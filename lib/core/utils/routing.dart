import 'package:go_router/go_router.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';
import 'package:project/Features/home/presentation/view/book_details_view.dart';
import 'package:project/Features/home/presentation/view/home_view.dart';
import 'package:project/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kSplashView = '/';
  static const String kHomeView = '/HomeView';
  static const String kBookDetailsView = '/HomeView/BookDetailsView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: kSplashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    GoRoute(
        path: kBookDetailsView,
        builder: (context, state) =>
            BookDetailsView(bookModel: state.extra as BookModel))
  ]);
}
