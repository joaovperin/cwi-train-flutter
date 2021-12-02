import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_bloc.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_events.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_states.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/pokemon_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonList extends StatefulWidget with WidgetWithSearchableBlock {
  const PokemonList({Key? key}) : super(key: key);

  @override
  PokemonBloc getBloc(BuildContext context) {
    return BlocProvider.of<PokemonBloc>(context);
  }

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late PokemonBloc _pokeBloc;
  final ScrollController _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    _pokeBloc = widget.getBloc(context);
    _pokeBloc.resetCounter();
    _pokeBloc.add(PokemonFetchPageEvent.first());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.container,
      child: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        // If the state has data, show it
        if (state is PokemonListState) {
          final list = state.list;
          return NotificationListener<ScrollNotification>(
            onNotification: (scroll) => _onScrollNotification(scroll, state),
            child: ListView.separated(
              controller: _scrollCtrl,
              itemCount: state.noMoreResults ? list.length : list.length + 1,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                if (index < list.length) {
                  return PokemonTileWidget(
                    model: list[index],
                    onDoubleTap: (model) {
                      _pokeBloc.add(PokemonShowPopupInfoEvent(model));
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          );
        }

        if (state is PokemonLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        var message = 'Something went wrong';
        if (state is PokemonFailState) {
          message = state.message;
        }
        // By default, state is PokemonFailedState (error)
        return Container(
          color: AppColors.container,
          child: Center(
            child: Text(message),
          ),
        );
      }),
    );
  }

  bool _onScrollNotification(
    ScrollNotification scroll,
    PokemonListState state,
  ) {
    if (scroll is ScrollEndNotification &&
        _scrollCtrl.position.extentAfter == 0 &&
        !state.noMoreResults) {
      _pokeBloc.add(PokemonFetchPageEvent.next(state.list));
    }
    return false;
  }
}
