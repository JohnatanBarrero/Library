import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_roobin/pages/intro/page.dart' as intro;
import 'package:library_roobin/pages/dashboard/page.dart' as dashboard;
import 'package:library_roobin/pages/detailbook/page.dart' as detail;

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const intro.Page(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/dashboard',
          child: (context, args) => const dashboard.Page(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/detail',
          child: (context, args) => detail.Page(
            doc: args.data['doc'],
          ),
          transition: TransitionType.fadeIn,
        ),
      ];
}
