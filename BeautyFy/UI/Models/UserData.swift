//
//  UserData.swift
//  BeautyFy
//
//  Created by Anjan Kumar Majumder on 11/22/19.
//  Copyright © 2019 anjan. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var makeUpModels = makeUpData
    @Published var noMakeUpModels = noMakeUpData
    @Published var inputMakeUp = makeUpData[0].image
    @Published var inputNoMakeUp = noMakeUpData[0].image
}
