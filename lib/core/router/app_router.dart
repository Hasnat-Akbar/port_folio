import 'package:go_router/go_router.dart';
import 'package:m_portfolio/features/home/presentation/pages/home_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => HomePage())],
);
