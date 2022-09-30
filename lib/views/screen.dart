import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/contoh_soal_provider.dart.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ContohSoalProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing get Contoh Soal"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 160,
                  child: TextField(
                    onChanged: (value) {
                      provider.setCode(value);
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.getData(provider.code);
                  },
                  child: const Text("Get Data"),
                ),
              ],
            ),
            Consumer<ContohSoalProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value.data[index].questionBody!),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//ini cuman demo masukin ke model dulu baru di display di listview, jangan ngoceh future" kntl