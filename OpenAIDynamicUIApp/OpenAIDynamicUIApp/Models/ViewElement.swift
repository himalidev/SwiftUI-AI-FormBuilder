//
//  ViewElement.swift
//  OpenAIDynamicUIApp
//
//  Created by Himali Marasinghe on 2025-05-26.
//

import Foundation

import Foundation

struct ViewElement: Codable {
    let type: String                     // e.g., "TextField", "Image", "Button", "Text"
    let title: String?                   // Used for Image or Button
    let value: String?                   // Used for static text (e.g. validation messages)
    let placeholder: String?            // For input fields
    let binding: String?                // Data key (e.g. "email", "password")
    let action: String?                 // Button action identifier (e.g. "login")
    let font: String?                   // e.g., "caption", "body", "title"

    let cornerRadius: Int?              // For styling
    let padding: Int?                   // For styling
    let backgroundColor: String?        // Optional override
    let foregroundColor: String?        // Optional text color

    let children: [ViewElement]?        // For nested HStack/VStack elements
}

struct ViewLayout: Codable {
    let type: String                     // e.g., "VStack"
    let spacing: Int
    let padding: Int
    let backgroundColor: String
    let children: [ViewElement]
}

