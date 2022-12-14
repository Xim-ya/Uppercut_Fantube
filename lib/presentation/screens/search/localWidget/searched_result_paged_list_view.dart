import 'package:uppercut_fantube/utilities/extensions/determine_content_type.dart';
import 'package:uppercut_fantube/utilities/index.dart';

/** Created By Ximya - 2022.12.24 ð
 * [SearchScreen] > TabViewìì ì¬ì©ëë
 *  íì´ì§ ë¦¬ì¤í¸ ë·°
 *  ì¸ì ì ë¬ ë°ì [ContentType]ì ë°ë¼ ì¼ë¶ ììë¥¼ ë¶ê¸°ì²ë¦¬.
 * */

class SearchedResultPagedListView extends BaseView<SearchViewModel> {
  const SearchedResultPagedListView({Key? key, required this.contentType})
      : super(key: key);

  final ContentType contentType;

  @override
  Widget buildView(BuildContext context) {
    return GestureDetector(
      onPanDown :(_){
        vm.focusNode.unfocus();
      },
      child: PagedListView.separated(
        padding: AppInset.top20 + AppInset.bottom46,
        pagingController: vm.pagingController,
        separatorBuilder: (__, _) => AppSpace.size12,
        builderDelegate: PagedChildBuilderDelegate<SearchedContent>(
          animateTransitions: true,

          /* ë¤ì íì´ì§ ë¦¬ì¤í¸ ë¶ë¬ì¬ ë ë¡ë© Indicator */
          newPageProgressIndicatorBuilder: (context) => const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3.6,
              color: AppColor.darkGrey,
            ),
          ),

          /* ì´ê¸° íë©´ */
          firstPageErrorIndicatorBuilder: (context) => Center(
            child: Text(
              '${contentType.isTv ? 'ëë¼ë§' : 'ìí'} ì ëª©ì ìë ¥í´ì£¼ì¸ì',
              style: AppTextStyle.headline3,
            ),
          ),

          /* ê²ìë ê²°ê³¼ê° ìì ë */
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: Text(
              'ê²ìë ê²°ê³¼ê° ììµëë¤',
              style: AppTextStyle.title1,
            ),
          ),

          /* ë¡ë© ì¸ëì¼ì´í° */
          firstPageProgressIndicatorBuilder: (context) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColor.darkGrey,
            ));
          },
          /* ê²ì ê²°ê³¼*/
          itemBuilder: (context, item, index) {
            // ì»¨íì¸  ë±ë¡ ì¬ë¶ì ë°ë¥¸ ì¸ëì¼ì´í° caseë³ ìì ¯ (ì´ë¯¸ì§ overlay)
            Widget caseOverlayIndicatorOnImg() {
              switch (item.isRegisteredContent.value) {
                case ContentRegisteredValue.isLoading:
                  return const SizedBox();
                case ContentRegisteredValue.registered:
                  return Positioned.fill(
                    child: Align(
                      child: IconInkWellButton(
                        iconPath: 'assets/icons/play.svg',
                        iconSize: 40,
                        onIconTapped: () {},
                      ),
                    ),
                  );
                case ContentRegisteredValue.unRegistered:
                  return Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
              }
            }

            // ì»¨íì¸  ë±ë¡ ì¬ë¶ ì¸ëì¼ì´í° caseë³ ìì ¯
            Widget caseIndicatorOnTrailing() {
              switch (item.isRegisteredContent.value) {
                case ContentRegisteredValue.isLoading:
                  return const SizedBox(
                    height: 12,
                    width: 12,
                    child: CircularProgressIndicator(
                      color: AppColor.darkGrey,
                      strokeWidth: 2,
                    ),
                  );
                case ContentRegisteredValue.registered:
                  return const SizedBox();
                case ContentRegisteredValue.unRegistered:
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset('assets/icons/round_exclamation.svg'),
                      AppSpace.size2,
                      Text(
                        'ë±ë¡ëì§ ìì ì»¨íì¸  ìëë¤',
                        style: AppTextStyle.alert2
                            .copyWith(color: const Color(0xFF303030)),
                      ),
                    ],
                  );
              }
            }

            return InkWell(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(12),
              ),
              onTap: () {
                vm.onSearchedContentTapped(
                    content: item, contentType: contentType);
              },
              child: Row(
                children: <Widget>[
                  // ì»¨íì¸  í¬ì¤í° ì´ë¯¸ì§
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CachedNetworkImage(
                            imageUrl: item.posterImgUrl?.prefixTmdbImgPath ?? '',
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            placeholder: (context, url) => Shimmer(
                              child: Container(
                                color: AppColor.black,
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: AppColor.darkGrey,
                              child: const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Obx(caseOverlayIndicatorOnImg)
                    ],
                  ),
                  AppSpace.size8,
                  SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppSpace.size2,
                        // ì ëª©
                        SizedBox(
                          width: SizeConfig.to.screenWidth - 140,
                          child: Text(
                            item.title ?? 'ì ëª© ìì',
                            style: AppTextStyle.title1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        AppSpace.size2,

                        // ê°ë´ & ì²« ë°©ìì¼
                        if (item.releaseDate != null || item.releaseDate != '')
                          Text(
                            item.releaseDate != null
                                ? Formatter.dateToyyMMdd(item.releaseDate!)
                                : contentType == ContentType.tv
                                    ? 'ë°©ìì¼ íì¸ ë¶ê°'
                                    : 'ê°ë´ì¼ íì¸ ë¶ê°',
                            style: AppTextStyle.body2
                                .copyWith(color: AppColor.lightGrey),
                          ),
                        AppSpace.size2,
                        // ë±ë¡ ì¬ë¶ Indicator
                        Obx(
                          caseIndicatorOnTrailing,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
