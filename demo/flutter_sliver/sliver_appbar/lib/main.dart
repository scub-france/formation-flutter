import 'package:flutter/material.dart';

/// Cette démo illustre l'intégration du SliverAppBar dans un CustomScrollView.
/// SliverAppBar est à comparer avec SliverPersistentHeader.
void main() => runApp(SliverAppbarApp());

class SliverAppbarApp extends StatelessWidget {
  const SliverAppbarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Sliver Appbar',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
          /// SliverToBoxAdapter est ici uniquement utilisé pour permettre de scroller l'écran
          /// en augmentant la hauteur de la zone inférieur du CustomScrollView
          SliverToBoxAdapter(
            child: SizedBox(
              height: 1500,
              child: Padding(
                padding: EdgeInsets.only(left: 100.0, top: 300.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium risus at auctor iaculis. Donec viverra diam id odio hendrerit, sit amet maximus felis mattis. Vivamus et tempus nibh, at dignissim neque. Fusce nisl ante, porttitor ac facilisis sed, dictum ac nunc. Maecenas ut fringilla mauris, vel tincidunt sem. Vestibulum ut lacus fringilla, tempor orci lacinia, convallis sem. Phasellus ac eleifend est, posuere aliquam arcu. Nulla dignissim mauris non ipsum gravida viverra. Proin viverra leo a tortor ullamcorper, sit amet placerat sapien scelerisque. Donec euismod ex at turpis sollicitudin congue. Nulla facilisis mauris ut lorem vulputate, in cursus nisi iaculis. Aenean dolor dolor, tristique sit amet sollicitudin in, accumsan a est. Mauris enim lectus, dapibus ac varius eget, imperdiet eu mauris. Donec sagittis cursus sem tincidunt bibendum. Proin gravida lectus ligula, vitae volutpat libero tincidunt at. Cras nec molestie dolor. Pellentesque tempus elit non vulputate efficitur. Vivamus tempor nisi sit amet sapien accumsan, quis aliquet metus consequat. Integer blandit varius massa, quis commodo leo pulvinar id. Sed vitae facilisis purus. Integer sed arcu at sapien eleifend dignissim maximus et neque. Vestibulum egestas varius ex, volutpat fermentum erat venenatis lacinia. Etiam massa sem, ultricies at mauris in, dapibus scelerisque libero. Donec felis turpis, ornare vitae efficitur id, faucibus vitae ex. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus a mi a lorem congue venenatis. Proin velit felis, pharetra consectetur justo ac, luctus tempus augue. Phasellus mauris erat, pretium sit amet velit vel, hendrerit pulvinar tellus. Vestibulum dapibus mollis luctus. Curabitur accumsan quam laoreet dapibus auctor. Mauris non risus non justo posuere varius. Ut non massa diam. Sed ut laoreet orci. Duis volutpat bibendum magna, ac dictum mi tempor a. Duis mi sem, vestibulum ut arcu ac, efficitur iaculis quam. Vestibulum varius et augue in porta. Pellentesque malesuada id nisi et volutpat. Nunc sollicitudin turpis eu fringilla maximus. Duis purus sem, aliquam sit amet arcu ut, hendrerit ullamcorper erat."
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
