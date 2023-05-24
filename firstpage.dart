import 'package:assessment_2_6701213043/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FormData {
  String textFieldDataName;
  String textFieldDataDesc;
  String textFieldDataPrice;
  String checkboxData1;
  String checkboxData2;
  String radioOptionData;

  FormData(
      {required this.textFieldDataName,
      required this.textFieldDataDesc,
      required this.textFieldDataPrice,
      required this.checkboxData1,
      required this.checkboxData2,
      required this.radioOptionData});
}

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController _textFieldController1 = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  TextEditingController _textFieldController3 = TextEditingController();
  String _selectedRadioOption = '';
  String pengiriman = 'tidak';
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  String retur = 'tidak';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 100, left: 25, right: 25, bottom: 15),
            child: SizedBox(
              width: 500,
              child: TextField(
                autofocus: true,
                controller: _textFieldController1,
                decoration: InputDecoration(
                    labelText: 'Nama barang', border: OutlineInputBorder()),
                keyboardType: TextInputType.multiline,
                minLines: 1, // <-- SEE HERE
                maxLines: 5, // <-- SEE HERE
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: SizedBox(
              width: 500,
              child: TextField(
                autofocus: true,
                controller: _textFieldController2,
                decoration: InputDecoration(
                    labelText: 'Deskripsi', border: OutlineInputBorder()),
                keyboardType: TextInputType.multiline,
                minLines: 1, // <-- SEE HERE
                maxLines: 4, // <-- SEE HERE
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: SizedBox(
              width: 500,
              child: TextField(
                autofocus: true,
                controller: _textFieldController3,
                decoration: InputDecoration(
                    labelText: 'Harga', border: OutlineInputBorder()),
                keyboardType: TextInputType.multiline,
                minLines: 1, // <-- SEE HERE
                maxLines: 5, // <-- SEE HERE
              ),
            ),
          ),
          Text(
            "Kondisi barang",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
          Divider(),
          RadioListTile(
            title: Text("Bekas"),
            value: "bekas",
            groupValue: _selectedRadioOption,
            onChanged: (String? newValue) {
              setState(() {
                _selectedRadioOption = newValue ?? '';
              });
            },
          ),
          RadioListTile(
            title: Text("Baru"),
            value: "baru",
            groupValue: _selectedRadioOption,
            onChanged: (String? newValue) {
              setState(() {
                _selectedRadioOption = newValue ?? '';
              });
            },
          ),
          Row(
            children: [
              Text(
                "Pengiriman dalam kota saja",
                textAlign: TextAlign.justify,
              ),
              Checkbox(
                value: _isChecked1,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked1 = newValue ?? false;
                    pengiriman = "ya";
                  });
                },
              )
            ],
          ),
          Row(
            children: [
              Text("Menerima Retur"),
              Checkbox(
                value: _isChecked2,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked2 = newValue ?? false;
                    retur = 'Ya';
                  });
                },
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: MaterialButton(
              minWidth: double.infinity,
              onPressed: () {
                FormData formData = FormData(
                  textFieldDataName: _textFieldController1.text,
                  textFieldDataDesc: _textFieldController2.text,
                  textFieldDataPrice: _textFieldController3.text,
                  checkboxData1: pengiriman,
                  checkboxData2: retur,
                  radioOptionData: _selectedRadioOption,
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(formData: formData)));
              },
              child: Text('PUBLIKASIKAN'),
              color: Colors.white,
              textColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
