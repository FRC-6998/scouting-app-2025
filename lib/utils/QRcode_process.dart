import 'dart:typed_data';
import 'package:yaml/yaml.dart';
import 'package:msgpack_dart/msgpack_dart.dart';
import 'package:base45/base45.dart';
import 'package:archive/archive.dart';

class QREncoder {
  /// Load OpenAPI YAML schema from a string
  static Map<String, dynamic> loadSchemaFromYaml(String yamlStr) {
    return loadYaml(yamlStr) as Map<String, dynamic>;
  }

  /// Flatten nested objects based on schema
  static List<dynamic> flattenObject(
      Map<String, dynamic> data,
      Map<String, dynamic> schema,
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
          final nestedResult = flattenObject(
            childData as Map<String, dynamic>? ?? {},
            prop,
          );
          result.add(nestedResult.length);
          result.addAll(nestedResult);
        }
        // Handle arrays
        else if (dataType == 'array') {
          final processedArray = flattenArray(
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
  static List<dynamic> flattenArray(
      List<dynamic> data,
      Map<String, dynamic> schema,
      ) {
    final result = <dynamic>[];

      final schemaType = schema['type'];
      // Object array
      if (schemaType == 'object') {
        for (final item in data) {
          final processed = flattenObject(
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
          final processed = flattenArray(
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
  static (Map<String, dynamic>, int) unflattenObject(
      List<dynamic> data,
      Map<String, dynamic> schema, [
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
        final (obj, newIdx) = unflattenObject(data, prop, idx);
        result[key] = obj;
        idx = newIdx;
      }
      // Handle arrays
      else if (schemaType == 'array') {
        final length = data[idx] as int;
        idx++;
        final (arr, newIdx) = unflattenArray(
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
  static (List<dynamic>, int) unflattenArray(
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
        final (obj, newIdx) = unflattenObject(data, schema, idx);
        result.add(obj);
        idx = newIdx;
      }
      // Nested array
      else if (schemaType == 'array') {
        final length = data[idx] as int;
        idx++;
        final (arr, newIdx) = unflattenArray(
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
  static String encodeQR(
      Map<String, dynamic> data,
      Map<String, dynamic> schema,
      ) {
    final flattenedData = flattenObject(data, schema);
    final packed = serialize(flattenedData);
    final compressed = Uint8List.fromList(ZLibEncoder().encode(packed));
    return Base45.encode(compressed);
  }

  /// Decode Base45 string back to original JSON data
  static Map<String, dynamic> decodeQR(
      String encoded,
      Map<String, dynamic> schema,
      ) {
    final decoded = Base45.decode(encoded);
    final decompressed = Uint8List.fromList(ZLibDecoder().decodeBytes(decoded));
    final unpacked = deserialize(decompressed) as List<dynamic>;
    final (result, _) = unflattenObject(unpacked, schema);
    return result;
  }
}