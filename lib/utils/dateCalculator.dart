class DateCalculator {
  int daysAgo(String createdAt) {
    print("aaa");
    print(createdAt);
    final currentDate = DateTime.now();
    final createdAtDate = DateTime.parse(createdAt);
    final dateDiff = currentDate.difference(createdAtDate);
    print(dateDiff.inDays);
    return dateDiff.inDays;
  }
}
