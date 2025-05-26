import Foundation

class Secrets {
    static let shared = Secrets()

    private var secrets: [String: String] = [:]

    init() {
        if let path = Bundle.main.path(forResource: ".env", ofType: nil),
           let content = try? String(contentsOfFile: path, encoding: .utf8) {
            let lines = content.split(separator: "\n")
            for line in lines {
                let parts = line.split(separator: "=", maxSplits: 1)
                if parts.count == 2 {
                    secrets[String(parts[0])] = String(parts[1])
                }
            }
        }
    }

    func get(_ key: String) -> String? {
        return secrets[key]
    }
}
