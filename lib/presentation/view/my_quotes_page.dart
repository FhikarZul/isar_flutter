import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar_flutter/injection.dart';
import 'package:isar_flutter/presentation/bloc/my_quotes/my_quotes_bloc.dart';

class MyQuotesPage extends StatelessWidget {
  const MyQuotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: const Text('My Quotes'),
        ),
        body: BlocProvider<MyQuotesBloc>(
          create: (context) => MyQuotesBloc(
              getSaveQuotesUsecase: locator.get(),
              deletedQuotesUsecase: locator.get())
            ..add(MyQuotesEventInitial()),
          child: BlocBuilder<MyQuotesBloc, MyQuotesState>(
            builder: (context, state) {
              return state.quotes.isEmpty
                  ? const Center(
                      child: Text('Quotes is empty!'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: state.quotes.length,
                      itemBuilder: (context, index) {
                        final quote = state.quotes[index];

                        return Card(
                          child: ListTile(
                            title: Text(quote.text),
                            subtitle: Text(quote.author),
                            trailing: InkResponse(
                              onTap: () {
                                context
                                    .read<MyQuotesBloc>()
                                    .add(MyQuotesEventDeleted(id: quote.id!));
                              },
                              child: const Icon(Icons.delete),
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        ));
  }
}
