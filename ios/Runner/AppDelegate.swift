import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
           GMSServices.provideAPIKey("AIzaSyC6pbtcBe5CI5MtcE8ZVN7MEWgj4Cj6IqM")
           GeneratedPluginRegistrant.register(with: self)
           return super.application(application, didFinishLaunchingWithOptions: launchOptions)
         }
}
