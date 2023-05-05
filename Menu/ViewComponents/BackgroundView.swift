//
//  BackgroundView.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 16.02.23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack{
            Color.black
            Image("backgrounImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .opacity(0.7)
        }.ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
