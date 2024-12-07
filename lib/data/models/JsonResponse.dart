

class JsonResponse {
  List<Attributes>? attributes;

  JsonResponse({this.attributes});

  JsonResponse.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add( Attributes.fromJson(v));
      });
    }
  }
}
class Attributes {
  String? id;
  String? title;
  String? type;
  List<String>? options;

  Attributes({this.id, this.title, this.type, this.options});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    options = json['options'].cast<String>();
  }


}

