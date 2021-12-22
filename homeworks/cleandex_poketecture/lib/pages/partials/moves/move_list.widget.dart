import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_events.dart';
import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_states.dart';
import 'package:cleandex_poketecture/application/ui/scroll_and_drag_scroll_behaviour.dart';
import 'package:cleandex_poketecture/application/widgets/app_loading.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move_details.dart';
import 'package:cleandex_poketecture/pages/move_details.page.dart';
import 'package:cleandex_poketecture/pages/partials/moves/bloc/move_bloc.dart';
import 'package:cleandex_poketecture/pages/partials/moves/move_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoveList extends StatefulWidget with WidgetWithSearchableBlock {
  const MoveList({Key? key}) : super(key: key);

  @override
  MoveBloc getBloc(BuildContext context) {
    return BlocProvider.of<MoveBloc>(context);
  }

  @override
  State<MoveList> createState() => _MoveListState();
}

class _MoveListState extends State<MoveList> {
  late MoveBloc _bloc;
  final ScrollController _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    _bloc = widget.getBloc(context);
    _bloc.add(AppBlocFetchFirstPageEvent<Move>());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.container,
      child:
          BlocBuilder<MoveBloc, AppBlocState<Move>>(builder: (context, state) {
        // If the state has data, show it
        if (state is AppBlocListState<Move>) {
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
                    return MoveTileWidget(
                      model: list[index],
                      onTap: (model) {
                        _bloc.loadDetails(model).then((details) {
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

        if (state is AppBlocLoadingState<Move>) {
          return AppLoadingWidget.centered();
        }

        var message = 'Something went wrong';
        if (state is AppBlocFailState<Move>) {
          message = state.message;
        }
        // By default, state is MoveFailedState (error)
        return Container(
          color: AppColors.container,
          child: Center(child: Text(message)),
        );
      }),
    );
  }

  bool _onScrollNotification(
    ScrollNotification scroll,
    AppBlocListState<Move> state,
  ) {
    if (scroll is ScrollEndNotification &&
        _scrollCtrl.position.extentAfter == 0 &&
        !state.noMoreResults) {
      _bloc.add(AppBlocFetchPageEvent<Move>.next(state.list));
    }
    return false;
  }

  Future<void> _showInfoPopup(Move model, MoveDetails _) async {
    Navigator.pushNamed(context, '${MoveDetailsPage.routeName}/${model.slug}',
        arguments: MoveDetailsPageArgs(model));
  }
}
