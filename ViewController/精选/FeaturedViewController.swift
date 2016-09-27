//
//  FeaturedViewController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class FeaturedViewController: BaseViewController {

    var dataDic = NSMutableDictionary()
    let secNameArr = ["挑战日日煮","每日新菜馆","当红人气菜","美食全攻略"]
    lazy var tableView: UITableView = {
       
        let tableView = UITableView.init(frame: CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49), style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib.init(nibName: "ChallengeTCell", bundle: nil), forCellReuseIdentifier: "ChallengeTCell")
        
        tableView.registerNib(UINib.init(nibName: "NewHotTCell", bundle: nil), forCellReuseIdentifier: "NewHotTCell")
        
        tableView.registerNib(UINib.init(nibName: "SimpleTCell", bundle: nil), forCellReuseIdentifier: "SimpleTCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.tableHeaderView = self.adView
        self.view.addSubview(tableView)
        return tableView
    }()
    
    lazy var adView:XTADScrollView = {
        let adView = XTADScrollView.init(frame: CGRectMake(0, 0, SCREEN_W, 200))
        //是否启动轮播
        adView.infiniteLoop = true
        //是否显示pageControl
        adView.needPageControl = true
        //pageControl显示的位置
        adView.pageControlPositionType = pageControlPositionTypeRight
        return adView
    }()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Search, target: self, action: #selector(self.barBtnItemClick))
        self.loadData()
        self.navigationItem.title = "首页"
    }
    
    func loadData() {
      //轮播视图
        bannerModel.requestBannerData { (bannerArr, error) in
            if error == nil {
                self.adView.imageURLArray = bannerArr
                self.tableView.reloadData()

            }else{
                print(error)
            }
        }
        
        challengeModel.requestChallengeData { (challengeArr, error) in
            if error == nil {
                print(111111111)
                self.dataDic.setValue(challengeArr!, forKey: "challengeArr")
                self.tableView.reloadData()
            }else{
                print(error)
            }
        }
        
//       newModel.requestNewData { (newArr, error) in
//            if error == nil {
//                print(22222222)
//                self.setValue(newArr!, forKey: "newArr")
//                self.tableView.reloadData()
//            }else{
//                print(error)
//            }
//        }
        
        MainModel.requestRedData { (hotArr, simpleArr, error) in
            if error == nil {
                print(333333333333)
//                self.dataDic.setValue(hotArr!, forKey: "hotArr")
                self.dataDic.setValue(simpleArr!, forKey: "simpleArr")
                self.tableView.reloadData()
                
            }else{
                print(error)
            }
        }
    }
    
    

    func barBtnItemClick() {
        
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataDic.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return dataDic["simpleArr"]!.count
        }
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160
        }else{
            return 210
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ChallengeTCell", forIndexPath: indexPath) as! ChallengeTCell
            let arr = self.dataDic["challengeArr"] as! [AnyObject]
            cell.dataArr = arr
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("SimpleTCell", forIndexPath: indexPath) as! SimpleTCell
            let arr = self.dataDic["simpleArr"] as! [AnyObject]
            let model = arr[indexPath.item] as! MainModel
            cell.imageV.sd_setImageWithURL(NSURL.init(string: model.imageUrl)!)
            cell.titleL.text = model.title
            cell.DesL.text = model.Description
            return cell
        }
        
    }
    
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let label = UILabel.init(frame: CGRectMake(0, 0, SCREEN_W, 50))
        label.text = secNameArr[section]
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(15)
        label.backgroundColor = UIColor.whiteColor()
        return label
    }
    
    
    
    
    
}


