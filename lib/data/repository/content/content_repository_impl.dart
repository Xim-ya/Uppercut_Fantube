import 'package:uppercut_fantube/utilities/index.dart';

class ContentRepositoryImpl implements ContentRepository {
  ContentRepositoryImpl(this._contentDataSource);

  final ContentDataSource _contentDataSource;

  /* 컨텐츠 정보 (컨텐츠탭 + 헤더) */
  @override
  Future<Result<ContentMainInfo>> loadContentMainInfo() async {
    try {
      final ContentMainInfo response = ContentMainInfo(
        id: 'V2sdf20aQ',
        title: '올드맨',
        ottTypeList: [OttType.netflix],
        rate: 8.2,
        genreList: ['드라마', '액션'],
        releaseDate: '2022-10-15',
        contentEpicType: ContentSeasonType.single,
        contentDescription:
            '수십 년 전 잠적한 전직 CIA 요원 댄 체이스. 과거의 비밀을 안고 은둔한 채 살악던 중 결국 정체가 탄로 난다. 하지만 미래를 위해서 더 이상 숨어 살 수 없는 그는 과거의 매듭을 풀고자 하는데',
        youtubeContents: [
          YoutubeContent(
            likes: 990000,
            viewCount: 5293315,
            releaseDate: '2022-11-19',
            lastUpdateDate: '2022-11-22',
            videoId: 'TXMtLF5OANI',
          )
        ],
      );
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  // 홈 상단 노출 콘텐츠 리스트 호출
  @override
  Future<Result<List<PosterExposureContent>>> loadTopExposedContent() async {
    try {
      final response = await _contentDataSource.loadTopExposedContentList();
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  // 컨텐츠 에피소드 아이템 리스트 호출
  @override
  Future<Result<List<ContentEpisodeInfoItem>>>
      loadContentEpisodeItemList() async {
    try {
      final response = await _contentDataSource.loadContentEpisodeItemList();
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  // Top10 컨텐츠 리스트 호출
  @override
  Future<Result<List<PosterExposureContent>>> loadTopTenContentList() async {
    try {
      final response = await _contentDataSource.loadTopTenContentList();
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<List<CategoryBaseContentList>>>
      loadContentListWithCategory() async {
    try {
      final response = await _contentDataSource.loadContentWithCategory();
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
