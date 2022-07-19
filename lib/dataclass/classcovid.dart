class Coviddata {
  final String? txnDate;
  final String? province;
  final int? newCase;
  final int? totalCase;
  final int? newCaseExcludeabroad;
  final int? totalCaseExcludeabroad;
  final int? newDeath;
  final int? totalDeath;
  final String? updateDate;

  Coviddata({
    this.txnDate,
    this.province,
    this.newCase,
    this.totalCase,
    this.newCaseExcludeabroad,
    this.totalCaseExcludeabroad,
    this.newDeath,
    this.totalDeath,
    this.updateDate,
  });

  Coviddata.fromJson(Map<String, dynamic> json)
      : txnDate = json['txn_date'] as String?,
        province = json['province'] as String?,
        newCase = json['new_case'] as int?,
        totalCase = json['total_case'] as int?,
        newCaseExcludeabroad = json['new_case_excludeabroad'] as int?,
        totalCaseExcludeabroad = json['total_case_excludeabroad'] as int?,
        newDeath = json['new_death'] as int?,
        totalDeath = json['total_death'] as int?,
        updateDate = json['update_date'] as String?;

  Map<String, dynamic> toJson() => {
        'txn_date': txnDate,
        'province': province,
        'new_case': newCase,
        'total_case': totalCase,
        'new_case_excludeabroad': newCaseExcludeabroad,
        'total_case_excludeabroad': totalCaseExcludeabroad,
        'new_death': newDeath,
        'total_death': totalDeath,
        'update_date': updateDate
      };
}
