import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool isPengeluaran = true;
  List<String> list = ['Makanan', 'Transportasi', 'Nonton Film', 'Liburan'];
  late String dropDownValue = list.first;
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah transaksi")),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Switch(
                value: isPengeluaran,
                onChanged: (bool value) {
                  setState(() {
                    isPengeluaran = value;
                  });
                },
                inactiveTrackColor: Colors.green[200],
                inactiveThumbColor: Colors.green,
                activeColor: Colors.red,
              ),
              Text(
                isPengeluaran ? "Pengeluaran" : "Pemasukan",
                style: GoogleFonts.montserrat(fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: "Amount"),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Text("Category", style: GoogleFonts.montserrat(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton(
                value: dropDownValue,
                isExpanded: true,
                icon: Icon(Icons.arrow_downward),
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {}),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(labelText: "Enter date"),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2099));
                if (pickedDate != null) {
                  String formatedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  dateController.text = formatedDate;
                }
              },
            ),
          ),
          SizedBox(height: 25),
          Center(child: ElevatedButton(onPressed: () {}, child: Text("Save")))
        ]),
      ),
    );
  }
}
