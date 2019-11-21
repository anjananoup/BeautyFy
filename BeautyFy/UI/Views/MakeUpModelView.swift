//
//  MakeUpModelView.swift
//  BeautyFy
//
//  Created by Anjan Kumar Majumder on 11/22/19.
//  Copyright © 2019 anjan. All rights reserved.
//

import SwiftUI


/// TitleOverlay
struct TitleOverlay: View {
    
    /// name
    let name: String
    
    /// gradient colors
    let colors: [Color] = [Color.gray.opacity(0.5), Color.gray.opacity(0)]
    
    /// gradient
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors),
                       startPoint: .bottomLeading, endPoint: .center)
    }
    
    /// body
    var body: some View {
        
        // ZStack - places views above each other
        ZStack(alignment: .bottomLeading) {
            
            // create a rectagular gradient from bottomLeading edge to center edge
            Rectangle().fill(gradient).cornerRadius(8)
            
            // create text above the gradient
            Text(name).font(.footnote).bold().lineLimit(1).padding(5)
        }
        .foregroundColor(.white)
    }
}


/// MakeUpCellView
struct MakeUpCellView: View {
    /// Image Model
    let status: ImageModel
    
    /// body
    var body: some View {
        
        // status image
        Image(uiImage: status.image)
            .resizable()
            .frame(width: 150, height: 150) // image frame
            
             // create outer view with border (color, width)
            .border(Color.gray.opacity(0.5), width: 0.5)
            
             // apply cornerRadius to hide visible cut out after applying border
            .cornerRadius(8)
            
            // for creating dark shadow behind the text
            .overlay(TitleOverlay(name: status.type))
    }
}

struct MakeUpCellView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return MakeUpCellView(status: userData.makeUpModels[1]).environmentObject(userData)
    }
}
