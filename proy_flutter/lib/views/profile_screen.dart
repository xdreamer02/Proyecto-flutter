import 'package:flutter/material.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/routes/routes.dart';
import 'package:proy_flutter/widgets/custom_Drawer.dart';
import 'package:proy_flutter/widgets/gridimage_widget.dart';
import 'package:proy_flutter/widgets/index.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<ImageApp> images = [
    ImageApp(
        '1', 'https://picsum.photos/seed/picsum/200/300', '1.2K', '12/12/2022'),
    ImageApp(
        '2', 'https://picsum.photos/seed/picsum/200/300', '1.2K', '12/12/2022'),
    ImageApp(
        '3', 'https://picsum.photos/seed/picsum/200/300', '23', '12/10/2022'),
    ImageApp(
        '4', 'https://picsum.photos/seed/picsum/200/300', '234', '12/12/2022'),
    ImageApp(
        '5', 'https://picsum.photos/seed/picsum/200/300', '123', '12/09/2022'),
    ImageApp(
        '6', 'https://picsum.photos/seed/picsum/200/300', '123', '12/12/2022'),
    ImageApp(
        '7', 'https://picsum.photos/seed/picsum/200/300', '2K', '12/12/2022'),
  ];

  List<ImageModel> onwImages = Preferences.imageNews;

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
                  'https://picsum.photos/200/300/?blur',
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
                          border: Border.all(color: Colors.white, width: 8)),
                      child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_960_720.jpg')),
                    ),
                    const Text(
                      'Chris Yovanka',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5),
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
          SizedBox(
            height: 350.0,
            child: Column(
              children: [
                TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.purple,
                    tabs: const [
                      Tab(
                        text: 'Tus Imagenes',
                      ),
                      Tab(
                        text: 'Favoritos',
                      )
                    ],
                    controller: _tabController),
                Expanded(
                  child: TabBarView(controller: _tabController, children: [
                    GridImageLocalWidget(images: onwImages),
                    GridImageWidget(
                        images: images, onTapImage: (id) => _onTapImage(id)),
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
