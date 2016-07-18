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
//        tabBar.barTintColor = UIColor(hexString: "06476d")
        addChildViewControllers(HomeViewController(), title: "首页")
        addChildViewControllers(SecondViewController(), title: "圈子")
    }
    
    func addChildViewControllers(childController: UIViewController, title: String) {
        childController.title = title
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
