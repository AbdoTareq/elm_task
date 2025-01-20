import '../../../export.dart';

class RoundedCornerButton extends StatelessWidget {
  const RoundedCornerButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.isOutlined = false,
    this.borderColor,
    this.width,
    this.height,
    this.isLoading = false,
  });

  final void Function()? onPressed;
  final Color? color;
  final Color? borderColor;
  final String text;
  final bool isOutlined;
  final double? width;
  final double? height;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoading
          ? Center(child: const CircularProgressIndicator())
          : SizedBox(
              width: width ?? double.infinity,
              height: height ?? 48.h,
              child: ElevatedButton(
                  style: isOutlined
                      ? ButtonStyle(
                          elevation: const WidgetStatePropertyAll<double>(0),
                          backgroundColor: const WidgetStatePropertyAll<Color>(
                              Colors.transparent),
                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: kPrimaryColor),
                          )))
                      : ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(
                              color ?? kPrimaryColor),
                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      color:
                                          borderColor ?? Colors.transparent)))),
                  onPressed: onPressed,
                  child: Text(
                    text.toTitleCase(),
                    style: context.textTheme.titleLarge?.copyWith(
                      color: isOutlined ? null : kWhite,
                    ),
                  )),
            ),
    );
  }
}
