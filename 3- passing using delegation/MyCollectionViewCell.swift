//
//  MyCollectionViewCell.swift
//  VideoTestingOne
//
//  Created by s on 04/02/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var myimage:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
}
