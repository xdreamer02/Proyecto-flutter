import 'package:flutter/material.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/routes/routes.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MyRoutes.rEditProfile, (route) => false);
              },
              icon: const Icon(Icons.edit_note))
        ],
      ),
      backgroundColor: Preferences.theme ? Colors.black54 : Colors.white,
      drawer: const customDrawerW(),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          SizedBox(
            height: 320,
            child: Stack(alignment: Alignment.topCenter, children: [
              const SizedBox(
                height: 180,
                width: double.infinity,
                child: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage(
                    'https://picsum.photos/200/300/?blur',
                  ),
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
                            color: Colors.black54,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 8)),
                        child: AvatarSmartWidget(
                          image: Preferences.image,
                          radius: 50,
                          text: Preferences.initialCharacters,
                        )),
                    Text(
                      Preferences.name,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:
                              Preferences.theme ? Colors.white : Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        Preferences.profession,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Preferences.theme
                                ? Colors.white70
                                : Colors.black45),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Preferences.country == ''
                            ? const Text('')
                            : Icon(
                                Icons.location_on,
                                color: Preferences.theme
                                    ? Colors.white70
                                    : Colors.black45,
                                size: 18,
                              ),
                        Text(
                          Preferences.country,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Preferences.theme
                                  ? Colors.white70
                                  : Colors.black45),
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
                    labelColor: Preferences.theme ? Colors.white : Colors.black,
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
