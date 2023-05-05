//
//  UserModel.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 17.02.23.
//

import Foundation


struct UserModel {
    var id: String
    var name: String
    var subjectName: String
    var number: String
    var subjectAddress: String

    var isLogined = false
    
    init(id: String, data: [String: Any]) {
       
        self.name = data["name"] as? String ?? ""
        self.subjectName = data["subjectName"] as? String ?? ""
        self.number = data["number"] as? String ?? ""
        self.subjectAddress = data["subjectAddress"] as? String ?? ""
        self.id = data["id"] as?  String ?? ""
    }
}
