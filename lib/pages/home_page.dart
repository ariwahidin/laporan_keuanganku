import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(5)),
                    Container(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.download,
                        color: Colors.green,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pemasukan",
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Rp. 55.000",
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(5)),
                    Container(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.upload,
                        color: Colors.red,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pengeluaran",
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Rp. 15.000",
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          // Text transaction
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Transaction",
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          // List Transaksi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Container(
                  child: Icon(Icons.upload, color: Colors.red),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                ),
                title: Text("Rp. 15.000"),
                subtitle: Text("Makan siang"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.edit)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Container(
                  child: Icon(Icons.upload, color: Colors.red),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                ),
                title: Text("Rp. 15.000"),
                subtitle: Text("Makan siang"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.edit)
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
