//
//  Font+From.swift
//  OpenAIDynamicUIApp
//
//  Created by Himali Marasinghe on 2025-05-26.
//


import SwiftUI

extension Font {
    static func from(string: String?) -> Font {
        switch string?.lowercased() {
        case "largeTitle": return .largeTitle
        case "title": return .title
        case "headline": return .headline
        case "subheadline": return .subheadline
        case "body": return .body
        case "callout": return .callout
        case "caption": return .caption
        case "footnote": return .footnote
        default: return .body
        }
    }
}
