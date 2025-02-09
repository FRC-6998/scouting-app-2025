  import 'dart:typed_data';
  import 'package:flutter/services.dart';
import 'package:scout_app_v0/utils/logger.dart';
  import 'package:yaml/yaml.dart';
  import 'package:msgpack_dart/msgpack_dart.dart';
  import 'package:base45/base45.dart';
  import 'package:archive/archive.dart';

  class QRStringProcessor {
    Map<dynamic, dynamic>? schema;

    // QRStringProcessor(String? schemaPath, {String? schemaString}) {
    //   if (schemaPath != null) {
    //     logger.d('schemaPath: $schemaPath');
    //     loadSchemaFromFile(schemaPath).then((_) {
    //       print("Schema loaded successfully.");
    //     });
    //   } else if (schemaString != null) {
    //     loadSchemaFromYamlString(schemaString);
    //   }
    // }
QRStringProcessor._();

    static Future<QRStringProcessor> init(String? schemaPath, {String? schemaString})  async{
      final processor = QRStringProcessor._();
      if (schemaPath != null) {
        logger.d('schemaPath: $schemaPath');
        await processor.loadSchemaFromFile(schemaPath);
        // processor.loadSchemaFromFile(schemaPath).then((_) {
        //   print("Schema loaded successfully.");
        //   return processor;
        // });
      } else if (schemaString != null) {
        processor.loadSchemaFromYamlString(schemaString);
      }
      print("return processor");
      return processor;
    }

    /// Load OpenAPI YAML schema from a string
    void loadSchemaFromYamlString(String yamlString) {
      // return loadYaml(yamlString) as Map<String, dynamic>;
      schema = loadYaml(yamlString) as Map;
      logger.d(schema);
    }

    /// Load OpenAPI YAML schema from a file
    Future<void> loadSchemaFromFile(String filePath) async {
      final fileData = await rootBundle.loadString(filePath);
      schema = loadYaml(fileData) as Map;
      logger.d(schema);
    }



    /// Flatten nested objects based on schema
    static List<dynamic> _flattenObject(
        Map<String, dynamic> data,
        Map<dynamic, dynamic> schema,
        ) {
      final result = <dynamic>[];

      final properties = schema['properties'] as Map<String, dynamic>? ?? {};
      for (final entry in properties.entries) {
        final key = entry.key;
        Map<String, dynamic> prop = entry.value;
        final dataType = prop['type'];
        final childData = data[key];

          // Handle nested objects
          if (dataType == 'object') {
            final nestedResult = _flattenObject(
              childData as Map<String, dynamic>? ?? {},
              prop,
            );
            result.add(nestedResult.length);
            result.addAll(nestedResult);
          }
          // Handle arrays
          else if (dataType == 'array') {
            final processedArray = _flattenArray(
              childData as List<dynamic>? ?? [],
              prop['items'] as Map<String, dynamic>? ?? {},
            );
            result.add(processedArray.length);
            result.addAll(processedArray);
          }
          // Handle enums
          else if (prop.containsKey('enum')) {
            final enumList = prop['enum'] as List<dynamic>;
            result.add(childData != null ? enumList.indexOf(childData) : -1);
          }
          // Handle primitive types
          else {
            result.add(childData);
          }
        }

      return result;
    }

    /// Flatten arrays based on schema
    static List<dynamic> _flattenArray(
        List<dynamic> data,
        Map<String, dynamic> schema,
        ) {
      final result = <dynamic>[];

        final schemaType = schema['type'];
        // Object array
        if (schemaType == 'object') {
          for (final item in data) {
            final processed = _flattenObject(
              item as Map<String, dynamic>,
              schema,
            );
            result.add(processed.length);
            result.addAll(processed);
          }
        }
        // Nested array
        else if (schemaType == 'array') {
          for (final item in data) {
            final processed = _flattenArray(
              item as List<dynamic>,
              schema['items'] as Map<String, dynamic>? ?? {},
            );
            result.add(processed.length);
            result.addAll(processed);
          }
        }
        // Enum array
        else if (schema.containsKey('enum')) {
          final enumList = schema['enum'] as List<dynamic>;
          for (final item in data) {
            result.add(enumList.indexOf(item));
          }
        }
        // Primitive type array
        else {
          result.addAll(data);
        }


      return result;
    }

    /// Unflatten data back into nested objects based on schema
    static (Map<String, dynamic>, int) _unflattenObject(
        List<dynamic> data,
        Map<dynamic, dynamic> schema, [
          int startIdx = 0,
        ]) {

      final result = <String, dynamic>{};
      var idx = startIdx;

      final properties = schema['properties'] as Map<String, dynamic>? ?? {};
      for (final entry in properties.entries) {
        final key = entry.key;
        Map<String, dynamic> prop = entry.value;

        final schemaType = prop['type'];
        if (schemaType == 'object') {
          idx++;
          final (obj, newIdx) = _unflattenObject(data, prop, idx);
          result[key] = obj;
          idx = newIdx;
        }
        // Handle arrays
        else if (schemaType == 'array') {
          final length = data[idx] as int;
          idx++;
          final (arr, newIdx) = _unflattenArray(
            data,
            prop['items'] as Map<String, dynamic>? ?? {},
            idx,
            length,
          );
          result[key] = arr;
          idx = newIdx;
        }
        // Handle enums
        else if (prop.containsKey('enum')) {
          final enumList = prop['enum'] as List<dynamic>;
          final value = data[idx] as int;
          result[key] = (value >= 0 && value < enumList.length)
              ? enumList[value]
              : null;
          idx++;
        }
        // Handle primitive types
        else {
          result[key] = data[idx];
          idx++;
        }
      }

      return (result, idx);
    }

    /// Unflatten data back into arrays based on schema
    static (List<dynamic>, int) _unflattenArray(
        List<dynamic> data,
        Map<String, dynamic> schema,
        int startIdx,
        int length,
        ) {
      final result = <dynamic>[];
      var idx = startIdx;
      final endIdx = startIdx + length;

      while (idx < endIdx) {
        final schemaType = schema['type'];
        if (schemaType == 'object') {
          idx++;
          final (obj, newIdx) = _unflattenObject(data, schema, idx);
          result.add(obj);
          idx = newIdx;
        }
        // Nested array
        else if (schemaType == 'array') {
          final length = data[idx] as int;
          idx++;
          final (arr, newIdx) = _unflattenArray(
            data,
            schema['items'] as Map<String, dynamic>? ?? {},
            idx,
            length,
          );
          result.add(arr);
          idx = newIdx;
        }
        // Enum array
        else if (schema.containsKey('enum')) {
          final enumList = schema['enum'] as List<dynamic>;
          final value = data[idx] as int;
          result.add(enumList[value]);
          idx++;
        }
        // Primitive type array
        else {
          result.add(data[idx]);
          idx++;
        }
      }

      return (result, idx);
    }

    /// Encode JSON data to a compressed Base45 string
    String encodeQRObject(
        Map<String, dynamic> data,
        // Map<String, dynamic> schema,
        ) {
      logger.d('encode schema: $schema');
      if(schema == null) {
        throw Exception('Schema is null');
      }
      if (schema!.isEmpty) {
        throw Exception('Schema is empty');
      }
      final flattenedData = _flattenObject(data, schema!);
      final packed = serialize(flattenedData);
      final compressed = Uint8List.fromList(ZLibEncoder().encode(packed));
      return Base45.encode(compressed);
    }

    /// Decode Base45 string back to original JSON data
    Map<String, dynamic> decodeQRString(
        String encoded,
        // Map<String, dynamic> schema,
        ) {
      if(schema == null) {
        throw Exception('Schema has not been loaded');
      }
      if (schema!.isEmpty) {
        throw Exception('Schema is empty');
      }
      final decoded = Base45.decode(encoded);
      final decompressed = Uint8List.fromList(ZLibDecoder().decodeBytes(decoded));
      final unpacked = deserialize(decompressed) as List<dynamic>;
      final (result, _) = _unflattenObject(unpacked, schema!);
      return result;
    }
  }