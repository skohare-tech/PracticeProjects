//
//  ViewController.swift
//  ComplitionHandlerDemo
//
//  Created by SachinK on 26/04/22.
//

import UIKit

class FirstVC: UIViewController {
    
    let secondVc = SecondVC()
    @IBOutlet weak var tfName: UITextField!
    
    

    @IBOutlet weak var lblMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
            
    }

    @IBAction func btnClicked(_ sender: Any) {
//        let vc = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as? SecondVC)!
//        self.navigationController?.pushViewController(vc, animated: true)
        
        self.secondVc.callTestFunction(name: tfName.text!) { (message) in
            print("\(message)")
            self.lblMessage.text = "\(message)"
        }
    }
    
    
    
    
}

