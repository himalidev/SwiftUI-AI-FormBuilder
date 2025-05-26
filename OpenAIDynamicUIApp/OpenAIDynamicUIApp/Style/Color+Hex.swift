import SwiftUI

extension Color {
    init(hex hexString: String?) {
        let hex = hexString?.replacingOccurrences(of: "#", with: "") ?? "000000"
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

