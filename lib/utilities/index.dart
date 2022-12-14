/* Created By Ximya - 2022.11.04
*  Single Imports로 패키지 및 소스파일 관리
*  TODO: 중복된 export 구문 있음. 삭제 필요
* */

// Flutter Packages
export 'package:flutter/material.dart';
export 'package:flutter/rendering.dart';
export 'package:flutter_svg/svg.dart';

// External Packages
export 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
export 'package:get/get.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:shimmer_animation/shimmer_animation.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:json_annotation/json_annotation.dart';
export 'package:youtube_explode_dart/youtube_explode_dart.dart';
export 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// BaseModule
export 'package:uppercut_fantube/presentation/base/base_view_model.dart';
export 'package:uppercut_fantube/domain/base/base_use_case.dart';
export 'package:uppercut_fantube/domain/base/base_no_param_use_case.dart';
export 'package:uppercut_fantube/domain/base/base_two_param_use_case.dart';

// App
export 'package:uppercut_fantube/data/dto/tmdb/response/newResponse/tmdb_movie_content_list_wrapped_response.dart';
export 'package:uppercut_fantube/data/dto/tmdb/response/newResponse/tmdb_tv_content_list_wrapped_response.dart';
export 'package:uppercut_fantube/app/config/font_config.dart';
export 'package:uppercut_fantube/app/config/color_config.dart';
export 'package:uppercut_fantube/app/config/color_config.dart';
export 'package:uppercut_fantube/app/routes/app_routes.dart';
export 'package:uppercut_fantube/app/config/app_space_config.dart';
export 'package:uppercut_fantube/app/config/size_config.dart';
export 'package:uppercut_fantube/app/modules/data_modules.dart';
export 'package:uppercut_fantube/app/modules/domain_modules.dart';
export 'package:uppercut_fantube/app/modules/presentation_modules.dart';

// Data
export 'package:uppercut_fantube/data/repository/youtube/youtube_repository.dart';
export 'package:uppercut_fantube/data/dto/tmdb/response/newResponse/tmdb_content_credit_response.dart';
export 'package:uppercut_fantube/data/dto/tmdb/response/newResponse/tmdb_tv_detail_response.dart';
export 'package:uppercut_fantube/data/dto/tmdb/tmdb_api.dart';
export 'package:uppercut_fantube/data/dto/tmdb/response/newResponse/tmdb_movie_detail_response.dart';
export 'package:uppercut_fantube/data/dto/tmdb/response/newResponse/tmdb_content_image_response.dart';
export 'package:uppercut_fantube/data/dataSource/content/content_data_source.dart';
export 'package:uppercut_fantube/data/dataSource/content/content_data_source_impl.dart';
export 'package:uppercut_fantube/data/dataSource/tmdb/tmdb_data_source.dart';
export 'package:uppercut_fantube/data/dataSource/tmdb/tmdb_data_source_impl.dart';
export 'package:uppercut_fantube/data/repository/content/content_repository.dart';
export 'package:uppercut_fantube/data/repository/content/content_repository_impl.dart';
export 'package:uppercut_fantube/data/repository/tmdb/tmdb_repository.dart';
export 'package:uppercut_fantube/data/repository/tmdb/tmdb_repository_impl.dart';

// Domain
export 'package:uppercut_fantube/domain/model/content/season_info.dart';
export 'package:uppercut_fantube/domain/model/video/content_videos.dart';
export 'package:uppercut_fantube/domain/enum/content_video_format.dart';
export 'package:uppercut_fantube/domain/useCase/video/load_content_of_video_list_use_case.dart';
export 'package:uppercut_fantube/domain/model/video/content_video_item.dart';
export 'package:uppercut_fantube/domain/model/content/content_shell.dart';
export 'package:uppercut_fantube/domain/model/content/simple_content_info.dart';
export 'package:uppercut_fantube/domain/enum/content_type_enum.dart';
export 'package:uppercut_fantube/domain/model/youtube/youtube_content_comment.dart';
export 'package:uppercut_fantube/domain/model/youtube/youtube_video_content_info.dart';
export 'package:uppercut_fantube/domain/model/content/tv_content_credit_info.dart';
export 'package:uppercut_fantube/domain/model/content/content_episode_info_item.dart';
export 'package:uppercut_fantube/domain/useCase/tmdb/load_searched_content_result_use_case.dart';
export 'package:uppercut_fantube/domain/useCase/content/load_top_exposed_content_list_use_case.dart';
export 'package:uppercut_fantube/domain/useCase/tmdb/load_content_detail_info_use_case.dart';
export 'package:uppercut_fantube/data/dataSource/content/content_data_source.dart';
export 'package:uppercut_fantube/domain/model/content/exposure_content.dart';
export 'package:uppercut_fantube/domain/model/content/youtube_content.dart';
export 'package:uppercut_fantube/domain/model/content/content_main_info.dart';
export 'package:uppercut_fantube/domain/model/content/category_based_content_list.dart';
export 'package:uppercut_fantube/domain/enum/content_season_type_enum.dart';
export 'package:uppercut_fantube/domain/enum/ott_type_enum.dart';
export 'package:uppercut_fantube/domain/model/content/content_detail_info.dart';
export 'package:uppercut_fantube/domain/model/content/searched_content.dart';
export 'package:uppercut_fantube/domain/service/content_service.dart';
export 'package:uppercut_fantube/domain/useCase/tmdb/load_content_credit_info_use_case.dart';
export 'package:uppercut_fantube/domain/useCase/tmdb/load_content_img_list_use_case.dart';
export 'package:uppercut_fantube/domain/model/content/content_argument_format.dart';
export 'package:uppercut_fantube/domain/model/youtube/youtube_channel_info.dart';

