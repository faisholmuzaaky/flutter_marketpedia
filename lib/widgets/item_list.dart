part of 'widget.dart';

class ItemList extends StatelessWidget {
  final String title;
  final double? height;
  final Widget? icon;

  const ItemList({
    super.key,
    required this.title,
    this.height = 60,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      // margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: orangeColor.withOpacity(0.25),
              borderRadius: BorderRadius.circular(6),
            ),
            child: icon,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
