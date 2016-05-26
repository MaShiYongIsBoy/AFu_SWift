//
//  AFManureListHeadView.swift
//  AFu_Swift
//
//  Created by bang on 16/3/28.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class AFManureListHeadView: UIView {
    @IBOutlet weak var seachView: UIView!
    
    override func awakeFromNib() {
        seachView.layer.borderWidth = 0.5
        seachView.layer.borderColor = UIColor.msy_colorWithRGB(0, g: 0, b: 0, alpha: 0.1).CGColor
    }
    /// 从nib请求组头
    class func loadMnaureHeadViewFromNib() ->AFManureListHeadView{
        let headVew = NSBundle.mainBundle().loadNibNamed("AFManureListHeadView", owner: nil, options: nil).last as? AFManureListHeadView
        return headVew!
    }
}
