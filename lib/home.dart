import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:provider_lesson/providers/counter_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<CounterProvider>(context, listen: false).listCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 60,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        context.watch<CounterProvider>().categories?.length ??
                            0,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(context
                                      .watch<CounterProvider>()
                                      .categories?[index]
                                      .strCategory ??
                                  ''),
                            ),
                          ),
                        )))),
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: context.watch<CounterProvider>().height,
                color: context.watch<CounterProvider>().color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      context.watch<CounterProvider>().meals?.first.strMeal ??
                          '',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Category: '),
                        Text(
                          context
                                  .watch<CounterProvider>()
                                  .meals
                                  ?.first
                                  .strCategory ??
                              '',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${context.watch<CounterProvider>().meals?.first.strIngredient1 ?? ''}:',
                        ),
                        Text(
                          context
                                  .watch<CounterProvider>()
                                  .meals
                                  ?.first
                                  .strMeasure1 ??
                              '',
                        ),
                      ],
                    ),
                    Text(
                      '${context.watch<CounterProvider>().counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().incrementCounter();
              // context.read<CounterProvider>().getActivity();
              context.read<CounterProvider>().listMeal();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().decrementCounter();
              // context.read<CounterProvider>().getActivity();
              context.read<CounterProvider>().listMeal();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
