//
//  LayerViewController.swift
//  transport_reality_app
//
//  Created by Артем Стратиенко on 17.04.2021.
//

import UIKit

class LayerViewController: UIViewController {
    //
    var myTableView: UITableView  =   UITableView()
    //
    var itemsToLoad: [String] = ["Transport", "Parking", "Carsharing"]
    //
    var switchDemo = UISwitch()
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2039215686, blue: 0.2745098039, alpha: 1)
        view.layer.cornerRadius = 25
        //self.configLayout()
        // Do any additional setup after loading the view.
    }
    func configLayout() {
        view.backgroundColor = #colorLiteral(red: 0.187439276, green: 0.2434635415, blue: 0.3291134392, alpha: 1)
        view.layer.cornerRadius = 25
        
        // заголовок экрана приветсвия
        let titleScreen = UILabel()
        titleScreen.font = UIFont.systemFont(ofSize: 25)
        titleScreen.numberOfLines = 0
        titleScreen.text = "Layers"//"Добро пожаловать в Audio Guide 🎑"
        //
        view.addSubview(titleScreen)
        titleScreen.snp.makeConstraints { (marker) in
            marker.left.right.equalToSuperview().inset(30)
            marker.centerY.equalToSuperview()
            marker.top.equalToSuperview().inset(5)
        }
        //
        switchDemo = UISwitch(frame:CGRect(x: 150, y: 150, width: 0, height: 0))
        switchDemo.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        switchDemo.setOn(true, animated: false)
        view.addSubview(switchDemo)
    }
    @objc func switchStateDidChange(_ sender:UISwitch!)
       {
           if (sender.isOn == true){
               print("UISwitch state is now ON")
           }
           else{
               print("UISwitch state is now Off")
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
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          // Get main screen bounds
          let screenSize: CGRect = UIScreen.main.bounds
          
          let screenWidth = screenSize.width
          let screenHeight = screenSize.height
   
          myTableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight);
        
          myTableView.dataSource = self
          myTableView.delegate = self
          
          myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
          myTableView.backgroundColor = .clear
          self.view.addSubview(myTableView)
          myTableView.snp.makeConstraints { (marker) in
            marker.left.right.equalToSuperview().inset(0)
            marker.top.bottom.equalToSuperview().inset(20)
        }
      }
}
extension LayerViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = self.itemsToLoad[indexPath.row]
        // add switch
        switchDemo = UISwitch(frame:CGRect(x: 150, y: 150, width: 0, height: 0))
        switchDemo.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        switchDemo.setOn(true, animated: false)
        
        cell.addSubview(switchDemo)
        switchDemo.snp.makeConstraints { (marker) in
            //marker.left.right.equalToSuperview().inset(60)
            marker.rightMargin.equalToSuperview().inset(5)
            marker.centerY.equalToSuperview()
            marker.top.equalToSuperview().inset(5)
        }
    return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
         return itemsToLoad.count
     }
     
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
     {
         print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])")
     }
}
