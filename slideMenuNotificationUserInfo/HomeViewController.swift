//
//  HomeViewController.swift
//  slideMenuNotificationUserInfo
//
//  Created by Đặng Khánh  on 4/26/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit
protocol MenuDelegate {
    var showing: Bool {get set}
}


class HomeViewController: UIViewController {
    
    var delegate: MenuDelegate?
    @IBOutlet weak var photoHome: UIImageView!
    @IBOutlet weak var nameHome: UILabel!
    @IBOutlet weak var addressHome: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         registerNotification()
    }
    
  
    
   
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .passUserInfo, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @objc
    func handleNotification(_ notification: Notification) {
        guard let imageData = notification.userInfo?["photo"] as? Data else {return}
        guard let name = notification.userInfo?["name"]  as? String else {return}
        guard let address = notification.userInfo?["address"]  as? String else {return}
        nameHome.text = name
        addressHome.text = address
        photoHome.image = UIImage(data: imageData)
    }

    
    @IBAction func menuButton(_ sender: Any) {
        delegate?.showing = true
        
    }
  
    
}



