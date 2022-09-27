//
//  ProfileVcWithTableviewViewController.swift
//  PageDesignPractice
//
//  Created by Admin on 12/01/22.
//

import UIKit

class ProfileVcWithTableviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        
        if indexPath.row == 0
        {
            let cell = tableview.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CellView1
            return cell
        }
        else if indexPath.row == 1
        {
            let cell = tableview.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CellView2
            return cell
        }
        else{
            
            let cell = tableview.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! CellView3
            return cell
            
        }

       
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.register(UINib(nibName: "CellView1", bundle: nil), forCellReuseIdentifier: "cell1")
        tableview.register(UINib(nibName: "CellView2", bundle: nil), forCellReuseIdentifier: "cell2")
        
        tableview.register(UINib(nibName: "CellView3", bundle: nil), forCellReuseIdentifier: "cell3")
    }
    
    
    
}
