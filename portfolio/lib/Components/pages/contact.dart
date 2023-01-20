import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/Components/sidebar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  ContactMe({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffold,
        backgroundColor: const Color.fromARGB(255, 53, 0, 62),
        body: Stack(
          children: [
            IconButton(
                icon: const Icon(Icons.menu,
                    color: Color.fromARGB(255, 2, 229, 254), size: 30.0),
                onPressed: () => _scaffold.currentState!.openDrawer()),
            Column(
              children: [
                Expanded(
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                      const SizedBox(height: 20),
                      const Text('Get in Touch !',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      const Text(
                          'Contact me for hiring, freelance or internship.',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // imageButton('https://cdn4.iconfinder.com/data/icons/iconsimple-logotypes/512/github-512.png'),
                            imageButton(
                                'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                                'https://github.com/Lucsc'),
                            const SizedBox(width: 10),
                            imageButton(
                                'https://cdn-icons-png.flaticon.com/512/4096/4096262.png',
                                'https://www.instagram.com/luc__sc/'),
                            const SizedBox(width: 10),
                            imageButton(
                                'https://cdn-icons-png.flaticon.com/512/1384/1384014.png',
                                'https://www.linkedin.com/in/luc-schmitt-24708b20a/'),
                          ]),
                    ]))),
              ],
            ),
            Center(
                child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Contact me',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          nameField(),
                          const SizedBox(height: 20),
                          emailField(),
                          const SizedBox(height: 20),
                          objectField(),
                          const SizedBox(height: 20),
                          messageField(),
                          const SizedBox(height: 20),
                          sendEmail(formKey, context)
                        ])))
          ],
        ),
        drawer: const Sidebar(),
      );
}

Widget nameField() => SizedBox(
      width: 250,
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
          // LengthLimitingTextInputFormatter(20)
        ],
        decoration: const InputDecoration(
          labelText: 'Your name',
          hintText: 'Enter your name',
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
      ),
    );

Widget emailField() => SizedBox(
      width: 250,
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z-@.-123456789 ]')),
          // LengthLimitingTextInputFormatter(20)
        ],
        decoration: const InputDecoration(
          labelText: 'Your email',
          hintText: 'Enter your email',
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          if (!value.contains('@') || !value.contains('.')) {
            return 'Please enter a valid email';
          }
          return null;
        },
      ),
    );

Widget objectField() => SizedBox(
      width: 250,
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Object',
          hintText: 'Enter the object of your message',
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the object of your message';
          }
          return null;
        },
      ),
    );

Widget messageField() => SizedBox(
      width: 250,
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(500)],
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(
          labelText: 'Message',
          hintText: 'Enter your message',
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your message';
          }
          return null;
        },
      ),
    );

Widget sendEmail(GlobalKey<FormState> formKey, BuildContext context) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 2, 229, 254),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // print('Email sent');
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Email sent')));
        }
      },
      child: const Text('Send Message',
          style: TextStyle(color: Color.fromARGB(255, 53, 0, 62))),
    );

Widget imageButton(String imageLink, String urlLink) {
  var url = Uri.parse(urlLink);
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 2, 229, 254),
      shape: const CircleBorder(side: BorderSide(color: Colors.transparent)),
    ),
    onPressed: () async {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $urlLink';
      }
    },
    child: Image.network(imageLink, width: 50, height: 50, fit: BoxFit.cover),
  );
}
