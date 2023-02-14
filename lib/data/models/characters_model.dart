class CharactersModel {
  List<Results>? results;
  CharactersModel({this.results});

  CharactersModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

}
class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  List<String>? episode;
  List<int>? appearance = [1,2,3,4,5,6];
  String? url;
  String? created;

  Results(
      {this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.image,
        this.episode,
        this.url,
        this.created,
        this.appearance,
      });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }
}

