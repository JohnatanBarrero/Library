import 'package:flutter/material.dart';
import 'package:library_roobin/models/doc.dart';

class Page extends StatelessWidget {
  final Doc doc;
  const Page({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _AppBar(
              doc: doc,
            ),
            _BodyDetail(
              doc: doc,
            )
          ],
        ),
      ),
    );
  }
}

class _BodyDetail extends StatelessWidget {
  final Doc doc;
  const _BodyDetail({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: 5.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: doc.title.toString(),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: NetworkImage(
                            'https://covers.openlibrary.org/b/olid/${doc.coverEditionKey.toString()}-L.jpg'),
                        height: 150.0,
                      )),
                ),
                const SizedBox(width: 20.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        doc.title.toString(),
                        style: Theme.of(context).textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        doc.authorName.toString(),
                        style: Theme.of(context).textTheme.subtitle2,
                        overflow: TextOverflow.ellipsis,
                      ),
                       Text(
                        doc.yearPublication.toString(),
                        style: Theme.of(context).textTheme.subtitle2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final Doc doc;
  const _AppBar({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          doc.title.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(
              'https://covers.openlibrary.org/b/olid/${doc.coverEditionKey.toString()}-L.jpg'),
          placeholder: const AssetImage('assets/loading.gif'),
          fadeInDuration: const Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
