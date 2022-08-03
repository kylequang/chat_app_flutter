import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: Colors.red,
            child: IconButton(
              icon: const Icon(Icons.arrow_left),
              onPressed: () {},
            ),
          ),
        ),
        title: const Text(
          'Contact Us',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(70),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Image.asset(
                        'assets/images/empty_data.jpg',
                        height: 300,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contact us if you need help with your order',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ausstralia'),
                  const Text('10-12 spencer St'),
                  const Text('111111111111'),
                  const SizedBox(height: 16),
                  const Text('cheeepizza@gmail.com'),
                  const Text('123456789'),
                  const SizedBox(height: 16),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Your question is...',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        maxLines: 5,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                          onPressed: () {
                            showDialogOrder(context);
                          },
                          child: const Text('Send'))
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDialogOrder(BuildContext context) {
    print('show dialog');
    showDialog<String>(
      // useSafeArea: false,
      context: context,
      builder: (BuildContext context) => Column(
        children: [
          AlertDialog(
            contentPadding: EdgeInsets.all(0),
            insetPadding: EdgeInsets.all(0),
            content: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/banner.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      child: Image.asset('assets/images/coca_logo.png'),
                    ),
                  ],
                ),
                GridView.count(
                    crossAxisCount: 9,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.all(4.0),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    children: <String>[
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                      'http://www.for-example.org/img/main/forexamplelogo.png',
                    ].map((String url) {
                      return GridTile(
                          child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: 12.0,
                        height: 12.0,
                      ));
                    }).toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
