import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ListImageFirestore extends StatelessWidget {
  const ListImageFirestore({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('images').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No hay imagenes nuevas',
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          final data = snapshot.data!;

          return SizedBox(
            height: 120,
            child: ListView.builder(
                itemCount: data.docs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  final item = data.docs[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 200,
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/loading.gif'),
                          image: NetworkImage(item["path"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                })),
          );
        });
  }
}
