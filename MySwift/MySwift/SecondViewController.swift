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
    var statusFrameArray:[StatusFrame] = [StatusFrame]()
    var headerImageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView.tableHeaderView = tableHeaderView()
//        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        view.addSubview(tableView)
        
        for i in 0..<5 {
            var statusDict = [String:AnyObject]()
            statusDict["iconImage"] = "Album\(i).jpg"
            switch i {
            case 0:
                statusDict["name"] = "么么么"
                statusDict["status"] = "阿萨德法师打发斯蒂芬阿斯f"
                statusDict["time"] = "刚刚"
                statusDict["from"] = "来自 iPhone8s"
            case 1:
                statusDict["name"] = "啪啪啪"
                statusDict["status"] = "阿萨德法师打发斯蒂芬阿斯顿发斯蒂芬阿阿斯顿发送到"
                statusDict["photo"] = "Album1.jpg"
                statusDict["time"] = "刚刚"
                statusDict["from"] = "来自 iPhone5s"
            case 2:
                statusDict["name"] = "哒哒哒"
                statusDict["status"] = "阿萨德法师打发斯蒂芬啊爱疯ssfasdfas撒发生的发生的分阿斯顿发斯蒂芬阿斯蒂芬阿萨德爱疯阿萨德法师打发斯蒂芬啊爱疯ssfasdfas撒发生的发生的分阿斯顿发斯蒂芬阿斯蒂芬阿萨德爱疯f阿萨德法师打发斯蒂芬啊爱疯ssfasdfas撒发生的发生的分阿斯顿发斯蒂芬阿斯蒂芬阿萨德爱疯f阿萨德法师打发斯蒂芬啊爱疯ssfasdfas撒发生的发生的分阿斯顿发斯蒂芬阿斯蒂芬阿萨德爱疯ff"
                statusDict["time"] = "1分钟前"
                statusDict["from"] = "来自 iPhone4s"
            case 3:
                statusDict["name"] = "噗噗噗"
                statusDict["status"] = "阿萨德法师打发斯蒂芬阿斯顿发斯蒂芬阿斯蒂芬啊爱疯sdfsadfsdadf"
                statusDict["photo"] = "Album3.jpg"
                statusDict["time"] = "1分钟前"
                statusDict["from"] = "来自 iPhone8s"
            default:
                statusDict["name"] = "哈哈哈"
                statusDict["status"] = "阿萨德法师打发斯蒂芬阿dadf"
                statusDict["photo"] = "Album5.jpg"
                statusDict["time"] = "2分钟前"
                statusDict["from"] = "来自 iPhone100s"
            }
            let status = Status(dict: statusDict)
            let statusFrame = StatusFrame()
            statusFrame.status = status
            statusFrameArray.append(statusFrame)
        }
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = CGRectMake(0, 0, view.width, view.height)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusFrameArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseId = "MainCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseId) as? SecondTableViewCell
        if cell == nil {
            cell = SecondTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: reuseId)
        }
        cell?.statusFrame = statusFrameArray[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return statusFrameArray[indexPath.row].cellHeight!
    }
    
    func tableHeaderView() -> UIImageView {
        headerImageView = UIImageView()
        headerImageView!.image = UIImage(named: "123")
        headerImageView!.frame = CGRectMake(0, 0, 100, 200)
        
        let iconView = UIImageView()
        iconView.image = UIImage(named: "111");
        headerImageView?.addSubview(iconView)
        iconView.frame = CGRectMake(margin, 100, 75, 75)
        iconView.layer.cornerRadius = iconView.width/2
        return headerImageView!
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