// Presentation
export 'package:uppercut_fantube/presentation/common/animated_index_stack.dart';
export 'package:uppercut_fantube/presentation/screens/home/home_screen.dart';
export 'package:uppercut_fantube/presentation/common/sticky_delegate_container.dart';
export 'package:uppercut_fantube/presentation/screens/contentDetail/content_detail_scaffold_controller.dart';
export 'package:uppercut_fantube/presentation/screens/contentDetail/content_detail_scaffold.dart';
export 'package:uppercut_fantube/presentation/screens/contentDetail/localWidget/tabView/content_detail_info_tab_view.dart';
export 'package:uppercut_fantube/presentation/common/video_thumbnail_img_with_player_btn.dart';
export 'package:uppercut_fantube/presentation/screens/contentDetail/content_detail_view_model.dart';
export 'package:uppercut_fantube/presentation/common/round_profile_img.dart';
export 'package:uppercut_fantube/presentation/screens/contentDetail/localWidget/section_title.dart';
export 'package:uppercut_fantube/presentation/base/base_screen.dart';
export 'package:uppercut_fantube/presentation/base/base_view.dart';
export 'package:uppercut_fantube/presentation/screens/tabs/tabs_view_model.dart';
export 'package:uppercut_fantube/presentation/screens/tabs/tabs_binding.dart';
export 'package:uppercut_fantube/presentation/screens/tabs/tabs_screen.dart';
export 'package:uppercut_fantube/presentation/common/content_post_item.dart';
export 'package:uppercut_fantube/presentation/common/content_post_slider.dart';
export 'package:uppercut_fantube/presentation/common/icon_ink_well_button.dart';
export 'package:uppercut_fantube/presentation/screens/home/home_scaffold.dart';
export 'package:uppercut_fantube/presentation/screens/home/home_view_model.dart';
export 'package:uppercut_fantube/presentation/screens/contentDetail/content_detail_binding.dart';
export 'package:uppercut_fantube/presentation/screens/contentDetail/content_detail_screen.dart';
export 'package:uppercut_fantube/presentation/screens/contentDetail/localWidget/tabView/main_content_tab_view.dart';
export 'package:uppercut_fantube/presentation/screens/search/localWidget/search_scaffold_controller.dart';
export 'package:uppercut_fantube/presentation/screens/search/localWidget/search_scaffold.dart';
export 'package:uppercut_fantube/presentation/screens/search/search_view_model.dart';
export 'package:uppercut_fantube/presentation/screens/search/localWidget/searched_result_paged_list_view.dart';
export 'package:uppercut_fantube/presentation/common/skeleton_box.dart';
export 'package:uppercut_fantube/presentation/screens/contentDetail/localWidget/content_video_views_by_case.dart';
export 'package:uppercut_fantube/presentation/screens/contentDetail/localWidget/single_video_skeleton_view.dart';

// Utilities
export 'package:uppercut_fantube/utilities/extensions/get_last_character_of_string.extension.dart';
export 'package:uppercut_fantube/utilities/constants/bottom_navigation_constants.dart';
export 'package:uppercut_fantube/utilities/api_error_handler_mixin.dart';
export 'package:uppercut_fantube/utilities/result.dart';
export 'package:uppercut_fantube/utilities/youtube_meta_data.dart';
export 'package:uppercut_fantube/app/config/app_insets.dart';
export 'package:flutter_styled_toast/flutter_styled_toast.dart';
export 'package:uppercut_fantube/utilities/extensions/check_null_state_extension.dart';
export 'package:uppercut_fantube/utilities/extensions/tmdb_img_path_extension.dart';
export 'package:uppercut_fantube/utilities/formatter.dart';
export 'package:uppercut_fantube/presentation/common/alert_widget.dart';
