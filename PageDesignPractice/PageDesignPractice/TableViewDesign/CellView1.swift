//
//  CellView3.swift
//  PageDesignPractice
//
//  Created by Admin on 12/01/22.
//

import UIKit

class CellView1: UITableViewCell {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var profile_img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.setGradientBackground()
        self.profile_img.makeRounded()
        self.getCardEffect(cardView: menuView)
        
//        topView.clipsToBounds = true
//        topView.layer.cornerRadius = 10
//        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setGradientBackground() {
        let colorBottom =  UIColor(red: 203.0/255.0, green: 33.0/255.0, blue: 142.0/255.0, alpha: 1.0).cgColor
        let colorTop = UIColor(red: 102.0/255.0, green: 23.0/255.0, blue: 203.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.1, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = self.topView.bounds
                
        self.topView.layer.insertSublayer(gradientLayer, at:0)
        
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


extension UIImageView {

    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    
}
