//
//  ImageExtensions.swift
//
//
//  Created by John Baker on 11/11/23.
//

import SwiftUI
import UIKit

@available(iOS 13.0, *)
public extension Image {
    init?(data: Data) {
        guard let uiImage = UIImage(data: data) else {
            return nil
        }
        
        self.init(uiImage: uiImage)
    }
}
