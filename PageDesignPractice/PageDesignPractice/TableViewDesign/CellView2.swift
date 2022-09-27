//
//  CellView2.swift
//  PageDesignPractice
//
//  Created by Admin on 12/01/22.
//

import UIKit

class CellView2: UITableViewCell {
    
    
    
    @IBOutlet weak var steemView: UIView!
    @IBOutlet weak var sboView: UIView!
    
    @IBOutlet weak var resourseCView: UIView!
    
    @IBOutlet weak var dot1View: UIView!
    @IBOutlet weak var dot2View: UIView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        self.getCardEffect(cardView: steemView)
        self.getCardEffect(cardView: sboView)
        self.getCardEffect(cardView: resourseCView)
       
        self.getBlueDotEffect(cardView: dot1View)
        self.getRedDotEffect(cardView: dot2View)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

    func getRedDotEffect(cardView: UIView)
    {
        cardView.backgroundColor = .red
        cardView.layer.cornerRadius = 8.0
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cardView.layer.shadowRadius = 5.0
        cardView.layer.shadowOpacity = 1.0
        
         }

    func getBlueDotEffect(cardView: UIView)
    {
        cardView.backgroundColor = .blue
        cardView.layer.cornerRadius = 8.0
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cardView.layer.shadowRadius = 5.0
        cardView.layer.shadowOpacity = 1.0
        
    }

}
