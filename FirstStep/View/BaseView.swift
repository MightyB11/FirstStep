//
//  BaseView.swift
//  FirstStep
//
//  Created by Mighty  on 15/9/2564 BE.
//

import SwiftUI

struct BaseView: View {
    @State var showMenu: Bool = false
    
    var body: some View {
    
        let sideBarWidth = getRect().width - 90
        
        // Whole Navigation View
        NavigationView {
            
            HStack (spacing: 0){
                
                //Side Menu...
                SideMenu(showMenu: $showMenu)
                
    
               
            }

            //Max Size...
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2 )
            // No Nav Bar title...
            //Hiding Nav Bar...
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
