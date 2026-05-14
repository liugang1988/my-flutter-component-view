import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class RoutemasterDemo extends StatefulWidget {
  const RoutemasterDemo({super.key});

  @override
  State<RoutemasterDemo> createState() => _RoutemasterDemoState();
}

class _RoutemasterDemoState extends State<RoutemasterDemo> {
  late final RoutemasterDelegate _delegate = RoutemasterDelegate(
    routesBuilder: (_) => RouteMap(
      routes: {
        '/': (_) => MaterialPage<void>(
          child: _RoutemasterPane(
            title: 'Routemaster home',
            body: 'RouteMap maps paths to pages.',
            onNext: (context) => Routemaster.of(context).push('/profile'),
          ),
        ),
        '/profile': (_) => MaterialPage<void>(
          child: _RoutemasterPane(
            title: 'Profile route',
            body: 'Nested pages can be pushed from the delegate.',
            onNext: (context) => Routemaster.of(context).replace('/'),
          ),
        ),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Router(
          routerDelegate: _delegate,
          routeInformationParser: const RoutemasterParser(),
        ),
      ),
    );
  }
}

class _RoutemasterPane extends StatelessWidget {
  const _RoutemasterPane({
    required this.title,
    required this.body,
    required this.onNext,
  });

  final String title;
  final String body;
  final ValueChanged<BuildContext> onNext;

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
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(body, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => onNext(context),
                child: const Text('Change route'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
