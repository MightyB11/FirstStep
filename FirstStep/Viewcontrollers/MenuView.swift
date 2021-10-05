//
//  MenuView.swift
//  FirstStep
//
//  Created by Mighty  on 28/8/2564 BE.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "person")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding(.top,100)
            HStack{
                Image(systemName: "envelope")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Journey")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding(.top,30)
            HStack{
                Image(systemName: "gear")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding(.top,30)
            Spacer()
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 50/255, green: 90/255, blue:100/255 ))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
