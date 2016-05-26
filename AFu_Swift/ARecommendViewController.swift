//
//  ARecommendViewController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/29.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ARecommendViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    /// json数据
    var json:JSON = []
    /// 加载数据动画
    var MBProgress:MBProgressHUD?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MBProgress = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        getYCSFListDataWith(1, lid: 43)
    }
    
    func getYCSFListDataWith(page:Int,lid:Int){
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=AfuRecommendList&page=\(page)&lid=\(lid)"
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
}

/// MARK - UITableView 代理事件
extension ARecommendViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return json["data"]["items"].count
    }
    
    func  tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecommendCellA") as! RecommendCellA
        cell.nameTitle.text = "\(json["data"]["items"][indexPath.row]["title"])"
        cell.infoLabel.text = "\(json["data"]["items"][indexPath.row]["address"])"
        cell.headImageView.sd_setImageWithURL(NSURL(string: "http://app.city-base.net\(json["data"]["items"][indexPath.row]["pic"])"))
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let ctl = self.storyboard?.instantiateViewControllerWithIdentifier("ARecommendDetailController") as!ARecommendDetailController
        self.navigationController?.pushViewController(ctl, animated: true)
    }
}

