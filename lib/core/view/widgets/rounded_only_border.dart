import 'package:elm_task/export.dart';

class RoundedOnlyBorder extends StatelessWidget {
  const RoundedOnlyBorder({
    super.key,
    required this.child,
    this.color = kPrimaryColor,
    this.top,
    this.bottom,
  });
  final Widget child;
  final Color color;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(top ?? 0),
            topEnd: Radius.circular(top ?? 0),
            bottomStart: Radius.circular(bottom ?? 0),
            bottomEnd: Radius.circular(bottom ?? 0),
          ),
        ),
      ),
      child: child,
    );
  }
}
