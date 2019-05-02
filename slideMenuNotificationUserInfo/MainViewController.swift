//
//  MainViewController.swift
//  slideMenuNotificationUserInfo
//
//  Created by Đặng Khánh  on 4/26/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let toggleSideMenu                 = Notification.Name("toggleSideMenu")
    static let passUserInfo                   = Notification.Name("passUserInfo")
    
}


protocol MenuDelegates {
    var showings: Bool {get set}
}


class MainViewController: UIViewController, MenuDelegate {
   
    var showing = false {
        didSet {
            UIView.animate(withDuration: 0.35, animations: {
                self.leadingViewMenu.constant = self.showing ? 0 : -self.viewMenu.bounds.width
                self.buttonMain.alpha = self.showing ? 1 : 0
                self.view.layoutIfNeeded()
            })
        }
    }

    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var buttonMain: UIButton!
    @IBOutlet weak var viewToHome: UIView!
    @IBOutlet weak var leadingViewMenu: NSLayoutConstraint!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        showing = false
        registerNotification()
        
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(backMenu(_:)), name: .toggleSideMenu, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? UINavigationController else {return}
        let vc1 = vc.topViewController as? HomeViewController
        vc1?.delegate = self
    }
    
   
    @IBAction func backMenu(_ sender: Any) {
        showing = !showing
    }
    
}

