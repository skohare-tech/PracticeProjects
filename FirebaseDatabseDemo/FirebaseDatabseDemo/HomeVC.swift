//
//  HomeVC.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 11/03/22.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func btnClicked(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        
        switch(tag)
        {
        case 1:
            print("Case 1")
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirebaseRealtime") as? FirebaseRealtime
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case 2:
            print("Case 2")
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FireStoreVC") as? FireStoreVC
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case 3:
            print("Case 3")
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FBStorageVC") as? FBStorageVC
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
        case 4:
            print("Case 4")
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FBStorageVC") as? FBStorageVC
            self.navigationController?.pushViewController(vc!, animated: true)
            break
            
            
        case 5:
            print("Case 5")
            break
            
        case 6:
            print("Case 6")
//            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HorTableDemo") as? HorTableDemo
//            self.navigationController?.pushViewController(vc!, animated: true)
            
            showMyViewControllerInACustomizedSheet()
        
            break
            
        default:
            break
            
        }
        
        
    }
    
    func showMyViewControllerInACustomizedSheet() {
       // let viewControllerToPresent = DemoBottomsheetVC()
        let viewControllerToPresent = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DemoBottomsheetVC") as? DemoBottomsheetVC
        if let sheet = viewControllerToPresent?.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(viewControllerToPresent!, animated: true, completion: nil)
    }
    
}
