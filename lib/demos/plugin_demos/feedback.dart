import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';

class FeedbackDemo extends StatelessWidget {
  const FeedbackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return BetterFeedback(
      child: Builder(
        builder: (feedbackContext) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('BetterFeedback wraps a subtree and opens screenshot feedback UI.'),
              const SizedBox(height: 10),
              FilledButton.icon(
                onPressed: () {
                  BetterFeedback.of(feedbackContext).show((feedback) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Feedback captured: ${feedback.text.isEmpty ? 'no text' : feedback.text}',
                        ),
                      ),
                    );
                  });
                },
                icon: const Icon(Icons.rate_review),
                label: const Text('Open feedback overlay'),
              ),
            ],
          );
        },
      ),
    );
  }
}
