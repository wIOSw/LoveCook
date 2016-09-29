//
//  DetailViewController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var id:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = UIWebView.init(frame: self.view.bounds)
        let url = NSURL.init(string: "http://www.daydaycook.com.cn/daydaycook/website/details.html?id=\(self.id)")
        let request = NSURLRequest.init(URL: url!)
        webView.loadRequest(request)
        self.view.addSubview(webView)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
