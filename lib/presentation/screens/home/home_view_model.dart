import 'package:uppercut_fantube/data/dataSource/content/content_data_source.dart';
import 'package:uppercut_fantube/domain/model/content/top_exposed_content_list.dart';
import 'package:uppercut_fantube/utilities/index.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class HomeViewModel extends BaseViewModel {
  /// 임시
  final ContentDataSource _dataSource;


  HomeViewModel(this._dataSource);

  /* Variables */

  /// State
  late double scrollOffset = 0;
  final RxBool showAppbarBackground = true.obs;
  RxBool showBlurAtAppBar = false.obs;

  /// Size
  final double appBarHeight = SizeConfig.to.statusBarHeight + 56;

  ///  Controllers
  late ScrollController scrollController;

  /* Intent */
  /// UI Intent Method
  // AppBar Blur효과 avtivate 여부
  void turnOnBlurInAppBar() {
    // Status Bar Height 보다 offest이 작을 땐 Blur 처리 X
    if (scrollOffset <= SizeConfig.to.statusBarHeight) {
      showBlurAtAppBar(false);
      return;
    } else {
      /** 중복 할당을 방지하기 위해. 조건 두가지를 추가.
       * [scrollController.position.userScrollDirection] 유저가 아래로 스크롤하고
       * [showBlurAtAppBar.isTrue] blur값이 true로 선언되어 있다면 값을 변경.
       * */
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward && showBlurAtAppBar.isTrue) {
          showBlurAtAppBar(false);
        return;
      } else if  (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse && showBlurAtAppBar.isFalse){
        showBlurAtAppBar(true);
        return;
      }
    }
  }

  void launchAnotherApp() async {
    if (!await launchUrl(Uri.parse('https://www.youtube.com/watch?v=zhdbtAqne_I&t=1162s'),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch ';
    }
  }



  /// Routes Method
  void routeToContentDetail(){
    Get.toNamed(AppRoutes.contentDetail);
  }


  /// Youtube Video Comment
  Future<void> youtubeIntent() async{
    var yt = YoutubeExplode();
    var video = await yt.videos.get('N16uIvWozVk');

    var comments = await yt.videos.commentsClient.getComments(video);
  }


  /// Mock Json Data Video
  Future<void> getJsonMockData() async {
    final responseResult =  await _dataSource.loadTopExposedContentList();
    final List<TopExposedContent> mockItemLis = responseResult;
    print(mockItemLis[2].title);
  }

  @override
  void onInit() {
    super.onInit();

    scrollController = ScrollController();
    scrollController.addListener(() {
      scrollOffset = scrollController.offset;
      turnOnBlurInAppBar();
    });

    youtubeIntent();
    getJsonMockData();
  }
}
