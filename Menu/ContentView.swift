//
//  ContentView.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 16.02.23.
//

import SwiftUI

struct ContentView: View {
    
    let uid = FirebaseConfig.shared.auth.currentUser?.uid
    
    var body: some View {
        if uid != nil {
            MyTabView()
            
        }else{
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
