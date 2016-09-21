//
//  FeatureModels.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import Foundation

class FeatureModel: JSONModel {
    
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
    
    override class func keyMapper() -> JSONKeyMapper {
        
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    
//    override class func keyMapper()->JSONKeyMapper{
//        
//        return JSONKeyMapper.init(modelToJSONDictionary: ["Description":"description"])
//        //特殊处理某一个字段 ，模型中的属性 和字典中的 key 不一致时，设置赋值对应关系，模型中的属性名作为键,字典中的key 作为 value
//    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
}
