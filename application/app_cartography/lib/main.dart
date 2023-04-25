import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import 'conf.dart';
import 'desk.dart';
import 'destination.dart';

void main() => runApp(const Cartographer());

class Cartographer extends StatelessWidget {
  const Cartographer({Key? key}) : super(key: key);

  @override
  build(context) => const MaterialApp(
      title: 'Cartographie',
      home: Cartography());
}

class Cartography extends StatefulWidget {
  const Cartography({Key? key}) : super(key: key);

  @override
  CartographyState createState() => CartographyState();
}

class CartographyState extends State<Cartography> {
  
  static const _origin = LatLng(44.83, -0.57);

  final controller = MapController(location: _origin);

  void center({LatLng coords = _origin}) =>
      setState(() => controller.center = coords);

  void _onDoubleTap(MapTransformer transformer, Offset position) =>
      setState(() {
        const delta = 0.5;
        final zoom = clamp(controller.zoom + delta, 2, 18);
        transformer.setZoomInPlace(zoom, position);
      });

  Offset _dragStart = Offset.zero;
  double _scaleStart = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      setState(() => controller.zoom += 0.02);
    } else if (scaleDiff < 0) {
      setState(() => controller.zoom -= 0.02);
    } else {
      setState(() {
        final now = details.focalPoint;
        final diff = now - _dragStart;
        _dragStart = now;
        transformer.drag(diff.dx, diff.dy);
      });
    }
  }

  Widget _buildMarkerWidget(Desk desk, Offset pos, Color color,
      [IconData icon = Icons.location_on]) =>
      Positioned(
        left: pos.dx - 24,
        top: pos.dy - 24,
        width: 48,
        height: 48,
        child: GestureDetector(
          child: Icon(icon, color: color, size: 48),
          onTap: () => center(coords: desk.coords),
        ),
      );

  @override
  build(context) => Scaffold(
    body: MapLayout(
      controller: controller,
      builder: (_, transformer) {
        final markerWidgets = Desk.values
            .map((desk) => _buildMarkerWidget(
          desk,
          transformer.toOffset(desk.coords),
          Colors.red,
        ))
            .toList();

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTapDown: (details) =>
              _onDoubleTap(transformer, details.localPosition),
          onScaleStart: _onScaleStart,
          onScaleUpdate: (details) => _onScaleUpdate(details, transformer),
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerSignal: (event) {
              if (event is PointerScrollEvent) {
                setState(() {
                  final delta = event.scrollDelta.dy / -1000.0;
                  final zoom = clamp(controller.zoom + delta, 2, 18);
                  transformer.setZoomInPlace(zoom, event.localPosition);
                });
              }
            },
            child: Stack(
              children: [
                TileLayer(
                  builder: (context, x, y, z) {
                    final tilesInZoom = pow(2.0, z).floor();

                    while (x < 0) {
                      x += tilesInZoom;
                    }
                    while (y < 0) {
                      y += tilesInZoom;
                    }

                    x %= tilesInZoom;
                    y %= tilesInZoom;

                    return CachedNetworkImage(
                        imageUrl: google(z, x, y), fit: BoxFit.cover);
                  },
                ),
                ...markerWidgets,
                const Align(alignment: Alignment.bottomCenter, child: Destinations())
              ],
            ),
          ),
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: center,
      tooltip: 'Localisation',
      child: const Icon(Icons.my_location),
    ),
  );
}

double clamp(double x, double min, double max) {
  if (x < min) x = min;
  if (x > max) x = max;
  return x;
}
