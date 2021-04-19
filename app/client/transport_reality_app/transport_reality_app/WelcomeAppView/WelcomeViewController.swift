//
//  WelcomeViewController.swift
//  transport_reality_app
//
//  Created by Артем Стратиенко on 16.04.2021.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
        // Do any additional setup after loading the view.
    }
    
    func configLayout() {
        view.backgroundColor = #colorLiteral(red: 0.7590399673, green: 0.7374965167, blue: 0.5871765646, alpha: 1)
        // заголовок экрана приветсвия
        let titleScreen = UILabel()
        titleScreen.font = UIFont.systemFont(ofSize: 30)
        titleScreen.numberOfLines = 0
        titleScreen.text = "Welcome to Public Transport Riga 🚇"//"Добро пожаловать в Audio Guide 🎑"
        //
        view.addSubview(titleScreen)
        titleScreen.snp.makeConstraints { (marker) in
            marker.left.right.equalToSuperview().inset(30)
            marker.top.equalToSuperview().inset(80)
        }
        // button continie
        let startTour = UIButton(type: .system)
        startTour.backgroundColor = #colorLiteral(red: 0.3759136491, green: 0.6231091984, blue: 0.6783652551, alpha: 1)
        startTour.setTitle("Routes", for: .normal)
        startTour.setTitleColor(.white, for: .normal)
        startTour.layer.cornerRadius = 15

        view.addSubview(startTour)
        startTour.snp.makeConstraints { (marker) in
            marker.bottom.equalToSuperview().inset(20)
            marker.centerX.equalToSuperview()
            marker.width.equalTo(200)
            marker.height.equalTo(40)
        }
        startTour.addTarget(self, action: #selector(showApp), for: .touchUpInside)
        // page controll
        let pageControl = UIPageControl()
            pageControl.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
            pageControl.numberOfPages = 2;
            pageControl.currentPage = 0;
            view.addSubview(pageControl)
        pageControl.snp.makeConstraints { (marker) in
            marker.bottom.equalTo(startTour).inset(40)
            marker.left.right.equalToSuperview().inset(30)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WelcomeViewController {
    @objc func showApp() {
        let viewTours = MainViewController()
            //startTest.modalTransitionStyle = .flipHorizontal
        viewTours.modalPresentationStyle = .fullScreen
        viewTours.modalTransitionStyle = .crossDissolve
        show(viewTours, sender: self)
            //present(startTest, animated: true, completion: nil)
        print("Launch second controller")
    }
}
