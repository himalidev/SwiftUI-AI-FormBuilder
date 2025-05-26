//
//  PromptTemplates.swift
//  OpenAIDynamicUIApp
//
//  Created by Himali Marasinghe on 2025-05-26.
//


struct PromptTemplates {
    static func layoutPrompt(from userInput: String) -> String {
        return """
        Only return a valid JSON object, with no explanation or markdown formatting.

        Use this schema:

        ViewLayout:
        - type: String ("VStack", "HStack", etc.)
        - spacing: Number
        - padding: Number
        - backgroundColor: String (hex color)
        - children: [ViewElement]
        
        ViewElement:
        - type: String ("Text", "TextField", "SecureField", "Image", "Button", etc.)
        - title?: String
        - value?: String
        - placeholder?: String
        - binding?: String
        - action?: String
        - font?: String
        - cornerRadius?: Number
        - padding?: Number
        - backgroundColor?: String
        - foregroundColor?: String
        - children?: [ViewElement]

        Now generate a SwiftUI layout for the following request:
        "\(userInput)"
        """
    }
}
