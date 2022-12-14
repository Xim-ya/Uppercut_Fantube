import 'dart:developer';
import 'package:get/get.dart';
import 'package:uppercut_fantube/data/repository/content/content_repository.dart';
import 'package:uppercut_fantube/domain/enum/content_type_enum.dart';
import 'package:uppercut_fantube/domain/model/content/simple_content_info.dart';
import 'package:uppercut_fantube/utilities/extensions/determine_content_type.dart';

/** Created By Ximya - 2022.12.24
 *  ContentService 모듈에서는 전역으로 사용되는
 *  모든 [content] 데이터와 관련된 객체와 메소드를 관리함.
 * */

class ContentService extends GetxService {
  // 등록된 전체 tv 컨텐츠 리스트
  final Rxn<List<SimpleContentInfo>> totalListOfRegisteredTvContent = Rxn();

  // 등록된 전체 movie 컨텐츠 리스트
  final Rxn<List<SimpleContentInfo>> totalListOfRegisteredMovieContent = Rxn();

  /* Intent */
  // 인자로 전달 받은 타입에 따라 등록된 전체 컨텐츠 리스트를 반환
  List<SimpleContentInfo>? returnTotalListBaseOnType(
      {required ContentType type}) {
    if (type.isTv) {
      return totalListOfRegisteredTvContent.value;
    } else {
      return totalListOfRegisteredMovieContent.value;
    }
  }

  // 등록된 'TV' 컨텐츠 리스트 호출
  Future<void> fetchAllOfRegisteredTvContent() async {
    final responseResult = await ContentRepository.to.loadAllOfTvContentList();
    responseResult.fold(
      onSuccess: (data) {
        totalListOfRegisteredTvContent.value = data;
      },
      onFailure: (e) {
        log('[ContentService] - 전체 TV 컨텐츠 리스트 호출 실패');
      },
    );
  }

  Future<void> fetchAllOfRegisteredMovieContent() async {
    final responseResult =
        await ContentRepository.to.loadAllOfMovieContentList();
    responseResult.fold(
      onSuccess: (data) {
        totalListOfRegisteredMovieContent.value = data;
      },
      onFailure: (e) {
        log('[ContentService] - 전체 MOVIE 컨텐츠 리스트 호출 실패');
      },
    );
  }

  static ContentService get to => Get.find();
}
