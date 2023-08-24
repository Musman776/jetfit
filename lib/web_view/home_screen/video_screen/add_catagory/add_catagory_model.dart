// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class CategoryModel {
  String? thumbnailimageURL;
  String? categoryID;
  String? categoryName;
  String? categoryDescription;
  String? categoryType;
  String? categoryTimeline;
  String? playlistType;
  CategoryModel({
    this.thumbnailimageURL,
    this.categoryID,
    this.categoryName,
    this.categoryDescription,
    this.categoryType,
    this.categoryTimeline,
    this.playlistType,
  });

  CategoryModel copyWith({
    String? thumbnailimageURL,
    String? categoryID,
    String? categoryName,
    String? categoryDescription,
    String? categoryType,
    String? categoryTimeline,
    String? playlistType,
  }) {
    return CategoryModel(
      thumbnailimageURL: thumbnailimageURL ?? this.thumbnailimageURL,
      categoryID: categoryID ?? this.categoryID,
      categoryName: categoryName ?? this.categoryName,
      categoryDescription: categoryDescription ?? this.categoryDescription,
      categoryType: categoryType ?? this.categoryType,
      categoryTimeline: categoryTimeline ?? this.categoryTimeline,
      playlistType: playlistType ?? this.playlistType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thumbnailimageURL': thumbnailimageURL,
      'categoryID': categoryID,
      'categoryName': categoryName,
      'categoryDescription': categoryDescription,
      'categoryType': categoryType,
      'categoryTimeline': categoryTimeline,
      'playlistType': playlistType,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      thumbnailimageURL: map['thumbnailimageURL'] != null
          ? map['thumbnailimageURL'] as String
          : null,
      categoryID:
          map['categoryID'] != null ? map['categoryID'] as String : null,
      categoryName:
          map['categoryName'] != null ? map['categoryName'] as String : null,
      categoryDescription: map['categoryDescription'] != null
          ? map['categoryDescription'] as String
          : null,
      categoryType:
          map['categoryType'] != null ? map['categoryType'] as String : null,
      categoryTimeline: map['categoryTimeline'] != null
          ? map['categoryTimeline'] as String
          : null,
      playlistType:
          map['playlistType'] != null ? map['playlistType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(thumbnailimageURL: $thumbnailimageURL, categoryID: $categoryID, categoryName: $categoryName, categoryDescription: $categoryDescription, categoryType: $categoryType, categoryTimeline: $categoryTimeline, playlistType: $playlistType)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.thumbnailimageURL == thumbnailimageURL &&
        other.categoryID == categoryID &&
        other.categoryName == categoryName &&
        other.categoryDescription == categoryDescription &&
        other.categoryType == categoryType &&
        other.categoryTimeline == categoryTimeline &&
        other.playlistType == playlistType;
  }

  @override
  int get hashCode {
    return thumbnailimageURL.hashCode ^
        categoryID.hashCode ^
        categoryName.hashCode ^
        categoryDescription.hashCode ^
        categoryType.hashCode ^
        categoryTimeline.hashCode ^
        playlistType.hashCode;
  }
}

class PlayListModel {
  String? videoURL;
  String? videoID;
  String? categoryID;
  String? videoName;
  String? videoDescription;
  String? duration;
  String? dificulty;
  String? classType;
  String? instructor;
  String? videoLanguage;
  List<dynamic>? viewers;
  PlayListModel({
    this.videoURL,
    this.videoID,
    this.categoryID,
    this.videoName,
    this.videoDescription,
    this.duration,
    this.dificulty,
    this.classType,
    this.instructor,
    this.videoLanguage,
    this.viewers,
  });

  PlayListModel copyWith({
    String? videoURL,
    String? videoID,
    String? categoryID,
    String? videoName,
    String? videoDescription,
    String? duration,
    String? dificulty,
    String? classType,
    String? instructor,
    String? videoLanguage,
    List<dynamic>? viewers,
  }) {
    return PlayListModel(
      videoURL: videoURL ?? this.videoURL,
      videoID: videoID ?? this.videoID,
      categoryID: categoryID ?? this.categoryID,
      videoName: videoName ?? this.videoName,
      videoDescription: videoDescription ?? this.videoDescription,
      duration: duration ?? this.duration,
      dificulty: dificulty ?? this.dificulty,
      classType: classType ?? this.classType,
      instructor: instructor ?? this.instructor,
      videoLanguage: videoLanguage ?? this.videoLanguage,
      viewers: viewers ?? this.viewers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'videoURL': videoURL,
      'videoID': videoID,
      'categoryID': categoryID,
      'videoName': videoName,
      'videoDescription': videoDescription,
      'duration': duration,
      'dificulty': dificulty,
      'classType': classType,
      'instructor': instructor,
      'videoLanguage': videoLanguage,
      'viewers': viewers,
    };
  }

  factory PlayListModel.fromMap(Map<String, dynamic> map) {
    return PlayListModel(
      videoURL: map['videoURL'] != null ? map['videoURL'] as String : null,
      videoID: map['videoID'] != null ? map['videoID'] as String : null,
      categoryID:
          map['categoryID'] != null ? map['categoryID'] as String : null,
      videoName: map['videoName'] != null ? map['videoName'] as String : null,
      videoDescription: map['videoDescription'] != null
          ? map['videoDescription'] as String
          : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      dificulty: map['dificulty'] != null ? map['dificulty'] as String : null,
      classType: map['classType'] != null ? map['classType'] as String : null,
      instructor:
          map['instructor'] != null ? map['instructor'] as String : null,
      videoLanguage:
          map['videoLanguage'] != null ? map['videoLanguage'] as String : null,
      viewers: map['viewers'] != null
          ? List<dynamic>.from((map['viewers'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayListModel.fromJson(String source) =>
      PlayListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlayListModel(videoURL: $videoURL, videoID: $videoID, categoryID: $categoryID, videoName: $videoName, videoDescription: $videoDescription, duration: $duration, dificulty: $dificulty, classType: $classType, instructor: $instructor, videoLanguage: $videoLanguage, viewers: $viewers)';
  }

  @override
  bool operator ==(covariant PlayListModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.videoURL == videoURL &&
        other.videoID == videoID &&
        other.categoryID == categoryID &&
        other.videoName == videoName &&
        other.videoDescription == videoDescription &&
        other.duration == duration &&
        other.dificulty == dificulty &&
        other.classType == classType &&
        other.instructor == instructor &&
        other.videoLanguage == videoLanguage &&
        listEquals(other.viewers, viewers);
  }

  @override
  int get hashCode {
    return videoURL.hashCode ^
        videoID.hashCode ^
        categoryID.hashCode ^
        videoName.hashCode ^
        videoDescription.hashCode ^
        duration.hashCode ^
        dificulty.hashCode ^
        classType.hashCode ^
        instructor.hashCode ^
        videoLanguage.hashCode ^
        viewers.hashCode;
  }
}

class FavouriteModel {
  String? videoURL;
  String? videoID;
  String? categoryID;
  String? videoName;
  String? videoDescription;
  String? duration;
  String? dificulty;
  String? classType;
  String? instructor;
  String? videoLanguage;
  String? favID;

  FavouriteModel({
    this.videoURL,
    this.videoID,
    this.categoryID,
    this.videoName,
    this.videoDescription,
    this.duration,
    this.dificulty,
    this.classType,
    this.instructor,
    this.videoLanguage,
    this.favID,
  });

  FavouriteModel copyWith({
    String? videoURL,
    String? videoID,
    String? categoryID,
    String? videoName,
    String? videoDescription,
    String? duration,
    String? dificulty,
    String? classType,
    String? instructor,
    String? videoLanguage,
    String? favID,
  }) {
    return FavouriteModel(
      videoURL: videoURL ?? this.videoURL,
      videoID: videoID ?? this.videoID,
      categoryID: categoryID ?? this.categoryID,
      videoName: videoName ?? this.videoName,
      videoDescription: videoDescription ?? this.videoDescription,
      duration: duration ?? this.duration,
      dificulty: dificulty ?? this.dificulty,
      classType: classType ?? this.classType,
      instructor: instructor ?? this.instructor,
      videoLanguage: videoLanguage ?? this.videoLanguage,
      favID: favID ?? this.favID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'videoURL': videoURL,
      'videoID': videoID,
      'categoryID': categoryID,
      'videoName': videoName,
      'videoDescription': videoDescription,
      'duration': duration,
      'dificulty': dificulty,
      'classType': classType,
      'instructor': instructor,
      'videoLanguage': videoLanguage,
      'favID': favID,
    };
  }

  factory FavouriteModel.fromMap(Map<String, dynamic> map) {
    return FavouriteModel(
      videoURL: map['videoURL'] != null ? map['videoURL'] as String : null,
      videoID: map['videoID'] != null ? map['videoID'] as String : null,
      categoryID:
          map['categoryID'] != null ? map['categoryID'] as String : null,
      videoName: map['videoName'] != null ? map['videoName'] as String : null,
      videoDescription: map['videoDescription'] != null
          ? map['videoDescription'] as String
          : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      dificulty: map['dificulty'] != null ? map['dificulty'] as String : null,
      classType: map['classType'] != null ? map['classType'] as String : null,
      instructor:
          map['instructor'] != null ? map['instructor'] as String : null,
      videoLanguage:
          map['videoLanguage'] != null ? map['videoLanguage'] as String : null,
      favID: map['favID'] != null ? map['favID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavouriteModel.fromJson(String source) =>
      FavouriteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FavouriteModel(videoURL: $videoURL, videoID: $videoID, categoryID: $categoryID, videoName: $videoName, videoDescription: $videoDescription, duration: $duration, dificulty: $dificulty, classType: $classType, instructor: $instructor, videoLanguage: $videoLanguage, favID: $favID)';
  }

  @override
  bool operator ==(covariant FavouriteModel other) {
    if (identical(this, other)) return true;

    return other.videoURL == videoURL &&
        other.videoID == videoID &&
        other.categoryID == categoryID &&
        other.videoName == videoName &&
        other.videoDescription == videoDescription &&
        other.duration == duration &&
        other.dificulty == dificulty &&
        other.classType == classType &&
        other.instructor == instructor &&
        other.videoLanguage == videoLanguage &&
        other.favID == favID;
  }

  @override
  int get hashCode {
    return videoURL.hashCode ^
        videoID.hashCode ^
        categoryID.hashCode ^
        videoName.hashCode ^
        videoDescription.hashCode ^
        duration.hashCode ^
        dificulty.hashCode ^
        classType.hashCode ^
        instructor.hashCode ^
        videoLanguage.hashCode ^
        favID.hashCode;
  }
}

class VideossModel {
  String? videoURL;
  String? videotype;
  String? videoID;
  String? catagorytpe;
  String? videoName;
  String? videoDescription;
  String? duration;
  String? dificulty;
  String? classType;
  String? instructor;
  String? videoLanguage;
  List<dynamic>? viewers;
  VideossModel({
    this.videoURL,
    this.videotype,
    this.videoID,
    this.catagorytpe,
    this.videoName,
    this.videoDescription,
    this.duration,
    this.dificulty,
    this.classType,
    this.instructor,
    this.videoLanguage,
    this.viewers,
  });

  VideossModel copyWith({
    String? videoURL,
    String? videotype,
    String? videoID,
    String? catagorytpe,
    String? videoName,
    String? videoDescription,
    String? duration,
    String? dificulty,
    String? classType,
    String? instructor,
    String? videoLanguage,
    List<dynamic>? viewers,
  }) {
    return VideossModel(
      videoURL: videoURL ?? this.videoURL,
      videotype: videotype ?? this.videotype,
      videoID: videoID ?? this.videoID,
      catagorytpe: catagorytpe ?? this.catagorytpe,
      videoName: videoName ?? this.videoName,
      videoDescription: videoDescription ?? this.videoDescription,
      duration: duration ?? this.duration,
      dificulty: dificulty ?? this.dificulty,
      classType: classType ?? this.classType,
      instructor: instructor ?? this.instructor,
      videoLanguage: videoLanguage ?? this.videoLanguage,
      viewers: viewers ?? this.viewers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'videoURL': videoURL,
      'videotype': videotype,
      'videoID': videoID,
      'catagorytpe': catagorytpe,
      'videoName': videoName,
      'videoDescription': videoDescription,
      'duration': duration,
      'dificulty': dificulty,
      'classType': classType,
      'instructor': instructor,
      'videoLanguage': videoLanguage,
      'viewers': viewers,
    };
  }

  factory VideossModel.fromMap(Map<String, dynamic> map) {
    return VideossModel(
      videoURL: map['videoURL'] != null ? map['videoURL'] as String : null,
      videotype: map['videotype'] != null ? map['videotype'] as String : null,
      videoID: map['videoID'] != null ? map['videoID'] as String : null,
      catagorytpe:
          map['catagorytpe'] != null ? map['catagorytpe'] as String : null,
      videoName: map['videoName'] != null ? map['videoName'] as String : null,
      videoDescription: map['videoDescription'] != null
          ? map['videoDescription'] as String
          : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      dificulty: map['dificulty'] != null ? map['dificulty'] as String : null,
      classType: map['classType'] != null ? map['classType'] as String : null,
      instructor:
          map['instructor'] != null ? map['instructor'] as String : null,
      videoLanguage:
          map['videoLanguage'] != null ? map['videoLanguage'] as String : null,
      viewers: map['viewers'] != null
          ? List<dynamic>.from((map['viewers'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideossModel.fromJson(String source) =>
      VideossModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VideossModel(videoURL: $videoURL, videotype: $videotype, videoID: $videoID, catagorytpe: $catagorytpe, videoName: $videoName, videoDescription: $videoDescription, duration: $duration, dificulty: $dificulty, classType: $classType, instructor: $instructor, videoLanguage: $videoLanguage, viewers: $viewers)';
  }

  @override
  bool operator ==(covariant VideossModel other) {
    if (identical(this, other)) return true;

    return other.videoURL == videoURL &&
        other.videotype == videotype &&
        other.videoID == videoID &&
        other.catagorytpe == catagorytpe &&
        other.videoName == videoName &&
        other.videoDescription == videoDescription &&
        other.duration == duration &&
        other.dificulty == dificulty &&
        other.classType == classType &&
        other.instructor == instructor &&
        other.videoLanguage == videoLanguage &&
        listEquals(other.viewers, viewers);
  }

  @override
  int get hashCode {
    return videoURL.hashCode ^
        videotype.hashCode ^
        videoID.hashCode ^
        catagorytpe.hashCode ^
        videoName.hashCode ^
        videoDescription.hashCode ^
        duration.hashCode ^
        dificulty.hashCode ^
        classType.hashCode ^
        instructor.hashCode ^
        videoLanguage.hashCode ^
        viewers.hashCode;
  }
}
