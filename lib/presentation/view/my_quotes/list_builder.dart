import 'package:flutter/material.dart';
import 'package:isar_flutter/domain/model/quotes_domain.dart';

class ListBuilder extends StatefulWidget {
  final int listLength;
  final IndexedWidgetBuilder itemBuilder;
  final Function(bool) scrollListener;

  const ListBuilder({
    Key? key,
    required this.listLength,
    required this.itemBuilder,
    required this.scrollListener,
  }) : super(key: key);

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController
      ..dispose()
      ..removeListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(20),
      itemCount: widget.listLength,
      itemBuilder: widget.itemBuilder,
    );
  }

  void _onScroll() {
    if (_isBottom) {
      widget.scrollListener.call(_isBottom);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return true;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= (maxScroll * 0.9);
  }
}
