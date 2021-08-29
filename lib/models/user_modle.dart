/// avatar : {"gravatar":{"hash":"c9e9fc152ee756a900db85757c29815d"}}
/// id : 548
/// iso_639_1 : "en"
/// iso_3166_1 : "CA"
/// name : "Travis Bell"
/// include_adult : true
/// username : "travisbell"

class UserModel {
  Avatar? _avatar;
  int? _id;
  String? _iso6391;
  String? _iso31661;
  String? _name;
  bool? _includeAdult;
  String? _username;

  Avatar? get avatar => _avatar;
  int? get id => _id;
  String? get iso6391 => _iso6391;
  String? get iso31661 => _iso31661;
  String? get name => _name;
  bool? get includeAdult => _includeAdult;
  String? get username => _username;

  UserModel({
      Avatar? avatar, 
      int? id, 
      String? iso6391, 
      String? iso31661, 
      String? name, 
      bool? includeAdult, 
      String? username}){
    _avatar = avatar;
    _id = id;
    _iso6391 = iso6391;
    _iso31661 = iso31661;
    _name = name;
    _includeAdult = includeAdult;
    _username = username;
}

  UserModel.fromJson(dynamic json) {
    _avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    _id = json['id'];
    _iso6391 = json['iso_639_1'];
    _iso31661 = json['iso_3166_1'];
    _name = json['name'];
    _includeAdult = json['include_adult'];
    _username = json['username'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_avatar != null) {
      map['avatar'] = _avatar?.toJson();
    }
    map['id'] = _id;
    map['iso_639_1'] = _iso6391;
    map['iso_3166_1'] = _iso31661;
    map['name'] = _name;
    map['include_adult'] = _includeAdult;
    map['username'] = _username;
    return map;
  }

}

/// gravatar : {"hash":"c9e9fc152ee756a900db85757c29815d"}

class Avatar {
  Gravatar? _gravatar;

  Gravatar? get gravatar => _gravatar;

  Avatar({
      Gravatar? gravatar}){
    _gravatar = gravatar;
}

  Avatar.fromJson(dynamic json) {
    _gravatar = json['gravatar'] != null ? Gravatar.fromJson(json['gravatar']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_gravatar != null) {
      map['gravatar'] = _gravatar?.toJson();
    }
    return map;
  }

}

/// hash : "c9e9fc152ee756a900db85757c29815d"

class Gravatar {
  String? _hash;

  String? get hash => _hash;

  Gravatar({
      String? hash}){
    _hash = hash;
}

  Gravatar.fromJson(dynamic json) {
    _hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['hash'] = _hash;
    return map;
  }

}