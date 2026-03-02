# 🤖 Smart Contract Generator

Generate professional trade contracts and proforma invoices from WhatsApp/WeChat conversations using AI.

## ✨ Features

- **AI-Powered Parsing**: Automatically extracts contract details from chat messages using Gemini Flash or DeepSeek AI
- **Mobile Optimized**: Works perfectly on iPhone and Android phones
- **Multi-Product Support**: Handle multiple product lines in one contract
- **Bilingual**: Parses both Chinese and English chat messages
- **Print/Export**: Generate professional PDFs or images
- **Local Storage**: Saves your seller information automatically
- **Clipboard Integration**: Paste directly from mobile apps

## 🚀 Quick Start

### 1. Get API Keys
- **Gemini API**: Free from [Google AI Studio](https://makersuite.google.com/app/apikey)
- **DeepSeek API**: Free from [DeepSeek Platform](https://platform.deepseek.com/api_keys)

### 2. Configure API Keys
Open `contract-gemini.html` and replace:
```javascript
const GEMINI_API_KEY = "YOUR_GEMINI_API_KEY_HERE";
const DEEPSEEK_API_KEY = "YOUR_DEEPSEEK_API_KEY_HERE";
```

### 3. Start Using
1. Open `index.html` in your browser
2. Click "Launch Contract Generator"
3. Enter your seller information (saves automatically)
4. Paste chat messages from WhatsApp/WeChat
5. Click "Parse with AI"
6. Generate contract or invoice

## 📱 Mobile Usage

### iOS/Android:
1. Copy chat messages from WhatsApp/WeChat
2. Open the contract generator in mobile browser
3. Click the **📋 Paste** button
4. Follow the on-screen instructions
5. Click **🧠 Parse with AI**

## 🛠️ Technical Details

### Files:
- `index.html` - Landing page
- `contract-gemini.html` - Main contract generator with AI parsing
- `contract-simple.html` - Simple version without AI
- `contract-simple-editor.html` - Editor version
- `contract-generator/` - Alternative generator versions

### Browser Compatibility:
- Chrome, Safari, Firefox, Edge (latest versions)
- iOS Safari, Android Chrome
- Requires JavaScript enabled

## 🔒 Privacy & Security

- **100% Client-side**: All processing happens in your browser
- **No Server**: Your data never leaves your device
- **Local Storage**: Seller info saved locally in your browser
- **API Keys**: Only used for AI parsing (sent to respective providers)

## 🌐 Deployment Options

### Option 1: GitHub Pages (Recommended)
```bash
# Create new repository on GitHub
# Push this code to GitHub
# Enable GitHub Pages in repository settings
```

### Option 2: Self-Hosted
```bash
# Upload files to any web hosting
# No server-side code required
# Works on any static file server
```

### Option 3: Local Usage
```bash
# Open index.html directly in browser
# Works offline after initial setup
```

## 📄 License

Free for personal and commercial use. Attribution appreciated.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 🆘 Support

For issues or questions:
1. Check the [API Key Setup](#1-get-api-keys)
2. Ensure JavaScript is enabled
3. Try different browser
4. Contact for additional help

---

**Note**: This tool is designed for trade professionals to quickly generate contracts from chat conversations. Always review generated documents before sending to clients.