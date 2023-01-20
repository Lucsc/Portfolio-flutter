import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Components/sidebar.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      backgroundColor: const Color.fromARGB(255, 53, 0, 62),
      body: Stack(
        children: [
          IconButton(
              icon: const Icon(Icons.menu,
                  color: Color.fromARGB(255, 2, 229, 254), size: 30.0),
              onPressed: () => _scaffold.currentState!.openDrawer()),
          Center(
            child: Column(
              children: [
              Expanded (
                child : Column (
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children : [
                  // const SizedBox(height: 220),
                  const Text('Hello, I am Luc Schmitt',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  student(),
                  const SizedBox(height: 20),
                  ],
                )),
              Expanded (
                  child : Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DownloadCv(
                        state: DownloadCvState.notDownloaded,
                        onDownload: () {},
                        onStopDownload: () {},
                        onOpen: () {},
                      ),
                      const SizedBox(width: 10),
                      contactMe(context),
                      
                    ],
                  )
                ),
              ],
             
            ),
          ),
        ],
      ),
      drawer: const Sidebar(),
    );
  }
}

Widget student() {
  return Container(
    width: 380,
    height: 150,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 2, 229, 254),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.school, color: Color.fromARGB(255, 53, 0, 62), size: 50),
        Text('Student in 3rd Year at Epitech Paris',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        Text('Bachelor\'s degree in Computer Science',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ],
    ),
  );
}

enum DownloadCvState {
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded
}

class DownloadCv extends StatelessWidget {
  const DownloadCv(
      {super.key,
      required this.state,
      this.duration = const Duration(milliseconds: 500),
      required this.onDownload,
      required this.onStopDownload,
      required this.onOpen,
      this.downloadProgress = 0.0});

  final DownloadCvState state;
  final Duration duration;
  final VoidCallback onDownload;
  final VoidCallback onStopDownload;
  final VoidCallback onOpen;
  final double downloadProgress;

  bool get isDownloaded => state == DownloadCvState.downloaded;
  bool get isDownloading => state == DownloadCvState.downloading;
  bool get isFetchingDownload => state == DownloadCvState.fetchingDownload;

  void _onPressed() {
    switch (state) {
      case DownloadCvState.notDownloaded:
        onDownload();
        break;
      case DownloadCvState.fetchingDownload:
        break;
      case DownloadCvState.downloading:
        onStopDownload();
        break;
      case DownloadCvState.downloaded:
        onOpen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onPressed,
        child: Stack(children: [
          ButtonShapeWidget(
            isDownloading: isDownloading,
            isDownloaded: isDownloaded,
            isFetchingDownload: isFetchingDownload,
            duration: duration,
          ),
          Positioned.fill(
              child: AnimatedOpacity(
                  duration: duration,
                  opacity: isDownloading || isFetchingDownload ? 1 : 0,
                  curve: Curves.ease,
                  child: Stack(alignment: Alignment.center, children: [
                    ProgressIndicatorWidget(
                      isDownloading: isDownloading,
                      isFetching: isFetchingDownload,
                      downloadProgress: downloadProgress,
                    ),
                    if (isDownloading)
                      const Icon(
                        Icons.stop,
                        size: 14.0,
                        color: CupertinoColors.activeBlue,
                      )
                  ])))
        ]));
  }
}

class ButtonShapeWidget extends StatelessWidget {
  const ButtonShapeWidget(
      {super.key,
      required this.isDownloading,
      required this.isDownloaded,
      required this.isFetchingDownload,
      required this.duration});

  final bool isDownloading;
  final bool isDownloaded;
  final bool isFetchingDownload;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    var shape = const ShapeDecoration(
      shape: StadiumBorder(),
      color: CupertinoColors.lightBackgroundGray,
    );

    if (isDownloading || isFetchingDownload) {
      shape = ShapeDecoration(
        shape: const CircleBorder(),
        color: Colors.white.withOpacity(0.0),
      );
    }
    return AnimatedContainer(
      duration: duration,
      curve: Curves.ease,
      width: 150,
      height : 50,
      decoration: shape,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: AnimatedOpacity(
              duration: duration,
              opacity: isDownloading || isFetchingDownload ? 0 : 1,
              curve: Curves.ease,
              child: Text(isDownloaded ? 'OPEN CV' : 'Download CV',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.button?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.activeBlue,
                        fontSize: 20,
                      )))),
    );
  }
}

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget(
      {super.key,
      required this.downloadProgress,
      required this.isDownloading,
      required this.isFetching});

  final double downloadProgress;
  final bool isDownloading;
  final bool isFetching;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: downloadProgress),
          duration: const Duration(milliseconds: 200),
          builder: (context, progress, child) {
            return CircularProgressIndicator(
              backgroundColor: isDownloading
                  ? CupertinoColors.lightBackgroundGray
                  : Colors.white.withOpacity(0),
              valueColor: AlwaysStoppedAnimation(isFetching
                  ? CupertinoColors.lightBackgroundGray
                  : CupertinoColors.activeBlue),
              strokeWidth: 2,
              value: isFetching ? null : progress,
            );
          },
        ));
  }
}

Widget contactMe(BuildContext context) {
  return Container(
    width: 150,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed:  () =>
          Navigator.of(context).pushNamed('/contact'),
          child: const Text('Contact me',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ],
    ),
  );
}