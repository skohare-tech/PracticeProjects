//
//  ExpnadableTbViewController.swift
//  PageDesignPractice
//
//  Created by Admin on 31/01/22.
//

import UIKit

class ExpnadableTbViewController: UIViewController, HeaderDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var values = [DataModel(headerTitle: "Header 1", subType: ["Sub data 1","Sub data 2","Sub data 3","Sub data 4"], isExpndable: false),
                  DataModel(headerTitle: "Header 2", subType: ["Sub data 1"], isExpndable: false),
                  DataModel(headerTitle: "Header 3", subType: ["Sub data 1","Sub data 2"], isExpndable: false)]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()

        tableView.register(UINib(nibName: "SubViewCell", bundle: nil), forCellReuseIdentifier: "SubViewCell")
        
        
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
    }
    
    func didClickedHeader(index: Int) {
        print("Delgate called")
       values[index].isExpndable  = !values[index].isExpndable
        tableView.reloadSections([index], with: .automatic)
    }
}


extension ExpnadableTbViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return values.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerview = HeaderViewCell(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
//        headerview.delegate = self
//        headerview.secIndex = section
//        headerview.backgroundColor =  .red
//        headerview.btn.setTitle(values[section].headerTitle, for: .normal)
//
//      return tableView.dequeueReusableCell(withIdentifier: "SubViewCell")
        
        let view = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView")  as! HeaderView
        view.delegate = self
        view.secIndex = section
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if values[section].isExpndable {
            return values[section].subType!.count
             
        }else
        {
        return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "SubViewCell") as! SubViewCell
      //  cell.textLabel?.text = values[indexPath.section].subType![indexPath.row]
        return cell
    }
    
    
}
