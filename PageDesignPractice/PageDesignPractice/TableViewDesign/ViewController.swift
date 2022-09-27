//
//  ViewController.swift
//  PageDesignPractice
//
//  Created by Admin on 11/01/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var profile_img: UIImageView!
    
    
    @IBOutlet weak var menu_view: UIView!
    
    
    @IBOutlet weak var steemView: UIView!
    @IBOutlet weak var sboView: UIView!
    @IBOutlet weak var blanckView: UIView!
    
    @IBOutlet weak var resourseCView: UIView!
    
    
    @IBOutlet weak var dot1View: UIView!
    @IBOutlet weak var dot2View: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initializeView()
        // Do any additional setup after loading the view.
    }
    
    
    
      func initializeView() {
          self.setGradientBackground()
          self.profile_img.makeRounded()
          self.getCardEffect(cardView: menu_view)
          self.getCardEffect(cardView: steemView)
          self.getCardEffect(cardView: sboView)
          self.getCardEffect(cardView: resourseCView)
          self.getCardEffect(cardView: blanckView)
          self.getBlueDotEffect(cardView: dot1View)
          self.getRedDotEffect(cardView: dot2View)
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


//extension UIImageView {
//
//    func makeRounded() {
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = false
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.cornerRadius = self.frame.height / 2
//        self.clipsToBounds = true
//    }
//    
//
//}
