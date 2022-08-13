import 'package:foodie/utils/assets.dart';

import '../exports.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FoodieWidget extends StatelessWidget {
  final String name;
  final String? imagelink;
  const FoodieWidget({
    Key? key,
    required this.name,
    this.imagelink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              // color: Colors.black12,
              // image: DecorationImage(
              //     image: NetworkImage(imagelink),
              //     fit: BoxFit.cover,
              //     colorFilter: const ColorFilter.mode(
              //       Colors.black26,
              //       BlendMode.darken,
              //     )),
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                color: Colors.black12,
                colorBlendMode: BlendMode.darken,
                imageUrl: imagelink!,
                progressIndicatorBuilder: (context, url, progress) =>
                    Image.asset(
                  Assets.loadingPlaceholder,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  Assets.loadingPlaceholder,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                name,
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
