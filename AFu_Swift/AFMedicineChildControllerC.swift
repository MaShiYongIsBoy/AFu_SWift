//
//  AFMedicineChildControllerC.swift
//  AFu_Swift
//
//  Created by bang on 16/3/22.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class AFMedicineChildControllerC: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    /// 那种作物
    var sid:String?
    /// 菊花
    var MBProgress:MBProgressHUD?
    /// json 数据
    var json:JSON = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MBProgress =  MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        getMedicineDataWith(1,id: sid!)
        
    }
    func getMedicineDataWith(page:Int, id:String){
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=AfuDZYY_BZList&page=\(page)&id=\(id)"
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
///MARK - UItableView 代理
extension AFMedicineChildControllerC:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json["data"]["items"][1]["items"].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChildTableCellC") as!ChildTableCellC
         cell.titleNameLabel.text = "\(json["data"]["items"][1]["items"][indexPath.row]["title"])"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("AFMedicineListController") as!AFMedicineListController
        Ctl.wid = "\(json["data"]["items"][0]["items"][indexPath.row]["id"])"
        Ctl.id = sid
        self.navigationController?.pushViewController(Ctl, animated: true)
    }

}
