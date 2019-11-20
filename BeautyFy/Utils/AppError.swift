//
//  File.swift
//  BeautyFy
//
//  Created by Anjan Kumar Majumder on 11/21/19.
//  Copyright © 2019 anjan. All rights reserved.
//

import Foundation

enum AppError: Error {
    case ImageConvertError(String)
    case CommonError(String)

    var localizedDescription: String {
        switch self {
        case .ImageConvertError(let errorMsg),
             .CommonError(let errorMsg):
            return errorMsg
        }
    }
}
