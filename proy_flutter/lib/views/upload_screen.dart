import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proy_flutter/widgets/custom_Drawer.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? image;
  int currentStep = 0;

  List<String> categories = ['Animales', 'Paisajes', 'Personajes'];

  String category = '';

  Future pickImage() async {
    try {
      final pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickImage == null) return;

      final imageTemp = File(pickImage.path);

      setState(() {
        this.image = imageTemp;
      });
    } catch (e) {
      debugPrint('error pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    category = categories.first;

    return Scaffold(
      appBar: AppBar(
        title: Text('Subir imagen'),
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
              // guardar imagen
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepTapped: (value) => setState(() {
            currentStep = value;
          }),
          steps: [
            Step(
                title: const Text('Imagen'),
                state: currentStep > 0 ? StepState.complete : StepState.indexed,
                content: SizedBox(height: 400, child: _pickImageWidget())),
            Step(
                title: const Text('Datos'),
                state: currentStep > 1 ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 1,
                content: Column(
                  children: [
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: _titleFieldWidget(
                            title: 'Titulo',
                            subTitle: '0/22',
                          ),
                        ),
                        const _textFieldWidget(
                            keyboardType: TextInputType.text,
                            hintText: 'Paisaje del mar'),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: _titleFieldWidget(title: 'Categoria'),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButton(
                              isExpanded: true,
                              value: category,
                              items: categories
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (value) {}),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: _titleFieldWidget(
                            title: 'Descripción',
                            subTitle: '0/220',
                          ),
                        ),
                        const _textFieldWidget(
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            hintText: 'Paisaje del mar en Ica'),
                      ],
                    )
                  ],
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
            ? Stack(
                children: [
                  Image.file(
                    image!,
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(131, 255, 255, 255),
                          child: IconButton(
                            color: Colors.black45,
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                image = null;
                              });
                            },
                          ),
                        ),
                      ))
                ],
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

class _textFieldWidget extends StatelessWidget {
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? hintText;

  const _textFieldWidget({
    Key? key,
    this.maxLines,
    this.keyboardType,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.purple),
            borderRadius: BorderRadius.circular(15)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.purple),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class _titleFieldWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _titleFieldWidget({
    Key? key,
    this.title = '',
    this.subTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: const TextStyle(fontSize: 18, color: Colors.purple),
        ),
        Text(subTitle!)
      ],
    );
  }
}
