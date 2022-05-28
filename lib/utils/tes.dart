import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Manusia {
  int ID, Umur;
  String Nama;

  Manusia(this.ID, this.Nama, this.Umur);
}

class _MyAppState extends State<MyApp> {
  int ColIndex = 0;
  List<Manusia> DaftarSiswa = <Manusia>[
    Manusia(3, "Cita", 12),
    Manusia(1, "Andi", 18),
    Manusia(5, "Echo", 17),
    Manusia(2, "Budi", 24),
    Manusia(6, "Frenki", 24),
    Manusia(4, "Dito", 15),
  ];

  bool sort;

  @override
  void initState() {
    super.initState();
    sort = false;
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        DaftarSiswa.sort((a, b) => a.ID.compareTo(b.ID));
      } else {
        DaftarSiswa.sort((a, b) => b.ID.compareTo(a.ID));
      }
    } else if (columnIndex == 1) {
      if (ascending) {
        DaftarSiswa.sort((a, b) => a.Nama.compareTo(b.Nama));
      } else {
        DaftarSiswa.sort((a, b) => b.Nama.compareTo(a.Nama));
      }
    } else if (columnIndex == 2) {
      if (ascending) {
        DaftarSiswa.sort((a, b) => b.Umur.compareTo(a.Umur));
      } else {
        DaftarSiswa.sort((a, b) => a.Umur.compareTo(b.Umur));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Data Tabel"),
        ),
        body: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                sortAscending: sort,
                sortColumnIndex: ColIndex,
                columns: [
                  DataColumn(
                      label: Text("ID"),
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          sort = !sort;
                          ColIndex = columnIndex;
                        });
                        onSortColum(columnIndex, ascending);
                      }),
                  DataColumn(
                      label: Text("Nama"),
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          sort = !sort;
                          ColIndex = columnIndex;
                        });
                        onSortColum(columnIndex, ascending);
                      }),
                  DataColumn(
                      label: Text("Umur"),
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          sort = !sort;
                          ColIndex = columnIndex;
                        });
                        onSortColum(columnIndex, ascending);
                      }),
                ],
                rows: DaftarSiswa.map(
                  (p) => DataRow(cells: [
                    DataCell(
                      Text(p.ID.toString()),
                    ),
                    DataCell(
                      Text(p.Nama),
                    ),
                    DataCell(
                      Text(p.Umur.toString()),
                    ),
                  ]),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
