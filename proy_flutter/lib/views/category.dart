import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Busquedas Populares',
                style:
                    GoogleFonts.montserrat(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    itemCount: 8,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25)),
                          ),
                          height: 150,
                          width: 140,
                          margin: EdgeInsets.all(5),
                          child: Center(
                            child: Text('Popular'),
                          ),
                        ))),
              ),
              Text(
                'Colores',
                style:
                    GoogleFonts.montserrat(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                    itemCount: 8,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.all(Radius.circular(70)),
                          ),
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(10),
                          child: Center(
                            child: Text('Colors'),
                          ),
                        ))),
              ),
              Text(
                'Ideales para ti',
                style:
                    GoogleFonts.montserrat(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: ((context, index) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(5),
                          child: Center(
                            child: Text('Colors'),
                          ),
                        ))),
              ),
              Text(
                'Categorias',
                style:
                    GoogleFonts.montserrat(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: ((context, index) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(5),
                          child: Center(
                            child: Text('Colors'),
                          ),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
