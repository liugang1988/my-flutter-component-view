import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class BeamerDemo extends StatefulWidget {
  const BeamerDemo({super.key});

  @override
  State<BeamerDemo> createState() => _BeamerDemoState();
}

class _BeamerDemoState extends State<BeamerDemo> {
  late final BeamerDelegate _delegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => _BeamPane(
          title: 'Beam home',
          body: 'Beamer uses path based route maps.',
          onNext: () => Beamer.of(context).beamToNamed('/books/7'),
        ),
        '/books/:id': (context, state, data) => _BeamPane(
          title: 'Book ${state.pathParameters['id']}',
          body: 'Path parameters are exposed on BeamState.',
          onNext: () => Beamer.of(context).beamToNamed('/'),
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
        child: Beamer(routerDelegate: _delegate),
      ),
    );
  }
}

class _BeamPane extends StatelessWidget {
  const _BeamPane({
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
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(body, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: onNext,
                child: const Text('Beam route'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
