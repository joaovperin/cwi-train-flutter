import 'package:cleandex_poketecture/application/widgets/app_search_field.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.bottomNavigationBar,
    this.onSearch,
  }) : super(key: key);

  final String title;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final OnSearchFn? onSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: AppColors.statusBar,
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            if (onSearch != null) AppSearchField(onSearch: onSearch!),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.appBarGradient,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 140,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Container(
            height: 3,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.dividerGradient,
              ),
            ),
          ),
        ),
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
