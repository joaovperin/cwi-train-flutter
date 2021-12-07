import 'package:cleandex_poketecture/application/ui/scroll_and_drag_scroll_behaviour.dart';
import 'package:cleandex_poketecture/application/widgets/app_loading.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item_info.dart';
import 'package:cleandex_poketecture/pages/details.page.dart';
import 'package:cleandex_poketecture/pages/partials/items/bloc/item_bloc.dart';
import 'package:cleandex_poketecture/pages/partials/items/bloc/item_events.dart';
import 'package:cleandex_poketecture/pages/partials/items/bloc/item_states.dart';
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
    _bloc.add(const ItemFetchFirstPageEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.container,
      child: BlocBuilder<ItemBloc, ItemState>(
          bloc: _bloc,
          builder: (context, state) {
            // If the state has data, show it
            if (state is ItemListState) {
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
                          onDoubleTap: (model) => _showInfoPopup(model),
                        );
                      }
                      return AppLoadingWidget.centered();
                    },
                  ),
                ),
              );
            }

            if (state is ItemLoadingState) {
              return AppLoadingWidget.centered();
            }

            var message = 'Something went wrong';
            if (state is ItemFailState) {
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
    ItemListState state,
  ) {
    if (scroll is ScrollEndNotification &&
        _scrollCtrl.position.extentAfter == 0 &&
        !state.noMoreResults) {
      _bloc.add(ItemFetchPageEvent.next(state.list));
    }
    return false;
  }

  Future<void> _showInfoPopup(ItemInfo model) async {
    Navigator.pushNamed(context, DetailsPage.routeName,
        arguments: DetailsPageArgs.mockItem());
  }
}
