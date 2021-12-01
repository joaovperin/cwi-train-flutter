import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MovesList extends StatefulWidget {
  const MovesList({Key? key}) : super(key: key);

  @override
  State<MovesList> createState() => _MovesListState();
}

class _MovesListState extends State<MovesList> {
  final MoveRepository moveRepository = GetIt.I.get<MoveRepository>();

  List<Move> _list = [];

  @override
  void initState() {
    super.initState();
    moveRepository.findAll().then((value) {
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
      color: AppColors.container,
      child: ListView.separated(
        itemCount: _list.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final model = _list[index];
          return InkWell(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
