//
//  SceneDelegate.swift
//  DynamicLoadingDemo
//
//  Created by Duy Quang Dao on 30/8/23.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window : UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            let vc = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController()
            self.window!.rootViewController = vc
            self.window!.makeKeyAndVisible()
        }
    }
}
   
