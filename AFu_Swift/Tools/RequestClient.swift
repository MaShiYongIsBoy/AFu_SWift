//
//  RequestClient.swift
//  AFu_Swift
//
//  Created by bang on 16/3/4.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class RequestClient: AFHTTPSessionManager {
    /// 单利
    private static let instance = RequestClient()
    
    public class var shareManager:RequestClient{
        return instance
    }
}
