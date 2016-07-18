//
//  GoodsDetailViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/7/15.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class GoodsDetailViewController: BaseViewController {

    var isOpen: Bool?
    var urlString: String?
    var webView: UIWebView!
    var tipsLabel: UILabel!
    var tipsButton: UIButton!
    var goodsButton :UIButton!
    var goodsButton1 :UIButton!
    var goodsButton2 :UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "商品详情"
        isOpen = false
        // Do any additional setup after loading the view.
        webView = UIWebView()
        webView.loadRequest(NSURLRequest(URL: NSURL(string: urlString!)!))
        view.addSubview(webView)
        
        tipsLabel = UILabel()
        tipsLabel.text = "100年后开卖"
        tipsLabel.textAlignment = NSTextAlignment.Center
        tipsLabel.backgroundColor = UIColor.whiteColor()
        tipsLabel.font = UIFont.systemFontOfSize(14)
        view.addSubview(tipsLabel)
        
        tipsButton = createButton("点击查看巴拉巴拉")
        tipsButton.addTarget(self, action: #selector(GoodsDetailViewController.tipsButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        goodsButton = createButton("详情巴拉巴拉")
        
        goodsButton1 = createButton("详情巴拉巴拉")
        
        goodsButton2 = createButton("详情巴拉巴拉")
    }
    
    override func viewWillLayoutSubviews() {
        webView.frame = CGRectMake(0, 20, view.width, view.height-20)
        tipsLabel.frame = CGRectMake(0, 0, view.width, 20)
        if !isOpen! {
            tipsButton.frame = CGRectMake(0, tipsLabel.bottom, view.width, 40)
        }else {
            goodsButton.frame = CGRectMake(0, tipsLabel.bottom, view.width, 40)
            goodsButton1.frame = CGRectMake(0, goodsButton.bottom, view.width, 40)
            goodsButton2.frame = CGRectMake(0, goodsButton1.bottom, view.width, 40)
        }
    }
    
    func tipsButtonClick() {
        isOpen = true
        tipsButton.removeFromSuperview()
        viewWillLayoutSubviews()
    }
    
    func createButton(title: String) -> UIButton {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setTitle(title, forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.backgroundColor = UIColor(hexString: "ffffff", alpha: 0.6)
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        view.addSubview(btn)
        return btn
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
