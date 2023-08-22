class Prayer {
  String fajr, dhuhr, asar, maghrib, isha;

  Prayer(this.fajr, this.dhuhr, this.asar, this.maghrib, this.isha);

  static List<Prayer> getMonthData(Map<String, dynamic> data) {
    List<Prayer> allData = [];

    for (final day in data["data"]) {
      allData.add(Prayer(
          day["timings"]["Fajr"],
          day["timings"]["Dhuhr"],
          day["timings"]["Asr"],
          day["timings"]["Maghrib"],
          day["timings"]["Isha"]));
    }
    return allData;
  }
}
