import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_roobin/generated/l10n.dart';
import 'package:library_roobin/models/doc.dart';
import 'package:library_roobin/pages/dashboard/bloc/bloc.dart' as bloc;
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => bloc.Bloc(),
          child: BlocListener<bloc.Bloc, bloc.State>(
            listener: (context, state) {
              if (state is bloc.AadedBooksState) {
                final snackBar = SnackBar(
                  content: Text(S.current.BookAddFavorites),
                  action: SnackBarAction(
                    label: S.current.Closed,
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const _Body(),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  static OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Color(0xff9b9b9b),
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const OutlineInputBorder errorBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  );

  static const TextStyle labelStyle = TextStyle(
    color: Color(0xFF28E9FD),
  );

  @override
  Widget build(BuildContext context) {
    int _radioval = 0;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: BlocBuilder<bloc.Bloc, bloc.State>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    S.current.SearchFor,
                    style: const TextStyle(
                      color: Color(0xff4b3621),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _RadioNameBook(radioval: _radioval),
                      Text(
                        S.current.NameBook,
                        style: const TextStyle(
                          color: Color(0xff4b3621),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _RadioNameAutor(radioval: _radioval),
                      Text(
                        S.current.Author,
                        style: const TextStyle(
                          color: Color(0xff4b3621),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _RadioFavoritesBooks(radioval: _radioval),
                      Text(
                        S.current.Favorites,
                        style: const TextStyle(
                          color: Color(0xff4b3621),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  state.model.typesearch != 3
                      ? TextFormField(
                          style: const TextStyle(
                            color: Color(0xFFA2A8B4),
                            fontSize: 16.0,
                          ),
                          controller: null,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: labelStyle,
                            focusedBorder: border,
                            enabledBorder: border,
                            errorBorder: errorBorderStyle,
                            focusedErrorBorder: errorBorderStyle,
                          ),
                          onChanged: (value) {
                            if (value.length > 4) {
                              context.read<bloc.Bloc>().add(
                                    bloc.LoadBooksEvent(value),
                                  );
                            }
                          },
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 16.0),
                  state.model.typesearch != 3
                      ? const _ListBooks()
                      : const CardSwiper(),
                  state.model.typesearch == 3
                      ? const _ListFavorites()
                      : const SizedBox.shrink()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ListBooks extends StatelessWidget {
  const _ListBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(
      builder: (context, state) {
        if (state is bloc.LoadingState) {
          return const CircularProgressIndicator();
        } else {
          return Column(
            children: <Widget>[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: state.model.docs.length,
                itemBuilder: (context, index) => ItemBook(
                  item: state.model.docs[index],
                ),
              )
            ],
          );
        }
      },
    );
  }

  //Esta linea es la que le dice que no destruya el estado
  bool get wantKeepAlive => true;
}

class _ListFavorites extends StatelessWidget {
  const _ListFavorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(builder: (context, state) {
      if (state is bloc.LoadingState) {
        return const CircularProgressIndicator();
      }
      return Column(
        children: <Widget>[
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.model.docsfavorites.length,
            itemBuilder: (context, index) => ItemBook(
              item: state.model.docsfavorites[index],
            ),
          )
        ],
      );
    });
  }
}

class _RadioNameAutor extends StatelessWidget {
  const _RadioNameAutor({
    Key? key,
    required int radioval,
  })  : _radioval = radioval,
        super(key: key);

  final int _radioval;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(
      builder: (context, state) {
        return Radio(
          value: state.model.typesearch == 2 ? 0 : 1,
          groupValue: _radioval,
          onChanged: (value) {
            context.read<bloc.Bloc>().add(
                  bloc.ChooseTypeSearchEvent(2),
                );
          },
        );
      },
    );
  }
}

class _RadioNameBook extends StatelessWidget {
  const _RadioNameBook({
    Key? key,
    required int radioval,
  })  : _radioval = radioval,
        super(key: key);

  final int _radioval;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(
      builder: (context, state) {
        return Radio(
          value: state.model.typesearch == 1 ? 0 : 1,
          groupValue: _radioval,
          onChanged: (value) {
            context.read<bloc.Bloc>().add(
                  bloc.ChooseTypeSearchEvent(1),
                );
          },
        );
      },
    );
  }
}

class _RadioFavoritesBooks extends StatelessWidget {
  const _RadioFavoritesBooks({
    Key? key,
    required int radioval,
  })  : _radioval = radioval,
        super(key: key);

  final int _radioval;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(
      builder: (context, state) {
        return Radio(
          value: state.model.typesearch == 3 ? 0 : 1,
          groupValue: _radioval,
          onChanged: (value) {
            context.read<bloc.Bloc>().add(
                  bloc.ChooseTypeSearchEvent(3),
                );
          },
        );
      },
    );
  }
}

class ItemBook extends StatelessWidget {
  final Doc item;
  const ItemBook({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.grey[200],
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0)
            ],
          ),
          child: Row(
            children: <Widget>[
              _ImageBook(
                item: item.coverEditionKey.toString(),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        S.current.Tittle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        S.current.Author + ': ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.authorName.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          state.model.typesearch != 3
                              ? InkWell(
                                  onTap: () {
                                    context.read<bloc.Bloc>().add(
                                          bloc.AddFavoriteBookEvent(item),
                                        );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: Colors.brown),
                                    child: Text(
                                      S.current.AddToFavorites,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {
                              Modular.to.pushNamed(
                                '/detail',
                                arguments: {
                                  'doc': item,
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.orange[300]),
                              child: Text(
                                S.current.ViewDetail,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                    ]),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ImageBook extends StatelessWidget {
  final String item;
  const _ImageBook({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: const EdgeInsets.only(
          left: 4.0,
        ),
        child: FadeInImage(
          image:
              NetworkImage('https://covers.openlibrary.org/b/olid/$item-M.jpg'),
          placeholder: const AssetImage('assets/no-image.jpg'),
          width: 100.0,
          height: 140.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return BlocBuilder<bloc.Bloc, bloc.State>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 4.0),
          child: Swiper(
              layout: SwiperLayout.STACK,
              itemWidth: _screenSize.width * 0.7,
              itemHeight: _screenSize.height * 0.5,
              itemBuilder: (BuildContext context, int index) {
                return Hero(
                  tag: state.model.docsfavorites[index].title.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed(
                          '/detail',
                          arguments: {
                            'doc': state.model.docsfavorites[index],
                          },
                        );
                      },
                      child: FadeInImage(
                        image: NetworkImage(
                            'https://covers.openlibrary.org/b/olid/${state.model.docsfavorites[index].coverEditionKey.toString()}-L.jpg'),
                        placeholder: const AssetImage('assets/no-image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.model.docsfavorites.length),
        );
      },
    );
  }
}
