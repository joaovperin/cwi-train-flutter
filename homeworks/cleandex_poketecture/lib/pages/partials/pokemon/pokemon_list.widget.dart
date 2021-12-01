import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final PokemonRepository pokemonRepository = GetIt.I.get<PokemonRepository>();

  List<Pokemon> _list = [];

  @override
  void initState() {
    super.initState();
    pokemonRepository.findAll().then((value) {
      setState(() => _list = value);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: ListView.separated(
        itemCount: _list.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final model = _list[index];
          return _buildItem(model);
        },
      ),
    );
  }

  Widget _buildItem(Pokemon model) {
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
