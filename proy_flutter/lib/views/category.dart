import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proy_flutter/views/detalle_cat.dart';

class categoryScreen extends StatefulWidget {
  const categoryScreen({super.key});

  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'Busquedas Populares',
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
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
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.limeAccent,
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(''),
                      ),
                    )
                  ],
                )),
            Text(
              'Ideales para ti',
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
                height: 350,
                child: ListView(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.red,
                              Colors.purple,
                              Colors.blueAccent
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'Blue',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                            colors: [Colors.red, Colors.purple, Colors.yellow]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'Red',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.red, Colors.green, Colors.black]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'Green',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    )
                  ],
                )),
            Text(
              'Categorias',
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.width,
              width: double.infinity,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                childAspectRatio: 4 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  Container(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CatImages())));
                          },
                          child: Container(
                            child: Image.network(
                              'https://picsum.photos/id/28/230/190',
                              fit: BoxFit.cover,
                            ),
                            height: 190,
                            width: 230,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Naturaleza',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CatImages())));
                          },
                          child: Container(
                            child: Image.network(
                              'https://wallpaperaccess.com/full/741407.jpg',
                              fit: BoxFit.cover,
                            ),
                            height: 190,
                            width: 230,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Tecnologia',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CatImages())));
                          },
                          child: Container(
                            child: Image.network(
                              'https://images.unsplash.com/photo-1493238792000-8113da705763?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8OHx8fGVufDB8fHx8&w=1000&q=80',
                              fit: BoxFit.cover,
                            ),
                            height: 190,
                            width: 230,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Vehiculos',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CatImages())));
                          },
                          child: Container(
                            child: Image.network(
                              'https://img.freepik.com/premium-vector/pop-art-comic-book-wallpaper-background_68166-661.jpg?w=1380',
                              fit: BoxFit.cover,
                            ),
                            height: 190,
                            width: 230,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Comics',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CatImages())));
                          },
                          child: Container(
                            child: Image.network(
                              'https://www.xtrafondos.com/wallpapers/resized/astronauta-perdido-en-el-espacio-5498.jpg?s=large',
                              fit: BoxFit.cover,
                            ),
                            height: 190,
                            width: 230,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Espacio',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CatImages())));
                          },
                          child: Container(
                            child: Image.network(
                              'https://p4.wallpaperbetter.com/wallpaper/399/192/946/geometric-patterns-geometric-patterns-retro-design-wallpaper-preview.jpg',
                              fit: BoxFit.cover,
                            ),
                            height: 190,
                            width: 230,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Patrones',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CatImages())));
                          },
                          child: Container(
                            child: Image.network(
                              'https://i.pinimg.com/originals/3f/e2/24/3fe2247e776c5f5917cce4fc1850a426.jpg',
                              fit: BoxFit.cover,
                            ),
                            height: 190,
                            width: 230,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Amor',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CatImages())));
                          },
                          child: Container(
                            child: Image.network(
                              'https://mobimg.b-cdn.net/v3/fetch/02/02d248d9eeaf7c12258f6ea6e1d445c1.jpeg',
                              fit: BoxFit.cover,
                            ),
                            height: 190,
                            width: 230,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Musica',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CatImages())));
                          },
                          child: Container(
                            child: Image.network(
                              'https://i.pinimg.com/564x/c0/9c/c1/c09cc1262f4f64e832cfcf2ab8e23a1e.jpg',
                              fit: BoxFit.cover,
                            ),
                            height: 190,
                            width: 230,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Videojuegos',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CatImages())));
                          },
                          child: Container(
                            child: Image.network(
                              'https://wallpaperaccess.com/full/343549.jpg',
                              fit: BoxFit.cover,
                            ),
                            height: 190,
                            width: 230,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Deporte',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
