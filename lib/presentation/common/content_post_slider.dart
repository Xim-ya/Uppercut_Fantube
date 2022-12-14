import 'package:uppercut_fantube/utilities/index.dart';

class ContentPostSlider extends StatelessWidget {
  const ContentPostSlider({Key? key, required this.height, required this.itemCount, required this.itemBuilder}) : super(key: key);

  final double height;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
          separatorBuilder: (__, _) => AppSpace.size8,
          padding: const EdgeInsets.only(left: 16),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder : itemBuilder,
          ),
    );
  }
}
