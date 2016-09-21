//
//  MyTabBarController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createViewCotrollers()
    }
    
    
    func createViewCotrollers() {
        let featured = FeaturedViewController()
        let recipe = RecipeViewController()
        let find = FindViewController()
        let mine = MineViewController()
        
        let vcArr = [featured, recipe, find, mine]
        
        let titleArr = ["精选", "食谱", "发现", "我的"]
        var i = 0
        var viewControllers = [UINavigationController]()
        
        for vc in vcArr {
           let nav = UINavigationController.init(rootViewController: vc)
            let title = titleArr[i]
            nav.title = title
            let image = UIImage.init(named: title + "A")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            let imageS = UIImage.init(named: title + "B")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            let tabItem = UITabBarItem.init(title: title, image: image, selectedImage: imageS)
            nav.tabBarItem = tabItem

            tabItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:TEXTGRAYCOLOR], forState: UIControlState.Normal)
            
            tabItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:UIColor.orangeColor()], forState: UIControlState.Selected)
            tabItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0)

            viewControllers.append(nav)
            i += 1

        }
        self.viewControllers = viewControllers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
