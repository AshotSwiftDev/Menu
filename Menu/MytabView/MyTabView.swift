//
//  MyTabView.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 20.02.23.
//

import SwiftUI


struct MyTabView: View {
    
    var body: some View {
        ZStack{
            TabView{
                MenuView()
                    .tabItem {
                        Image(systemName: "house")
                            .foregroundColor(.red)
                        Text("Menu")
                            .foregroundColor(.white)
                    }
               ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                            .foregroundColor(.white)
                    }
            }.tint(Color.black)
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
