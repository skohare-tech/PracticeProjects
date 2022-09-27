//
//  SoundHapticsVC.swift
//  PageDesignPractice
//
//  Created by Admin on 19/01/22.
//

import UIKit

class SoundHapticsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let sections = ["VIBRATE", "HEADPHONE AUDIO", "RINGER ALERTS", "SOUND AND VIBRATION PATTERNS"]
    
    let svp = ["Ringtone","Text Tone","New Voice Mail","New Mail","Sent Mail","Calender Alerts","Remider Alerts","AirDrops"]
    
    let vb = ["Vibrate on ring", "Vibrate on silent"]
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0)
        {
            return 2
        }
        else if (section == 1)
        {
            return 1
        }else if (section == 2)
        {
            return 2
        }else if (section == 3)
        {
            return 8
        }
        else{
        
            return 2

        }
                    
                    
    }
//
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if(indexPath.section == 3)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sh_cell1", for: indexPath) as! SHCellView1
            cell.lblSVPName.text = svp[indexPath.row]
            return cell
        }
        else if(indexPath.section == 2)
        {
            if(indexPath.row == 0)
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "sh_cell3", for: indexPath) as! SHCellView3
                return cell
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "sh_cell2", for: indexPath) as! SHCellView2
                cell.lblVbType.text = "Change with Buttons"

                return cell
            }
            
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "sh_cell2", for: indexPath) as! SHCellView2
            
            if(indexPath.section == 0)
            {
                cell.lblVbType.text = vb[indexPath.row]
                
            }else if(indexPath.section == 1){
                
                cell.lblVbType.text = "Headphone Safty"

                
            }
            return cell
        }
        
        
          
            
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.register(UINib(nibName: "SHCellView1", bundle: nil), forCellReuseIdentifier: "sh_cell1")
        
        tableView.register(UINib(nibName: "SHCellView2", bundle: nil), forCellReuseIdentifier: "sh_cell2")
        
        
        tableView.register(UINib(nibName: "SHCellView3", bundle: nil), forCellReuseIdentifier: "sh_cell3")
        
        
    }
    

    
}
