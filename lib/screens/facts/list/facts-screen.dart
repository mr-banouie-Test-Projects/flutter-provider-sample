import 'package:fluttertest/viewmodels/facts/fact-list-view-model.dart';
import 'package:fluttertest/screens/facts/list/fact-row-widget.dart';
import '../../../Utils/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FactsScreen extends StatefulWidget {
  const FactsScreen({Key? key}) : super(key: key);

  @override
  _FactsScreenState createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
  var scrollController = ScrollController();

  void pagination() {
    if ((scrollController.position.pixels ==
        scrollController.position.maxScrollExtent)) {
      Provider.of<FactListViewModel>(context, listen: false)
          .getFactsByPagination();
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(pagination);
    Provider.of<FactListViewModel>(context, listen: false)
        .getFactsByPagination();
  }

  @override
  Widget build(BuildContext context) {
    var vs = Provider.of<FactListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Facts", style: CustomTheme.appbarTitleStyle),
        ),
        toolbarHeight: 80,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: _buildList(vs),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(FactListViewModel vs) {
    switch (vs.loadingStatus) {
      case LoadingStatus.searching:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FactRow(
            facts: vs.facts,
            scrollController: scrollController,
          ),
        );
      case LoadingStatus.empty:
      default:
        return const Center(
          child: Text("No results found"),
        );
    }
  }
}
