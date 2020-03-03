import 'package:flutter/material.dart';
import './employee.dart';
import './employeebloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _employeeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee App'),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                            '${snapshot.data[index].id}.',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            
                            Text(
                              '${snapshot.data[index].name}',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              '₹ ${snapshot.data[index].salary}',
                              style: TextStyle(
                                fontSize: 20.0,fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(icon: Icon(Icons.thumb_up),
                         onPressed: (){
                           _employeeBloc.employeeSalaryIncrement.add(snapshot.data[index]);
                         },
                         color: Colors.green,
                        ),
                      ),
                      Container(
                        child: IconButton(icon: Icon(Icons.thumb_down),
                         onPressed: (){
                           _employeeBloc.employeeSalaryDecrement.add(snapshot.data[index]);
                         },
                         color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: snapshot.data.length,
            );
          },
          stream: _employeeBloc.employeeListStream,
        ),
      ),
    );
  }
}
