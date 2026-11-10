# Modern React Mobile Developer Portfolio

A high-performance personal portfolio built in **React 18 + Vite + Tailwind CSS**, modeled after **[musman.dev](https://musman.dev/)**.

## 🌟 Key Features

1. **Exact Data & Structure from `musman.dev`**:
   - **Hero Section**: Value proposition ("I build mobile apps that hold up in the real world"), status indicator, 1-click email copy, 1:1 call scheduler.
   - **What I Take Care Of**: High-risk mobile pillars (Zero to App Store, Legacy App Takeovers & Audits, Complex Integrations & Hardware, Offline-First & Edge Cases).
   - **Architecture First**: Clean Architecture visual breakdown (Presentation, Pure Dart Domain, Data layer with local caching and offline sync queue).
   - **Selected Work**: Production case studies from `musman.dev` including:
     - **Practice360** (National healthcare app mandated by Kenyan SHA)
     - **Tapday** (No-code mobile application platform for Shopify merchants)
     - **Crypto POS** (Point-of-sale app with Bluetooth thermal receipt printing)
     - **FlashChat**, **Monify**, and **RoadRadar**
   - **Tech Stack**: Categorized by Mobile, Backend/AI, Databases, and DevOps.
   - **Developer Utilities**: 5 real, interactive developer utilities running directly in the browser:
     - JSON to Dart / TypeScript Model Generator
     - Regex Tester & Explainer
     - Case Converter (camelCase, snake_case, PascalCase, kebab-case, CONSTANT_CASE)
     - JWT Header & Payload Inspector
     - High-Res QR Code Generator with PNG download
   - **Contact Section (`#contact`)**: Direct email cards, Calendly 1:1 booking, and an interactive Project Inquiry form with celebratory confetti.
   - **Profile Switcher**: One-click floating toggle to switch between **M. Usman (`musman.dev`)** and **Arshad Rahman**.

## 🚀 Getting Started

### 1. Run Development Server
```bash
cd portfolio-react
npm run dev
```
Open [http://localhost:3000](http://localhost:3000) in your browser.

### 2. Build for Production
```bash
npm run build
```

### 3. Deploy to `about-me` (Custom Domain / GitHub Pages)
Run the root deploy script:
```bash
./deploy_react.sh
```

## 🛠️ Modifying Portfolio Data
All portfolio copy, case studies, stats, and contact emails live in a single centralized file:
`src/data/portfolioData.js`

