//
//  ManureHeadView.swift
//  AFu_Swift
//
//  Created by bang on 16/3/18.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ManureHeadView: UIView {
    /// 点击事件闭包
    var clickHeadView:(() -> ())?
    /// 组头的点击手势
    var headTap:UITapGestureRecognizer?
    
    /// 第几个组头
    @IBOutlet weak var numberLabel: UILabel!
    /// 组头子标题
    @IBOutlet weak var subTitlteLable: UILabel!
    /// 组头背景图
    @IBOutlet weak var backImageView: UIImageView!
    /// 组头数字背景图
    @IBOutlet weak var numberImageView: UIImageView!
    /// 组头标题
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    override func awakeFromNib() {
        headTap = UITapGestureRecognizer(target: self, action: #selector(ManureHeadView.headView))
        self.addGestureRecognizer(headTap!)
    }
    // 闭包,类似OC-block
    func headView(){
        clickHeadView!()
    }
    /// 从nib请求组头
    class func loadHeadViewFromNib() ->ManureHeadView{
        let headVew = NSBundle.mainBundle().loadNibNamed("AFManureHeadView", owner: nil, options: nil).last as? ManureHeadView
        return headVew!
    }
}
