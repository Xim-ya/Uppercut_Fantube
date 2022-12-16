import 'package:uppercut_fantube/utilities/index.dart';

class TmdbDataSourceImpl with ApiErrorHandlerMixin implements TmdbDataSource {
  TmdbDataSourceImpl(this._api);

  final TmdbApi _api;

  // tmdb tv 컨텐츠 상세 정보
  @override
  Future<TmdbTvDetailResponse> loadTmdbDetailResponse(int tvId) async =>
      _api.loadTmdbDetailResponse(tvId);

  // tmdb tv 컨텐츠 크레딧 정보
  @override
  Future<TmdbTveCreditResponse> loadTmdbTvCastInfoResponse(int tvId) async =>
      _api.loadTvCreditInfo(tvId);

  // tmdb tv 이미지 리스트
  @override
  Future<TmdbTvImagesResponse> loadTmdbTvIContentImages(int tvId) async =>
      _api.loadTvImages(tvId);
}
