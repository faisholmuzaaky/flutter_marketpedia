part of 'widget.dart';

class NoContent extends StatelessWidget {
  final Widget icon;
  final String title;
  final String message;
  final String? buttoTittle;
  final double? buttonWidth;
  final double? buttonHeight;
  final Function()? onTap;
  const NoContent({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.buttoTittle,
    this.buttonWidth,
    this.buttonHeight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 150),
      child: Column(
        children: [
          icon,
          const SizedBox(
            height: 24,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            message,
            style: greyTextStyle,
          ),
          const SizedBox(
            height: 18,
          ),
          buttoTittle != null
              ? GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: buttonWidth,
                    height: buttonHeight,
                    decoration: BoxDecoration(
                      color: orangeColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        buttoTittle!,
                        style: orangeTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
