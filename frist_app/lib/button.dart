
import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String text;
  int index;
  Function onClickChange;
  BoardButton(this.text,this.index,this.onClickChange);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(5),

          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ),
              onPressed: (){
              onClickChange(index);

              },
              child: Text(text ,style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),)),
        )
    );

  }
}