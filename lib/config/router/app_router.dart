import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (contex, state) => const HomeScreen()),
  GoRoute(
      path: '/cubits', builder: (contex, state) => const CubitCounterScreen()),
  GoRoute(path: '/bloc', builder: (contex, state) => const BlocCounterScreen()),
]);
