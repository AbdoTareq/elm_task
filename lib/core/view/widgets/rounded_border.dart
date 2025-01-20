import 'package:elm_task/export.dart';

class RoundedBorder extends StatelessWidget {
  const RoundedBorder({
    super.key,
    required this.child,
    this.color = kPrimaryColor,
    this.radius = 12,
  });
  final Widget child;
  final Color color;
  final num radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color),
          borderRadius: BorderRadius.all(Radius.circular(radius.r)),
        ),
      ),
      child: child,
    );
  }
}
