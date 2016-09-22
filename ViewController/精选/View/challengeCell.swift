//
//  challengeCell.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class challengeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageV: UIImageView!

    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var levelL: UILabel!
    
    @IBOutlet weak var cateL: UILabel!
    
    @IBOutlet weak var countL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cateL.textColor = TEXTGRAYCOLOR
        countL.textColor = TEXTGRAYCOLOR
    }
    
    

}
