import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/domain/vo/name_url_pair.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_bloc.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_events.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_states.dart';
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
                  return _PokemonTileWidget(
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

class _PokemonTileWidget extends StatelessWidget {
  const _PokemonTileWidget({
    Key? key,
    required this.model,
    required this.onDoubleTap,
  }) : super(key: key);

  final Pokemon model;
  final OnTapFn<Pokemon> onDoubleTap;

  @override
  Widget build(BuildContext context) {
    final pokemonStats = [];
    return Material(
      color: AppColors.listTileBg,
      child: InkWell(
        splashColor: AppColors.splash,
        onDoubleTap: () => onDoubleTap.call(model),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.name),
              ...pokemonStats.map((e) => Text(e.type.name)).toList(),
            ],
          ),
          subtitle: Text(model.fmtId),
          leading: SizedBox(
            width: 64,
            height: 64,
            child: Image.network(model.pictureUrl),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ),
    );
  }

  // Future<List<PokeType>> get _stats async {
  List<PokeType> get _stats {
    return [
      const PokeType(
        slot: 1,
        type: NameUrlPair(
          name: 'normal',
          url: 'https://pokeapi.co/api/v2/type/1/',
        ),
      )
    ];
  }
}
