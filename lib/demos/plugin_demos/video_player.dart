import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerDemo extends StatefulWidget {
  const VideoPlayerDemo({super.key});

  @override
  State<VideoPlayerDemo> createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {
  VideoPlayerController? _controller;
  String? _error;

  Future<void> _loadSample() async {
    setState(() => _error = null);
    final previous = _controller;
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    );
    await previous?.dispose();
    try {
      await _controller!.initialize();
      await _controller!.setLooping(true);
      await _controller!.play();
      if (mounted) {
        setState(() {});
      }
    } catch (error) {
      if (mounted) {
        setState(() => _error = error.toString());
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: controller != null && controller.value.isInitialized
                  ? VideoPlayer(controller)
                  : Center(
                      child: Text(
                        _error == null ? 'Load the official sample video' : _error!,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            FilledButton.icon(
              onPressed: _loadSample,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Load video'),
            ),
            if (controller != null && controller.value.isInitialized)
              OutlinedButton.icon(
                onPressed: () {
                  controller.value.isPlaying
                      ? controller.pause()
                      : controller.play();
                  setState(() {});
                },
                icon: Icon(
                  controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                label: Text(controller.value.isPlaying ? 'Pause' : 'Play'),
              ),
          ],
        ),
      ],
    );
  }
}
