
//
//  extension+msyUIColor.swift
//  AFu_Swift
//
//  Created by bang on 16/3/15.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{

   class func msy_colorWithRGB(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        let color = UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
        return color
    }
}