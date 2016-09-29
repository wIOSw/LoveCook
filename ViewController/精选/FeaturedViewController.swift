//
//  FeaturedViewController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class FeaturedViewController: BaseViewController {

//    var challengeArr = [AnyObject]()
//    var newArr = [AnyObject]()
//    var hotArr = [AnyObject]()
//    var simpleArr =
    
    var dataArr = NSMutableArray.init(capacity: 4)
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
        self.automaticallyAdjustsScrollViewInsets = false
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
              print(1111111111)
                self.dataArr[0] = challengeArr!
                self.tableView.reloadData()
            }else{
                print(error)
            }
        }
        
       newModel.requestNewData { (newArr, error) in
            if error == nil {
                print(22222222)
                self.dataArr[1] = newArr!
                self.tableView.reloadData()
            }else{
                print(error)
            }
        }
        
        MainModel.requestRedData { (hotArr, simpleArr, error) in
            if error == nil {
                print(33333333)
                self.dataArr[2] = hotArr!
                self.dataArr[3] = simpleArr!
                self.tableView.reloadData()
                
            }else{
                print(error)
            }
        }
    }
    
    

    func barBtnItemClick() {
        let svc = SearchViewController()
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    //selector
    func pushDetailView(model: AnyObject) {
        let dvc = DetailViewController()
        
        if model.isKindOfClass(newModel) {
            dvc.id = (model as! newModel).id
        }else{
            dvc.id = (model as! MainModel).recipeId
        }
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataArr.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 || section == 2
        {
            return 1
        }else{
            return dataArr[section].count
        }
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160
        }else if indexPath.section == 1 || indexPath.section == 2 {
            return 310
        }else{
            return 210
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ChallengeTCell", forIndexPath: indexPath) as! ChallengeTCell
            cell.dataArr = self.dataArr[0] as! [AnyObject]
            return cell
        }else if indexPath.section == 1 || indexPath.section == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("NewHotTCell", forIndexPath: indexPath) as! NewHotTCell
            cell.targ = self
            cell.action = #selector(self.pushDetailView(_:))
            cell.dataArr = self.dataArr[indexPath.section] as! [AnyObject]
            cell.section = indexPath.section
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("SimpleTCell", forIndexPath: indexPath) as! SimpleTCell
            let arr = dataArr[3] as! [AnyObject]
            let model = arr[indexPath.row] as! MainModel
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
    
    
    //MainModel 是 name   newModel是id
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 3 {
            let arr = dataArr[3] as! [AnyObject]
            let model = arr[indexPath.row]
            self.pushDetailView(model)
        }
    }
    
    
    
}


