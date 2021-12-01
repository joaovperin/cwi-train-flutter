import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_bloc.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_events.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late PokemonBloc pokeBloc;
  final ScrollController _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    pokeBloc = BlocProvider.of<PokemonBloc>(context);
    pokeBloc.add(const PokemonLoadRequestEvent([]));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        if (state is PokemonListState) {
          final list = state.list;
          return NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  _scrollCtrl.position.extentAfter == 0) {
                pokeBloc.add(PokemonLoadRequestEvent(list));
              }
              return false;
            },
            child: ListView.separated(
              controller: _scrollCtrl,
              itemCount: state.noMoreResults ? list.length : list.length + 1,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                if (index < list.length) {
                  return _PokemonItemWidget(model: list[index]);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          );
        }

        var message = 'Something went wrong';
        if (state is PokemonFailState) {
          message = state.message;
        }
        // By default, state is PokemonFailedState (error)
        return Container(
          color: AppColors.white,
          child: Center(
            child: Text(message),
          ),
        );
      }),
    );
  }
}

class _PokemonItemWidget extends StatelessWidget {
  const _PokemonItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Pokemon model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(model.name),
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
    );
  }
}
