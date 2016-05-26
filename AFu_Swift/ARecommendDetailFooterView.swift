//
//  ARecommendDetailFooterView.swift
//  AFu_Swift
//
//  Created by bang on 16/4/7.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ARecommendDetailFooterView: UIView {
    /// 点击我要评论
    var clickCommectButton:(() -> ())?
    
    @IBAction func commentButton(sender: AnyObject) {
        
        if (clickCommectButton != nil) {
            clickCommectButton!()
        }
    }

    /// 从nib请求组头
    class func loadRecommendFootViewFromNib() ->ARecommendDetailFooterView{
        let headVew = NSBundle.mainBundle().loadNibNamed("ARecommendDetailFooterView", owner: nil, options: nil).last as? ARecommendDetailFooterView
        return headVew!
    }

}
