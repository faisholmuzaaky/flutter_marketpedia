part of 'widget.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 12,
              top: 14,
              bottom: 14,
            ),
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              Icons.search,
              color: greyColor,
            ),
          ),
          Text(
            'Search product',
            style: greyTextStyle,
          ),
        ],
      ),
    );
  }
}
