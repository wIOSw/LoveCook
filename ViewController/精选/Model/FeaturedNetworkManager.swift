//
//  FeaturedNetworkManager.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import Foundation

//轮播视图
extension bannerModel {
    //   /daydaycook/server/ad/listAds.do
    //version=2.2.1&uid=&regionCode=156&mainland=1
    
    class func requestBannerData(callBack:(bannerArr:[AnyObject]?, error:NSError?)->Void)->Void {
        
        let para = ["version":"2.2", "regionCode":"156", "mainland":"1"]
        BaseRequest.postWithURL(HOME_URL + "/daydaycook/server/ad/listAds.do", para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let arr = obj["data"] as! [NSObject]
                let arr1 = bannerModel.arrayOfModelsFromDictionaries(arr)
                let bannerArr = NSMutableArray()
                for model in arr1 {
                    bannerArr.addObject((model as! bannerModel).path)
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(bannerArr: bannerArr as [AnyObject], error: nil)
                })
                
            }else{
                
                callBack(bannerArr: nil, error: error)
            }
        }
    }
    
}


//挑战
extension challengeModel {
    //    /daydaycook/server/lesson/list.do
     //  pageSize=12&currentPage=1&mainland=1&version=2.2.1&regionCode=156
    
    class func requestChallengeData(callBack: (challengeArr:[AnyObject]?, error:NSError?)->Void) {
        let para = ["pageSize":"12", "currentPage":"1", "mainland":"1", "version":"2.2.1", "regionCode":"156"]
        BaseRequest.postWithURL(HOME_URL + "/daydaycook/server/lesson/list.do", para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let arr = obj["data"] as! [AnyObject]
                let chaArr = challengeModel.arrayOfModelsFromDictionaries(arr)
                
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(challengeArr:  chaArr as [AnyObject], error: nil)
                })
            }else {
                callBack(challengeArr:  nil, error: error)
            }
        }
    }
}

//每日新菜馆

extension newModel {
    
    class func requestNewData(callBack:(newArr: [AnyObject]?,error:NSError?)->Void)->Void {
        
        let para = ["pageSize": "10", "currentPage":"1","version":"2.2.1", "mainland":"1"]
        BaseRequest.postWithURL(HOME_URL + "/daydaycook/server/recipe/search.do", para: para) { (data, error) in

            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let arr = obj["data"] as! [AnyObject]
                let newArr = newModel.arrayOfModelsFromDictionaries(arr) as [AnyObject]
                dispatch_async(dispatch_get_main_queue(), { 
                    callBack(newArr: newArr, error: nil)
                })
            }else{
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(newArr: nil, error: error)
                })
            }
        
        }
    }
    
}


//当红人气菜和全攻略

extension MainModel {
    
    //   /daydaycook/recommend/queryRecommendAll.do
    //   mainland=1&version=2.2.1&languagedld=3&regionCode=156
    class func requestRedData(callBack: (hotArr: [AnyObject]?,simpleArr: [AnyObject]?,error:NSError?)->Void) {
        
        let para = ["mainland":"1", "version":"2.2.1", "languagedld":"3", "regionCode":"156"]
        BaseRequest.postWithURL(HOME_URL + "/daydaycook/recommend/queryRecommendAll.do", para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                let arr1 = obj["recipeList"] as! [AnyObject]
                let hotArr = MainModel.arrayOfModelsFromDictionaries(arr1) as [AnyObject]
                
                let arr2 = obj["themeList"] as! [AnyObject]
                let simpleArr = MainModel.arrayOfModelsFromDictionaries(arr2) as [AnyObject]
                
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(hotArr: hotArr, simpleArr: simpleArr, error: nil)
                })
            }else{
                
                dispatch_async(dispatch_get_main_queue(), {
                    callBack(hotArr: nil, simpleArr: nil, error: error)
                })
            }
        }
        
        
    }

    
    
}









