//
//  SHCellView2.swift
//  PageDesignPractice
//
//  Created by Admin on 19/01/22.
//

import UIKit

class SHCellView2: UITableViewCell {
    
    
    @IBOutlet weak var lblVbType: UILabel!
    
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        getCardEffect(cardView: view)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func getCardEffect(cardView: UIView)
    {
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 5.0
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cardView.layer.shadowRadius = 6.0
        cardView.layer.shadowOpacity = 0.1
    }
}
