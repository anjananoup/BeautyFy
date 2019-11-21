//
//  MakeUpOutputFrameView.swift
//  BeautyFy
//
//  Created by Anjan Kumar Majumder on 11/22/19.
//  Copyright © 2019 anjan. All rights reserved.
//

import SwiftUI

struct MakeUpOutputFrameView: View {

    let makeUpImage: UIImage
    let noMakeUpImage: UIImage
    let frameSize: CGFloat //currently support 256x256
    
    var oututImage: UIImage {
        let group = DispatchGroup()
        group.enter()
        var genImage: UIImage?
        MakeUpMLManager.instance.makeOver(makeUpModel: makeUpImage, noMakeUpModel: noMakeUpImage) { result in
            switch result {
            case .success(let image):
                genImage = image
            case .failure(let error):
                print("Makeover Faild: \(error.localizedDescription)")
            }
            group.leave()
        }
        group.wait()
        return genImage ?? UIImage()
    }
    var body: some View {
        Image(uiImage: oututImage)
            .resizable()
            .frame(width: frameSize, height: frameSize)
            .border(Color.gray.opacity(0.5), width: 1)
            .cornerRadius(10)
    }
}

//struct MakeUpOutputFrameView_Previews: PreviewProvider {
//    static var previews: some View {
//        let user = UserData()
//        return MakeUpOutputFrameView(image: user.noMakeUpModels[0].image, frameSize: 180)
//    }
//}
