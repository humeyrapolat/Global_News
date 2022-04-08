class LanguagesListModel {
  LanguagesListModel({
      Languages? languages, 
      String? description, 
      String? status,}){
    _languages = languages;
    _description = description;
    _status = status;
}

  LanguagesListModel.fromJson(dynamic json) {
    _languages = json['languages'] != null ? Languages.fromJson(json['languages']) : null;
    _description = json['description'];
    _status = json['status'];
  }
  Languages? _languages;
  String? _description;
  String? _status;

  Languages? get languages => _languages;
  String? get description => _description;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_languages != null) {
      map['languages'] = _languages?.toJson();
    }
    map['description'] = _description;
    map['status'] = _status;
    return map;
  }

}

class Languages {
  Languages({
      String? arabic, 
      String? chinese, 
      String? dutch, 
      String? english, 
      String? finnish, 
      String? french, 
      String? german, 
      String? hindi, 
      String? italian, 
      String? japanese, 
      String? korean, 
      String? malay, 
      String? portuguese, 
      String? russian, 
      String? spanish, 
      String? vietnamise}){
    _arabic = arabic;
    _chinese = chinese;
    _dutch = dutch;
    _english = english;
    _finnish = finnish;
    _french = french;
    _german = german;
    _hindi = hindi;
    _italian = italian;
    _japanese = japanese;
    _korean = korean;
    _malay = malay;
    _portuguese = portuguese;
    _russian = russian;
    _spanish = spanish;
    _vietnamise = vietnamise;
}

  Languages.fromJson(dynamic json) {
    _arabic = json['Arabic'];
    _chinese = json['Chinese'];
    _dutch = json['Dutch'];
    _english = json['English'];
    _finnish = json['Finnish'];
    _french = json['French'];
    _german = json['German'];
    _hindi = json['Hindi'];
    _italian = json['Italian'];
    _japanese = json['Japanese'];
    _korean = json['Korean'];
    _malay = json['Malay'];
    _portuguese = json['Portuguese'];
    _russian = json['Russian'];
    _spanish = json['Spanish'];
    _vietnamise = json['Vietnamise'];
  }
  String? _arabic;
  String? _chinese;
  String? _dutch;
  String? _english;
  String? _finnish;
  String? _french;
  String? _german;
  String? _hindi;
  String? _italian;
  String? _japanese;
  String? _korean;
  String? _malay;
  String? _portuguese;
  String? _russian;
  String? _spanish;
  String? _vietnamise;

  String? get arabic => _arabic;
  String? get chinese => _chinese;
  String? get dutch => _dutch;
  String? get english => _english;
  String? get finnish => _finnish;
  String? get french => _french;
  String? get german => _german;
  String? get hindi => _hindi;
  String? get italian => _italian;
  String? get japanese => _japanese;
  String? get korean => _korean;
  String? get malay => _malay;
  String? get portuguese => _portuguese;
  String? get russian => _russian;
  String? get spanish => _spanish;
  String? get vietnamise => _vietnamise;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Arabic'] = _arabic;
    map['Chinese'] = _chinese;
    map['Dutch'] = _dutch;
    map['English'] = _english;
    map['Finnish'] = _finnish;
    map['French'] = _french;
    map['German'] = _german;
    map['Hindi'] = _hindi;
    map['Italian'] = _italian;
    map['Japanese'] = _japanese;
    map['Korean'] = _korean;
    map['Malay'] = _malay;
    map['Portuguese'] = _portuguese;
    map['Russian'] = _russian;
    map['Spanish'] = _spanish;
    map['Vietnamise'] = _vietnamise;
    return map;
  }

}