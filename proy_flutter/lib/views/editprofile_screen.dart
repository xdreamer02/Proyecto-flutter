import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/providers/index.dart';
import 'package:proy_flutter/services/msg_auth.dart';
import 'package:proy_flutter/services/profile_service.dart';
import 'package:proy_flutter/widgets/index.dart';
import 'package:http/http.dart' as http;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isImage = true;
  final _controller = TextEditingController(text: Preferences.image);

  Future<bool> _validURL(String url) async {
    try {
      final uri = Uri.parse(url);

      final response = await http.get(uri);

      switch (response.statusCode) {
        case 200:
          return true;
        default:
          return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
        centerTitle: true,
      ),
      drawer: const customDrawerW(),
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Form(
          key: provider.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AvatarSmartWidget(
                    image: provider.image,
                    radius: 60,
                    text: Preferences.initialCharacters,
                  ),
                  const TitleFieldWidget(
                    title: 'Url imagen',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextFieldWidget(
                      controller: _controller,
                      initialValue: null,
                      suffixIcon: IconButton(
                          onPressed: () {
                            provider.image = '';
                            Preferences.image = '';
                            _controller.clear();
                          },
                          icon: const Icon(Icons.clear)),
                      onChanged: (value) async {
                        print('image change');

                        if (value == '') {
                          return;
                        }

                        final isValid = await _validURL(value);

                        if (!isValid) {
                          MsgAuth.verSnackbarStateColor(
                              msg:
                                  'No se puede usar la url de la imagen, intente con otro',
                              color: Colors.red);
                        } else {
                          provider.image = value;
                          Preferences.image = value;
                        }

                        setState(() {
                          isImage = isValid;
                        });
                      },
                      validator: (value) {
                        return isImage ? null : 'No se puede usar esta url';
                      },
                    ),
                  ),
                  TitleFieldWidget(
                    title: 'Nombre',
                    subTitle: '${provider.name.length.toString()}/30',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextFieldWidget(
                      initialValue: Preferences.name,
                      onChanged: (value) {
                        provider.name = value;
                        Preferences.name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        return (value != null && value.length <= 30)
                            ? null
                            : 'El nombre debe tener menos de 30 caracteres';
                      },
                    ),
                  ),
                  TitleFieldWidget(
                    title: 'Profesion',
                    subTitle: '${provider.profession.length.toString()}/50',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextFieldWidget(
                        initialValue: Preferences.profession,
                        onChanged: (value) {
                          provider.profession = value;
                          Preferences.profession = value;
                          setState(() {});
                        },
                        validator: (value) {
                          return (value != null && value.length <= 50)
                              ? null
                              : 'La profesion debe tener menos de 50 caracteres';
                        }),
                  ),
                  TitleFieldWidget(
                    title: 'Ubicación',
                    subTitle: '${provider.country.length.toString()}/30',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextFieldWidget(
                        initialValue: Preferences.country,
                        onChanged: (value) {
                          provider.country = value;
                          Preferences.country = value;
                          setState(() {});
                        },
                        validator: (value) {
                          return (value != null && value.length <= 30)
                              ? null
                              : 'El pais debe tener menos de 30 caracteres';
                        }),
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: MaterialButton(
                        color: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        disabledColor: Colors.purple,
                        elevation: 1,
                        onPressed: provider.isLoading
                            ? null
                            : () async {
                                FocusScope.of(context).unfocus();

                                final service = Provider.of<ProfileService>(
                                    context,
                                    listen: false);

                                if (!provider.isValidForm()) return;

                                provider.isLoading = true;

                                final message = await service.edit(
                                    email: Preferences.email,
                                    country: Preferences.country,
                                    image: Preferences.image,
                                    name: Preferences.name,
                                    profession: provider.profession);

                                if (message == null) {
                                  MsgAuth.verSnackbarStateColor(
                                      msg:
                                          'No fue posible actualizar sus datos',
                                      color: Colors.red);
                                } else {
                                  Preferences.name = provider.name;
                                  Preferences.country = provider.country;
                                  Preferences.profession = provider.profession;
                                  Preferences.image = provider.image;

                                  MsgAuth.verSnackbarStateColor(msg: message);
                                }

                                provider.isLoading = false;
                                setState(() {});
                              },
                        child: provider.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'GUARDAR',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
