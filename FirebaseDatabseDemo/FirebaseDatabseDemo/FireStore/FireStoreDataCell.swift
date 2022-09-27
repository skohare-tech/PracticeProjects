//
//  FireStoreDataCell.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 07/03/22.
//

import UIKit

class FireStoreDataCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblOrganization: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
