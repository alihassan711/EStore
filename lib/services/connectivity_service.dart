// // import 'dart:async';
// // import 'package:connectivity/connectivity.dart';
// // import '../constants/enums/connectivity_status.dart';
// // class ConnectivityService {
// //   // Create our public controller
// //   StreamController<ConnectivityStatus> connectionStatusController = StreamController<ConnectivityStatus>();
// //   ConnectivityService() {
// //     // Subscribe to the connectivity Chanaged Steam
// //     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
// //       // Use Connectivity() here to gather more info if you need t
// //       connectionStatusController.add(_getStatusFromResult(result));
// //     });
// //   }
// //   // Convert from the third part enum to our own enum
// //   ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
// //     switch (result) {
// //       case ConnectivityResult.mobile:
// //         return ConnectivityStatus.Cellular;
// //       case ConnectivityResult.wifi:
// //         return ConnectivityStatus.WiFi;
// //       case ConnectivityResult.none:
// //         return ConnectivityStatus.Offline;
// //       default:
// //         return ConnectivityStatus.Offline;
// //     }
// //   }
// // }
// import 'package:estore/model/getx_networkmanager_class.dart';
// import 'package:get/get.dart';
//
// class NetworkBinding extends Bindings{
//
//   // dependence injection attach our class.
//   @override
//   void dependencies() {
//     // TODO: implement dependencies
//     Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
//   }
//
// }