//
//  HomeViewController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/2.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class HomeViewController:UIViewController  {
    //天气详情
    @IBAction func weather_Tap(sender: AnyObject) {
        
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("WeatherViewController") as? WeatherViewController
        self.navigationController?.pushViewController(Ctl!, animated: true)
    }
    //更多推荐文章
    @IBAction func moreButton(sender: AnyObject) {
        
        let moreCtl = self.storyboard?.instantiateViewControllerWithIdentifier("MoreViewController") as? MoreViewController
        self.navigationController?.pushViewController(moreCtl!, animated: true)
    }
    //推荐文章详情
    @IBAction func artictle_Tap(sender: AnyObject) {
        let infoCtl = self.storyboard?.instantiateViewControllerWithIdentifier("ArtictleViewController") as? ArtictleViewController
        infoCtl!.sid = newsID
        self.navigationController?.pushViewController(infoCtl!, animated: true)
        
    }
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    /// 文章ID
    var newsID:Int?
    /// 数据model
    var model:HomeModel?
    private var imageData = ["Home_SpecificFertilizer","Home_Medicine","Home_Consult","Home_Map","Home_Class","Home_Soil"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=Weather"
        RequestAPI.GET(getUrl, body: nil, succeed: succeed , failed: failed)
    }
    
    //数据请求
    func succeed(task:NSURLSessionDataTask!,responseObject:AnyObject!)->Void{
        
        let json               = JSON(responseObject)
        newsID                 = json["data"]["news"]["id"].intValue
        model                  = HomeModel()
        model?.title           = "\(json["data"]["news"]["title"])"
        model?.artictIcon      = "http://app.city-base.net\(json["data"]["news"]["litpic"])"
        model?.weekday         = "\(json["data"]["weekday"]),"
        model?.weathera        = "\(json["data"]["weathera"]),"
        model?.weatherf        = "\(json["data"]["weatherf"])"
        model?.date            = "\(json["data"]["date"]),"
        model?.icon            = "http://app.city-base.net\(json["data"]["icon"])"
        model?.newsDescription = "\(json["data"]["news"]["description"])"
        
        myCollectionView.reloadData()
    }
    
    func failed(task:NSURLSessionDataTask!,error:NSError!)->Void{
        
    }
}

// MARK: - UICollectionview代理事件
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //MARK:代理事件
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeCollectionViewCell", forIndexPath: indexPath) as!HomeCollectionViewCell
        cell.headImageVIew.image = UIImage(named: imageData[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "CollectionHeadView", forIndexPath: indexPath) as!CollectionHeadView
        
        if let _ = model {
           headView.model = model!
        }
        return headView
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row{
        case 4:
            let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("NongJiClassController") as! NongJiClassController
            Ctl.witchCtl = 1
            Ctl.navName = "农技课堂"
            self.navigationController?.pushViewController(Ctl, animated: true)
            break
        case 5:
            let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("NongJiClassController") as! NongJiClassController
            Ctl.witchCtl = 0
            Ctl.navName = "土壤修复"
            self.navigationController?.pushViewController(Ctl, animated: true)
            break
        case 0:
            let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("ManureViewController") as! ManureViewController
            Ctl.witchClass = 2
            self.navigationController?.pushViewController(Ctl, animated: true)
            break
        case 1:
            let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("ManureViewController") as! ManureViewController
            Ctl.witchClass = 3
            self.navigationController?.pushViewController(Ctl, animated: true)
            break
        case 3:
            let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("AFMapAroundController") as! AFMapAroundController
            self.navigationController?.pushViewController(Ctl, animated: true)
            break
        default:
            break
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = CGSize(width: 187.5, height: 100)
        return size
    }
    
}

