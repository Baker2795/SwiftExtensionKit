//
//  File.swift
//  
//
//  Created by John Baker on 11/24/23.
//

import UIKit
import SwiftUI

extension UIFont {
    @available(iOS 14.0, *)
    class func preferredFont(font: Font, weight: Font.Weight) -> UIFont {
        let style: UIFont.TextStyle
        let fontWeight: UIFont.Weight

        switch font {
        case .largeTitle:
            style = .largeTitle
        case .title:
            style = .title1
        case .title2:
            style = .title2
        case .title3:
            style = .title3
        case .headline:
            style = .headline
        case .subheadline:
            style = .subheadline
        case .callout:
            style = .callout
        case .caption:
            style = .caption1
        case .caption2:
            style = .caption2
        case .footnote:
            style = .footnote
        default: // .body
            style = .body
        }

        switch weight {
        case .ultraLight:
            fontWeight = .ultraLight
        case .thin:
            fontWeight = .thin
        case .light:
            fontWeight = .light
        case .regular:
            fontWeight = .regular
        case .medium:
            fontWeight = .medium
        case .semibold:
            fontWeight = .semibold
        case .bold:
            fontWeight = .bold
        case .heavy:
            fontWeight = .heavy
        case .black:
            fontWeight = .black
        default:
            fontWeight = .regular
        }

        return UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: style).pointSize, weight: fontWeight)
    }
}
