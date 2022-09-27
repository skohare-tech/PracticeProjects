//
//  FilterCell.swift
//  FilterDesign
//
//  Created by Admin on 25/03/22.
//

import UIKit
protocol CellProtocol:AnyObject{
    func passInfo(indexNumber: Int?)
}

class FilterCell: UICollectionViewCell {
    var indexNumber: Int?
    @IBOutlet weak var filterView : UIView!
    @IBOutlet weak var contentText : UILabel!
    weak var delegate : CellProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        filterView.layer.cornerRadius = 4
        filterView.layer.borderWidth = 0.5
        filterView.layer.borderColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 0.3512583347)
    }
    @IBAction func deleteAction(){
        delegate?.passInfo(indexNumber: indexNumber)
    }
}
