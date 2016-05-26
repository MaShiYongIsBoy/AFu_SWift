//
//  ManureViewController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/18.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ManureViewController: UIViewController {
    
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var myTableView: UITableView!
    /// 点击组头
    var clickSection:Int = -1
    /// 再次被点击
    var clickSectionAgain:Int?
    /// 记录上一次被点击的组头
    var flat:Int?
    /// 数据
    var json:JSON = []
    /// 是哪一个cell
    var witchClass:Int?
    /// 加载数据动画
    var MBProgress:MBProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MBProgress = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        if witchClass == 2{
             getYCSFDataWith(1)
        }else{
            getDZYYDataWith(1)
        }
    }
    func getYCSFDataWith(page:Int){
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=AfuYCSF&page=\(page)"
        MBProgress?.show(true)
        RequestAPI.GET(getUrl, body: nil, succeed: succeed , failed: failed)
    }
    func getDZYYDataWith(page:Int){
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=AfuDZYY&page=\(page)"
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
// MARK: - UITableView代理事件
extension ManureViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (clickSection == section && clickSectionAgain == 1){
            return json["data"]["items"][section]["items"].count
        }
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return json["data"]["items"].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ManureTableCell") as! ManureTableCell
        cell.titleLabel.text = "\(json["data"]["items"][indexPath.section]["items"][indexPath.row]["title"])"
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = ManureHeadView.loadHeadViewFromNib()
        headView.mainTitleLabel.text = "\(json["data"]["items"][section]["title"])"
        headView.numberLabel.text = "\(section+1)"
        //点击组头换组头的背景图
        if clickSectionAgain == 1{
            if section == clickSection{
                headView.backImageView.image      = UIImage(named: "greenKind")
                headView.numberImageView.image = UIImage(named: "greenKindY")
                headView.mainTitleLabel.textColor = UIColor.whiteColor()
                headView.subTitlteLable.textColor = UIColor.whiteColor()
            }else{
                headView.backImageView.image      = UIImage(named: "writeKind")
                headView.numberImageView.image = UIImage(named: "writeKindY")
                headView.mainTitleLabel.textColor = UIColor.blackColor()
                headView.subTitlteLable.textColor = UIColor.grayColor()
            }
        }
        //设置组头的收合状态
        weak var weakSelf = self
        headView.clickHeadView = {
            weakSelf!.flat = weakSelf!.clickSection
            weakSelf!.clickSection = section
            if weakSelf!.flat == weakSelf!.clickSection{
                if weakSelf!.clickSectionAgain == 1{
                    weakSelf!.clickSectionAgain = 0
                }else{
                    weakSelf!.clickSectionAgain = 1
                }
            }else{
                weakSelf!.clickSectionAgain = 1
            }
            weakSelf!.myTableView.reloadData()
        }
        return headView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if witchClass == 2{
            let Ctl  = self.storyboard?.instantiateViewControllerWithIdentifier("ManureListViewController") as?ManureListViewController
            Ctl?.sid = "\(json["data"]["items"][indexPath.section]["items"][indexPath.row]["id"])"
            self.navigationController?.pushViewController(Ctl!, animated: true)
        }else{
            let Ctl  = self.storyboard?.instantiateViewControllerWithIdentifier("AFMedicineViewController") as?AFMedicineViewController
            Ctl?.sid = "\(json["data"]["items"][indexPath.section]["items"][indexPath.row]["id"])"
            self.navigationController?.pushViewController(Ctl!, animated: true)
        }
    }
}
