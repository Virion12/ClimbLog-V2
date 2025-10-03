import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Widgets/Routes/charts/compare_routes_by2date_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompareroutesPage extends ConsumerWidget {
  const CompareroutesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final selectedDate1 = ref.watch(selectedDate1Provider);
    final selectedDate2 = ref.watch(selectedDate2Provider);
    final selectedDate3 = ref.watch(selectedDate3Provider);
    final selectedDate4 = ref.watch(selectedDate4Provider);

    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 246, 245, 245),
        centerTitle: true,
        title: Text("Compare"),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 200,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                  Text("Data set 1",style: TextStyle(fontSize: 16),),
                  SizedBox(height: 20,),   
                   SizedBox(
                    width: 160,
                     child: TextField(
                          controller: TextEditingController(
                              text: "${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}"
                            ),
                          decoration: InputDecoration(
                            labelText: 'From',
                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 243, 243),
                            prefixIcon: Icon(Icons.calendar_today),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF00a896)),
                            ),
                          ),
                          readOnly: true,
                          onTap:  () async {
                          final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
                            if(dateTime != null){
                              ref.read(selectedDate1Provider.notifier).state = dateTime;
                            }
                        },
                        ),
                   ), 
                   SizedBox(height: 20,),        
                      SizedBox(
                        width: 160,
                        child: TextField(
                          controller: TextEditingController(
                              text: "${selectedDate2.day}-${selectedDate2.month}-${selectedDate2.year}"
                            ),
                          decoration: InputDecoration(
                            labelText: 'To',
                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 243, 243),
                            prefixIcon: Icon(Icons.calendar_today),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF00a896)),
                            ),
                          ),
                          readOnly: true,
                          onTap:  () async {
                          final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
                            if(dateTime != null){
                              ref.read(selectedDate2Provider.notifier).state = dateTime;
                            }
                        },
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 200,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                  Text("Data set 2",style: TextStyle(fontSize: 16),),
                  SizedBox(height: 20,),   
                   SizedBox(
                    width: 160,
                     child: TextField(
                          controller: TextEditingController(
                              text: "${selectedDate3.day}-${selectedDate3.month}-${selectedDate3.year}"
                            ),
                          decoration: InputDecoration(
                            labelText: 'From',
                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 243, 243),
                            prefixIcon: Icon(Icons.calendar_today),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF00a896)),
                            ),
                          ),
                          readOnly: true,
                          onTap:  () async {
                          final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
                            if(dateTime != null){
                              ref.read(selectedDate3Provider.notifier).state = dateTime;
                            }
                        },
                        ),
                   ), 
                   SizedBox(height: 20,),        
                      SizedBox(
                        width: 160,
                        child: TextField(
                          controller: TextEditingController(
                              text: "${selectedDate4.day}-${selectedDate4.month}-${selectedDate4.year}"
                            ),
                          decoration: InputDecoration(
                            labelText: 'To',
                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 243, 243),
                            prefixIcon: Icon(Icons.calendar_today),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF00a896)),
                            ),
                          ),
                          readOnly: true,
                          onTap:  () async {
                          final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
                            if(dateTime != null){
                              ref.read(selectedDate4Provider.notifier).state = dateTime;
                            }
                        },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),



          //Compare barchart
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: EdgeInsets.all(10),
            height: 250,
            margin: EdgeInsets.only(top: 20,left: 25,right: 25),
            child: Column(
              children: [
                Text("Problems done by grade"),
                SizedBox(height: 10),
                ChartRoutesCompare(height: 200, width: double.infinity,),
              ],
            ),
          ),
       
        ],
      ),
    );
  }

}