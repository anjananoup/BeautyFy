//
//  Data.swift
//  BeautyFy
//
//  Created by Anjan Kumar Majumder on 11/22/19.
//  Copyright © 2019 anjan. All rights reserved.
//

import UIKit
import SwiftUI

let makeUpData: [ImageModel] = load("m") //load all image with m pref
let noMakeUpData: [ImageModel] = load("n")

func load(_ prefix: String) -> [ImageModel] {
    var data: [ImageModel] = []
    var index = 1
    while let dataImage = UIImage(named: "\(prefix)\(index)") {
        data.append(ImageModel(type: "\(prefix)\(index)", image: dataImage))
        index += 1
    }
    return data
}
