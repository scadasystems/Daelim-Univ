import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class GalleryItem {
  final int total;
  final int totalHits;
  final List<GalleryItemHits> hits;

  GalleryItem({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  GalleryItem copyWith({
    int? total,
    int? totalHits,
    List<GalleryItemHits>? hits,
  }) {
    return GalleryItem(
      total: total ?? this.total,
      totalHits: totalHits ?? this.totalHits,
      hits: hits ?? this.hits,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'totalHits': totalHits,
      'hits': hits.map((x) => x.toMap()).toList(),
    };
  }

  factory GalleryItem.fromMap(Map<String, dynamic> map) {
    return GalleryItem(
      total: map['total'] as int,
      totalHits: map['totalHits'] as int,
      hits: List<GalleryItemHits>.from(
        (map['hits'] as List<dynamic>).map<GalleryItemHits>(
          (x) => GalleryItemHits.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryItem.fromJson(String source) => GalleryItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GalleryItem(total: $total, totalHits: $totalHits, hits: $hits)';

  @override
  bool operator ==(covariant GalleryItem other) {
    if (identical(this, other)) return true;

    return other.total == total && other.totalHits == totalHits && listEquals(other.hits, hits);
  }

  @override
  int get hashCode => total.hashCode ^ totalHits.hashCode ^ hits.hashCode;
}

class GalleryItemHits {
  final String tags;
  final String webformatURL;

  GalleryItemHits({
    required this.tags,
    required this.webformatURL,
  });

  GalleryItemHits copyWith({
    String? tags,
    String? webformatURL,
  }) {
    return GalleryItemHits(
      tags: tags ?? this.tags,
      webformatURL: webformatURL ?? this.webformatURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tags': tags,
      'webformatURL': webformatURL,
    };
  }

  factory GalleryItemHits.fromMap(Map<String, dynamic> map) {
    return GalleryItemHits(
      tags: map['tags'] as String,
      webformatURL: map['webformatURL'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryItemHits.fromJson(String source) =>
      GalleryItemHits.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GalleryItemHits(tags: $tags, webformatURL: $webformatURL)';

  @override
  bool operator ==(covariant GalleryItemHits other) {
    if (identical(this, other)) return true;

    return other.tags == tags && other.webformatURL == webformatURL;
  }

  @override
  int get hashCode => tags.hashCode ^ webformatURL.hashCode;
}
