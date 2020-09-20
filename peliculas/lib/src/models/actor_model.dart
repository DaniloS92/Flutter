class Cast {
  List<Actor> actores = List();

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((element) => actores.add(Actor.fromJsonMap(element)));
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getPhotoImg() {
    String url = 'https://image.tmdb.org/t/p/w500/$profilePath';
    if (profilePath == null)
      url =
          'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png';
    return url;
  }
}
