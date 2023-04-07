abstract class Utils {
  /// 毫秒转为分钟
  static String transformSecondToMinute(int second) {
    return (second  / 60000).toStringAsFixed(2);
  }
}