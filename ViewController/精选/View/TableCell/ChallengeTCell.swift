//
//  ChallengeTCell.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class ChallengeTCell: UITableViewCell ,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var dataArr: [AnyObject]! {
        didSet{
            collectionV.delegate = self
            collectionV.dataSource = self
            self.collectionV.reloadData()
        }
    }
    
    @IBOutlet weak var collectionV: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionV.registerNib(UINib.init(nibName: "LongCCell", bundle: nil), forCellWithReuseIdentifier: "LongCCell")
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: collectionView 协议代理
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LongCCell", forIndexPath: indexPath) as! LongCCell
        let model = dataArr[indexPath.item] as! challengeModel
        cell.title.text = model.title
        cell.levelL.text = model.levelInfo
        cell.countL.text = model.participantCount + "人参加"
        cell.imageV.sd_setImageWithURL(NSURL.init(string: model.indexImgUrl)!)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(300, 150)
    }
}


