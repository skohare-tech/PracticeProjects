//
//  ViewController.swift
//  FilterDesign
//
//  Created by Admin on 25/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView : UICollectionView!
    var content = Content()
    var width = UIScreen.main.bounds.width
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "FilterCell", bundle: nil), forCellWithReuseIdentifier: "FilterCell")
        
        
        collectionView.reloadData()
    }


}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return content.contentType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as? FilterCell else{
            return UICollectionViewCell()
        }
        filterCell.contentView.widthAnchor.constraint(equalToConstant: ( width/2)).isActive = true
        filterCell.contentText.text = content.contentType[indexPath.row]
        filterCell.indexNumber = indexPath.row
        filterCell.delegate = self
        return filterCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: width/2, height: 50)
       }
}
extension ViewController: CellProtocol{
    func passInfo(indexNumber: Int?) {
    self.content.contentType.remove(at: indexNumber ?? 0)
   
    let indexPath = IndexPath(row: indexNumber ?? 0, section: 0)
    print(content.contentType)
        self.collectionView.reloadItems(at: [indexPath])
    
}
    
}
