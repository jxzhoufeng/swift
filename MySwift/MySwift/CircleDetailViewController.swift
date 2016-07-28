//
//  CircleDetailViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/7/28.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class CircleDetailViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView!
    var iconString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()

        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.blackColor()
        tableView.separatorStyle = .None
        let heaerView = CircleHeaderView()
        heaerView.iconString = self.iconString
        tableView.tableHeaderView = heaerView
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = CGRectMake(0, 0, view.width, view.height)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseId = "circleCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseId) as? CircleTableViewCell
        if cell == nil {
            cell = CircleTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: reuseId)
        }
        cell?.selectionStyle = .None
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 240
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
