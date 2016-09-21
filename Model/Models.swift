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

    

//
    override class func keyMapper() -> JSONKeyMapper {
        
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
    }
    
    override class func propertyIsOptional(propertyName: String) -> Bool {
        return true
    }

    
}
