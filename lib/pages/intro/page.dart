import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_roobin/generated/l10n.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:library_roobin/pages/intro/bloc/bloc.dart' as bloc;
import 'package:flutter_modular/flutter_modular.dart';

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => bloc.Bloc()
            ..add(
              bloc.LoadStatusEvent(),
            ),
          child: BlocListener<bloc.Bloc, bloc.State>(
            listener: (context, state) {
              if (state is bloc.LoadedState) {
                Modular.to.pushNamed('/dashboard');
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff482b24),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: Image.asset(
                "assets/5946.jpg",
                width: 320,
                height: 245,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GradientText(
              S.current.Library,
              gradientDirection: GradientDirection.ttb,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              colors: const [
                Color(0xff4b3621),
                Color(0xffe0dad6),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const _Progres()
          ],
        ),
      ),
    );
  }
}

class _Progres extends StatelessWidget {
  const _Progres({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(
      builder: (context, state) {
        if (state is bloc.LoadingState) {
          return const CircularProgressIndicator();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
