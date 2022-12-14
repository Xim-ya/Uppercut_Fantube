import 'package:uppercut_fantube/utilities/index.dart';

/* Created By Ximya - 2022.12.31
 *  컨텐츠의 유튜브 비도오 정보 리스트를 호출하는 useCase
 *  [contentId] 와[contentType]을 인자로 전달 받음.
 *  [contentType]값('tv' 'movie')에 따라 다른 Api를 호출
* */

class LoadContentOfVideoListUseCase
    extends BaseTwoParamUseCase<ContentType, int, Result<ContentVideos>> {
  LoadContentOfVideoListUseCase(this._repository);

  final ContentRepository _repository;

  @override
  Future<Result<ContentVideos>> call(ContentType firstReq, int secondReq) {
    // firstReq -> [contentType] / secondRequest -> [Query]
    if (firstReq == ContentType.tv) {
      return _repository.loadDramaContentVideoList(secondReq);
    } else {
      return _repository.loadMovieContentVideoList(secondReq);
    }
  }
}
