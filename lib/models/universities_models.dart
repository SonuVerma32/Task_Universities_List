/// web_pages : ["http://www.marywood.edu"]
/// name : "Marywood University"
/// domains : ["marywood.edu"]
/// country : "United States"
/// state-province : null
/// alpha_two_code : "US"

class UniversitiesModels {
  UniversitiesModels({
      List<String>? webPages, 
      String? name, 
      List<String>? domains, 
      String? country, 
      dynamic stateprovince, 
      String? alphaTwoCode,}){
    _webPages = webPages;
    _name = name;
    _domains = domains;
    _country = country;
    _stateprovince = stateprovince;
    _alphaTwoCode = alphaTwoCode;
}

  UniversitiesModels.fromJson(dynamic json) {
    _webPages = json['web_pages'] != null ? json['web_pages'].cast<String>() : [];
    _name = json['name'];
    _domains = json['domains'] != null ? json['domains'].cast<String>() : [];
    _country = json['country'];
    _stateprovince = json['state-province'];
    _alphaTwoCode = json['alpha_two_code'];
  }
  List<String>? _webPages;
  String? _name;
  List<String>? _domains;
  String? _country;
  dynamic _stateprovince;
  String? _alphaTwoCode;
UniversitiesModels copyWith({  List<String>? webPages,
  String? name,
  List<String>? domains,
  String? country,
  dynamic stateprovince,
  String? alphaTwoCode,
}) => UniversitiesModels(  webPages: webPages ?? _webPages,
  name: name ?? _name,
  domains: domains ?? _domains,
  country: country ?? _country,
  stateprovince: stateprovince ?? _stateprovince,
  alphaTwoCode: alphaTwoCode ?? _alphaTwoCode,
);
  List<String>? get webPages => _webPages;
  String? get name => _name;
  List<String>? get domains => _domains;
  String? get country => _country;
  dynamic get stateprovince => _stateprovince;
  String? get alphaTwoCode => _alphaTwoCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['web_pages'] = _webPages;
    map['name'] = _name;
    map['domains'] = _domains;
    map['country'] = _country;
    map['state-province'] = _stateprovince;
    map['alpha_two_code'] = _alphaTwoCode;
    return map;
  }

}