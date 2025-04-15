import 'package:dapperz/config.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                panEnabled: true,
                panAxis: PanAxis.aligned,
                boundaryMargin: const EdgeInsets.all(100),
                minScale: 1,
                maxScale: 2,
                child: FadeInImageLayout(
                  image: imageUrl,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ).paddingOnly(
                    right: AppScreenUtil().screenWidth(10),
                    left: AppScreenUtil().screenWidth(10)),
              ),
            ),
            Positioned(
              top: 20.0,
              right: 20.0,
              child: IconButton(
                icon: const Icon(Icons.close),
                color: Colors.black,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
