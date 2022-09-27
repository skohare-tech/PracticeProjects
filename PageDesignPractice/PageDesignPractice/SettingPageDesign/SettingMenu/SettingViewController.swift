//
//  SettingViewController.swift
//  PageDesignPractice
//
//  Created by Admin on 19/01/22.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    let settingMenus = [ "", "Airplane Mode", "Wi-Fi", "Bluetooth", "Mobile Data", "Personal Hotspot", "Notifications", "Control Center", "Sound & Haptics"]
    
    let seetingMenuIcons: [UIImage] = [UIImage(named: "icon_airplane")!, UIImage(named: "icon_airplane")!, UIImage(named: "icon_wifi")!, UIImage(named: "icon_bluetooth")!, UIImage(named: "icon_data")!,UIImage(named: "icon_hotspot")!,UIImage(named: "icon_notification")!,UIImage(named: "icon_notification")!,UIImage(named: "icon_sound")! ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingMenus.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if(indexPath.row % 2 != 0)
        {
            let altColor = UIColor(white: 1.0, alpha: 0.5)
            cell.backgroundColor = altColor
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0)
        {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting_cell1", for: indexPath) as! SettingCellView1
        return cell
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "setting_cell2", for: indexPath) as! SettingCellView2
            cell.menu_icon.image = seetingMenuIcons[indexPath.row]
            cell.lblMenuName.text=settingMenus[indexPath.row]
            return cell
            
        }
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
        if(indexPath.row == 8 )
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SoundHapticsVC") as? SoundHapticsVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   self.title = "Setting"

        // Do any additional setup after loading the view.
        
        tableview.register(UINib(nibName: "SettingCellView1", bundle: nil), forCellReuseIdentifier: "setting_cell1")
        
        
        tableview.register(UINib(nibName: "SettingCellView2", bundle: nil), forCellReuseIdentifier: "setting_cell2")
    }
    

    
    
    

}
