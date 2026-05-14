import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterDemo extends StatefulWidget {
  const GoRouterDemo({super.key});

  @override
  State<GoRouterDemo> createState() => _GoRouterDemoState();
}

class _GoRouterDemoState extends State<GoRouterDemo> {
  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => _RoutePane(
          title: 'Home',
          body: 'GoRouter uses declarative route tables.',
          onNext: () => context.go('/details/42'),
        ),
      ),
      GoRoute(
        path: '/details/:id',
        builder: (context, state) => _RoutePane(
          title: 'Details #${state.pathParameters['id']}',
          body: 'Path parameters are available from GoRouterState.',
          onNext: () => context.go('/'),
        ),
      ),
    ],
  );

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Router(
          routerDelegate: _router.routerDelegate,
          routeInformationParser: _router.routeInformationParser,
          routeInformationProvider: _router.routeInformationProvider,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}

class _RoutePane extends StatelessWidget {
  const _RoutePane({
    required this.title,
    required this.body,
    required this.onNext,
  });

  final String title;
  final String body;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(body, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: onNext,
                child: const Text('Navigate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
