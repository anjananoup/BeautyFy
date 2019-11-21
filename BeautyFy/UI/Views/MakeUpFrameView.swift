//
//  MakeUpFrameView.swift
//  BeautyFy
//
//  Created by Anjan Kumar Majumder on 11/22/19.
//  Copyright © 2019 anjan. All rights reserved.
//
import Foundation
import SwiftUI

struct MakeUpFrameView: View {
    let imageName: String
    let frameSize: CGFloat //currently support 256x256
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: frameSize, height: frameSize)
            .border(Color.gray.opacity(0.5), width: 1)
            .cornerRadius(5)
    }
}

struct MakeUpFrameView_Previews: PreviewProvider {
    static var previews: some View {
        MakeUpFrameView(imageName: "n13", frameSize: 180)
    }
}
