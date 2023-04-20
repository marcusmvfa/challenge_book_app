import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/domain/model/volume_info.dart';
import 'package:flutter_book_app/presentation/shared/rating_stars.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key, required this.volumeInfo});
  final VolumeInfo? volumeInfo;

  String getAuthors() {
    var listAuthors = "By ";
    if (volumeInfo?.authors != null && volumeInfo!.authors!.isNotEmpty) {
      for (var author in volumeInfo!.authors!) {
        listAuthors += "$author, ";
      }
    }
    return listAuthors;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // elevation: 2,
      child: Container(
        margin: const EdgeInsets.only(top: 32, right: 32, left: 32, bottom: 16),
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            volumeInfo?.imageLinks?.thumbnail != null
                ? Image.network(
                    volumeInfo!.imageLinks!.thumbnail!,
                    loadingBuilder: (context, child, loading) {
                      if (loading == null) return child;
                      return const SizedBox(
                        height: 254,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorBuilder: ((context, error, stackTrace) => const FlutterLogo(
                          size: 254,
                        )),
                  )
                : const FlutterLogo(
                    size: 254,
                  ),
            const SizedBox(
              height: 16,
            ),
            Text(
              volumeInfo?.title ?? "",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              getAuthors(),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
            const SizedBox(
              height: 16,
            ),
            RatingStars(stars: volumeInfo?.averageRating ?? 0)
          ],
        ),
      ),
    );
  }
}
