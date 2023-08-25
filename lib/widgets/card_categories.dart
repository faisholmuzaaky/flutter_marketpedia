part of 'widget.dart';

class CardCategories extends StatelessWidget {
  final String image;
  const CardCategories({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: greyColor.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(image),
      ),
    );
  }
}
