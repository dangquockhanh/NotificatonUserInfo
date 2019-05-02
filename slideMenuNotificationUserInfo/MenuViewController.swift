//
//  MenuViewController.swift
//  slideMenuNotificationUserInfo
//
//  Created by Đặng Khánh  on 4/26/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit
struct Users {
    var photo: Data?
    var name: String?
    var address: String?
    
}


class MenuViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoMenu: UIImageView!
    @IBOutlet weak var nameMenu: UITextField!
    @IBOutlet weak var addressMenu: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoMenu.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(sender: UIButton) {
        if let photoData = photoMenu.image?.pngData() {
            NotificationCenter.default.post(name: .passUserInfo,
                                            object: nil,
                                            userInfo: ["photo": photoData ,
                                                       "name": nameMenu.text ?? "", "address": addressMenu.text ?? ""])
            
            NotificationCenter.default.post(name: .toggleSideMenu, object: nil)
            
        }
        
    }
    
    
}
