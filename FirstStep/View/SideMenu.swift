//
//  SideMenu.swift
//  FirstStep
//
//  Created by Mighty  on 15/9/2564 BE.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment:.leading, spacing: 5){
                
                Image("Logo") //add logo of app
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:275, height:100)
                    .cornerRadius(40)
                    .padding()
                    .padding(.leading, 20)

                
                ScrollView(.vertical, showsIndicators: false){
                    
                    VStack{
                        
                        VStack(alignment: .leading, spacing: 20){
                            
                            //Tap Buttons
                            TapButton(title: "Home", image: "Home")
                                
                            
                            TapButton(title: "Journey", image: "Journey")
                                .background(
                                    Color(red: 169/255, green: 211/255, blue: 205/255)
                                        .frame(width:getRect().width, height:getRect().height/13)
                                        
                                
                                )
                                
                            TapButton(title: "Achievements", image: "Achievements")
                            
                            TapButton(title: "Leaderboard", image: "Leaderboard")
                                .background(
                                    Color(red: 169/255, green: 211/255, blue: 205/255)
                                        .frame(width:getRect().width, height:getRect().height/13)
                                        
                                
                                )
                            
                            
                            TapButton(title: "FAQ", image: "FAQ")
                            
                            TapButton(title: "Settings", image: "Settings")
                                .background(
                                    Color(red: 169/255, green: 211/255, blue: 205/255)
                                        .frame(width:getRect().width, height:getRect().height/13)
                                        
                                
                                )
                        
                    }
                        
                    }
                    .padding()
                    .padding(.leading, 95)
                    .padding(.top,35)

                }
                
                
                
                
            }
            
            
        }
        .padding(.vertical)
        .frame(maxWidth:.infinity, alignment:.leading)
        //Max Width
        .frame(width:getRect().width - 100)
        .frame(maxHeight: .infinity)
        .background(
            
            Color(red: 181/255, green: 226/255, blue: 221/255)
                .ignoresSafeArea(.container, edges: .vertical))
        
    }
    
    @ViewBuilder
    func TapButton(title: String, image: String)-> some View {
        Button {
            
        } label: {
            HStack(spacing: 15){
                
                Image(image)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                
                Text(title)
            }
            .foregroundColor(.white)
            .font(Font.custom("CookieRunOTF Black", size:18))
            .frame(maxWidth:.infinity,alignment:.leading)
            
                
        }
        .padding(.leading)
            
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

// Extending View to get Screen Rect...
extension View {
    func getRect() ->CGRect{
        return UIScreen.main.bounds
    }
}
