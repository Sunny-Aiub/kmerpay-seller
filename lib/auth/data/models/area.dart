

class AreaDatum {
  AreaDatum({
    this.areaId,
    this.areaName,
  });

  int? areaId;
  String? areaName;

  factory AreaDatum.fromJson(Map<String, dynamic> json) => AreaDatum(
    areaId: json["area_id"],
    areaName: json["area_name"],
  );

  Map<String, dynamic> toJson() => {
    "area_id": areaId  ,
    "area_name": areaName,
  };
}

AreaDatum area1 = AreaDatum(areaId: 1,areaName: 'Nikunjo 1');
AreaDatum area2 = AreaDatum(areaId: 2,areaName: 'Nikunjo 2');
