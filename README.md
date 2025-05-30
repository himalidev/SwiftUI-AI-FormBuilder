# 🧠 SwiftUI-AI-FormBuilder

Generate dynamic SwiftUI forms from a simple text prompt using OpenAI's GPT API.

This project shows how to:
- Use natural language to define UI layouts (e.g., "a registration form with name, email, and password")
- Fetch and decode JSON-based form structures from OpenAI
- Dynamically render SwiftUI views using `ViewLayout` and `ViewElement` models
- Bind user input to a generic state model
- Handle form actions like "register" or "submit"

## 🧪 Features

- ✅ AI-generated UI layouts using GPT-4 or GPT-4o
- 🎨 Dynamic rendering with `DynamicFormView`
- 🔄 Live input binding using dictionary-backed `@State`
- 🔘 Form action handling (e.g., login, register)
- 🔐 Secure API key management via `.env`

## 📦 Components

| File | Purpose |
|------|---------|
| `DynamicFormView.swift` | Renders JSON layout into SwiftUI |
| `OpenAIService.swift`   | Sends prompt and decodes response |
| `ViewElement.swift`     | Models for UI components |
| `Secrets.swift`         | Securely loads `.env` variables |
| `ContentView.swift`     | Example trigger and preview logic |

## 🚀 Demo

![demo](https://github.com/user-attachments/assets/5c712dbd-704a-4659-bf22-ebbb0651bd87)
> *From text prompt to live SwiftUI form — rendered in seconds.*

## 🧪 Example Prompts

You can generate different forms by changing the prompt. Here's one for a registration screen and another for a login screen.

### 🔹 Registration Form Prompt

```
Generate a JSON-based SwiftUI UI layout for a user registration form with the following:

- A top logo image titled "logo"
- A heading that says "Registration"
- A text field for full name with placeholder "Enter your full name"
- A text field for email with placeholder "Enter your email"
- A secure field for password with placeholder "Enter your password"
- A secure field for confirming password with placeholder "Confirm your password"
- A submit button titled "Register" that triggers the action "register"

Use a vertical stack (VStack) with 16 spacing and 20 padding, and set the background color to white (#FFFFFF). All input fields should have 10 padding, 5 corner radius, and light gray background (#F0F0F0). The submit button should have 10 padding, 5 corner radius, a blue background (#007BFF), and white text (#FFFFFF). The heading text should use the "largeTitle" font and a text color of #000000.

Only return a valid JSON object, with no explanation or markdown formatting.
```

### 🔹 Login Screen Prompt

```
Generate a JSON-based SwiftUI UI layout for a login screen with the following elements:

- A centered logo image titled "logo"
- A text heading that says "Welcome Back!"
- A text field for email with placeholder "Enter your email"
- A secure field for password with placeholder "Enter your password"
- A "Forgot Password?" link as a text element (styled like a button)
- A login button labeled "Login" with the action "login"
- A secondary text element that says "Don’t have an account? Sign Up"

Use a vertical stack (VStack) with 20 spacing and 24 padding, and a background color of white (#FFFFFF). All input fields should have 12 padding, 8 corner radius, and light gray background (#F2F2F2). The login button should have 14 padding, 10 corner radius, a dark blue background (#0057FF), and white text (#FFFFFF). The title should use the "title" font with color #222222, and the subtitle link should use color #007BFF.

Only return a valid JSON object, with no explanation or markdown formatting.
```

## 📷 Screenshots
> **Registration Form Example Output**  
![image](https://github.com/user-attachments/assets/d5bb9592-45d4-464e-974d-1957cec408dc)



> **Login Form Example Output**
![image](https://github.com/user-attachments/assets/a89ade54-4ba7-4342-a6f6-db9a0dfb9925)


## 🔧 Getting Started

1. Clone the repo:
   ```bash
   git clone [[https://github.com/your-username/SwiftUI-AI-FormBuilder.git]
   cd SwiftUI-AI-FormBuilder
   
## 🔐 Setting Up OpenAI API

1. Create an OpenAI API key: https://platform.openai.com/account/api-keys  
2. Create a `.env` file at the root of your project:

```
OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

3. Run the project in Xcode and use the "Generate UI" button to test prompts.

## 🧑‍💻 Author

Created by **Himali Marasinghe**  


