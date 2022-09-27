//
//  FireStoreVC.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 03/03/22.
//

import UIKit
import FirebaseFirestore

class FireStoreVC: UIViewController {
    let firestoreVm = FirestoreViewModel()
    

    @IBOutlet weak var tableView: UITableView!
    let databse = Firestore.firestore()
   // var data = [Dictionary<String, AnyObject>]()
    var users = [UserModel]()


    
    @IBOutlet weak var dataTableview: UITableView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfOrganization: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Firestore Database"
//        firestoreVm.getData(){ [weak self](users) in
//            self?.users = users
//            self?.dataTableview.reloadData()
//        }
//            //step 4, finishing the execution
        
        
        // Do any additional setup after loading the view.
        let ref = databse.collection("Firestore")

        ref.getDocuments() { snapshot, error in
            
            self.users.removeAll()
            self.firestoreVm.getData(){ [weak self](users) in
                self?.users = users
                self?.dataTableview.reloadData()
            }
            
//            for document in snapshot!.documents {                      //print("\(document.documentID) => \(document.data())")
//                                 //   let data = document.data()
//              //  print(data)
//
//            }
//
//           // print(data)
            
        }
    }
    
    @IBAction func btnSubmit(_ sender: Any) {
        let doc = "Doc-\(Int.random(in: 0..<100))"
        let ref = databse.collection("Firestore").document(doc)
        ref.setData(["Name" : tfName.text!, "Organization": tfOrganization.text!]) {
            
            error in
            if let err = error {
                print(err)
            }
            else {
                print("Data submitted")
                self.tfOrganization.text=""
                self.tfName.text=""
            }
                
        }

    }
    
}


extension FireStoreVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "FireStoreDataCell", for: indexPath) as! FireStoreDataCell
        if  let name = users[indexPath.row].name
        {
            cell.lblName.text = name
        }
        
        if  let org = users[indexPath.row].organization
        {
            cell.lblOrganization.text = org
        }
        
       // let dict = self.data[indexPath.row]
        return cell
        
    }
   

}
