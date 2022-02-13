import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'NavBar.dart';
class Section extends StatefulWidget {
  const Section({Key? key}) : super(key: key);

  @override
  _courseState createState() => _courseState();
}

class _courseState extends State<Section> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.3,
        actions: [
        ],
      ),
      drawer: menu(),
      backgroundColor: Colors.white,
      body: Column(
          children: [
            SizedBox(height: 10,),
            Center(
              child: Container(
                child: Text(
                  "CS122\nSF-04",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
          /*  Row(
              children: <Widget>[
                SizedBox(width:20),
                Icon(Icons.today,color: Colors.black,),
                SizedBox(width:7),
                Text("20/02/2020",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12,),
              ],
            ),*/
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.only(right:20.0,left: 20),
                  padding: EdgeInsets.only(right:100),
                  decoration: BoxDecoration(
                      color: Colors.red[300],
                      shape: BoxShape.circle
                  ),

                ),
                Text(
                    "DN Students",
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],

              ),

             Container(height: 40, child: Divider(color: Colors.grey)),
            Expanded(child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,

                child:MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child:   Container(
                      padding: EdgeInsets.all(15),
                      child:Table(
                        border: TableBorder.all(width:2, color:Colors.black45),
                        children: [
                          TableRow(
                              children: [
                                TableCell(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Name")
                                    )
                                ),
                                TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("ID")
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Sara"),
                                      color: Colors.red[200],
                                    )
                                ),
                                TableCell(
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text("2180007689"),
                                    color: Colors.red[200],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Alaa")
                                    )
                                ),
                                TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("2180003468")
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Zainab"),
                                      color: Colors.red[200],
                                    )
                                ),
                                TableCell(
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text("2180009860"),
                                    color: Colors.red[200],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Aseal")
                                    )
                                ),
                                TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("2180000989")
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Ameerah")
                                    )
                                ),
                                TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("2180000735")
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Masheal")
                                    )
                                ),
                                TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("2180000985")
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Khadija")
                                    )
                                ),
                                TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("2180000085")
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Alhanouf")
                                    )
                                ),
                                TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("21800008793")
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Fatima"),
                                      color: Colors.red[200],
                                    )
                                ),
                                TableCell(
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text("2180002873"),
                                    color: Colors.red[200],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                TableCell(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Nora")
                                    )
                                ),
                                TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("2180008698")
                                  ),
                                ),
                              ]
                          ),
                        ],
                      )
                  ),
                )
            )
            )
          ]

      ),
    );
  }
}
List<PieChartSectionData> data =[
  PieChartSectionData(title:"Absent", titleStyle: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12) ,color: Colors.red,value: 70),
  PieChartSectionData(title:"Attend", titleStyle: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),color: Colors.green,value: 30),

];