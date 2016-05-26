//
//  AppDelegate.swift
//  AFu_Swift
//
//  Created by bang on 16/3/2.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        ShareSDK.registerApp("9ab0d4e9dd2c", activePlatforms: [SSDKPlatformType.TypeQQ.rawValue,
            SSDKPlatformType.TypeWechat.rawValue,], onImport:{(platform : SSDKPlatformType) -> Void in
                switch platform{
                case SSDKPlatformType.TypeWechat:
                     ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                    break
                case SSDKPlatformType.TypeQQ:
                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                    break
                default:
                    break
                }
            }, onConfiguration: {(platform : SSDKPlatformType,appInfo : NSMutableDictionary!) -> Void in
                switch platform {
                    
                case SSDKPlatformType.TypeWechat:
                    //设置微信应用信息
                    appInfo.SSDKSetupWeChatByAppId("wx6d257958c6aa38f6", appSecret: "4c8730f07c76907948598a3cd8280bf5")
                    break
                case SSDKPlatformType.TypeQQ:
                    //设置QQ应用信息
                    appInfo.SSDKSetupQQByAppId("1104833428", appKey: "jOBUbjMeNq8iHlmK", authType: SSDKAuthTypeBoth)
                default:
                    break
                    
                }
        })
            return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

