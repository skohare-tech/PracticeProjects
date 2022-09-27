//
//  SecondVC.swift
//  ComplitionHandlerDemo
//
//  Created by SachinK on 26/04/22.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var tf_input: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func callTestFunction(name: String, handler: @escaping(_ message: String) -> Void ){
  //      print("Enter in function")
        handler("Welcome to Bipp, \(name).\n Thank you!")
        
    }

    

}
