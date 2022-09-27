//
//  HeaderView.swift
//  PageDesignPractice
//
//  Created by Admin on 01/02/22.
//

import UIKit

protocol HeaderDelegate: AnyObject{
    func didClickedHeader(index: Int)
}

class HeaderView: UITableViewHeaderFooterView {

    var delegate: HeaderDelegate?
     var secIndex: Int?
    
    override func awakeFromNib() {
           super.awakeFromNib()

          // titleLabel.text = "Title"
       }

       override init(reuseIdentifier: String?) {
           super.init(reuseIdentifier: reuseIdentifier)
       }

       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
    
    @IBAction func btnClick(_ sender: Any) {
    print("Btn Clicked")
        
        if let index = secIndex {
         delegate?.didClickedHeader(index: index)
        }
    
    }
    
    
}
