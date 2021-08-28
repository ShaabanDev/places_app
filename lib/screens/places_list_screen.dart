import 'package:flutter/material.dart';
import 'package:places_app/providers/place_provider.dart';
import 'package:places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListCreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              child: Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<PlacesProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<PlacesProvider>(
                    child: Center(child: const Text('No places added !')),
                    builder: (ctx, placeData, ch) => placeData.items.length <= 0
                        ? ch!
                        : ListView.builder(
                            itemCount: placeData.items.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(placeData.items[i].image),
                              ),
                              title: Text(placeData.items[i].title),
                              onTap: () {},
                            ),
                          ),
                  ),
      ),
    );
  }
}
