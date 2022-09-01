/// Extension on strings
extension StringExtension on String {
  /// changes first letter to caps
  String firstLetterInCaps() {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
