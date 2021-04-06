import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:CDCourtServices/screens/profile.dart';
import 'package:CDCourtServices/services/location_service.dart';
import 'package:CDCourtServices/models/Location.dart';

class LocationsView extends StatefulWidget {
  @override
  _LocationsViewState createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  LocationService locationService;
  List<Location> _allLocations = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    locationService = Provider.of<LocationService>(context, listen: false);
    _getLocationList();
  }

  void _getLocationList() async {
    setState(() {
      _isLoading = true;
    });
    locationService.getAllLocations().then((value) {
      setState(() {
        _allLocations = value;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Locations'),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/dummy-profile.png'),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
        ],
      ),
      body: Container(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : new ListView.builder(
                itemCount: _allLocations.length,
                padding: EdgeInsets.all(10.0),
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.home_work_rounded,
                            size: 40.0,
                            color: Colors.blue,
                          ),
                          title: Text(_allLocations[index].name),
                          subtitle: Text(_allLocations[index].address),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                          onTap: () async {
                            MapsLauncher.launchQuery(
                                _allLocations[index].address);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
