//
//  SettingCellView2.swift
//  PageDesignPractice
//
//  Created by Admin on 19/01/22.
//

import UIKit

class SettingCellView2: UITableViewCell {

    @IBOutlet weak var lblMenuName: UILabel!
    
    @IBOutlet weak var menu_icon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        menu_icon.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
