import '../../../export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.searchList,
    this.searchController,
  });

  final SearchController? searchController;
  final String title;
  final List? searchList;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title.toTitleCase(),
          style: Theme.of(context).textTheme.titleLarge),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
