//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by SachinK on 11/04/22.
//

import UIKit

class DataVc: UIViewController {
    
    var name: String?
    var address: String?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DATA"
        self.addButton()
        // Do any additional setup after loading the view.
        
        myTextField.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
        
        fetchEmployee()
        
//
//        let arr = [43,57,2,44,54,65]
//        var first = arr[0]
//        var second = arr[0]
//
//        for num in arr {
//            if num >= first {
//                first = num
//            }
//            if num >= second && num != first{
//                second = first
//            }
//        }
//        print("First: \(first)")
//        print("Second: \(second)")
    }

    
    @objc func myTargetFunction(textField: UITextField) {
        print("")
    }

    func addButton() {
        let btn = UIButton()
        btn.frame = CGRect(x:0, y:0, width: 60, height: 35)
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 51/255, green: 51/255, blue: 1, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(addData), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItem = barButton

    }
    
    // Implement the addName IBAction
    @objc func addData() {
        
        let alert = UIAlertController(title: "Add Employee", message: "Add name and address", preferredStyle: .alert)
                                      
          alert.addTextField { (name) in
               name.text = ""
               name.placeholder = "Full name"
           }
          alert.addTextField { (address) in
              address.text = ""
              address.placeholder = "Enter address"
          }
        
          
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
              let nameField = alert?.textFields![0] // Force unwrapping because we know it exists.
              let addressFields = alert?.textFields![1]

              let name = nameField?.text
              let address = addressFields?.text
              
              
              if name == "" || address == "" {
                 print("Enter valid employee data")
                      } else {
                          if let fullName  = name {
                          print("Hello, \(fullName)")
                              self.name = fullName
                          }
                          
                          if let adrs  = address {
                              self.name = adrs
                          }

                          self.addEmployee()
                          }
              
          }))
        
        
          self.present(alert, animated: true, completion: nil)
    }
    
    func addEmployee() {
        let emp = Employee(context: PersistantStorage.shared.context)
        emp.address = self.name
        emp.address = self.address
        emp.id = 1
        PersistantStorage.shared.saveContext()
    }
    func fetchEmployee()
    {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(path)
        do {
           guard let reuslt = try PersistantStorage.shared.context.fetch(Employee.fetchRequest()) as? [Employee] else {return}
            reuslt.forEach({debugPrint($0)})
        }
        catch let error {
            debugPrint(error)
        }
    }
    
    
}


extension DataVc: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as? DataCell else {return UITableViewCell()}
                return cell
        
    }
    
    
    
    
}
