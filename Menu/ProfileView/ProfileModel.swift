//
//  ProfileModel.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 20.02.23.
//

import Foundation


struct ProfileModel {
   
    var uid: String
    var email: String
    var name: String
    var subjectName: String
    var number: String
    var subjectAddress: String
    var isLogined = false   
}

struct AuthModel {
    var email = ""
    var password = ""
}
