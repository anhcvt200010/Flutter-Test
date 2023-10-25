import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_test/CRUD/db_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> allData = [];

  bool isLoading = true;

  void refreshData() async{
    final data = await SQLHelper.getAllData();
    setState(() {
      allData = data;
      isLoading = false;
    });
  }

  @override
  void initState(){
    super.initState();
    refreshData();
  }

  void showBottomSheet(int ?id) async{

    if (id != null) {
      final existingData = allData.firstWhere((element) => element['id'] == id);
      nameController.text = existingData['name'];
      addrController.text = existingData['addr'];
      classesController.text = existingData['classes'];
      gpaController.text = existingData['gpa'].toString();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Tên"
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: addrController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Địa chỉ"
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: classesController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Lớp học"
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: gpaController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Điểm GPA"
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await addData();
                  }
                  else {
                    await updateData(id);
                  }

                  nameController.text = "";
                  addrController.text = "";
                  classesController.text = "";
                  gpaController.text = "";

                  Navigator.of(context).pop();
                  print("Data added");
                },
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                      id == null ? "Thêm dữ liệu": "Cập nhật",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      )
                    )
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addrController = TextEditingController();
  final TextEditingController classesController = TextEditingController();
  final TextEditingController gpaController = TextEditingController();

  Future<void> addData() async{
    await SQLHelper.createData(nameController.text, addrController.text, classesController.text, double.parse(gpaController.text));
    refreshData();
  }

  Future<void> updateData(int id) async{
    await SQLHelper.updateData(id, nameController.text, addrController.text, classesController.text, double.parse(gpaController.text));
    refreshData();
  }

  void deleteData(int id) async{
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Đã xóa dữ liệu")),
    );
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("App test CRUD"),
      ),
      body: isLoading
          ? Center(
            child: CircularProgressIndicator(),
          )
          : ListView.builder(
              itemCount: allData.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(15),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      allData[index]['name'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            "GPA: ${allData[index]['gpa'].toString()}",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        Text(
                            "Lớp học: ${allData[index]['classes']}",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        Text("Địa chỉ: ${allData[index]['addr']}",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            showBottomSheet(allData[index]['id']);
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.indigo,
                          )
                      ),
                      IconButton(
                          onPressed: () {
                            deleteData(allData[index]['id']);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )
                      )
                    ],
                  ),
                ),
              ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (() => showBottomSheet(null)),
            child: Icon(Icons.add),
          ),
    );
  }
}