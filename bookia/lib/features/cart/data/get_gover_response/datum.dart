class Datum {
  int? id;
  String? governorateNameAr;
  String? governorateNameEn;

  Datum({this.id, this.governorateNameAr, this.governorateNameEn});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        governorateNameAr: json['governorate_name_ar'] as String?,
        governorateNameEn: json['governorate_name_en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'governorate_name_ar': governorateNameAr,
        'governorate_name_en': governorateNameEn,
      };
}
