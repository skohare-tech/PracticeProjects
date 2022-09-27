//
//  MvvmTestViewController.swift
//  PageDesignPractice
//
//  Created by Admin on 13/01/22.
//

import UIKit

class MvvmTestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mvvmcell", for: indexPath) as! MvvmTableviewCell
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableview.register(UINib(nibName: "MvvmTableviewCell", bundle: nil), forCellReuseIdentifier: "mvvmcell")
    }
    

    
}
