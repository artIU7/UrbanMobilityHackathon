//
//  AppDelegate.swift
//  transport_reality_app
//
//  Created by Артем Стратиенко on 16.04.2021.
//

import UIKit
import NMAKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let credentials = (
                          appId: "KKo6UCgA4Z8alSgWjAkV",
                          appCode: "_tBymmu0CW1i3TvQgmz_hg",
                          licenseKey: "QOko/yAcCh6xKKsBmmbiyzGYDBRNMxCgFbwj+WdxEyhUZ2zJ/qTNjA/jmPrT23P0mlj5bgi/MoFEcZXuRGhN9WzKIcGnDXO3MBUk1N6b/EkA4LtPp3NQxSbevTYZlMpnyA4kf/jE+U6lYmpo/LoH/rgm34tLK5SvePTMR0Sn2y1Ph7DvtqkgLH9PYWwaM46g+iubSz+adzdK5r7GY8d/neYg72FZqzvTk+xeGsId5UeM2FGimpHYGQ1zIQ5OCwpz7F2cT1l3QzyU35bS/Hs3colxOndHoggcap5BoYv5xQ2jq/D/Sc5Mk9jiR8WMeME9zyKLh8VybBH5yO1iN+RYVix3/KuUuPQfoZx28X43ICpA388n/eUQ7fLyDHw1r8mUQ3+Xf//hUN/04Ep357XzY2c/cAUN+JaskGRf4vnblpbMC4fSR560Cb5fkaxExPj9KvYkNRIcZm37/KtuR1ZAoJOf42ObcgRcm6zfQzCd8P5H57xNQH2at3DHNe5KzZ9ijMhZuYcbS8GuacV6kTeK1mHpue+wA2/TDJk3tNxxHv7X6/0GmUFwX6qqzUBLWK7TUko8oDZ75uA2iyVqH7yznab9926nknDpCCimubQ/OqASAbfTD0AwJhtIsKQwdqhylX7FxxGb4iP3JJitofZAvJ8lSDvlfwRu1p2yOtE8YGs="
                      )


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        NMAApplicationContext.setAppId(credentials.appId,
                                       appCode: credentials.appCode,
                                       licenseKey: credentials.licenseKey)
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

