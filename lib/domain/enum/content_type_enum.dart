/** Created By ximya - 2022.12.17
 *  컨텐츠 타입 - '영화' '드라마'
 * */

enum ContentType {
  tv,
  movie;

  factory ContentType.fromString(String originStr) {
    switch (originStr) {
      case 'tv':
        return ContentType.tv;
      case 'movie':
        return ContentType.movie;
      default:
        throw Exception('enum not found');
    }
  }
}
