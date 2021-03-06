//
//  AppDelegate.swift
//  MySwift
//
//  Created by 周峰 on 16/7/11.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit
import MMDrawerController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var drawerController: MMDrawerController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let options = EMOptions(appkey: "zzzgff#imtest")
        EMClient.sharedClient().initializeSDKWithOptions(options)
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let leftVc = LeftViewController();
        let centerVc = MainTabBarController()
        drawerController = MMDrawerController(centerViewController: centerVc, leftDrawerViewController: leftVc)
        drawerController?.showsShadow = false;
        drawerController?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.All
        drawerController?.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.All
        drawerController?.maximumLeftDrawerWidth = screenWidth*0.7
        drawerController?.setDrawerVisualStateBlock { (drawerController, drawerSide, percentVisible) -> Void in
            
            var sideDrawerViewController:UIViewController?
            if(drawerSide == MMDrawerSide.Left){
                sideDrawerViewController = drawerController.leftDrawerViewController;
            }
            sideDrawerViewController?.view.alpha = percentVisible
        }
        window?.rootViewController = drawerController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        EMClient.sharedClient().applicationDidEnterBackground(application)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        EMClient.sharedClient().applicationWillEnterForeground(application)
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

