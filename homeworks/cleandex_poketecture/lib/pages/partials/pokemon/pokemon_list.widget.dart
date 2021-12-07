import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_events.dart';
import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_states.dart';
import 'package:cleandex_poketecture/application/ui/scroll_and_drag_scroll_behaviour.dart';
import 'package:cleandex_poketecture/application/widgets/app_loading.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_bloc.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/pokemon_tile.widget.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/pokemon_weaknesses.dialog.dart';
import 'package:flutter/cupertino.dart';
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
    _pokeBloc.add(AppBlocFetchFirstPageEvent<Pokemon>());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _showInfoPopup(Pokemon model, PokemonDetails details) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return PokemonWeaknessesDialog(model, details);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.container,
      child: BlocBuilder<PokemonBloc, AppBlocState<Pokemon>>(
          builder: (context, state) {
        // If the state has data, show it
        if (state is AppBlocListState<Pokemon>) {
          final list = state.list;
          return NotificationListener<ScrollNotification>(
            onNotification: (scroll) => _onScrollNotification(scroll, state),
            child: ScrollConfiguration(
              behavior: const ScrollAndDragScrollBehavior(),
              child: ListView.separated(
                controller: _scrollCtrl,
                itemCount: state.noMoreResults ? list.length : list.length + 1,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  if (index < list.length) {
                    return PokemonTileWidget(
                      model: list[index],
                      onDoubleTap: (model) {
                        _pokeBloc.loadPokemonDetails(model).then((details) {
                          _showInfoPopup(model, details);
                        });
                      },
                    );
                  }
                  return AppLoadingWidget.centered();
                },
              ),
            ),
          );
        }

        if (state is AppBlocLoadingState<Pokemon>) {
          return AppLoadingWidget.centered();
        }

        var message = 'Something went wrong';
        if (state is AppBlocFailState<Pokemon>) {
          message = state.message;
        }
        // By default, state is PokemonFailedState (error)
        return Container(
          color: AppColors.container,
          child: Center(child: Text(message)),
        );
      }),
    );
  }

  bool _onScrollNotification(
    ScrollNotification scroll,
    AppBlocListState<Pokemon> state,
  ) {
    if (scroll is ScrollEndNotification &&
        _scrollCtrl.position.extentAfter == 0 &&
        !state.noMoreResults) {
      _pokeBloc.add(AppBlocFetchPageEvent<Pokemon>.next(state.list));
    }
    return false;
  }
}
