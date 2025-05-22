// import 'package:dapperz/models/category/category_model.dart' as cm;
import 'package:dapperz/models/dashboard/all_category_model.dart' as cm;
import '../../../config.dart';

class CategoryCardLayout extends StatelessWidget {
  final cm.Data? categoryModel;
  final int? index;
  final bool? isEven;
  final GestureTapCallback? onTap;

  const CategoryCardLayout({
    Key? key,
    this.categoryModel,
    this.index,
    this.isEven,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      final Size size = MediaQuery.of(context).size;

      final bool safeIsEven = isEven ?? true;

      // Flexible height values for staggered layout
      final double imageHeight = safeIsEven ? 210 : 140;
      final double cardHeight = imageHeight + 100; // total height estimate

      return categoryModel?.imageUrl != null
          ? GestureDetector(
        onTap: onTap,
        child: Container(
          // Remove fixed height, let content define height
          // margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: safeIsEven
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // important!
            children: [
              // Flexible image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  categoryModel!.imageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: imageHeight,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
                ),
              ),
            const SizedBox(height: 10),

              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    categoryModel?.categoryName ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      )
          : const SizedBox();
    });
  }
}

