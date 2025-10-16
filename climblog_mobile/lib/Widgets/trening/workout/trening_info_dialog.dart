import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';

class TreningInfoDialog extends StatelessWidget {
  const TreningInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicContainer(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
              Text(" 1. To delete trening plan long press concerned trening plan icon, please keep in mind that the trening plan will be permanently deleted" ),
              SizedBox(height: 20,),
              Text(" 2. To open the concerned trening plan please one click on it"),
              SizedBox(height: 20,),
              Text(" 3. In order to edit trening plan you will firstly need to open details of plan by following step 2 and clicking pencil icon"),
              SizedBox(height: 20,),
              TextButton(
              style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF00a896),
              foregroundColor: Colors.white, 
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
            ),
              onPressed: () {
                Navigator.of(context).pop();
              }     
            , child: Text("Close")),
        ],
      )
    );
  }
}