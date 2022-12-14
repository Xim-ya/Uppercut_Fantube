import 'package:uppercut_fantube/domain/model/content/season_info.dart';
import 'package:uppercut_fantube/utilities/index.dart';

/** Created By Ximya - 2022.11.16
 * 컨텐츠 상세페이지에서 사용되는 모델 [헤더 & 컨텐츠 탭]
 * 컨텐츠 상세페이지에 필요한 데이터를 분할하기 위해 '컨텐츠' '정보' '헤더'에 필요한 데이터를 구분함.
 * TMDB API로부터 데이터를 매핑
 * */

class ContentDetailInfo {
  // 헤더 영역 및 공통 영역
  final int id;
  final String title; // 컨텐츠 제목
  final double rate; // 평점
  final String? posterImgUrl; // 포스터 이미지 url
  final String? backDropImgUrl; // 컨텐츠 배경 이미지 url
  final List<String>? genreList; // 장르 타입 리스트
  final String? releaseDate; // 컨텐츠 출시일
  final String overView; // 컨텐츠 설명
  final ContentSeasonType? contentEpicType; // 시리즈물 or 단일 컨텐츠
  final String? airStatus; // 컨텐츠 방영 상태
  late List<SeasonInfo>? seasonInfoList; // 시즌 정보 리스트

  ContentDetailInfo({
    required this.id,
    required this.posterImgUrl,
    required this.title,
    required this.rate,
    required this.genreList,
    required this.releaseDate,
    required this.overView,
    this.backDropImgUrl,
    this.contentEpicType,
    this.airStatus,
    this.seasonInfoList,
  });

  // ContentType == movie인 response
  factory ContentDetailInfo.fromMovieDetailResponse(
      TmdbMovieDetailResponse response) {
    List<String> formattedGenre = [];

    if (response.genres.hasData) {
      for (var ele in response.genres!) {
        // "Action & Adventure" 장르 데이터가 이런 형태도 넘어온다면 Split 함.
        if (ele.name.contains('&')) {
          final List<String> splitGenre = ele.name.split('&');
          formattedGenre.addAll(splitGenre);
        } else {
          formattedGenre.add(ele.name);
        }
      }
    }

    return ContentDetailInfo(
      posterImgUrl: response.poster_path ?? response.backdrop_path,
      id: response.id,
      title: response.title,
      rate: response.vote_average,
      genreList: formattedGenre,
      releaseDate: response.release_date,
      overView: response.overview,
      backDropImgUrl: response.backdrop_path,
    );
  }

  // ContentType == tv인 response
  factory ContentDetailInfo.fromTvDetailResponse(
      TmdbTvDetailResponse response) {
    List<String> formattedGenre = [];

    if (response.genres.hasData) {
      for (var ele in response.genres!) {
        // "Action & Adventure" 장르 데이터가 이런 형태도 넘어온다면 Split 함.
        if (ele.name.contains('&')) {
          final List<String> splitGenre = ele.name.split('&');
          formattedGenre.addAll(splitGenre);
        } else {
          formattedGenre.add(ele.name);
        }
      }
    }

    return ContentDetailInfo(
      posterImgUrl: response.poster_path ?? response.backdrop_path,
      id: response.id,
      title: response.name,
      rate: response.vote_average,
      genreList: formattedGenre,
      releaseDate: response.first_air_date,
      contentEpicType:
          ContentSeasonType.fromSeasonCount(response.number_of_seasons),
      overView: response.overview,
      airStatus: _translateTvContentStatus(response.status!),
      backDropImgUrl: response.backdrop_path,
      seasonInfoList:
          response.seasons?.map((e) => SeasonInfo.fromResponse(e)).toList(),
    );
  }
}

String _translateTvContentStatus(String status) {
  switch (status) {
    case 'Canceled':
      return '방영 취소';
    case 'Ended':
      return '방영 종료';
    case 'In Production':
      return '제작 중';
    case 'Pilot':
      return '파일럿';
    case 'Returning Series':
      return '다음 시즌 방영 예정';
    default:
      return '정보 없음';
  }
}
