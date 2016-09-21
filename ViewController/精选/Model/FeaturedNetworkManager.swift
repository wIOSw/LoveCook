////
////  FeaturedNetworkManager.swift
////  LoveCook
////
////  Created by qianfeng on 16/9/20.
////  Copyright © 2016年 LiuWei. All rights reserved.
////
//
//import Foundation
//
//
//extension FeatureModel {
//    
//    class func requestHomeData(page: NSInteger,callBack:(bannerArray:[AnyObject]?,cateArray:[AnyObject]?,error:NSError?)->Void)->Void {
//        
//        // /daydaycook/server/ad/listAds.do
//        //version=2.2.1&uid=&regionCode=156&mainland=1
//        //轮播视图
//        let bannerArr = NSMutableArray()
//        
//        let para = ["version":"2.2.1", "regionCode":"156", "mainland":"1"]
//        BaseRequest.postWithURL(HOME_URL + "/daydaycook/server/ad/listAds.do", para: para) { (data, error) in
//            
//            if error == nil {
//                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
//                let arr = obj["data"] as! [NSDictionary]
//                for dic in arr {
//                    let imageUrl = dic["path"] as! String
//                    bannerArr.addObject(imageUrl)
//                }
//            }else{
//                
//            }
//            
//        }
//
//        let cateArr = NSMutableArray()
//        //每日新菜馆
//        
//        
//        //pageSize=10&currentPage=0&version=2.2.1&mainland=1
//        let para1 = ["version":"2.2.1","pageSize":"10", "currentPage":page, "mainland":"1"]
//        BaseRequest.postWithURL(HOME_URL + "/daydaycook/server/recipe/search.do", para: para1) { (data, error) in
//            
//            
//        }
//        
//        
//        ///daydaycook/server/ad/listAds.do
//        //version=2.2.1&uid=&regionCode=156&mainland=1
//        let para2 = ["version":"2.2.1", "regionCode":"156", "languagedld":"3", "mainland":"1"]
//        
//        BaseRequest.postWithURL(HOME_URL + "/daydaycook/recommend/queryRecommendAll.do", para: para2) { (data, error) in
//            let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding)!
//            print(str)
//        }
//
//        
//        
//    }
//    
//    
//}