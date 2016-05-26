//
//  CollectionHeadView.swift
//  AFu_Swift
//
//  Created by bang on 16/3/2.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class CollectionHeadView: UICollectionReusableView {
 /// 数据model
    var model:HomeModel?{
        didSet{
           
            self.title.text = model!.title
            self.describtion.text = model!.newsDescription
            setWeather(model!.weekday!, date: model!.date!, weathera: model!.weathera!, weatherf: model!.weatherf!,Aimage: model!.artictIcon!)
        }
    }
 /// 推荐文章头部图片
    @IBOutlet weak var headImageView: UIImageView!
 /// 天气底层view
    @IBOutlet weak var weatherView: UIView!
 /// 推荐文章名字
    @IBOutlet weak var title: UILabel!
 /// 推荐文章描述
    @IBOutlet weak var describtion: UILabel!
 /// 天气
    var weather:String?
    
 /// 填充天气的具体数据
    func setWeather(weekday:String,date:String,weathera:String,weatherf:String,Aimage:String){
        let weatherV = "上海," + weekday + date + weathera + weatherf
        
        weather = weatherV.stringByReplacingOccurrencesOfString("(", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
        weather = weather!.stringByReplacingOccurrencesOfString(")", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)

        let weatherLabel:CoreLabel = CoreLabel()
            weatherLabel.frame = CGRectMake(20, 0, 375, 50)
            weatherLabel.setFontWith(14)
        headImageView.sd_setImageWithURL(NSURL(string: Aimage)!)
        if let weather = weather{
            weatherLabel.text = weather
        }
        self.weatherView.addSubview(weatherLabel)
    }
}
