import 'package:flutter/material.dart';
import 'package:flutter_crud/net/flutterfire.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {

  List<String> coins = [
    'bitcoin',
    'ethereum',
    'tether',
  ];

  String dropdownValue = "bitcoin";
TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ? DropDown
          DropdownButton(
            value : dropdownValue,
            onChanged: (String value) {
              setState(() {
                dropdownValue = value;
              });
            },
            items : coins.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value : value,
                child: Text(value),
              );
            }).toList(),
            ),

            // ? TextFromField
            Container(
              width  : MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText : "Coin amount",
                ),
              ),
            ),

            // ? Material button
            Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: MaterialButton(
              onPressed: () async {
                // await addCoin(dropdownValue, _amountController.text);
                // Navigator.of(context).pop();
                await addCoin(dropdownValue, _amountController.text);
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
          ),
        ],
      ),
      
    );
  }
}