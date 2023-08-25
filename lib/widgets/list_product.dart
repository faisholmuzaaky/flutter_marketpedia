part of 'widget.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DetailProduct(),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 150,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: greyColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.only(right: 14),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Cooper Mount Bike',
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    '\$570.0',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star_border,
                      color: whiteColor,
                    ),
                    label: Text(
                      '4.5',
                      style: whiteTextStyle,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orangeColor,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  child: const Icon(Icons.favorite),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: greyColor.withOpacity(0.2),
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
