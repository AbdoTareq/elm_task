import '../../../export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final List<Widget>? actions;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title.toTitleCase(),
          style: Theme.of(context).textTheme.titleLarge),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
