//
//  SettingsController.swift
//  transport_reality_app
//
//  Created by Артем Стратиенко on 16.04.2021.
//

import UIKit

class SettingsController: UIViewController {

    // custom tint tab bar
    var tabBarTag: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
          
           if tabBarTag == true {
            self.tabBarController?.tabBar.tintColor = #colorLiteral(red: 0.3310849984, green: 0.9619176219, blue: 1, alpha: 1)//UIColor.blue
            self.tabBarController?.tabBar.backgroundColor = #colorLiteral(red: 0.1156016763, green: 0.1961770704, blue: 0.3223885175, alpha: 1)//UIColor.cyan
           } else {
               self.tabBarController?.tabBar.tintColor = UIColor.white
           }
    }

}
