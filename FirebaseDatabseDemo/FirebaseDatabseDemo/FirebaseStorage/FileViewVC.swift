//
//  FileViewVC.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 11/03/22.
//

import UIKit
import WebKit

class FileViewVC: UIViewController {
    
    var urlString = String()

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

                let url = URL (string: urlString)
               let req = URLRequest(url: url!)
                self.webView.load(req)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
