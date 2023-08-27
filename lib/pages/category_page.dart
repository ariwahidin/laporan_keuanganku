import 'package:catatan_keuanganku/models/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isPengeluaran = true;
  int type = 2;
  final AppDb database = AppDb();
  TextEditingController categoryNameController = TextEditingController();

  Future insert(String name, int type) async {
    DateTime now = DateTime.now();
    final row = await database.into(database.categories).insertReturning(
        CategoriesCompanion.insert(
            name: name, type: type, createdAt: now, updatedAt: now));
    print(row);
  }

  Future<List<Category>> getAllCategory(int type) async {
    return await database.getAllCategoryRepo(type);
  }

  void bukaDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  Text(
                    (isPengeluaran) ? "Tambah pengeluaran" : "Tambah pemasukan",
                    style: (isPengeluaran)
                        ? GoogleFonts.montserrat(
                            fontSize: 20, color: Colors.red)
                        : GoogleFonts.montserrat(
                            fontSize: 20, color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: categoryNameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Name"),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        insert(
                            categoryNameController.text, isPengeluaran ? 2 : 1);
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                        setState(() {});
                      },
                      child: Text("Save"))
                ],
              )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                value: isPengeluaran,
                onChanged: (bool value) {
                  setState(() {
                    isPengeluaran = value;
                    type = value ? 2 : 1;
                  });
                },
                inactiveTrackColor: Colors.green[200],
                inactiveThumbColor: Colors.green,
                activeColor: Colors.red,
              ),
              IconButton(
                  onPressed: () {
                    bukaDialog();
                  },
                  icon: Icon(Icons.add))
            ],
          ),
        ),
        FutureBuilder(
            future: getAllCategory(type),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  if (snapshot.data!.length > 0) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Card(
                              elevation: 10,
                              child: ListTile(
                                leading: (isPengeluaran)
                                    ? Icon(Icons.upload, color: Colors.red)
                                    : Icon(Icons.download, color: Colors.green),
                                title: Text(snapshot.data![index].name),
                                trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit)),
                                    ]),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: Text("Tidak ada data"),
                    );
                  }
                } else {
                  return Center(
                    child: Text("Tidak ada data"),
                  );
                }
              }
            })
      ],
    ));
  }
}
