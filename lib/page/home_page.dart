import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../util/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController taskController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  List<ListToDo> ListTD = List.empty(growable: true);

  DateTime _date = DateTime.now();

  int selectedIndex  = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quản lí công việc"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
             TextField(
              controller: taskController,
              decoration: InputDecoration(
                hintText: 'Nhập công việc',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ) 
                )
              ) ,
            ),
            
            SizedBox(height: 10),
              TextField(
                controller: dateController,
                onTap: () async {
                  _date = (await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ))!;
                  dateController.text = DateFormat.yMd().format(_date);
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Deadline',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 ElevatedButton(onPressed: (){
                    String task = taskController.text.trim();
                    String date = dateController.text.trim();
                    if(task.isNotEmpty && date.isNotEmpty){
                      setState(() {
                        taskController.text = '';
                        dateController.text = '';
                        ListTD.add(ListToDo(task: task, date: date));
                      });
                    }
                 }, child: const Text("Lưu")),
                 ElevatedButton(onPressed: (){
                    String task = taskController.text.trim();
                    String date = dateController.text.trim();
                     if(task.isNotEmpty && date.isNotEmpty){
                      setState(() {
                        taskController.text = '';
                        dateController.text = '';
                        ListTD[selectedIndex].task = task;
                        ListTD[selectedIndex].date = date;
                        selectedIndex = -1;
                      });
                    }
                 }, child: const Text("Cập nhật")),
                ],
              ),
              const SizedBox(height: 10,),
              ListTD.isEmpty ? const Text(
                'Công việc hiện đang trống' ,
                style: TextStyle(fontSize: 22), 
              )
              : Expanded(
                child: ListView.builder(
                  itemCount: ListTD.length,
                  itemBuilder: (context,index) => getRow(index),
                ),
              ),
          ],
        ),
      ),
    );
  }
  

Widget getRow(int index) {
  DateTime now = DateTime.now();
  DateTime deadline = DateFormat.yMd().parse(ListTD[index].date);
  bool isExpired = deadline.isBefore(now);

  return Card(
    color: isExpired ? Colors.red.withOpacity(0.3) : null,
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor:
            index % 2 == 0 ? Colors.pink : Colors.green,
        foregroundColor: Colors.black,
        child: Text(
          ListTD[index].task[0],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ListTD[index].task,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(ListTD[index].date),
        ],
      ),
      trailing: SizedBox(
        width: 80,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                taskController.text = ListTD[index].task;
                dateController.text = ListTD[index].date;
                setState(() {
                  selectedIndex = index;
                });
              },
              child: const Icon(Icons.edit),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  ListTD.removeAt(index);
                });
              },
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    ),
  );
}

}