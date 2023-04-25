import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

const duration = Duration(milliseconds: 3000); // Durée de l'animation
const radius = Radius.circular(16); // Rayon de la bordure arrondie
const topMark = .7; // Position où l'animation de floutage s'arrête

void main() {
  runApp(const MyBlurhashImage());
}

class MyBlurhashImage extends StatelessWidget {
  const MyBlurhashImage({super.key});

  @override
  build(context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter BlurHash'),
        ),
        body: ListView(
          children: const [
            Text(
                'Afficher une image floue, en utilisant la librairie BlurHash, progressivement'),
            // Utilisation de ProgressiveBlurHashImage pour afficher l'image floue de façon progressive
            ProgressiveBlurHashImage(
              hash: 'LHKA+p_45S?v.Tobx@k?E89tkp_2', // Hash de l'image floue
              imageUrl: 'https://picsum.photos/200/300', // URL de l'image réelle
              width: 200, // Largeur de l'image
              height: 200, // Hauteur de l'image
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressiveBlurHashImage extends StatefulWidget {
  final String hash;
  final String imageUrl;
  final double width;
  final double height;

  const ProgressiveBlurHashImage({
    Key? key,
    required this.hash,
    required this.imageUrl,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _ProgressiveBlurHashImageState createState() =>
      _ProgressiveBlurHashImageState();
}

class _ProgressiveBlurHashImageState extends State<ProgressiveBlurHashImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialisation de l'animation de floutage
    _controller = AnimationController(vsync: this, duration: duration)
      ..forward();

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, topMark, curve: Curves.easeInOut),
      ),
    )..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  build(context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(radius),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            // Affichage de l'image floue avec BlurHash
            Positioned.fill(
              child: BlurHash(
                hash: widget.hash,
                curve: Curves.easeInOut,
                duration: duration,
                imageFit: BoxFit.cover,
              ),
            ),
            // Affichage de l'image réelle avec une opacité animée
            Positioned.fill(
              child: Opacity(
                opacity: _animation.value,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
