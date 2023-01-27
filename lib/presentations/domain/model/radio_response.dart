// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MyRadioList {
  final List<MyRadio>? radio;
  MyRadioList({
    this.radio,
  });

  MyRadioList copyWith({
    List<MyRadio>? radio,
  }) {
    return MyRadioList(
      radio: radio ?? this.radio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'radio': radio?.map((x) => x.toMap()).toList(),
    };
  }

  factory MyRadioList.fromMap(Map<String, dynamic> map) {
    return MyRadioList(
      radio: map['radio'] != null
          ? List<MyRadio>.from(
              (map['radio'] as List<dynamic>).map<MyRadio?>(
                (x) => MyRadio.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRadioList.fromJson(String source) =>
      MyRadioList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MyRadioList(radio: $radio)';

  @override
  bool operator ==(covariant MyRadioList other) {
    if (identical(this, other)) return true;

    return listEquals(other.radio, radio);
  }

  @override
  int get hashCode => radio.hashCode;
}

class MyRadio {
  final int? id;
  final int? order;
  final String? tagline;
  final String? url;
  final String? desc;
  final String? image;
  final String? name;
  final String? lang;
  MyRadio({
    this.id,
    this.order,
    this.tagline,
    this.url,
    this.desc,
    this.image,
    this.name,
    this.lang,
  });

  MyRadio copyWith({
    int? id,
    int? order,
    String? tagline,
    String? url,
    String? desc,
    String? image,
    String? name,
    String? lang,
  }) {
    return MyRadio(
      id: id ?? this.id,
      order: order ?? this.order,
      tagline: tagline ?? this.tagline,
      url: url ?? this.url,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      name: name ?? this.name,
      lang: lang ?? this.lang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'tagline': tagline,
      'url': url,
      'desc': desc,
      'image': image,
      'name': name,
      'lang': lang,
    };
  }

  factory MyRadio.fromMap(Map<String, dynamic> map) {
    return MyRadio(
      id: map['id'] != null ? map['id'] as int : null,
      order: map['order'] != null ? map['order'] as int : null,
      tagline: map['tagline'] != null ? map['tagline'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      lang: map['lang'] != null ? map['lang'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRadio.fromJson(String source) =>
      MyRadio.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyRadio(id: $id, order: $order, tagline: $tagline, url: $url, desc: $desc, image: $image, name: $name, lang: $lang)';
  }

  @override
  bool operator ==(covariant MyRadio other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.order == order &&
        other.tagline == tagline &&
        other.url == url &&
        other.desc == desc &&
        other.image == image &&
        other.name == name &&
        other.lang == lang;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        order.hashCode ^
        tagline.hashCode ^
        url.hashCode ^
        desc.hashCode ^
        image.hashCode ^
        name.hashCode ^
        lang.hashCode;
  }
}
