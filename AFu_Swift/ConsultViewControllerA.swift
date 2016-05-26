//
//  ConsultViewControllerA.swift
//  AFu_Swift
//
//  Created by bang on 16/3/29.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ConsultViewControllerA: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    /// json数据
    var json:JSON = []
    /// 数据加载动画
    var MBProgress:MBProgressHUD?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MBProgress = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        getYCSFListDataWith(1, lid: 1)
    }
    
    func getYCSFListDataWith(page:Int,lid:Int){
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=AfuNewsList&page=\(page)&lid=\(lid)"
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
/// MARK - UITableView代理事件
extension ConsultViewControllerA:UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json["data"]["items"].count
    }
    
    func  tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ConsultCellA") as! ConsultCellA
        let titleString = "\(json["data"]["items"][indexPath.row]["addTime"])"
        let imageString = "http://app.city-base.net\(json["data"]["items"][indexPath.row]["pic"])"
        let imageUrl = NSURL(string: imageString)
        cell.nameLabel.text = "\(json["data"]["items"][indexPath.row]["title"])"
        cell.timeLabel.text = titleString.componentsSeparatedByString(" ").first
        cell.InfoImageView.sd_setImageWithURL(imageUrl)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("ArtictleViewController") as! ArtictleViewController
        Ctl.sid = json["data"]["items"][indexPath.row]["id"].intValue
        self.navigationController?.pushViewController(Ctl, animated: true)
    }
}






