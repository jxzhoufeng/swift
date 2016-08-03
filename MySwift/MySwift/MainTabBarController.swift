//
//  MainTabBarController.swift
//  MySwift
//
//  Created by 周峰 on 16/7/15.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        tabBar.barTintColor = UIColor(hexString: "000000", alpha: 0.3)
        
        addChildViewControllers(HomeViewController(), title: "首页", image: "Main")
        addChildViewControllers(FriendViewController(), title: "朋友", image: "Star");
        addChildViewControllers(SecondViewController(), title: "圈子", image: "Circle")
        
        let sb = UIStoryboard(name: "IMfriendsViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        addChildViewControllers(vc!, title: "信息", image: "Main")
    }
    
    func addChildViewControllers(childController: UIViewController, title: String, image: String) {
        childController.title = title
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.whiteColor()], forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blackColor()], forState: UIControlState.Selected)
        childController.tabBarItem.image = UIImage(named: image)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let nav = MainNavigationController(rootViewController: childController)
        addChildViewController(nav)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
