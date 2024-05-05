import 'package:flutter/material.dart';

class Scanning extends StatelessWidget {
  const Scanning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Disease Detecion',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 3)),
                    child: const Text(
                      'No Image Selected',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {},
                          child: const Icon(Icons.add_a_photo_outlined),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          child: const Icon(Icons.perm_media_sharp),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          child: const Icon(Icons.no_photography_rounded),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
