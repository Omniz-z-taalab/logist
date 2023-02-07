// /* 
//   // STAGE_TYPE
//   'dev': "https://hodhod-dev-bk-coreserv01-development.azurewebsites.net/",
//   'qc': "https://hodhod-dev-bk-coreserv01-testing.azurewebsites.net/",
//   'stage': "https://hodhod-dev-bk-coreserv01-stage.azurewebsites.net/",
//   'prod': "https://hodhod-prod-bk-coreserv01.azurewebsites.net/",
// */

// enum Flavor { dev, test, stage, production }

// class EnvVariables {
//   EnvVariables._internal();
//   static EnvVariables? _instance;

//   Flavor flavor = Flavor.dev;
//   // static const String apiBaseDev = "http://20.56.169.181";
//   static const String apiBaseDev = "https://madar-02-dev-backend-development.azurewebsites.net";
//   static const String apiBaseTesting = "https://madar-02-dev-backend-testing.azurewebsites.net";
//   static const String apiBaseStage = "https://madar-02-dev-backend-development.azurewebsites.net";
//   static const String apiBaseProd = "https://madar-02-dev-backend-development.azurewebsites.net";
//   static const String stageType = String.fromEnvironment('env_type');
//   static const String _imageUrl = 'https://madarstorage.blob.core.windows.net/test1/test1/';

//   static void imageUrl(String? image) => image == null ? null : _imageUrl + image;

//   String apiBaseUrl = '';

//   static EnvVariables instance() {
//     _instance ??= EnvVariables._internal();

//     return _instance!;
//   }

//   void init() {
//     _setFlavor();
//   }

//   bool isProduction() => _instance!.flavor == Flavor.production;

//   bool isDevelopment() => _instance!.flavor == Flavor.dev;

//   bool isTesting() => _instance!.flavor == Flavor.test;

//   void _setFlavor() {
//     switch (stageType) {
//       case 'dev':
//         flavor = Flavor.dev;
//         apiBaseUrl = apiBaseDev;
//         break;
//       case 'prod':
//         flavor = Flavor.production;
//         apiBaseUrl = apiBaseProd;
//         break;
//       case 'test':
//         flavor = Flavor.test;
//         apiBaseUrl = apiBaseTesting;
//         break;
//       case 'stage':
//         flavor = Flavor.stage;
//         apiBaseUrl = apiBaseStage;
//         break;
//       default:
//         flavor = Flavor.dev;
//         apiBaseUrl = apiBaseDev;
//     }
//   }
// }
