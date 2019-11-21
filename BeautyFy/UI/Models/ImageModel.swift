//
//  ImageModel.swift
//  BeautyFy
//
//  Created by Anjan Kumar Majumder on 11/22/19.
//  Copyright © 2019 anjan. All rights reserved.
//

import SwiftUI

struct ImageModel: Identifiable {
    // unique id
    var id: String = UUID().uuidString
    
    /// user name
    let type: String
    
    /// user profile avatar
    let image: UIImage
    
    /// Init
    init(type: String, image: UIImage) {
        self.type = type
        self.image = image
    }
}
