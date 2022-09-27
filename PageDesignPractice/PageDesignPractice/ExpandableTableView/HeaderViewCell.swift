//
//  HeaderViewCell.swift
//  PageDesignPractice
//
//  Created by Admin on 31/01/22.
//

import UIKit

//protocol HeaderDelegate{
//    func didClickedHeader(index: Int)
//}

class HeaderViewCell: UIView {
   var delegate: HeaderDelegate?
    var secIndex: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var btn: UIButton = {
        
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        btn.backgroundColor = .red
        btn.titleLabel?.textColor = .white
        btn.addTarget(self, action: #selector(onClickHeaderView), for: .touchUpInside)
        return btn
        
    }()
    
    @objc func onClickHeaderView() {
        print("Header clicked")
        
        if let index = secIndex {
         delegate?.didClickedHeader(index: index)
        }
        
    }
    

}
