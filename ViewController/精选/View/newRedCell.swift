//
//  newRedCell.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class newRedCell: UITableViewCell {
    
    
    var dataArr = NSMutableArray()

    var section = 0
    @IBOutlet weak var collectionV: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.cyanColor()
        self.collectionV.showsHorizontalScrollIndicator = false
        
        collectionV.registerNib(UINib.init(nibName: "complexCell", bundle: nil), forCellWithReuseIdentifier: "complexCell")
        collectionV.registerNib(UINib.init(nibName: "challengeCell", bundle: nil), forCellWithReuseIdentifier: "challengeCell")
        self.collectionV.delegate = self
        self.collectionV.dataSource = self

    }

}


extension newRedCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if self.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("challengeCell", forIndexPath: indexPath) as! challengeCell
            let model = dataArr[indexPath.row] as! challengeModel
            cell.titleL.text = model.title
            cell.levelL.text = model.level
            cell.cateL.text = model.levelInfo
            cell.countL.text = model.participantCount
            cell.imageV.sd_setImageWithURL(NSURL.init(string: model.indexImgUrl)!)
            cell.contentView.backgroundColor = UIColor.redColor()
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("complexCell", forIndexPath: indexPath) as! complexCell
            return cell
        }

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if self.section == 0 {
            return CGSizeMake(300, 150)
        }else{
            return CGSizeMake(200, 300)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

    
    
    
}












