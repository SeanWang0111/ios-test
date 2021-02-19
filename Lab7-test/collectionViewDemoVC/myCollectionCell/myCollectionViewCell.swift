//
//  myCollectionViewCell.swift
//  Lab7-test
//
//  Created by Sean Wang on 2021/2/7.
//

import UIKit

class myCollectionViewCell: UICollectionViewCell
{
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(imgName:String,title:String)
    {
        imgView.image = UIImage(named: imgName)
        titleLabel.text = title
    }

}
