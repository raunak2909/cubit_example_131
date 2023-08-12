import 'package:cubit_example_131/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class SeconsPage extends StatelessWidget {
  var titleController = TextEditingController();
  var descController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cubit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: titleController,
            ),

            SizedBox(
              height: 11,
            ),

            TextField(
              controller: descController,
            ),

            SizedBox(
              height: 11,
            ),

            ElevatedButton(onPressed: (){
              var title = titleController.text.toString();
              var desc = descController.text.toString();

              if(title!="" && desc!=""){
                context.read<CounterCubit>().addData({
                  'title':title,
                  'desc':desc
                });
              }

            }, child: Text('Add'))

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
