//
//  CommentViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/7/27.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

let labelFont: CGFloat = 14

class CommentViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var commentArr: [String] = [String]()
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "查看所有评论"
        view.backgroundColor = UIColor.blackColor()
        
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tableView.backgroundColor = UIColor.blackColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = CGRectMake(0, 0, view.width, view.height)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseId = "commentCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseId)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: reuseId)
        }
        cell?.textLabel?.text = commentArr[indexPath.row]
        cell?.textLabel?.textColor = UIColor.whiteColor()
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.font = UIFont.systemFontOfSize(labelFont)
        cell?.backgroundColor = UIColor.blackColor()
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let size = commentArr[indexPath.row].size(UIFont.systemFontOfSize(labelFont), constrainedToSize: CGSizeMake(screenWidth-20, CGFloat(MAXFLOAT)))
        return size.height+10
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
