import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_test/features/nasa_pictures/widgets/details/nasa_pictures_details.dart';
import 'package:nasa_test/features/nasa_pictures/list/nasa_pictures_list.dart';
import 'package:nasa_test/app_home_page.dart';
import 'package:nasa_test/shared/error_page.dart';

class NasaAppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const AppHomePage()),
    ChildRoute('/list', child: (context, args) => const NasaPicturesList()),
    ChildRoute('/detail',
        child: (context, args) => NasaPicturesDetails(args: args.data)),
    WildcardRoute(
        child: (context, args) => ErrorPage(
              error: 'Route not found!',
              onRefresh: () => Modular.to.navigate(Modular.initialRoute),
            )),
  ];
}
