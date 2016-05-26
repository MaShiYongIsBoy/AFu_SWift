//
//  ARecommendDetailHeadView.swift
//  AFu_Swift
//
//  Created by bang on 16/4/7.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ARecommendDetailHeadView: UIView {
    /// 从nib请求组头
    class func loadRecommendHeadViewFromNib() ->ARecommendDetailHeadView{
        let headVew = NSBundle.mainBundle().loadNibNamed("ARecommendDetailHeadView", owner: nil, options: nil).last as? ARecommendDetailHeadView
        return headVew!
    }
}
