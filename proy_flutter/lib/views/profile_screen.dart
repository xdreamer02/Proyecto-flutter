import 'package:flutter/material.dart';
import 'package:proy_flutter/routes/routes.dart';
import 'package:proy_flutter/widgets/custom_Drawer.dart';
import 'package:proy_flutter/widgets/gridimage_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<ImageApp> images = [
    ImageApp('1', 'assets/wallpaper.jpeg', '1.2K', '12/12/2022'),
    ImageApp('2', 'assets/wallpaper.jpeg', '1.2K', '12/12/2022'),
    ImageApp('3', 'assets/wallpaper.jpeg', '23', '12/10/2022'),
    ImageApp('4', 'assets/wallpaper.jpeg', '234', '12/12/2022'),
    ImageApp('5', 'assets/wallpaper.jpeg', '123', '12/09/2022'),
    ImageApp('6', 'assets/wallpaper.jpeg', '123', '12/12/2022'),
    ImageApp('7', 'assets/wallpaper.jpeg', '2K', '12/12/2022'),
  ];

  void _onTapImage(String id) {
    debugPrint('Tap image ${id}');
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, MyRoutes.rLogin);
              },
              child: const Icon(Icons.logout),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      drawer: const customDrawerW(),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          SizedBox(
            height: 320,
            child: Stack(alignment: Alignment.topCenter, children: [
              SizedBox(
                height: 180,
                width: double.infinity,
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2016/10/20/18/35/earth-1756274__340.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 12)),
                      child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_960_720.jpg')),
                    ),
                    const Text(
                      'Chris Yovanka',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Designer | Photographer',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: Colors.black45,
                          size: 18,
                        ),
                        Text(
                          'Lima, Perú',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
          Container(
            height: 350.0,
            child: Column(
              children: [
                TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.purple,
                    tabs: const [
                      Tab(
                        text: 'Diseños',
                      ),
                      Tab(
                        text: 'Favoritos',
                      )
                    ],
                    controller: _tabController),
                Expanded(
                  child: TabBarView(controller: _tabController, children: [
                    GridImageWidget(
                        images: images, onTapImage: (id) => _onTapImage(id)),
                    Text('Favoritos'),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
