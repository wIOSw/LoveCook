//
//  FeatureModels.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import Foundation

class MainModel: JSONModel {
    
    var clickCount: String!
    var Description: String!
    var favorite: String!
    var favoriteCount: String!
    var groupId: String!
    var imageUrl: String!
    var locationId: String!
    var locationName: String!
    var makingTime: String!
    var recipeId: String!
    var recipeType: String!
    var recommendType: String!
    var rid: String!
    var shareCount: String!
    var strDate: String!
    var title: String!
    
    
    override func setValue(value: AnyObject?, forKey key: String) {
        
        if key == "click_count"{
            self.setValue(value, forKey: "clickCount")
        }else if key == "description"{
            self.setValue(value, forKey: "Description")
        }else if key == "favorite_count"{
            self.setValue(value, forKey: "favoriteCount")
        }else if key == "group_id"{
            self.setValue(value, forKey: "groupId")
        }else if key == "image_url"{
            self.setValue(value, forKey: "imageUrl")
        }else if key == "recipe_id"{
            self.setValue(value, forKey: "recipeId")
        }else if key == "recipe_type"{
            self.setValue(value, forKey: "recipeType")
        }else if key == "share_count"{
            self.setValue(value, forKey: "shareCount")
        }else if key == "str_date"{
            self.setValue(value, forKey: "strDate")
        }else{
            //普通的字段赋值
            super.setValue(value, forKey: key)
        }
    }

    override class func propertyIsOptional(propertyName: String) -> Bool {
        return true
    }
    
}


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







