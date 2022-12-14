// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_content_credit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TmdbContentCreditResponse _$TmdbContentCreditResponseFromJson(
        Map<String, dynamic> json) =>
    TmdbContentCreditResponse(
      json['id'] as int,
      (json['cast'] as List<dynamic>)
          .map((e) =>
              TmdbCastInfoItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TmdbCastInfoItemResponse _$TmdbCastInfoItemResponseFromJson(
        Map<String, dynamic> json) =>
    TmdbCastInfoItemResponse(
      json['adult'] as bool,
      json['gender'] as int?,
      json['id'] as int,
      json['known_for_department'] as String,
      json['name'] as String,
      json['original_name'] as String,
      (json['popularity'] as num).toDouble(),
      json['profile_path'] as String?,
      json['cast_id'] as int?,
      json['character'] as String,
      json['credit_id'] as String?,
    );
