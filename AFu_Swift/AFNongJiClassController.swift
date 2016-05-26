//
//  NongJiClassController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/18.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class NongJiClassController: UIViewController {
    /// 列表
    @IBOutlet weak var myTableView: UITableView!
    /// 导航栏名字
    @IBOutlet weak var navgationName: UILabel!
    /// 返回
    @IBAction func back_Button(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    /// 数据
    var json:JSON = []
    /// 内容数据名字Cell
    var contentTitle:String?
    /// 区分是那个控制器,农技课堂或者是土壤修复
    var witchCtl:Int?
    /// 用来修改导航栏的名字
    var navName:String?
    var MBProgress:MBProgressHUD?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MBProgress = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        if witchCtl == 1{
             getNJKTDataWith(1)
            
        }else{
            getTRXFDataWith(1)
        }
        navgationName.text = navName
    }
    
    func getTRXFDataWith(page:Int){
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=AfuTRXFList&page=\(page)"
        MBProgress?.show(true)
        RequestAPI.GET(getUrl, body: nil, succeed: succeed , failed: failed)
    }
    
    func getNJKTDataWith(page:Int){
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=AfuNJKTList&page=\(page)"
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
// MARK: - UITabelView代理事件
extension NongJiClassController:UITableViewDataSource,UITableViewDelegate{

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json["data"]["items"].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ClassTableCell") as! ClassTableCell
        contentTitle = "\(json["data"]["items"][indexPath.row]["title"])"
        if let _ = contentTitle{
            cell.nameLabel.text = contentTitle
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("ArtictleViewController") as? ArtictleViewController
        Ctl?.sid = json["data"]["items"][indexPath.row]["id"].intValue
        self.navigationController!.pushViewController(Ctl!, animated: true)
    }
}