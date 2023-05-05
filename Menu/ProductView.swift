//
//  ProductView.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 21.02.23.
//

import SwiftUI

struct ProductView: View {
    @State var image: String
    @State var name: String
    @State var description: String
    @State var netto: String
    @State var price: String
    
    var body: some View {
        ZStack{
            TabViewBackground()
            VStack {
                ZStack(alignment: .top){
                    Color.white
                        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 1.3).opacity(0.4)
                        .cornerRadius(18)
                        .padding(.top, -10)
                        .blur(radius: 20)
                    VStack{
                        Color.black
                            .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 1.3)
                            .cornerRadius(20)
                            .padding(.top, -10)
                        Spacer()
                    }
                    VStack(){
                        AsyncImage(url: URL(string: image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width - 30, height: 260)
                                .cornerRadius(10)
                                .padding(.top, 100)
                            
                        } placeholder: {
                            VStack{
                                ProgressView().foregroundColor(.white)
                            }
                            .frame(width: UIScreen.main.bounds.width - 30, height: 260)
                        }
                        
                        VStack{
                            VStack(alignment: .leading){
                                HStack(spacing: 0){
                                    Text("Name:")
                                        .font(.system(size: 22))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(name)
                                        .font(.system(size: 22))
                                        .foregroundColor(.white)
                                }
                                
                                VStack(alignment: .leading, spacing: 0){
                                    
                                    Text("description:")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22))
                                        .padding(.bottom, 6)
                                    ZStack(alignment: .topLeading){
                                        Color.white
                                        Text(description).padding(.horizontal, 10)
                                            .foregroundColor(.black)
                                    }.frame(width: UIScreen.main.bounds.width - 40, height: 80)
                                        .cornerRadius(12)
                                }.padding(.vertical, 6)
                                
                                HStack{
                                    Text("netto:")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(netto)
                                        .foregroundColor(.white)
                                    
                                }.padding(.vertical, 6)
                                HStack{
                                    Text("price:")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(price)
                                        .foregroundColor(.white)
                                }
                            }.padding(.horizontal, 30)
                        }
                    }.padding(.top)
                }
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(image: "https://firebasestorage.googleapis.com:443/v0/b/menu-app-3d780.appspot.com/o/RUuakykVKGQSpP7qMHLy?alt=media&token=1e205a25-c0a2-4596-90a3-8a1dbd44cc6d", name: "aaa", description: "aaa", netto: "aaa", price: "aaa")
    }
}

