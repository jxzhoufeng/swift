//
//  SecondViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/7/15.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
//        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = CGRectMake(0, 0, view.width, view.height)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseId = "MainCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseId) as? SecondTableViewCell
        if cell == nil {
            cell = SecondTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: reuseId)
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
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
