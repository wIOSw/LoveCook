//
//  FeatureModels.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import Foundation

class FeatureModel: JSONModel {
    var categoryID: String!
    var clickCount: String!
    var Description: String!
    var detailsUrl: String!
    var favoriteCount: String!
    var id: String!
    var imageUrl: String!
    var maketime: String!
    var name: String!
    var releaseDate: String!
    var title: String!
    
    
    override class func keyMapper() -> JSONKeyMapper {
        
        return JSONKeyMapper.mapperFromUnderscoreCaseToCamelCase()
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







