import 'package:flutter/material.dart';

/// Cette démo illustre l'intégration du SliverFixedExtentList dans un CustomScrollView.
/// SliverList est un silver qui permet de construire une liste de widget scrollable.
/// Les éléments de SliverFixedExtentList sont de dimension fixe.
/// SliverFixedExtentList est à comparer à SliverList.
void main() => runApp(SliverFixedExtentListApp());

class SliverFixedExtentListApp extends StatelessWidget {
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
  Widget _buildFixedList(String _text) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.1,
              0.9,
            ],
            colors: [
              Colors.black26,
              Colors.black12,
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
        child: Text(
          _text,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
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
              background: FlutterLogo(),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 70,
            /// SliverChildListDelegate est rempli de widget dont le contenu est différent.
            /// Il faut noter que chaque widget aura une hauteur fixe.
            delegate: SliverChildListDelegate([
              _buildFixedList("Fixed List item 1"),
              _buildFixedList("Fixed List item 2"),
              _buildFixedList("Fixed List item 3.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium risus at auctor iaculis. Donec viverra diam id odio hendrerit, sit amet maximus felis mattis. Vivamus et tempus nibh, at dignissim neque. Fusce nisl ante, porttitor ac facilisis sed, dictum ac nunc. Maecenas ut fringilla mauris, vel tincidunt sem. Vestibulum ut lacus fringilla, tempor orci lacinia, convallis sem. Phasellus ac eleifend est, posuere aliquam arcu. Nulla dignissim mauris non ipsum gravida viverra. Proin viverra leo a tortor ullamcorper, sit amet placerat sapien scelerisque. Donec euismod ex at turpis sollicitudin congue. Nulla facilisis mauris ut lorem vulputate, in cursus nisi iaculis. Aenean dolor dolor, tristique sit amet sollicitudin in, accumsan a est. Mauris enim lectus, dapibus ac varius eget, imperdiet eu mauris. Donec sagittis cursus sem tincidunt bibendum. Proin gravida lectus ligula, vitae volutpat libero tincidunt at. Cras nec molestie dolor. Pellentesque tempus elit non vulputate efficitur. Vivamus tempor nisi sit amet sapien accumsan, quis aliquet metus consequat. Integer blandit varius massa, quis commodo leo pulvinar id. Sed vitae facilisis purus. Integer sed arcu at sapien eleifend dignissim maximus et neque. Vestibulum egestas varius ex, volutpat fermentum erat venenatis lacinia. Etiam massa sem, ultricies at mauris in, dapibus scelerisque libero. Donec felis turpis, ornare vitae efficitur id, faucibus vitae ex. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus a mi a lorem congue venenatis. Proin velit felis, pharetra consectetur justo ac, luctus tempus augue. Phasellus mauris erat, pretium sit amet velit vel, hendrerit pulvinar tellus. Vestibulum dapibus mollis luctus. Curabitur accumsan quam laoreet dapibus auctor. Mauris non risus non justo posuere varius. Ut non massa diam. Sed ut laoreet orci. Duis volutpat bibendum magna, ac dictum mi tempor a. Duis mi sem, vestibulum ut arcu ac, efficitur iaculis quam. Vestibulum varius et augue in porta. Pellentesque malesuada id nisi et volutpat. Nunc sollicitudin turpis eu fringilla maximus. Duis purus sem, aliquam sit amet arcu ut, hendrerit ullamcorper erat."),
              _buildFixedList("Fixed List item 4"),
              _buildFixedList("Fixed List item 5"),
            ]),
          ),
          /// SliverToBoxAdapter est ici uniquement utilisé pour permettre de scroller l'écran
          /// en augmentant la hauteur de la zone inférieur du CustomScrollView
          SliverToBoxAdapter(
            child: SizedBox(
              height: 1500,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0.1,
                        0.4,
                        0.6,
                        0.9,
                      ],
                      colors: [
                        Color.fromRGBO(84, 197, 248, 1),
                        Color.fromRGBO(17, 78, 105, 1.0),
                        Color.fromRGBO(60, 121, 148, 1.0),
                        Color.fromRGBO(42, 177, 238, 1.0),
                      ],
                    )),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
