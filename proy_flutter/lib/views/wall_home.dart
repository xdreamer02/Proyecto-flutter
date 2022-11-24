import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WallPage extends StatelessWidget {
  const WallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.black,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Destacados',
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => Container(
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                            ),
                            width: 190,
                            margin: EdgeInsets.all(5),
                            child: Center(
                              child: Text('Popular'),
                            ),
                          ))),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Colecciones Populares',
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => Container(
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                            ),
                            width: 190,
                            margin: EdgeInsets.all(5),
                            child: Center(
                              child: Text('Popular'),
                            ),
                          ))),
                ),
                Text('Popular',
                    style: GoogleFonts.montserrat(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.width,
          width: double.infinity,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: const Text("He'd have you all unravel at the"),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[300],
                child: const Text('Sound of screams but the'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[400],
                child: const Text('Who scream'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[500],
                child: const Text('Revolution is coming...'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[600],
                child: const Text('Revolution, they...'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
