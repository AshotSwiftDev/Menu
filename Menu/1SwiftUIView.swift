//
//  1SwiftUIView.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 04.05.23.
//

import SwiftUI

struct _SwiftUIView: View {
   
    @State var color1: UIColor = .gray
    @State var id = 0
    var body: some View {
      
        ZStack{
            Color.black
            
            VStack{
               
                HStack{
                    Button {
                       print( a(num: 12, num2: 23))
                    } label: {
                        Text("Plus").frame(width: 100, height: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .padding()
                    }
                    Button {
                        if id == 0 {
                            color1 = .white
                        } else {
                            color1 = .yellow
                        }
                    } label: {
                        ZStack{
                            Color.yellow .frame(width: 90, height: 90)
                                .clipShape(Circle())
                            Image("MOLOTOK")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .scaledToFill()
                        }
                    }
                    
                    Button {
                        color1 = .blue
                    } label: {
                        ZStack{
                            Color.blue .frame(width: 90, height: 90)
                                .clipShape(Circle())
                            
                            
                            Image("MOLOTOK")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .scaledToFill()
                        }
                    }
                    
                    Button {
                        color1 = .red
                    } label: {
                        ZStack{
                            Color.red .frame(width: 90, height: 90)
                                .clipShape(Circle())
                            
                            
                            Image("MOLOTOK")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .scaledToFill()
                        }
                    }
                    
                    Button {
                        color1 = .green
                    } label: {
                        ZStack{
                            Color.green .frame(width: 90, height: 90)
                                .clipShape(Circle())
                            Image("MOLOTOK")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .scaledToFill()
                        }
                    }
                }.offset(y: -300)
            }
        
            VStack{
                Button {
                    id = 1
                } label: {
                    ZStack{
                        if id == 1 {
                            let color = color1
                            Color(color)
                        }else{
                            Color(.white)
                        }
                    }.frame(width: 200, height: 60)
                        .cornerRadius(20)
                }
                
                Button {
                    id = 2
                } label: {
                    ZStack{
                        if id == 2 {
                            let color = color1
                            Color(color)
                        }else{
                            Color(.white)
                        }
                    }.frame(width: 200, height: 60)
                        .cornerRadius(20)
                }
            }
        }.ignoresSafeArea()
       

        }
   
    func a <T:  BinaryFloatingPoint >(num: T, num2: T) -> T {
        return num + num2
    }
    
    
    
    
}

struct _SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        _SwiftUIView()
    }
}


