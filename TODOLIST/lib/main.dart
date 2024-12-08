import 'package:flutter/material.dart';

void main() {
runApp(Todolist());
}
class Todolist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'To-Do List',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
      ),
      home: TodoListScreen(),
    );
  }
}
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  List<String> _tasks =[];
  TextEditingController _Controller= TextEditingController();

  void _addTask(){
    String newTask= _Controller.text.trim();
    if(newTask.isNotEmpty){
      setState(() {
        _tasks.add(newTask);
      });
      _Controller.clear();
    }
  }

  void _deleteTask(int index){
    setState(() {
      _tasks.removeAt(index);
    });
  }
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        centerTitle: true,
      ),
      body: Container(padding: const EdgeInsets.all(16.0),
      child:Column(
      children:[
        Row(
     children: [
       Expanded(child: TextField(
     controller: _Controller,
     decoration: InputDecoration(
     hintText: 'enter a new task',
     border:  OutlineInputBorder(),
     ),
     ),
     ),
     SizedBox(width: 8,),
     ElevatedButton(onPressed: _addTask, child: Text('Add'),
     )
     ],
     ),
SizedBox(height: 20),
        Expanded(child: _tasks.isEmpty
        ?Center(child: Text('no task added!'))
     :ListView.builder(
     itemCount: _tasks.length,
     itemBuilder: (context,index){
       return Card(
       child: ListTile(
       title: Text(_tasks[index]),
     trailing: IconButton(onPressed: ()=>_deleteTask(index), icon: Icon(Icons.delete,color: Colors.red,)),
       ),
       );
     }
     )
        )
     ]
      )
    )
    );
  }
}

