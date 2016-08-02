//
//  BaseViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/7/15.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        navigationController!.navigationBar.translucent = false;
    }
    
    func enableOpenLeftDrawer(enable: Bool) {
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if enable {
            delegate.drawerController?.leftDrawerViewController = LeftViewController()
        }else {
            delegate.drawerController?.closeDrawerAnimated(true, completion: { (finish) in
                delegate.drawerController!.leftDrawerViewController = nil
            })
        }
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
