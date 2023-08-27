part of 'widget.dart';

class ListTransaction extends StatelessWidget {
  final TransactionModel transaction;
  const ListTransaction({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: orangeColor,
                size: 32,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shopping',
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      transaction.transactionDate!,
                      style: greyTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Grand Total',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      )),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                        .format(getTotal()),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: greyColor,
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Text(
          //         'Address',
          //         style: greyTextStyle,
          //       ),
          //     ),
          //     Text(
          //       transaction.transactionAddress ?? "Pura",
          //       style: blackTextStyle.copyWith(fontWeight: semiBold),
          //     )
          //   ],
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Text(
          //         'Delivery by',
          //         style: greyTextStyle,
          //       ),
          //     ),
          //     Text(
          //       transaction.transactionDelivery ?? 'Grab Instan',
          //       style: blackTextStyle.copyWith(fontWeight: semiBold),
          //     )
          //   ],
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Text(
          //         'Payment method',
          //         style: greyTextStyle,
          //       ),
          //     ),
          //     Text(
          //       transaction.transactionPayment ?? 'OVO',
          //       style: blackTextStyle.copyWith(fontWeight: semiBold),
          //     )
          //   ],
          // ),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: NetworkImage(
                      (context.read<ProductCubit>().state as ProductSuccess)
                          .products
                          .where((element) =>
                              element.productId ==
                              transaction.salesDetail!.first.productId)
                          .first
                          .productPhoto!,
                    ))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (context.read<ProductCubit>().state as ProductSuccess)
                          .products
                          .where((element) =>
                              element.productId ==
                              transaction.salesDetail!.first.productId)
                          .first
                          .productName!,
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${transaction.salesDetail!.first.transactionQty} item',
                      style: greyTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: transaction.salesDetail!.length > 1 ? 8 : 0,
          ),
          transaction.salesDetail!.length > 1
              ? Text(
                  '+${transaction.salesDetail!.length - 1} other item',
                  style: greyTextStyle.copyWith(fontWeight: medium),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  int getTotal() {
    int total = 0;
    for (var element in transaction.salesDetail!) {
      total = total +
          int.parse(element.transactionValue!) *
              int.parse(element.transactionQty!);
    }
    return total;
  }
}
