//
//  RecipeViewController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class RecipeViewController: BaseViewController {
    
    var dataArr = NSMutableArray()
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .Vertical
        layout.itemSize = CGSizeMake((SCREEN_W - 15) / 2, (SCREEN_W - 15) / 2 + 50)
        
        let collectionView = UICollectionView.init(frame: CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(UINib.init(nibName: "complexCell", bundle: nil), forCellWithReuseIdentifier: "complexCell")
        self.view.addSubview(collectionView)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "食谱"
        self.loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        newModel.requestNewData { (newArr, error) in
            if error == nil {
                self.dataArr.addObjectsFromArray(newArr!)
                self.collectionView.reloadData()
                
            }else{
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension RecipeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("complexCell", forIndexPath: indexPath) as! complexCell
        
        let model = dataArr[indexPath.item] as! newModel
        
        cell.imageV.sd_setImageWithURL(NSURL.init(string: model.imageUrl)!)
        cell.titleL.text = model.title
        cell.decL.text = model.Description
        cell.countL.text = "\(model.clickCount)"
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        print(11111111111)
        let dvc = DetailViewController()
        let model = dataArr[indexPath.item] as! newModel
        dvc.id = String(model.id)
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
}


