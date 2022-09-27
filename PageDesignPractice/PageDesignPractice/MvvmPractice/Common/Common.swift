//
//  Common.swift
//  PageDesignPractice
//
//  Created by Admin on 18/01/22.
//

import Foundation
import UIKit
struct Constants {
    static let ErrorAlertTitle = "Error"
    static let OkAlertTitle = "Ok"
    static let CancelAlertTitle = "Cancel"
}

struct ApiEndpoints
{
    //static let login = "https://api-dev-scus-demo.azurewebsites.net/api/User/Login"
    static let login = "http://restapi.adequateshop.com/api/authaccount/login"
    
    
}


func common_alert(vc: ViewController, msg: String)
{
    let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    
    vc.present(alert, animated: true, completion: nil)


}
