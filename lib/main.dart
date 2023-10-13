import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 219, 32),
        title: Text("Kalkulator Luas Persegi Panjang"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          tooltip: "Kembali",
          onPressed: () {
            // Do something
          },
        ),
      ),
      body: LuasPersegiPanjangCalculator(),

        
    )// Menggunakan instance dari LuasPersegiPanjangCalculator
  ));
}


class LuasPersegiPanjangCalculator extends StatefulWidget {
  @override
  _LuasPersegiPanjangCalculatorState createState() => _LuasPersegiPanjangCalculatorState();
}

class _LuasPersegiPanjangCalculatorState extends State<LuasPersegiPanjangCalculator> {
  double panjang = 0.0;
  double lebar = 0.0;
  double luas = 0.0;

   final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();

  void hitungLuas() {
    setState(() {
      luas = panjang * lebar;
    });
  }

  void reset() {
    setState(() {
      panjang = 0.0;
      lebar = 0.0;
      luas = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color.fromARGB(100, 183, 255, 14),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                 margin: EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      controller: panjangController,
                      decoration: InputDecoration(
                        hintText: "Masukkan Panjang Persegi Panjang",
                      ),
                      onChanged: (value) {
                        setState(() {
                          panjang = double.parse(value);
                        });
                      },
                    ),
              ),
              Container(
                 margin: EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      controller: lebarController,
                      decoration: InputDecoration(
                        hintText: "Masukkan Lebar Persegi Panjang",
                      ),
                      onChanged: (value) {
                        setState(() {
                          lebar = double.parse(value);
                        });
                      },
                    ),
              ),
              Container(
                 margin: EdgeInsets.symmetric(vertical: 50.0),
                child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 191, 219, 32),
                        ),
                  onPressed: hitungLuas,
                  child: Text("Hitung Luas"),
                ),
              ),
              Text("Luas Persegi Panjang: $luas cm", 
              style:TextStyle(
                fontSize: 15,

              ),),
            ],
           
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
        ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Do something
            setState(() {
            panjang = 0.0;
            lebar = 0.0;
            
          });
          panjangController.clear();
          lebarController.clear();
            reset();
          },
          child: Text("Reset"),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}