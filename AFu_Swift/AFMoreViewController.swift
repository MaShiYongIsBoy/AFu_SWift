//
//  MoreViewController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/15.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    /// JSON数据
    var json:JSON = []
    /// 内容标题
    var contentTitle:String?
    /// 加载旋转
    var MBProgress:MBProgressHUD?
    override func viewDidLoad() {
        
       super.viewDidLoad()
       MBProgress =  MBProgressHUD.showHUDAddedTo(self.view, animated: true)
       getMoreArtictlDataWith(1)
        
}
    func getMoreArtictlDataWith(page:Int){
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=IndexRec&page=\(page)"
        MBProgress?.show(true)
        RequestAPI.GET(getUrl, body: nil, succeed: succeed , failed: failed)
    }
    //数据请求
    func succeed(task:NSURLSessionDataTask!,responseObject:AnyObject!)->Void{
        json = JSON(responseObject)
        MBProgress?.hide(true)
        myTableView.reloadData()
    }
    func failed(task:NSURLSessionDataTask!,error:NSError!)->Void{
        
    }
    //返回按钮
    @IBAction func back_Button(sender: AnyObject) {
    self.navigationController?.popViewControllerAnimated(true)
    }
}

extension MoreViewController:UITableViewDataSource,UITableViewDelegate{

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json["data"]["items"].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MoreArtictleCell") as! MoreArtictleCell
        contentTitle = "\(json["data"]["items"][indexPath.row]["title"])"
        if let _ = contentTitle{
            cell.contentLabel.text = contentTitle
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("ArtictleViewController") as? ArtictleViewController
        Ctl?.sid = json["data"]["items"][indexPath.row]["id"].intValue
        self.navigationController!.pushViewController(Ctl!, animated: true)
    }
}