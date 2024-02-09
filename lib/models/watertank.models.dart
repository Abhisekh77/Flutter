class WaterTank {
  String? _sId;
  int? _waterLevelOfNormalTank;
  int? _waterLevelRainTank;

  WaterTank(
      {String? sId, int? waterLevelOfNormalTank, int? waterLevelRainTank}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (waterLevelOfNormalTank != null) {
      this._waterLevelOfNormalTank = waterLevelOfNormalTank;
    }
    if (waterLevelRainTank != null) {
      this._waterLevelRainTank = waterLevelRainTank;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  int? get waterLevelOfNormalTank => _waterLevelOfNormalTank;
  set waterLevelOfNormalTank(int? waterLevelOfNormalTank) =>
      _waterLevelOfNormalTank = waterLevelOfNormalTank;
  int? get waterLevelRainTank => _waterLevelRainTank;
  set waterLevelRainTank(int? waterLevelRainTank) =>
      _waterLevelRainTank = waterLevelRainTank;

  WaterTank.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _waterLevelOfNormalTank = json['Water level of normal tank'];
    _waterLevelRainTank = json['Water level rain tank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['Water level of normal tank'] = this._waterLevelOfNormalTank;
    data['Water level rain tank'] = this._waterLevelRainTank;
    return data;
  }
}
