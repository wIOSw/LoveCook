//
//  FeatureModels.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import Foundation

//轮播视图
class bannerModel: JSONModel {
    
    var area: String!
    var id: String!
    var path: String!
    var title: String!
    var type: String!
    var url: String!
    
    override class func propertyIsOptional(propertyName: String) -> Bool {
        return true
    }
    
    
}




//  挑战日日煮
class challengeModel: JSONModel {
    
    var indexImgUrl: String!
    var lessonId: String!
    var level: String!
    var levelInfo: String!
    var participantCount: String!
    var rank: String!
    var title: String!
    var totalStep: String!
    var userInfo: String!
    
    override class func propertyIsOptional(propertyName: String) -> Bool {
        return true
    }
    
    
}


// 每日新菜馆

class newModel: JSONModel {
    
    var categoryID: String!
    var clickCount: String!
    var content: String!
    var createDate: String!
    var deleteStatus: String!
    var Description: String!   //特殊处理
    var detailsUrl: String!
    var favorite: Bool!
    var id: String!
    var imageUrl: String!
    var maketime: String!
    var name: String!
    var shareCount: String!
    var title: String!
    var type: String!
    
    override class func keyMapper()->JSONKeyMapper{
        
        return JSONKeyMapper.init(modelToJSONDictionary: ["Description":"description"])
        //特殊处理某一个字段 ，模型中的属性 和字典中的 key 不一致时，设置赋值对应关系，模型中的属性名作为键,字典中的key 作为 value
    }
    
    
    override class func propertyIsOptional(propertyName: String) -> Bool {
        return true
    }
    
}


// 当红人气菜 和 美食全攻略
class MainModel: JSONModel {
    
    var clickCount: String!
    var Description: String!
    var favorite: String!
    var favoriteCount: String!
    var groupId: String!
    var imageUrl: String!
    var makingTime: String!
    var recipeId: String!
    var recipeType: String!
    var recommendType: String!
    var rid: String!
    var shareCount: String!
    var strDate: String!
    var title: String!
    
    
    //1、 init setValueForkeywithDictionary  + setValu for undefinedKey
    //2、 keyMapper + isOptional
    
    
    override class func keyMapper()->JSONKeyMapper{
        
        return JSONKeyMapper.init(modelToJSONDictionary: ["clickCount": "click_count","Description":"description", "favoriteCount":"favorite_count", "groupId":"group_id", "imageUrl":"image_url", "recipeId":"recipe_id", "recipeType": "recipe_type", "shareCount":"share_count", "strDate":"str_date"])
        //特殊处理某一个字段 ，模型中的属性 和字典中的 key 不一致时，设置赋值对应关系，模型中的属性名作为键,字典中的key 作为 value
    }

    override class func propertyIsOptional(propertyName: String) -> Bool {
        return true
    }
    
    
//    required init(dictionary dict: [NSObject : AnyObject]!) throws {
//        super.init()
//    }
//    
//    override func setValue(value: AnyObject?, forKey key: String) {
//        if key == "click_count"{
//            self.setValue(value, forKey: "clickCount")
//        }else if key == "description"{
//            self.setValue(value, forKey: "Description")
//        }else if key == "favorite_count"{
//            self.setValue(value, forKey: "favoriteCount")
//        }else if key == "group_id"{
//            self.setValue(value, forKey: "groupId")
//        }else if key == "image_url"{
//            self.setValue(value, forKey: "imageUrl")
//        }else if key == "recipe_id"{
//            self.setValue(value, forKey: "recipeId")
//        }else if key == "recipe_type"{
//            self.setValue(value, forKey: "recipeType")
//        }else if key == "share_count"{
//            self.setValue(value, forKey: "shareCount")
//        }else if key == "str_date"{
//            self.setValue(value, forKey: "strDate")
//        }else{
//            //普通的字段赋值
//            super.setValue(value, forKey: key)
//        }
//
//    }
//    
//    required init(data: NSData!) throws {
//        fatalError("init(data:) has not been implemented")
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    
//    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
//        
//    }
    
}














