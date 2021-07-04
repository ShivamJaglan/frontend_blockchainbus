// @dart=2.9
import 'dart:io';

import 'package:covid/providers/covidProvider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetResults extends StatefulWidget {
  @override
  _GetResultsState createState() => _GetResultsState();
}

class _GetResultsState extends State<GetResults> {
  var _file;
  bool result;
  bool _loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BlockchAInBus"),
      ),
      body: Stack(children: [
        Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  _openPicker();
                },
                child: Text("upload file")),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _loading = true;
                  });
                  Provider.of<CovidProvider>(context, listen: false)
                      .getResults()
                      .catchError((error) {
                    print(error);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(error)));
                  }).then((value) {
                    setState(() {
                      _loading = false;
                      result =
                          Provider.of<CovidProvider>(context, listen: false)
                              .result;
                    });
                  });
                },
                child: Text("Show Results")),
            result != null
                ? Text(result ? "covid +" : "covid -ve")
                : Text(result ? "covid +" : "covid -ve")
          ],
        ),
        Center(
          child:
              Visibility(visible: _loading, child: CircularProgressIndicator()),
        )
      ]),
    );
  }

  Future<void> _openPicker() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path);
      Provider.of<CovidProvider>(context, listen: false)
          .postData(file)
          .catchError((error) {
        print(error);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error)));
      }).then((value) => print("posted details"));
    } else {}
  }
}
