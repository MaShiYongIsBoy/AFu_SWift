//
//  AFMedicineListController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/28.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class AFMedicineListController: UIViewController {

    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var myTableView: UITableView!
    /// 接口传参
    var wid:String?
    /// 接口传参
    var id:String?
    /// 菊花
    var MBProgress:MBProgressHUD?
    /// json 数据
    var json:JSON = []
    override func viewDidLoad() {
        super.viewDidLoad()
        MBProgress =  MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        getMedicineListDataWith(1,wid:wid! ,id: id!)
        myTableView.tableHeaderView = AFManureListHeadView.loadMnaureHeadViewFromNib()
    }
    func getMedicineListDataWith(page:Int,wid:String ,id:String){
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=AfuDZYYList&page=\(page)&&wid=\(wid)&id=\(id)"
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
extension AFMedicineListController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json["data"]["items"].count
    }
    
    func  tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AFMedicineListCell") as!AFMedicineListCell
        cell.nameLabel.text = "\(json["data"]["items"][indexPath.row]["title"])"
        let timeString:String = "\(json["data"]["items"][indexPath.row]["addTime"])"
        cell.timeLabel.text = timeString.componentsSeparatedByString(" ").first
        let imageUrl = "http://app.city-base.net\(json["data"]["items"][indexPath.row]["pic"])"
        let URL = NSURL(string: imageUrl)
        cell.contentImageView!.sd_setImageWithURL(URL!)
        
        return cell
    }

    func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("ArtictleViewController") as! ArtictleViewController
        Ctl.sid = json["data"]["items"][indexPath.row]["id"].intValue
        self.navigationController?.pushViewController(Ctl, animated: true)
    }
}
