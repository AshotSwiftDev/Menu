//
//  ProductCell.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 16.02.23.
//

import SwiftUI

struct ProductCell: View {
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var image: String
    var name: String
    var description: String
    var netto: String
    var price: String
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.4).blur(radius: 0.2)
            ZStack(alignment: .center){
                Image("productBackgrounImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Color.white.opacity(0.1)
                
                VStack(spacing: 0){
                    
                    AsyncImage(url: URL(string: image)) {images in
                        images
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 160,height: 120)
                            .cornerRadius(20)
                            .padding()
                    }placeholder: {
                        VStack{
                            ProgressView()
                        }
                        .frame(width: 160,height: 120)
                        .padding()
                    }
                    ZStack{
                        Color.buttonColor
                            .cornerRadius(12)
                        Text(name)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    } .frame(width: 140 ,height: 20)
                    HStack(spacing: 0){
                        Text(description)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                    }.frame(width: 140 ,height: 40)
                    HStack(spacing: 0){
                        Text("Netto:")
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(netto) e")
                            .foregroundColor(.white)
                    }.padding(.horizontal)
                    HStack(spacing: 0){
                        Text("Price:")
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(price) $")
                            .foregroundColor(.white)
                    }.padding(.horizontal)
                        .padding(.bottom, 10)
                    
                }.frame(width: width / 2.3,height:  250)
                    .cornerRadius(20)
            }
        }.frame(width: width / 2.28,height:  251)
            .cornerRadius(20)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(image: "3", name: "aattttttttaa", description: "attttttttytyyuyuyuyiyiyiyaaa", netto: "12", price: "123" )
    }
}
