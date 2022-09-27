//
//  CellView3.swift
//  PageDesignPractice
//
//  Created by Admin on 12/01/22.
//

import UIKit

class CellView3: UITableViewCell {

    
    @IBOutlet weak var blankView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        getCardEffect(cardView: blankView)
    }

    
    func getCardEffect(cardView: UIView)
    {
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 10.0
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cardView.layer.shadowRadius = 6.0
        cardView.layer.shadowOpacity = 0.7
    }

}
