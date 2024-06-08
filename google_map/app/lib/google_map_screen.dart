// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:animated_expandable_fab/animated_expandable_fab.dart';

// class GoogleMapScreen extends StatefulWidget {
//   const GoogleMapScreen({super.key});

//   @override
//   State<GoogleMapScreen> createState() => _GoogleMapScreenState();
// }

// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   late CameraPosition initCameraPosition;
//   late GoogleMapController? mapController;
//   Set<Marker> markers = {
//     const Marker(
//       markerId: MarkerId("marker.1"),
//       position: LatLng(30.356954, 30.530255),
//     ),
//   };

//   @override
//   void initState() {
//     initCameraPosition = const CameraPosition(
//       target: LatLng(30.356954, 30.530255),
//       zoom: 12,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     mapController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Google Map",
//           style: Theme.of(context).textTheme.headlineMedium,
//         ),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: initCameraPosition,
//         // markers: markers,
//         //! Set the controller
//         onMapCreated: (controller) {
//           mapController = controller;
//           // initMapStyle();
//         },
//       ),
//       floatingActionButton: ExpandableFab(
//         distance: 100,
//         openIcon: const Icon(Icons.my_location),
//         closeIcon: const Icon(Icons.close, color: Color(0xffe51449)),
//         closeBackgroundColor: const Color(0xfffefefe),
//         children: [
//           ActionButton(
//             color: const Color(0xffe51449),
//             icon: const Icon(Icons.pin_drop),
//             onPressed: () {
//               debugPrint("Go to Banha");
//               mapController!.animateCamera(
//                 CameraUpdate.newLatLng(const LatLng(30.4564, 31.1842)),
//               );
//               setState(() {});
//             },
//             text: const Text("Banha "),
//           ),
//           ActionButton(
//               color: const Color(0xffe51449),
//               text: const Text("Cairo "),
//               icon: const Icon(Icons.pin_drop),
//               onPressed: () {
//                 debugPrint("Go to Cairo");
//                 mapController!.animateCamera(
//                   CameraUpdate.newLatLng(const LatLng(30.0444, 31.2357)),
//                 );
//                 setState(() {});
//               }),
//           ActionButton(
//               color: const Color(0xffe51449),
//               text: const Text("Alex "),
//               icon: const Icon(Icons.pin_drop),
//               onPressed: () {
//                 debugPrint("Go to Alex");
//                 mapController!.animateCamera(
//                   CameraUpdate.newLatLng(const LatLng(31.2001, 29.9187)),
//                 );
//                 setState(() {});
//               }),
//         ],
//       ),
//       // const AppFloatingActionButton(),
//     );
//   }
// }

import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  //! only initial camera position
  late CameraPosition initCameraPosition;
  late GoogleMapController? mapController;

  @override
  void initState() {
    initCameraPosition = const CameraPosition(
      target: LatLng(30.356954, 30.530255),
      zoom: 12,
    );
    super.initState();
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  int currentCity = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) => CityWidget(
                    text: latLngGovernorateOfEgypt[index]["name"],
                    isClicked: index == currentCity,
                    onTap: () {
                      currentCity = index;
                      mapController!.animateCamera(
                        CameraUpdate.newLatLng(
                          LatLng(
                            latLngGovernorateOfEgypt[index]["latitude"],
                            latLngGovernorateOfEgypt[index]["longitude"],
                          ),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemCount: 10,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: GoogleMap(
                    //! Set the type of map
                    // mapType: MapType.hybrid,
                    //! Set the controller
                    onMapCreated: (controller) {
                      mapController = controller;
                      initMapStyle();
                    },
                    //! Set the initial camera position
                    initialCameraPosition: initCameraPosition,

                    //! Sets a frame for a specific area within the map
                    // cameraTargetBounds: CameraTargetBounds(
                    //   LatLngBounds(
                    //     southwest: const LatLng(30.325861, 30.524547),
                    //     northeast: const LatLng(30.500847, 30.536670),
                    //   ),
                    // ),
                  ),
                ),
              ),
              /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              mapController!.animateCamera(
                                CameraUpdate.newLatLng(
                                  const LatLng(30.046396, 31.224839),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text('Cairo'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              mapController!.animateCamera(
                                CameraUpdate.newLatLng(
                                  const LatLng(31.201009, 29.914291),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text('Alexandria'),
                      ),
                    ]),
              )*/
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initMapStyle() async {
    var mapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/retro_style.json');
    mapController!.setMapStyle(mapStyle);
  }
}

class CityWidget extends StatelessWidget {
  const CityWidget({
    super.key,
    required this.text,
    this.onTap,
    this.isClicked = false,
  });
  final String text;
  final void Function()? onTap;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isClicked ? const Color(0xff0085FF) : const Color(0xffF2F2F7),
        ),
        padding: const EdgeInsets.all(12),
        child: Text(text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color:
                  isClicked ? const Color(0xffFFFFFF) : const Color(0xff61676C),
            )
            // realTime
            //     ? AppStyles.font15DarkGrayRegular.copyWith(color: AppColors.white)
            //     : AppStyles.font15DarkGrayRegular,
            ),
      ),
    );
  }
}



//! we can change map style using 
//? https://snazzymaps.com/explore?sort=recent
//? https://stylist.atlist.com/
//? https://console.cloud.google.com/google/maps-apis/studio/styles