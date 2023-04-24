import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';


const duration = Duration(milliseconds: 3000);

const radius = Radius.circular(16);

const topMark = .7;

void main() {
  runApp(const MyImages());
}

class MyImages extends StatelessWidget {
  const MyImages({super.key});


  @override
  build(context) {


    const imageUrl = 'https://picsum.photos/200/300';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Images'),
        ),
        body: ListView(
          children: [
            // Ajout d'une image depuis un réseau distant
            Column(
              children: [
                const Text('Ajout d\'image depuis un réseau distant'),
                Image.network(
                  'https://picsum.photos/200/300',
                  width: 200,
                  height: 200,
                ),
              ],
            ),

            // Ajout d'une image depuis les ressources de l'application
            Column(
              children: [
                const Text(
                    'Ajout d\'image depuis les ressources de l\'application'),
                Image.asset(
                  '/assets/poulet.jpg',
                  width: 200,
                  height: 200,
                ),
              ],
            ),

            // Ajout d'une image depuis un fichier local
            // Column(
            //   children: [
            //     const Text('Ajout d\'image depuis un fichier local'),
            //     Image.file(
            //       file,
            //       width: 200,
            //       height: 200,
            //     ),
            //   ],
            // ),
            // Ce widget ne fonctionne pas sur le Web car les navigateurs Web ne permettent pas l'accès direct au système de fichier local pour des raisons de sécurité

            // Ajout d'une image avec chargement asynchrone
            Column(
              children: [
                const Text('Ajout d\'une image avec chargement asynchrone'),
                FadeInImage.assetNetwork(
                  placeholder: '/assets/mountains.jpg',
                  image: imageUrl,
                  width: 200,
                  height: 200,
                  fadeInDuration: const Duration(milliseconds: 500),
                  fadeOutDuration: const Duration(milliseconds: 500),
                ),
              ],
            ),
            // Afficher une image floue à partir d'un Hash progressivement
            Column(
              children: const [
                Text(
                    'Afficher une image floue, en utilisantla librairie BlurHash, progressivement'),
                ProgressiveBlurHashImage(
                  hash: 'LHKA+p_45S?v.Tobx@k?E89tkp_2',
                  imageUrl: 'https://picsum.photos/200/300',
                  width: 200,
                  height: 200,


                ),
              ],
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
            Positioned.fill(
              child: BlurHash(
                hash: widget.hash,
                curve: Curves.easeInOut,
                duration: duration,
                imageFit: BoxFit.cover,
              ),
            ),
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