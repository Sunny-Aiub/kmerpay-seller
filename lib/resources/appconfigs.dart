
import 'dart:io';

import 'package:get/get.dart';

import 'constants.dart';

class AppConfigs {
  static String currentLocation = VariableConstant.currentLocationString;
  static String accessToken = "";
  static String serviceType = ServiceType.delivery.name;
  static var statusTitle = StatusType.Online.name.obs;

  static var isLoggedIn = true;

  static clearAppData() {

    accessToken = '';

  }
}

enum ServiceType { delivery, pickup }
enum StatusType { Online, Offline }

enum ExploreMoreMenu {
  safetyStandard,
  aboutUs,
  cares,
  media,
  catering,
  loyalty,
  blog,
  dineIn
}

// final exploreMoreMenuValues = EnumValues({
//   "safety-standard": ExploreMoreMenu.safetyStandard,
//   "about-us": ExploreMoreMenu.aboutUs,
//   "cares": ExploreMoreMenu.cares,
//   "media": ExploreMoreMenu.media,
//   "catering": ExploreMoreMenu.catering,
//   "loyalty": ExploreMoreMenu.loyalty,
//   "blog": ExploreMoreMenu.blog,
//   "dineIn": ExploreMoreMenu.dineIn
// });

extension ExploreMoreMenuExtension on ExploreMoreMenu {
  String get name {
    return ["safety-standard",
      "about-us",
      "cares",
      "media" ,
      "catering" ,
      "loyalty" ,
      "blog" ,
      "dineIn" ][index];
  }
}
class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

/**
 * Microservice Architecture implementation
 * Modified Signing Process For Buyers
 * Deployment in AWS for both Frontend and Backend
 * API development for Admin and Seller
 * Frontend API integration for Admin
 * Frontend Authentication API integration for Seller
 * Mobile app design for Seller
 */
