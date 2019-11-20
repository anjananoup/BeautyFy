//
//  MakeUpMLManager.swift
//  BeautyFy
//
//  Created by Anjan Kumar Majumder on 11/21/19.
//  Copyright © 2019 anjan. All rights reserved.
//

import UIKit
import CoreML

//Using Singletone for app scope
class MakeUpMLManager {
    static let instance = MakeUpMLManager()

    private let mlModel = makeup()
    private let queue = DispatchQueue(label: "UserInit", qos: .userInitiated)
    
    ///Photo sample support
    private let size = 256 //Current ML support 256x256 sample

    private init() {
    }
    
    ///MakeOver to given sample
    ///Note: onComplete will called from non UI thread. Handle it properly
    func makeOver(makeUpModel: UIImage, noMakeUpModel: UIImage, _ onComplete: @escaping (_ result: Result<UIImage, Error>) -> Void) {
        queue.async { [weak self] in
            guard let self = self else {
                print("MakeUpMLManager not available")
                onComplete(.failure(AppError.CommonError("MakeUpMLManager not available")))
                return
            }
            guard let makeUpBuf = makeUpModel.pixelBuffer(width: self.size, height: self.size), let noMakeUpBuf = noMakeUpModel.pixelBuffer(width: self.size, height: self.size) else {
                print("Input Buffer not created successfully")
                onComplete(.failure(AppError.ImageConvertError("Input Buffer not created successfully")))
                return
            }
            do {
                let output = try self.mlModel.prediction(Y__0: makeUpBuf, X__0: noMakeUpBuf)
                let imageData = self.convertBuffer(output.generator__xs__0)
                if let makeOverImage = imageData {
                    onComplete(.success(makeOverImage))
                } else {
                    onComplete(.failure(AppError.ImageConvertError("Output Image Generation not completed")))
                }
            } catch {
                print("Unable to predict: Error: \(error.localizedDescription)")
                onComplete(.failure(AppError.CommonError("CoreML model not predict properly: \(error.localizedDescription)")))
                return
            }
        }
    }
    
    private func convertBuffer(_ imageMultiArray: MLMultiArray) -> UIImage? {
        print("imageMultiArray count: \(imageMultiArray.count)")
        if let image = imageMultiArray.cgImage(min: -1, max: 1) { //ML color scope range {-1, 1}
            print("Conversion process success")
            return UIImage(cgImage: image)
        }
        return nil
    }
}
