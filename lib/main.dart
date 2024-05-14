import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jovial_svg/jovial_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Uint8List> _useJovial() async {
    final si = await ScalableImage.fromSvgHttpUrl(
        Uri.parse('https://docs.gtk.org/gtk3/gtk-logo.svg'));

    await si.prepareImages();
    final vpSize = si.viewport;
    final recorder = PictureRecorder();
    final Canvas c = Canvas(recorder);

    si.paint(c);
    si.unprepareImages();

    final Picture pict = recorder.endRecording();
    final rendered =
        await pict.toImage(vpSize.width.round(), vpSize.height.round());

    final ByteData? bd = await rendered.toByteData(format: ImageByteFormat.png);
    final r = Uint8List.fromList(bd!.buffer.asUint8List());

    rendered.dispose();
    pict.dispose();

    return r;
  }

  void _useFlutterSvg() async {
    try {
      final PictureInfo pictureInfo = await vg.loadPicture(
        const SvgNetworkLoader('https://docs.gtk.org/gtk3/gtk-logo.svg'),
        null,
        onError: (error, stackTrace) {
          print(error);
          print(stackTrace);
        },
      );

      final recorder = PictureRecorder();
      final Canvas c = Canvas(recorder);

      c.drawPicture(pictureInfo.picture);
      pictureInfo.picture.dispose();

      final Picture pict = recorder.endRecording();
      final rendered = await pict.toImage(
          pictureInfo.size.width.toInt(), pictureInfo.size.height.toInt());

      final ByteData? bd =
          await rendered.toByteData(format: ImageByteFormat.png);

      rendered.dispose();
      pict.dispose();

      print(bd?.lengthInBytes);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Crashes on Linux, but not Web.  I didn\'t test the others',
            ),
            ElevatedButton(
                onPressed: _useJovial, child: const Text('Use Jovial')),
            ElevatedButton(
                onPressed: _useFlutterSvg, child: const Text('Use Jovial')),
          ],
        ),
      ),
    );
  }
}
