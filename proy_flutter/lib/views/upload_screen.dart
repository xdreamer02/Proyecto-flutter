import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:proy_flutter/providers/index.dart';
import 'package:proy_flutter/services/index.dart';
import 'package:proy_flutter/widgets/index.dart';
import 'package:proy_flutter/widgets/utils.dart';
import 'package:uuid/uuid.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? image;

  int currentStep = 0;

  Future pickImage() async {
    try {
      final pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickImage == null) return;

      print('pick image path: ${pickImage.path}');

      final imageTemp = File(pickImage.path);

      final Directory directory = await getApplicationDocumentsDirectory();

      String path = directory.path;

      print('copy image path: ${path}');

      String id = Uuid().v1();

      final File newImage = await imageTemp.copy('$path/$id.jpg');

      setState(() {
        image = newImage;
      });
    } catch (e) {
      debugPrint('error pick image $e');
    }
  }

  Future saveImage(ImageAppProvider imageAppProvider) async {
    FocusScope.of(context).unfocus();

    GalleryService service =
        Provider.of<GalleryService>(context, listen: false);

    if (!imageAppProvider.isValidForm()) return;

    imageAppProvider.isLoading = true;

    EasyLoading.show(status: 'Guardando...');

    if (image == null) {
      imageAppProvider.isLoading = false;

      MsgAuth.verSnackbarStateColor(
          msg: 'No selecciono una imagen', color: Colors.red);
      return;
    }

    try {
      DateTime now = DateTime.now();

      ImageModel imageModel = ImageModel(
          title: imageAppProvider.title,
          description: imageAppProvider.description,
          path: image?.path ?? '',
          favorites: '0',
          date: DateFormat('dd/MM/yyyy').format(now));

      String? response = await service.saveLocal(imageModel);

      final id = await service.save(imageModel);

      print('db: $id');

      EasyLoading.dismiss();

      imageAppProvider.isLoading = false;

      MsgAuth.verSnackbarStateColor(msg: response!, color: Colors.green);
    } catch (e) {
      EasyLoading.dismiss();

      imageAppProvider.isLoading = false;

      MsgAuth.verSnackbarStateColor(
          msg: 'Ocurrio un error al guardar la imagen', color: Colors.red);
    }

    debugPrint('complete');
  }

  @override
  Widget build(BuildContext context) {
    final imageAppProvider = Provider.of<ImageAppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subir imagen'),
        centerTitle: true,
      ),
      drawer: const customDrawerW(),
      body: Center(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepCancel: () => currentStep == 0
              ? null
              : setState((() {
                  currentStep -= 1;
                })),
          onStepContinue: () {
            bool isLastStep = (currentStep == 1);

            if (isLastStep) {
              imageAppProvider.isLoading ? null : saveImage(imageAppProvider);
            } else {
              if (image == null) {
                MsgAuth.verSnackbarStateColor(
                    msg: 'Necesitar seleccionar una imagen para continuar',
                    color: Colors.red);
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            }
          },
          onStepTapped: (value) => setState(() {
            currentStep = value;
          }),
          controlsBuilder: (context, details) {
            bool isLastStep = (currentStep == 1);
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  TextButton(
                      onPressed: details.onStepContinue,
                      child: Text(
                          imageAppProvider.isLoading
                              ? 'Cargando ...'
                              : isLastStep
                                  ? 'Terminar'
                                  : 'Continuar',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.purple))),
                  TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Cancelar',
                          style:
                              TextStyle(fontSize: 18, color: Colors.purple))),
                ],
              ),
            );
          },
          steps: [
            Step(
                title: const Text('Imagen'),
                state: currentStep > 0 ? StepState.complete : StepState.indexed,
                content: SizedBox(height: 400, child: _pickImageWidget())),
            Step(
                title: const Text('Datos'),
                state: currentStep > 1 ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 1,
                content: _FormWidget(
                  imageAppProvider: imageAppProvider,
                ))
          ],
        ),
      ),
    );
  }

  Column _pickImageWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image != null
            ? ImagePickerWidget(
                image: image,
                onPressed: () {
                  setState(() {
                    image = null;
                  });
                },
              )
            : DottedBorder(
                color: Colors.black45,
                dashPattern: const [6, 3, 2, 3],
                radius: const Radius.circular(10),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    const Text(
                      "No hay imagen para mostrar",
                      style: TextStyle(fontSize: 20, color: Colors.black45),
                    ),
                    const Icon(
                      Icons.image,
                      color: Colors.purple,
                      size: 100,
                    ),
                    MaterialButton(
                      onPressed: () => pickImage(),
                      color: Colors.purple,
                      child: const Text(
                        'Seleccionar imagen',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
      ],
    );
  }
}

class _FormWidget extends StatefulWidget {
  final ImageAppProvider imageAppProvider;

  const _FormWidget({Key? key, required this.imageAppProvider})
      : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState(imageAppProvider);
}

class _FormWidgetState extends State<_FormWidget> {
  final ImageAppProvider imageAppProvider;

  List<String> categories = ['Animales', 'Paisajes', 'Personajes'];

  _FormWidgetState(this.imageAppProvider);

  @override
  Widget build(BuildContext context) {
    String category = categories.first;

    return Form(
      key: imageAppProvider.formKey,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TitleFieldWidget(
                  title: 'Titulo',
                  subTitle: '${imageAppProvider.title.length.toString()}/22',
                ),
              ),
              TextFieldWidget(
                keyboardType: TextInputType.text,
                hintText: 'Paisaje del mar',
                onChanged: (value) {
                  imageAppProvider.title = value;
                  setState(() {});
                },
                validator: (value) {
                  return (value != null &&
                          value.length >= 4 &&
                          value.length <= 22)
                      ? null
                      : 'El titulo debe tener entre 4 y 22 caracteres.';
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TitleFieldWidget(title: 'Categoria'),
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField(
                    isExpanded: true,
                    value: category,
                    decoration: decorationField(),
                    style: const TextStyle(color: Colors.black45),
                    dropdownColor: Colors.purple.shade100,
                    items: categories
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(
                                    color: Colors.black45, fontSize: 18),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      imageAppProvider.category = value!;
                      setState(() {
                        category = value;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TitleFieldWidget(
                  title: 'Descripción',
                  subTitle:
                      '${imageAppProvider.description.length.toString()}/220',
                ),
              ),
              TextFieldWidget(
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                hintText: 'Paisaje del mar en Ica',
                onChanged: (value) {
                  imageAppProvider.description = value;
                  setState(() {});
                },
                validator: (value) {
                  return (value != null && value.length <= 220)
                      ? null
                      : 'La descripcion debe ser menor de 220 caracteres';
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
