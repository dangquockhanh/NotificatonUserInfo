//
//  UserInfo.swift
//  slideMenuNotificationUserInfo
//
//  Created by Đặng Khánh  on 4/26/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import Foundation
class UserInfo {
    var photo: Data?
    var name: String?
    var address: String?
    init(photo: Data, name: String, address: String) {
        self.name = name
        self.address = address
        self.photo = photo
    }
}
