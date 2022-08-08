import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar_flutter/injection.dart';
import 'package:isar_flutter/presentation/bloc/quotes/quotes_bloc.dart';
import 'package:isar_flutter/presentation/view/my_quotes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuotesBloc>(
      create: (context) => QuotesBloc(
          getQuotesUsecase: locator.get(), saveQuotesUsecase: locator.get())
        ..add(QuotesEventIntial()),
      child: BlocConsumer<QuotesBloc, QuotesState>(
        listener: (context, state) {
          if (state.saveIsSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Quotes is saved'),
              ),
            );
          }

          if (state.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Terjadi Kesalahan!')),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<QuotesBloc, QuotesState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 5,
                  title: const Text('Quotes'),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkResponse(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyQuotesPage())),
                        child: const Icon(Icons.bookmark_border),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkResponse(
                        onTap: () =>
                            context.read<QuotesBloc>().add(QuotesEventIntial()),
                        child: const Icon(Icons.refresh_sharp),
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: double.infinity,
                            child: state.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '"${state.quote.text}"',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(state.quote.author),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context.read<QuotesBloc>().add(QuoteEventSave(
                                    text: state.quote.text,
                                    author: state.quote.author,
                                  ));
                            },
                            child: const Text('Save'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                text:
                                    '${state.quote.text}\n${state.quote.author}',
                              ));

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Quote is copied'),
                                ),
                              );
                            },
                            child: const Text('Copy'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
