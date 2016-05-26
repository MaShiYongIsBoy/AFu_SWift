//
//  RequestAPI.swift
//  AFu_Swift
//
//  Created by bang on 16/3/4.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

typealias Succeed = (NSURLSessionDataTask!,AnyObject)->Void
typealias Failed  = (NSURLSessionDataTask!,NSError)  ->Void

class RequestAPI: NSObject {

    //通用get请求
     class func GET(url:String!, body:AnyObject?,succeed:Succeed,failed:Failed) {
        let mySucceed:Succeed = succeed
        let myFailed:Failed = failed
        RequestClient.shareManager.GET(url, parameters: body, success: { (task:NSURLSessionDataTask!, responseObject:AnyObject!) -> Void in
            
                mySucceed(task,responseObject)
            
            }) { (task:NSURLSessionDataTask!, error:NSError!) -> Void in
                
                myFailed(task,error)
        }
    }
    
    
    //通用post
    class func POST(url:String!, body:AnyObject?,succeed:Succeed,failed:Failed){
        let mySucceed:Succeed = succeed
        let myFailed:Failed = failed
        RequestClient.shareManager.POST(url, parameters: body, success: { (task:NSURLSessionDataTask!, responseObject:AnyObject!) in
            
                mySucceed(task,responseObject)
            }) { (task:NSURLSessionDataTask!, error:NSError!) in
                
                myFailed(task,error)
        }
    }
    
    
}
