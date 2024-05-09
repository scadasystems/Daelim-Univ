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

/*
{
      "id": 8378189,
      "pageURL": "https://safesearch.pixabay.com/ko/photos/%EB%8F%99%EB%AC%BC%EC%9B%90-%EC%95%B5%EB%AC%B4%EC%83%88-%EC%83%88-%EB%8F%99%EB%AC%BC-8378189/",
      "type": "photo",
      "tags": "동물원, 앵무새, 새",
      "previewURL": "https://cdn.pixabay.com/photo/2023/11/09/19/36/zoo-8378189_150.jpg",
      "previewWidth": 100,
      "previewHeight": 150,
      "webformatURL": "https://safesearch.pixabay.com/get/g5fe1a146291bc958d12ebcf64383e2709d8305d7772447ebe2bd472efb86a654981e0cc35034e1d9ce8f85084fbe777e52d76207c941388d1e2a60f0a24a3d10_640.jpg",
      "webformatWidth": 427,
      "webformatHeight": 640,
      "largeImageURL": "https://safesearch.pixabay.com/get/g51756fba2dfbf505639cb8482a9db7d25843dc2aea229101c796a7a341a21256757c97020520693286228162b1581e404280ff2fc6d99a12bfc3347c9a832e0b_1280.jpg",
      "imageWidth": 4000,
      "imageHeight": 6000,
      "imageSize": 6347123,
      "views": 29206,
      "downloads": 23504,
      "collections": 233,
      "likes": 977,
      "comments": 24,
      "user_id": 3428504,
      "user": "Zsolt71",
      "userImageURL": "https://cdn.pixabay.com/user/2016/10/06/08-16-23-11_250x250.jpg"
    }
*/
class GalleryItemHits {
  final int id;
  final String tags;
  final String webformatURL;
  final String largeImageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int collections;
  final int downloads;
  final int comments;
  final int likes;
  final int userId;
  final String user;
  final String userImageURL;

  GalleryItemHits({
    required this.id,
    required this.tags,
    required this.webformatURL,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.collections,
    required this.downloads,
    required this.comments,
    required this.likes,
    required this.userId,
    required this.user,
    required this.userImageURL,
  });

  GalleryItemHits copyWith({
    int? id,
    String? tags,
    String? webformatURL,
    String? largeImageURL,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? collections,
    int? downloads,
    int? comments,
    int? likes,
    int? userId,
    String? user,
    String? userImageURL,
  }) {
    return GalleryItemHits(
      id: id ?? this.id,
      tags: tags ?? this.tags,
      webformatURL: webformatURL ?? this.webformatURL,
      largeImageURL: largeImageURL ?? this.largeImageURL,
      imageWidth: imageWidth ?? this.imageWidth,
      imageHeight: imageHeight ?? this.imageHeight,
      imageSize: imageSize ?? this.imageSize,
      views: views ?? this.views,
      collections: collections ?? this.collections,
      downloads: downloads ?? this.downloads,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      userImageURL: userImageURL ?? this.userImageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tags': tags,
      'webformatURL': webformatURL,
      'largeImageURL': largeImageURL,
      'imageWidth': imageWidth,
      'imageHeight': imageHeight,
      'imageSize': imageSize,
      'views': views,
      'collections': collections,
      'downloads': downloads,
      'comments': comments,
      'likes': likes,
      'userId': userId,
      'user': user,
      'userImageURL': userImageURL,
    };
  }

  factory GalleryItemHits.fromMap(Map<String, dynamic> map) {
    return GalleryItemHits(
      id: map['id'] as int,
      tags: map['tags'] as String,
      webformatURL: map['webformatURL'] as String,
      largeImageURL: map['largeImageURL'] as String,
      imageWidth: map['imageWidth'] as int,
      imageHeight: map['imageHeight'] as int,
      imageSize: map['imageSize'] as int,
      views: map['views'] as int,
      collections: map['collections'] as int,
      downloads: map['downloads'] as int,
      comments: map['comments'] as int,
      likes: map['likes'] as int,
      userId: map['user_id'] as int,
      user: map['user'] as String,
      userImageURL: map['userImageURL'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryItemHits.fromJson(String source) =>
      GalleryItemHits.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GalleryItemHits(id: $id, tags: $tags, webformatURL: $webformatURL, largeImageURL: $largeImageURL, imageWidth: $imageWidth, imageHeight: $imageHeight, imageSize: $imageSize, views: $views, collections: $collections, downloads: $downloads, comments: $comments, likes: $likes, userId: $userId, user: $user, userImageURL: $userImageURL)';
  }

  @override
  bool operator ==(covariant GalleryItemHits other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.tags == tags &&
        other.webformatURL == webformatURL &&
        other.largeImageURL == largeImageURL &&
        other.imageWidth == imageWidth &&
        other.imageHeight == imageHeight &&
        other.imageSize == imageSize &&
        other.views == views &&
        other.collections == collections &&
        other.downloads == downloads &&
        other.comments == comments &&
        other.likes == likes &&
        other.userId == userId &&
        other.user == user &&
        other.userImageURL == userImageURL;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tags.hashCode ^
        webformatURL.hashCode ^
        largeImageURL.hashCode ^
        imageWidth.hashCode ^
        imageHeight.hashCode ^
        imageSize.hashCode ^
        views.hashCode ^
        collections.hashCode ^
        downloads.hashCode ^
        comments.hashCode ^
        likes.hashCode ^
        userId.hashCode ^
        user.hashCode ^
        userImageURL.hashCode;
  }
}
