import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_bloc.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_events.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_states.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/pokemon_tile.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  Future<void> _showPokemonInfoPopup(PokemonInfo model) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return PokemonInfoDialog(model);
      },
    );
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
                    onDoubleTap: (model) => _showPokemonInfoPopup(model),
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

class PokemonInfoDialog extends StatelessWidget {
  const PokemonInfoDialog(
    this.model, {
    Key? key,
  }) : super(key: key);

  final PokemonInfo model;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      title: SizedBox(
        height: 80,
        width: 420,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(model.pictureUrl, fit: BoxFit.fill),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  model.fmtId,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.fadedText,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...model.types.map((e) {
                    final type = e.type.name;
                    return Container(
                      width: 36,
                      height: 36,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.element[type] ?? AppColors.unknown,
                        shape: BoxShape.circle,
                      ),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: SvgPicture.asset(
                          'assets/icons/elements/$type.svg',
                          semanticsLabel: type,
                        ),
                      ),
                    );
                  }).toList()
                ],
              ),
            ),
          ],
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Wrap(
          spacing: 20,
          runSpacing: 8,
          children: [
            const Divider(),
            ..._splitListInChunks(_getWeaknesses(), 3).map((list) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [...list.map((e) => _buildChip(e))],
              );
            }),
          ],
          // ),
        ),
      ),
    );
  }

  Widget _buildChip(_WeaknessInfo e) {
    final type = e.name;
    return SizedBox(
      width: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.element[type] ?? AppColors.unknown,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/icons/elements/$type.svg',
              semanticsLabel: type,
            ),
          ),
          Center(
            child: Text(
              e.value,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.fadedText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<_WeaknessInfo> _getWeaknesses() {
  return const [
    _WeaknessInfo('bug', '1x'),
    _WeaknessInfo('dark', '1x'),
    _WeaknessInfo('dragon', '1x'),
    _WeaknessInfo('electric', '2x'),
    _WeaknessInfo('fairy', '1x'),
    _WeaknessInfo('fighting', '1x'),
    _WeaknessInfo('fire', '1/2x'),
    _WeaknessInfo('flying', '1x'),
    _WeaknessInfo('ghost', '1x'),
    _WeaknessInfo('grass', '2x'),
    _WeaknessInfo('ground', '1x'),
    _WeaknessInfo('ice', '1/2x'),
    _WeaknessInfo('normal', '1x'),
    _WeaknessInfo('poison', '1x'),
    _WeaknessInfo('psychic', '1x'),
    _WeaknessInfo('rock', '1x'),
    _WeaknessInfo('steel', '1/2x'),
    _WeaknessInfo('water', '1/2x'),
  ];
}

List<List<_WeaknessInfo>> _splitListInChunks(
    List<_WeaknessInfo> list, int chunkSize) {
  return List.generate(
    (list.length / chunkSize).ceil(),
    (index) => list.sublist(index * chunkSize, (index + 1) * chunkSize),
  );
}

class _WeaknessInfo {
  final String name;
  final String value;

  const _WeaknessInfo(this.name, this.value);
}
