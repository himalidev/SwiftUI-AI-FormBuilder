import SwiftUI

struct DynamicFormView: View {
    let layout: ViewLayout

    @State private var formValues: [String: String] = [:]
    @State private var errorMessage: String?

    var body: some View {
        ScrollView {
            buildView(from: layout)
                .padding(.horizontal)
        }
    }

    @ViewBuilder
    private func buildView(from layout: ViewLayout) -> some View {
        VStack(spacing: CGFloat(layout.spacing)) {
            ForEach(0..<layout.children.count, id: \.self) { index in
                buildElement(layout.children[index])
            }
        }
        .padding(CGFloat(layout.padding))
        .background(Color(layout.backgroundColor))
    }

    @ViewBuilder
    func buildElement(_ element: ViewElement) -> some View {
        switch element.type.lowercased() {
            case "text":
                if let value = element.title {
                    Text(value)
                        .font(Font.from(string: element.font))
                        .foregroundColor(Color(hex: element.foregroundColor))
                }

            case "textfield":
                TextField(element.placeholder ?? "", text: binding(for: element.binding))
                    .padding(CGFloat(element.padding ?? 0))
                    .background(Color(hex: element.backgroundColor))
                    .cornerRadius(CGFloat(element.cornerRadius ?? 0))

            case "securefield":
                SecureField(element.placeholder ?? "", text: binding(for: element.binding))
                    .padding(CGFloat(element.padding ?? 0))
                    .background(Color(hex: element.backgroundColor))
                    .cornerRadius(CGFloat(element.cornerRadius ?? 0))

            case "button":
                Button(action: {
                    handleAction(named: element.action)
                }) {
                    Text(element.title ?? "Submit")
                        .frame(maxWidth: .infinity)
                        .padding(CGFloat(element.padding ?? 12))
                        .background(Color(hex: element.backgroundColor ?? "#007BFF"))
                        .foregroundColor(Color(hex: element.foregroundColor ?? "#FFFFFF"))
                        .cornerRadius(CGFloat(element.cornerRadius ?? 8))
                }

            case "image":
                if let title = element.title {
                    Image(title)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .padding()
                }

            case "vstack":
                if let children = element.children {
                    VStack(spacing: CGFloat(layout.spacing)) {
                        ForEach(0..<children.count, id: \.self) {
                            buildElement(children[$0])
                        }
                    }
                }

            case "hstack":
                if let children = element.children {
                    HStack(spacing: CGFloat(layout.spacing)) {
                        ForEach(0..<children.count, id: \.self) {
                            buildElement(children[$0])
                        }
                    }
                }

            default:
                EmptyView()
        }
    }

    private func binding(for key: String?) -> Binding<String> {
        let key = key ?? UUID().uuidString
        return Binding<String>(
            get: { self.formValues[key, default: ""] },
            set: { self.formValues[key] = $0 }
        )
    }

    private func handleAction(named action: String?) {
        switch action?.lowercased() {
            case "login":
                loginAction()
            case "register":
                registerAction()
            default:
                print("Unhandled action: \(action ?? "nil")")
        }
    }

    private func loginAction() {
        let email = formValues["email"] ?? ""
        let password = formValues["password"] ?? ""

        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password cannot be empty"
            print(errorMessage!)
            return
        }

        print("Logging in with:")
        print("Email: \(email)")
        print("Password: \(password)")
    }

    private func registerAction() {
        let name = formValues["fullName"] ?? ""
        let email = formValues["email"] ?? ""
        let password = formValues["password"] ?? ""
        let confirmPassword = formValues["confirmPassword"] ?? ""

        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            print("⚠️ All fields are required.")
            return
        }

        guard password == confirmPassword else {
            print("❌ Passwords do not match.")
            return
        }

        print("✅ Registering user:")
        print("Name: \(name), Email: \(email)")
    }

}
