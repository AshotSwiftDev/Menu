//
//  LoginViewModel.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 17.02.23.
//
import SwiftUI
import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    
    @Published var authMadel: AuthModel
    @Published var  userModel: UserModel
    
    init(authMadel: AuthModel, userModel: UserModel){
        self.authMadel = authMadel
        self.userModel = userModel
    }
    func creatAccount(){
        
        Auth.auth().createUser(withEmail: authMadel.email, password: authMadel.password) { authResult, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.userModel.isLogined = true
            self.creatUserInfo()
        }
    }
    
    func logIn(){
        Auth.auth().signIn(withEmail: authMadel.email, password: authMadel.password) { authResult, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.userModel.isLogined = true
        }
    }
    func creatUserInfo(){
        
        let fullNumber = "+ 374 " + userModel.number
        
        guard let uid = FirebaseConfig.shared.auth.currentUser?.uid else { return }
        
        let document = FirebaseConfig.shared.firestore.collection("Users")
            .document(uid)
            .collection("user")
            .document()
        
        let user = [
            "uid" : uid,
            "name" : userModel.name,
            "subjectName" : userModel.subjectName,
            "subjectAddress" : userModel.subjectAddress,
            "email" : authMadel.email,
            "number": fullNumber
            
        ] as [String : Any]
        
        document.setData(user) {error in
            if let error = error {
                print("No SetData",  error.localizedDescription)
            }
        }
    }
}
