import 'package:flutter/material.dart';

void main() {
  runApp(const PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final networkImages = [
    {'src': 'https://images.unsplash.com/photo-1495819903255-00fdfa38a8de', 'caption': 'Caption 1'},
    {'src': 'https://images.unsplash.com/photo-1495819903255-00fdfa38a8de', 'caption': 'Caption 2'},
    {'src': 'https://images.unsplash.com/photo-1495819903255-00fdfa38a8de', 'caption': 'Caption 3'},
    {'src': 'https://images.unsplash.com/photo-1495819903255-00fdfa38a8de', 'caption': 'Caption 4'},
    {'src': 'https://images.unsplash.com/photo-1495819903255-00fdfa38a8de', 'caption': 'Caption 5'},
    {'src': 'https://images.unsplash.com/photo-1495819903255-00fdfa38a8de', 'caption': 'Caption 6'},
  ];

  List<Map<String, String>> photos = [
    {
      'url': 'https://images.unsplash.com/photo-1495819903255-00fdfa38a8de',
      'title': 'Sample Photo 1',
      'description': 'Category 1',
    },
    {
      'url': 'https://images.unsplash.com/photo-1495819903255-00fdfa38a8de',
      'title': 'Sample Photo 2',
      'description': 'Category 2',
    },
    {
      'url': 'https://images.unsplash.com/photo-1495819903255-00fdfa38a8de',
      'title': 'Sample Photo 3',
      'description': 'Category 3',
    },
  ];

  infoSnackBar(BuildContext context, message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  CustomeAlertDialogue(BuildContext context, header, message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(header),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Center(
                child: Text(
                  'Welcome to My Photo Gallery!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
              ),
              itemCount: networkImages.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // This makes the splash transparent
                    shadowColor: Colors.transparent, // No shadow
                    padding: EdgeInsets.all(0), // Remove default padding
                  ),
                  onPressed: () {
                    infoSnackBar(context, 'Clicked on photo!');
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            networkImages[index]['src']!,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.black54,
                              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              child: Text(
                                networkImages[index]['caption']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: photos.length, // Use the length of your list
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(photos[index]['url']!, fit: BoxFit.cover, width: 50, height: 50),
                  title: Text(photos[index]['title']!), // Use the data from your list
                  subtitle: Text(photos[index]['description']!), // Use the data from your list
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          infoSnackBar(context, 'Photos Uploaded Successfully!');
        },
        child: Icon(Icons.cloud_upload),
      ),
    );
  }
}
