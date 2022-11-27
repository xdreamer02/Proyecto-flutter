import 'package:flutter/material.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:proy_flutter/preferences/preferences.dart';
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

  List<ImageModel> images = [
    ImageModel(
        path: 'https://picsum.photos/200/300?=1',
        favorites: '1.2K',
        title: '',
        description: ''),
    ImageModel(
        path: 'https://picsum.photos/200/300?=2',
        favorites: '1.2K',
        title: '',
        description: ''),
    ImageModel(
        path: 'https://picsum.photos/200/300?=3',
        favorites: '23',
        title: '',
        description: ''),
    ImageModel(
        path: 'https://picsum.photos/200/300?=4',
        favorites: '234',
        title: '',
        description: ''),
    ImageModel(
        path: 'https://picsum.photos/200/300?=5',
        favorites: '123',
        title: '',
        description: ''),
    ImageModel(
        path: 'https://picsum.photos/200/300?=6',
        favorites: '123',
        title: '',
        description: ''),
    ImageModel(
        path: 'https://picsum.photos/200/300?=7',
        favorites: '2K',
        title: '',
        description: ''),
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
                  fit: BoxFit.fill,
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
                    const GridImageFirestoreWidget(),
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
