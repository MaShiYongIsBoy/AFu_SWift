//
//  ManureListViewController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/21.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ManureListViewController: UIViewController {
    /// 控制器上的表格控制器
    @IBOutlet weak var myTableView: UITableView!
    /// 返回按钮
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    /// json数据
    var json:JSON = []
    /// 文章类型标签
    var sid:String?
    /// 加载数据动画
    var MBProgress:MBProgressHUD?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        MBProgress = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        getYCSFListDataWith(1, sid: sid!)
        
        myTableView.tableHeaderView = AFManureListHeadView.loadMnaureHeadViewFromNib()
    }
    
    func getYCSFListDataWith(page:Int,sid:String){
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=AfuDZYYList&page=\(page)&id=\(sid)"
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
// MARK: - 代理事件
extension ManureListViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json["data"]["items"].count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ManureListCell") as!ManureListCell
        cell.nameLabel.text = "\(json["data"]["items"][indexPath.row]["title"])"
        cell.timeLabel.text = "\(json["data"]["items"][indexPath.row]["addTime"])"
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("ArtictleViewController") as! ArtictleViewController
        Ctl.sid = json["data"]["items"][indexPath.row]["id"].intValue
        self.navigationController?.pushViewController(Ctl, animated: true)
    }
}