//
//  HorTableDemo.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 21/03/22.
//

import UIKit

class HorTableDemo: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.setTableView()
    }
    func setTableView()
    {
        tableView.rowHeight = 450.0
        tableView.separatorStyle = .singleLine
          // Rotates the view.
          let transform = CGAffineTransform(rotationAngle: -1.5707963)
        tableView.transform = transform
          // Repositions and resizes the view.
          let contentRect = CGRect(x: 0, y: 30, width: 500, height: 200)
        tableView.frame = contentRect
        tableView.isPagingEnabled = true
    }
}


extension HorTableDemo: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "HorTabCell", for: indexPath) as? HorTabCell else {return UITableViewCell()
        }
        
        
        self.tableView.contentInset = UIEdgeInsets(top: (tableView.bounds.height/2 - cell.bounds.height/2), left: 0, bottom: 0, right: 0)

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let transform = CGAffineTransform(rotationAngle: 1.5707963)
        cell.transform = transform
    }

}


extension CGRect {
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}
