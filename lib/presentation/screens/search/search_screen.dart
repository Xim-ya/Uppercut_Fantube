import 'package:uppercut_fantube/presentation/screens/search/localWidget/search_scaffold.dart';
import 'package:uppercut_fantube/presentation/screens/search/search_view_model.dart';
import 'package:uppercut_fantube/utilities/index.dart';

class SearchScreen extends BaseScreen<SearchViewModel> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  bool get wrapWithSafeArea => false;

  // 앱바
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(0, SizeConfig.to.statusBarHeight),
      child: Container(
        padding: EdgeInsets.only(top: SizeConfig.to.statusBarHeight) +
            AppInset.horizontal12,
        height: SizeConfig.to.statusBarHeight + 54,
        child: SizedBox(
          child: Row(
            children: [
              SizedBox(
                  height: 40,
                  width: SizeConfig.to.screenWidth - 84,
                  child: Stack(
                    children: [
                      TextFormField(
                        keyboardAppearance: Brightness.dark,
                        focusNode: FocusNode(),
                        onChanged: (String) {},
                        controller: TextEditingController(),
                        cursorColor: AppColor.lightGrey,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'pretendard_regular'),
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding:
                              const EdgeInsets.only(left: 38, right: 40),
                          hintText: '제목을 입력하세요',
                          errorBorder: InputBorder.none,
                          enabledBorder: fixedOutLinedBorder(),
                          disabledBorder: fixedOutLinedBorder(),
                          focusedBorder: fixedOutLinedBorder(),
                          fillColor: AppColor.strongGrey,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColor.lightGrey.withOpacity(0.4),
                              fontFamily: 'pretendard_regular'),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          width: 40,
                          child: Icon(
                            Icons.search_rounded,
                            color: AppColor.lightGrey,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            print('close Searched Query');
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: const BoxDecoration(
                                color: AppColor.lightGrey,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close_rounded,
                                size: 12,
                                color: AppColor.strongGrey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                width: 60,
                child: Center(
                  child: Text(
                    '취소',
                    style: AppTextStyle.title2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildScreen(BuildContext context) {
    return SearchScaffold();
  }

  OutlineInputBorder fixedOutLinedBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: Colors.transparent));
  }
}