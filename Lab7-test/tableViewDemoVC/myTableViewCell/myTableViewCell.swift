//
//  myTableViewCell.swift
//  Lab7-test
//
//  Created by Sean Wang on 2021/2/7.
//

import UIKit

class myTableViewCell: UITableViewCell
{
    @IBOutlet var myImgView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(imgName:String,title:String)
    {
        myImgView.image = UIImage(named: imgName)
        titleLabel.text = title
    }
}
