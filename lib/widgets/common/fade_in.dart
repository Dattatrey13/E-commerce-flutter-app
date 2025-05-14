import 'package:cached_network_image/cached_network_image.dart';
import 'package:dapperz/common_methods.dart';

import '../../config.dart';

class FadeInImageLayout extends StatelessWidget {
  final String? image;
  final double? height, width;
  final BoxFit? fit;
  final bool isAsset;

  const FadeInImageLayout(
      {Key? key,
      this.image,
      this.width,
      this.height,
      this.fit,
      this.isAsset = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isAsset
        ? FadeInImage(
            placeholder: AssetImage(gifAssets.loading),
            image: AssetImage(image!),
            fit: fit,
            height: height,
            alignment: Alignment.center,
            placeholderFit: BoxFit.contain,
            width: width,
          )
        : CachedNetworkImage(
            cacheKey: getAWSS3BaseImageUrl(image!),
            // imageUrl: image!,
            imageUrl: getAWSS3BaseImageUrl(image!),
            fit: fit,
            height: height,
            alignment: Alignment.center,
            width: width,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                SizedBox(
              height: 200,
              width: 200,
              child: Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress)),
            ),
            errorWidget: (context, url, error) {
              return CachedNetworkImage(
                cacheKey: getAWSS3BaseImageUrl(image!),
                imageUrl: image!,
                fit: fit,
                height: height,
                alignment: Alignment.center,
                width: width,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
                ),
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
              );
            },
          );
    // : FadeInImage(
    //     placeholder: AssetImage(gifAssets.loading),
    //     image: NetworkImage(image!),
    //     fit: fit,
    //     height: height,
    //     alignment: Alignment.center,
    //     placeholderFit: BoxFit.none,
    //     width: width,
    //     imageErrorBuilder: (context, error, stacktrace) {
    //       return FadeInImage.memoryNetwork(
    //         fit: BoxFit.cover,
    //         placeholder: kTransparentImage,
    //         image: image!,
    //         imageErrorBuilder: (context, error, stacktrace) {
    //           return SizedBox(
    //             height: height,
    //             child: const Center(
    //               child: Text(
    //                 'Image Not Available',
    //               ),
    //             ),
    //           );
    //         },
    //       );
    //     },
    //   );
  }
}
