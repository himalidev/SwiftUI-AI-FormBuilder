import Foundation

class OpenAIService {
    private let apiKey = Secrets.shared.get("OPENAI_API_KEY") ?? ""
    private let endpoint = URL(string: "https://api.openai.com/v1/chat/completions")!

    func fetchLayout(for userPrompt: String, completion: @escaping (Result<ViewLayout, Error>) -> Void) {
        let fullPrompt = PromptTemplates.layoutPrompt(from: userPrompt)

        let body: [String: Any] = [
            "model": "gpt-4o",
            "messages": [
                ["role": "system", "content": "You are a SwiftUI layout generator."],
                ["role": "user", "content": fullPrompt]
            ],
            "temperature": 0.2
        ]

        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1)))
                return
            }

            do {
                let response = try JSONDecoder().decode(OpenAIResponse.self, from: data)
                if let jsonText = response.choices.first?.message.content {
                    let cleaned = jsonText
                        .replacingOccurrences(of: "```json", with: "")
                        .replacingOccurrences(of: "```", with: "")
                        .trimmingCharacters(in: .whitespacesAndNewlines)

                    let layout = try JSONDecoder().decode(ViewLayout.self, from: Data(cleaned.utf8))
                    print(cleaned)
                    completion(.success(layout))
                } else {
                    completion(.failure(NSError(domain: "Empty choice", code: -1)))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

private struct OpenAIResponse: Codable {
    struct Choice: Codable {
        struct Message: Codable {
            let role: String
            let content: String
        }
        let message: Message
    }
    let choices: [Choice]
}
