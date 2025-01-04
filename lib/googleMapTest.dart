// location_picker.dart
import 'dart:async';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationPickerController extends GetxController {
  Completer<GoogleMapController> mapController = Completer();
  final markers = <Marker>[].obs;
  final isLoading = true.obs;

  late CameraPosition initialPosition;
  double? selectedLat;
  double? selectedLng;

  @override
  void onInit() {
    super.onInit();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    try {
      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar('Error', 'Location permissions are denied');
          return;
        }
      }

      // Get current location
      Position position = await Geolocator.getCurrentPosition();
      initialPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15,
      );

      // Add initial marker
      _addMarker(LatLng(position.latitude, position.longitude));

      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', 'Failed to get location: $e');
      isLoading.value = false;
    }
  }

  void _addMarker(LatLng position) {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('selected_location'),
        position: position,
        draggable: true,
        onDragEnd: (newPosition) {
          selectedLat = newPosition.latitude;
          selectedLng = newPosition.longitude;
        },
      ),
    );
    selectedLat = position.latitude;
    selectedLng = position.longitude;
  }

  void onMapTap(LatLng position) {
    _addMarker(position);
  }

  void confirmLocation() {
    if (selectedLat != null && selectedLng != null) {
      Get.back(result: {
        'latitude': selectedLat,
        'longitude': selectedLng,
      });
    } else {
      Get.snackbar('Error', 'Please select a location first');
    }
  }
}

class LocationPicker extends StatelessWidget {
  const LocationPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocationPickerController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر موقع التوصيل'),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: controller._initializeLocation,
          ),
        ],
      ),
      body: Obx(
            () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Stack(
          children: [
            GoogleMap(
              initialCameraPosition: controller.initialPosition,
              markers: Set.from(controller.markers),
              onMapCreated: (GoogleMapController mapController) {
                controller.mapController.complete(mapController);
              },
              onTap: controller.onMapTap,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: controller.confirmLocation,
                child: const Text(
                  'تأكيد الموقع',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:e_commerce_app/core/services/services.dart';
 // import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationPicker extends StatefulWidget {
//   final Function(LatLng location, String address) onLocationSelected;
//
//   LocationPicker({required this.onLocationSelected});
//
//   @override
//   _LocationPickerState createState() => _LocationPickerState();
// }
//
// class _LocationPickerState extends State<LocationPicker> {
//   LatLng? _selectedLocation;
//   final MapController _mapController = MapController();
//   bool _isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   Future<void> _getCurrentLocation() async {
//     setState(() => _isLoading = true);
//     try {
//       // التحقق من أذونات الموقع
//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//       }
//
//       if (permission == LocationPermission.whileInUse ||
//           permission == LocationPermission.always) {
//         // الحصول على الموقع الحالي
//         Position position = await Geolocator.getCurrentPosition();
//         setState(() {
//           _selectedLocation = LatLng(position.latitude, position.longitude);
//           _mapController.move(_selectedLocation!, 15);
//         });
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('حدث خطأ في تحديد موقعك. حاول مرة أخرى')),
//       );
//     }
//     setState(() => _isLoading = false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('حدد موقع التوصيل'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.my_location),
//             onPressed: _getCurrentLocation,
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           FlutterMap(
//             mapController: _mapController,
//             options: MapOptions(
//             //  center: _selectedLocation ?? LatLng(30.0444, 31.2357),
//               maxZoom: 15.0,
//               onTap: (tapPosition, latLng) {
//                 setState(() => _selectedLocation = latLng);
//               },
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                 userAgentPackageName: 'com.example.app',
//               ),
//               if (_selectedLocation != null)
//                 MarkerLayer(
//                   markers: [
//                     Marker(
//                       point: _selectedLocation!,
//                       width: 80,
//                       height: 80,
//                       child:  Icon(
//                         Icons.location_pin,
//                         color: Colors.red,
//                         size: 40,
//                       ),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//           if (_isLoading)
//             Center(child: CircularProgressIndicator()),
//           Positioned(
//             bottom: 16,
//             left: 16,
//             right: 16,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               onPressed: _selectedLocation == null
//                   ? null
//                   : () {
//                 // هنا يمكنك إضافة كود للحصول على العنوان من الإحداثيات
//                 widget.onLocationSelected(
//                   _selectedLocation!,
//                   "العنوان المحدد", // يمكنك استخدام خدمة Geocoding للحصول على العنوان الفعلي
//                 );
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 'تأكيد الموقع',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }