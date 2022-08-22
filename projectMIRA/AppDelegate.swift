//
//  AppDelegate.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 28.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.isTranslucent = false
        navigationBarAppearance.clipsToBounds = false
        
        let titleTextAttributes: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.systemBlue]
        
        navigationBarAppearance.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.defaultPrompt)
        navigationBarAppearance.shadowImage = UIImage()
        navigationBarAppearance.shadowImage = UIImage()
        navigationBarAppearance.barTintColor = UIColor.white
        navigationBarAppearance.titleTextAttributes = titleTextAttributes
        navigationBarAppearance.tintColor = UIColor.systemBlue
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

