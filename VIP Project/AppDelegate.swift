//
//  AppDelegate.swift
//  VIP Project
//
//  Created by Victor on 21/08/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let baseApp = BaseApp()
    var window: UIWindow?
    
    /// A global variable used
    /// to determine if the app is running the tests.
    var isRunningUnitTests: Bool {
        let environment = ProcessInfo.processInfo.environment
        if environment["APP_IS_RUNNING_TEST"] == "YES" {
            return true
        } else { return false }
    }
    
    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            if !isRunningUnitTests {
                window = UIWindow(frame: UIScreen.main.bounds)
                window?.makeKeyAndVisible()
                baseApp.prepare()
            }
            return true
        }
}

