//
//  TabViewController.swift
//  transport_reality_app
//
//  Created by Артем Стратиенко on 16.04.2021.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = TransportMapView()
        let tabOneBarItem = UITabBarItem(title: "Transport", image: UIImage(named: "transport_toogle_svg"), selectedImage: UIImage(named: "transport_toogle_svg"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = TourViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Tour", image: UIImage(named: "tour_guide"), selectedImage: UIImage(named: "tour_guide"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab tree
        let tabTree = SettingsController()
        let tabTreeBarItem3 = UITabBarItem(title: "Settings", image: UIImage(named: "custom_property"), selectedImage: UIImage(named: "custom_property"))
        
        tabTree.tabBarItem = tabTreeBarItem3
        
        
        self.viewControllers = [tabOne, tabTwo, tabTree]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let appearance = UITabBarAppearance()
        //appearance.backgroundColor = #colorLiteral(red: 0.3791669923, green: 0.4272061604, blue: 0.434493125, alpha: 0.5) //.red
        
        tabBar.standardAppearance = appearance
        print("Selected \(viewController.title!)")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 55
        tabBar.frame.origin.y = view.frame.height - 55
    }
}
