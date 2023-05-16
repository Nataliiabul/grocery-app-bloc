import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:grocery_app_bloc/features/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishlistBloc.add(WishlistInitialEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Wishlist'),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is !WishlistActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistSuccessState:
                final successState = state as WishlistSuccessState;
                return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                  return WishlistTileWidget(
                      productDataModel: successState.wishlistItems[index],
                      wishlistBloc: wishlistBloc);
                });
              default: return SizedBox();
            }
          },
        ));
  }
}
