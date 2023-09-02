//
//  AppDelegate.swift
//  DynamicLoadingDemo
//
//  Created by Duy Quang Dao on 30/8/23.
//

import UIKit

@UIApplicationMain
class AppDelegate : UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
        -> Bool {
            if #available(iOS 13, *) {
                // do only pure app launch stuff, not interface stuff
            } else {
                self.window = UIWindow()
                let vc = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController()
                self.window!.rootViewController = vc
                self.window!.makeKeyAndVisible()
            }
            return true
    }
}

