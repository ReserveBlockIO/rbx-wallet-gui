bool isWithinThirtySeconds(DateTime date1, DateTime date2) {
  if (date1.year != date2.year || date1.month != date2.month || date1.day != date2.day) {
    return false;
  }

  return date1.difference(date2).inSeconds < 30;
}
