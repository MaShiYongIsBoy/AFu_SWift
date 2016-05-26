//
//  ArtictleViewController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/15.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ArtictleViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    /// 根据id来判断是那条数据
    var sid:Int?
    /// 菊花
    var MBProgress:MBProgressHUD?
    override func viewDidLoad() {
        super.viewDidLoad()
        MBProgress       = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        MBProgress?.show(true)
        let webUrl       = "http://app.city-base.net/view.php?id=\(sid!)"
        myWebView.opaque = true
        myWebView.backgroundColor = UIColor.whiteColor()
        myWebView.loadRequest(NSURLRequest(URL: NSURL(string: webUrl)!))
    }
    
    @IBAction func back_Button(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}

extension ArtictleViewController:UIWebViewDelegate{
    
    func webViewDidStartLoad(webView: UIWebView) {
        MBProgress?.hide(true)
    }
}
