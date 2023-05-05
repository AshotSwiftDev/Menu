//
//  TabViewBackground.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 20.02.23.
//

import SwiftUI

struct TabViewBackground: View {
    var body: some View {
        ZStack{
            Color.black
            
            Image("backgrounImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .opacity(0.2)
            VStack{
                Spacer()
                Color.white.frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height / 10)
            }
        }.ignoresSafeArea()
    }
}

struct TabViewBackground_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBackground()
    }
}
