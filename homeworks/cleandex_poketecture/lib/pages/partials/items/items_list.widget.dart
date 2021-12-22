import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_events.dart';
import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_states.dart';
import 'package:cleandex_poketecture/application/ui/scroll_and_drag_scroll_behaviour.dart';
import 'package:cleandex_poketecture/application/widgets/app_loading.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item_details.dart';
import 'package:cleandex_poketecture/pages/item_details.page.dart';
import 'package:cleandex_poketecture/pages/partials/items/bloc/item_bloc.dart';
import 'package:cleandex_poketecture/pages/partials/items/item_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsList extends StatefulWidget with WidgetWithSearchableBlock {
  const ItemsList({Key? key}) : super(key: key);

  @override
  State<ItemsList> createState() => _ItemsListState();

  @override
  ItemBloc getBloc(BuildContext context) => BlocProvider.of<ItemBloc>(context);
}

class _ItemsListState extends State<ItemsList> {
  late ItemBloc _bloc;
  final ScrollController _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    _bloc = widget.getBloc(context);
    _bloc.add(AppBlocFetchFirstPageEvent<Item>());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.container,
      child: BlocBuilder<ItemBloc, AppBlocState<Item>>(
          bloc: _bloc,
          builder: (context, state) {
            // If the state has data, show it
            if (state is AppBlocListState<Item>) {
              final list = state.list;
              return NotificationListener<ScrollNotification>(
                onNotification: (scroll) =>
                    _onScrollNotification(scroll, state),
                child: ScrollConfiguration(
                  behavior: const ScrollAndDragScrollBehavior(),
                  child: ListView.separated(
                    controller: _scrollCtrl,
                    itemCount:
                        state.noMoreResults ? list.length : list.length + 1,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      if (index < list.length) {
                        return ItemsTitleWidget(
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

            if (state is AppBlocLoadingState<Item>) {
              return AppLoadingWidget.centered();
            }

            var message = 'Something went wrong';
            if (state is AppBlocFailState<Item>) {
              message = state.message;
            }
            // By default, state is ItemFailedState (error)
            return Container(
              color: AppColors.container,
              child: Center(child: Text(message)),
            );
          }),
    );
  }

  bool _onScrollNotification(
    ScrollNotification scroll,
    AppBlocListState<Item> state,
  ) {
    if (scroll is ScrollEndNotification &&
        _scrollCtrl.position.extentAfter == 0 &&
        !state.noMoreResults) {
      _bloc.add(AppBlocFetchPageEvent<Item>.next(state.list));
    }
    return false;
  }

  Future<void> _showInfoPopup(Item model, ItemDetails _) async {
    Navigator.pushNamed(context, '${ItemDetailsPage.routeName}/${model.slug}',
        arguments: ItemDetailsPageArgs(model));
  }
}
