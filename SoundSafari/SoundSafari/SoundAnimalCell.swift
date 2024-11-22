//
//  Animal.swift
//  SoundSafari
//
//  Created by jin fu on 2024/11/22.
//
import UIKit

class SoundAnimalCell: UITableViewCell {
    @IBOutlet weak var aniImg: UIImageView!
    @IBOutlet weak var aniName: UILabel!
    @IBOutlet weak var aniOneLine: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}
