import 'package:geolocator/geolocator.dart';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/AccountManagement/Model/company_information.dart';
import 'package:http/http.dart' as http;

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.

//https://finalyearproject20221212223004.azurewebsites.net/api/companyapi

class determinePositionState {
  static Future<List<Company>?> getCompanyData() async {
    List<Company> company = [];

    var url = Uri.parse(
        'https://finalyearproject20221212223004.azurewebsites.net/api/companyapi');
    // var response = await http.put(url,
    var response = await http.get(url);

    if (response.statusCode == 200) {
      String infoString = response.body;
      infoString = infoString.substring(2, infoString.length - 2);
      List<String> infoList;
      infoList = infoString.split("\",\"");

      for (var element in infoList) {
        List<String> retrievedData = element.split(",");
        int i = -1;
        Company companyModel = new Company();

        companyModel.company_id = retrievedData[++i];
        if (userModel.parentCompany == companyModel.company_name) {
          companyModel.company_name = retrievedData[++i];
          companyModel.current_admin = retrievedData[++i];
          companyModel.address = retrievedData[++i];
          companyModel.longitude = retrievedData[++i];
          companyModel.latitude = retrievedData[++i];
          company.add(companyModel);
        }
      }
      return company;
    }
    return null;
  }

  //Call API to retrieve radius
  static double setRadius = 110;
  static double distance = 100;
  static double companyLatitude = 3.217215;
  static double companyLongitude = 101.727817;

  static Future<String?> determinePosition() async {
    List<Company>? companyInfo = await getCompanyData();
    if (companyInfo != null) {
      for (int i = 0; i < companyInfo.length; i++) {
        companyLatitude = double.parse(companyInfo[i].latitude!);
        companyLongitude = double.parse(companyInfo[i].longitude!);
      }
    }
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();
    print(position.toString());

//position.latitude and position.longitude is USER CURRENT POSITION
//end is company location
//if distanceBetween < specified radius in METER, attendance can be taken
    distance = distanceBetween(position.latitude, position.longitude,
        companyLatitude, companyLongitude);
    print(distanceBetween(position.latitude, position.longitude,
            companyLatitude, companyLongitude)
        .toDouble());
    return distance.toString();
  }

  static bool validPosition() {
    if (distance <= setRadius) {
      return true;
    } else
      return false;
  }

  /// Calculates the distance between the supplied coordinates in meters.
  /// The distance between the coordinates is calculated using the Haversine
  /// formula (see https://en.wikipedia.org/wiki/Haversine_formula). The
  /// supplied coordinates [startLatitude], [startLongitude], [endLatitude] and
  /// [endLongitude] should be supplied in degrees.
  /// return value is METER
  static double distanceBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) =>
      GeolocatorPlatform.instance.distanceBetween(
        startLatitude,
        startLongitude,
        endLatitude,
        endLongitude,
      );
}
