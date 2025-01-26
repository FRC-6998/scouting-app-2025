double? addIfNotNull(double? value, double factor) {
  return value != null ? value + factor : null;
}

double? multiplyIfNotNull(double? value, double factor) {
  return value != null ? value * factor : null;
}
