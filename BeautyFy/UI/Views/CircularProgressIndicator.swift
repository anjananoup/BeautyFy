//
//  CircularProgressIndicator.swift
//  BeautyFy
//
//  Created by Anjan Kumar Majumder on 11/22/19.
//  Copyright © 2019 anjan. All rights reserved.
//

import SwiftUI

struct CircularProgressIndicator: View {
    @State var spinCircle = false

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(Color.blue, lineWidth:4)
                .frame(width:100)
                .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
        }
        .onAppear {
            self.spinCircle = true
        }
    }
}

struct CircularProgressIndicator_Previews: PreviewProvider {
    static var previews: some View {
        let circle = CircularProgressIndicator()
        circle.spinCircle = true
        return circle
    }
}
