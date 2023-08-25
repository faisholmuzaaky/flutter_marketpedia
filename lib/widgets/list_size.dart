part of 'widget.dart';

class ListSize extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  const ListSize({
    super.key,
    required this.title,
    this.backgroundColor,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(
        top: 8,
        right: 8,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? greyColor.withOpacity(0.2),
        border: Border.all(color: blackColor),
      ),
      child: Text(
        title,
        style: titleStyle ??
            blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
      ),
    );
  }
}
