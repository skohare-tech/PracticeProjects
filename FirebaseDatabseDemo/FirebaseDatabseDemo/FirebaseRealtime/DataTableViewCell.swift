//
//  DataTableViewCell.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 25/02/22.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblOrganization: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
