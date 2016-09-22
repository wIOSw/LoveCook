//
//  complexCell.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class complexCell: UICollectionViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var decL: UILabel!
    
    @IBOutlet weak var countL: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        decL.textColor = TEXTGRAYCOLOR
        countL.textColor = TEXTGRAYCOLOR
    }

    
}
