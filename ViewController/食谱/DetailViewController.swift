//
//  DetailViewController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var webView:UIWebView!
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView = UIWebView.init(frame: self.view.frame)
        let url = NSURL.init(string: "http://www.daydaycook.com.cn/daydaycook/website/details.html?id=\(id)")
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
