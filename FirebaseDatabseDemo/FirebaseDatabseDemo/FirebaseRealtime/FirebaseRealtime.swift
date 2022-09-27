//
//  ViewController.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 25/02/22.
//

import UIKit
import FirebaseDatabase

class FirebaseRealtime: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var organization: UITextField!
    
    
    
    
    @IBOutlet weak var dataTableView: UITableView!
    
    var data = [Dictionary<String, AnyObject>]()
    let databse = Database.database().reference()
    var id = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Real Time Database"
        // Do any additional setup after loading the view.
        
        var keysList = Array<Any>()
        
        databse.child("Data").observe(DataEventType.value, with: { [self](snapshot) in

            
            if snapshot.childrenCount > 0 {
                self.data.removeAll()

                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                   keysList.append(snap.key)
                    if let childDic = snap.value as? Dictionary<String, AnyObject> {
                        self.data.append(childDic)
                    }
                    self.dataTableView.reloadData()

                 }
                
                

                
            }
        })
    }

    @IBAction func btnAddEntryClicked(_ sender: Any) {
        
        let org = self.organization.text!
        let nm = self.name.text!
        
        let dataObject: Dictionary = [
            "organization" : org,
            "id" : "\(self.id)",
            "name" : nm,
            ]
        databse.child("Data").childByAutoId().setValue(dataObject) {(data, err) in
            self.organization.text = ""
            self.name.text = ""
        }
    }
    
  
}

extension FirebaseRealtime: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as! DataTableViewCell
        let dict = self.data[indexPath.row]
        
        cell.lblName.text = dict["name"] as? String
        cell.lblOrganization.text = dict["organization"] as? String

        return cell
        
    }
   
    
    
    
}
    
