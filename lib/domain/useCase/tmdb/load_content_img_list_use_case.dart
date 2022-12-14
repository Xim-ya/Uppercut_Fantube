import 'package:uppercut_fantube/utilities/index.dart';

class LoadContentImgListUseCase
    extends BaseTwoParamUseCase<ContentType, int, Result<List<String>>> {
  LoadContentImgListUseCase(this._repository);

  final TmdbRepository _repository;

  @override
  Future<Result<List<String>>> call(ContentType firstReq, int secondReq) {
    /// firstReq -> [contentType] / secondRequest -> [contentId]
    if (firstReq == ContentType.tv) {
      return _repository.loadTvImgUrlList(secondReq);
    } else {
      // 임시
      return _repository.loadMovieImgUrlList(secondReq);
    }
  }
}
