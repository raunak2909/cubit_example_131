import 'package:cubit_example_131/cubit/counter_cubit.dart';
import 'package:cubit_example_131/cubit/counter_state.dart';
import 'package:cubit_example_131/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    //your work
  }

  @override
  void dispose() {
    super.dispose();
    //your work
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cubit'),
      ),
      body: Center(
        child:
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return Center(
              child: Text(
                state.errorMsg,
                style: TextStyle(fontSize: 25),
              ),
            );
          } else {
            return state.arrData.isNotEmpty
                ? ListView.builder(
                    itemCount: state.arrData.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: Text('${index + 1}'),
                        title: Text('${state.arrData[index]['title']}'),
                        subtitle: Text('${state.arrData[index]['desc']}'),
                        trailing: InkWell(
                            onTap: () {
                              context.read<CounterCubit>().deleteData(index);
                              //BlocProvider.of<CounterCubit>(context).deleteData(index);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      );
                    })
                : Center(
                    child: Text('No Data Found!!'),
                  );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<CounterCubit>()
              .addData({'title': "Hello", 'desc': "How are you"});

          /*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SeconsPage(),
              ));*/
        },
        tooltip: 'Next Page',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
