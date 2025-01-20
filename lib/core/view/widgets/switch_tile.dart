import 'package:elm_task/export.dart';

class SwitchTile extends StatelessWidget {
  const SwitchTile({
    super.key,
    required this.title,
    this.hasBottomDivider = true,
    this.onChanged,
    required this.value,
  });

  final String title;
  final bool value;
  final bool hasBottomDivider;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          value: value,
          dense: true,
          activeColor: kPrimaryColor,
          contentPadding: const EdgeInsets.all(0),
          visualDensity: VisualDensity.compact,
          title: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          onChanged: onChanged,
        ),
        if (hasBottomDivider)
          Divider(
            thickness: 1,
            color: kPrimaryColor.withOpacity(.3),
          ),
      ],
    );
  }
}
