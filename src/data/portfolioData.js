export const portfolioData = {
  profile: {
    fullName: "Abdullah Arshadul Rahman",
    name: "Arshad Rahman",
    preferredName: "Arshad Rahman",
    role: "Senior Flutter & Full-Stack Engineer",
    secondaryRole: "Mobile Systems Architect & Technical Lead",
    statusBadge: "OPEN TO WORK · TARGET: DUBAI / UAE 🇦🇪",
    statusDetail: "Open to Senior Mobile / Tech Lead opportunities in Dubai, UAE & Global Remote",
    baseLocation: "Kerala, India / Riyadh, KSA",
    targetLocation: "Dubai / UAE 🇦🇪",
    experienceYears: "7+",
    email: "arshadrahman.dev@gmail.com",
    secondaryEmail: "hello@musman.dev",
    portfolioUrl: "https://arshadrahman.in",
    calendlyUrl: "https://calendly.com/software-engineer-arshadrahman",
    socialLinks: {
      github: "https://github.com/arshadrahiman",
      linkedin: "https://www.linkedin.com/in/arshadul-rahman",
      twitter: "https://twitter.com/",
      whatsapp: "https://wa.me/"
    },
    hero: {
      eyebrow: "Banking · Fintech · Insurance · 7+ Years Experience",
      headline: "Crafting secure, high-performance mobile apps that hold up in the real world.",
      subheadline: "Senior Mobile Team Lead & Full-Stack Engineer specializing in Flutter, Kotlin, React Native, and robust backend microservices (.NET, Node.js, Python). Leading with Clean Architecture, enterprise mobile security (OWASP MASVS), and zero-to-App Store delivery.",
      stats: [
        { label: "Industry Tenure", value: "7+ Years", detail: "Software Dev & Mobile Leadership" },
        { label: "Production Apps", value: "20+", detail: "Across iOS & Android stores" },
        { label: "Crash-Free Rate", value: "99.9%", detail: "Sustained production SLA" },
        { label: "Domains Mastered", value: "Fintech & InsurTech", detail: "Banking, Insurance & Health" }
      ]
    },
    currentFocus: [
      { label: "Working on", value: "Reusable Flutter security and architecture kits" },
      { label: "Learning", value: "SwiftUI, Flutter performance profiling, native platform channels" },
      { label: "Targeting", value: "Flutter / Mobile Lead roles in Dubai and the UAE 🇦🇪" },
      { label: "Ask me about", value: "Flutter, mobile security, Node.js / TypeScript / .NET APIs, test automation" }
    ]
  },

  // 4 Core Pillars from GitHub README
  pillars: [
    {
      icon: "smartphone",
      title: "Mobile Engineering",
      tagline: "Cross-platform & Native Excellence",
      skills: "Flutter, Kotlin, React Native, Java, Swift; custom native bridges, store releases, 60fps performance."
    },
    {
      icon: "shield",
      title: "Mobile Security",
      tagline: "Enterprise & OWASP MASVS",
      skills: "Certificate pinning, biometrics auth, encrypted local storage, root & jailbreak detection, code obfuscation."
    },
    {
      icon: "server",
      title: "Back-End & APIs",
      tagline: "Microservices & Distributed Systems",
      skills: "Node.js, TypeScript, Python, PHP, .NET microservices, GraphQL, REST APIs, WebSockets."
    },
    {
      icon: "test-tube",
      title: "Test Automation & QA",
      tagline: "Full-Spectrum Reliability",
      skills: "Appium, Robot Framework, Selenium, JMeter load testing, Postman API suites, CI/CD automation."
    }
  ],

  services: [
    {
      id: "banking-fintech-insurtech",
      title: "Banking, Fintech & Insurance Apps",
      tagline: "High-security regulatory compliance and financial transaction integrity",
      description: "Proven track record delivering member-facing insurance systems (Tawuniya) and mobile banking & investment platforms (Leader Investment Group). Architected for fault-tolerant microservices, biometric authentication, and strict compliance.",
      points: [
        "End-to-end delivery of enterprise insurance & investment mobile applications",
        "Integration with .NET, Node.js, and Java core banking/insurance microservices",
        "Zero-downtime offline transactions, statement generation, and push-based KYC",
        "PCI-DSS, OWASP MASVS compliance and financial audit readiness"
      ],
      badge: "FinTech & InsurTech"
    },
    {
      id: "zero-to-app-store",
      title: "Zero to App Store & Play Store",
      tagline: "End-to-end product realization without compromises",
      description: "From technical discovery and scoping to production deployment on Apple App Store and Google Play. Configuring signing certificates, review compliance, crash reporting, privacy disclosures, and automated deployment pipelines.",
      points: [
        "Architected from day one for multi-tenant scalability and rapid feature velocity",
        "CI/CD release automation with Fastlane, GitHub Actions, and App Center",
        "Deep understanding of Apple App Review Guidelines & Google Play Store policies",
        "Seamless release management, phased rollouts, and rollback readiness"
      ],
      badge: "Full Lifecycle"
    },
    {
      id: "mobile-security-hardening",
      title: "Mobile Security Hardening & Audits",
      tagline: "Fortifying applications against tampering, reverse engineering & MITM",
      description: "Preventing sensitive financial and personal data leakage with military-grade mobile security protocols. I implement strict cryptographic layers and runtime application self-protection (RASP).",
      points: [
        "SSL/TLS Certificate Pinning to eliminate Man-in-the-Middle (MITM) attacks",
        "Biometric authentication (TouchID, FaceID, BiometricPrompt) & Secure Enclave/KeyStore",
        "Root and jailbreak runtime detection with integrity attestation",
        "ProGuard/R8 code obfuscation, anti-tampering, and memory leak prevention"
      ],
      badge: "Enterprise Security"
    },
    {
      id: "legacy-takeovers",
      title: "Legacy App Takeovers & Test Automation",
      tagline: "Stabilizing unruly codebases and eliminating tech debt",
      description: "Inherited a Flutter or native app riddled with race conditions, memory leaks, or outdated dependencies? I conduct deep code audits, isolate bottlenecks, stabilize crash loops, and automate regression suites.",
      points: [
        "Granular performance and memory leak profiling (Dart DevTools & Native Profiler)",
        "State management refactoring to clean unidirectional data flow (BLoC, Riverpod, GetX)",
        "Automated E2E test suites with Appium, Robot Framework, and Selenium",
        "Zero-downtime database schema migrations for SQLite and encrypted local storage"
      ],
      badge: "QA & Refactoring"
    }
  ],

  architecture: {
    title: "Architecture First Philosophy",
    subtitle: "Why Clean Architecture is non-negotiable for serious mobile & enterprise products",
    philosophy: "Most mobile apps collapse under their own weight when features scale because business logic is tangled into UI widgets. I enforce strict unidirectional data flow and clean separation of concerns, ensuring high testability, rapid onboarding, and zero architectural rot.",
    layers: [
      {
        name: "Presentation Layer",
        role: "Reactive UI & State Delivery",
        tech: "Flutter Widgets, BLoC / Riverpod / GetX, Micro-Animations",
        desc: "Strictly reactive and stateless where possible. The presentation layer knows only how to render states and emit user intents. It never performs direct network queries or raw calculations.",
        features: ["Unidirectional State Flow", "Declarative Navigation", "Micro-Interactions & Fluid 60fps", "Accessible & Screen-Reader Ready"]
      },
      {
        name: "Domain Layer (Core)",
        role: "Pure Business Logic & Entities",
        tech: "Pure Dart, Zero External Framework Dependencies",
        desc: "The heartbeat of the application. Contains UseCases and Entities written in vanilla Dart. Completely decoupled from UI or network libraries, allowing 100% unit test coverage with no mocking overhead.",
        features: ["Independent Use Cases", "Fail-safe Business Rules", "Pure Dart Entities", "100% Mock-Free Unit Testing"]
      },
      {
        name: "Data Layer",
        role: "Repositories, Caching & Remote APIs",
        tech: "Dio / Http, SQLite / Hive, SecureStorage, GraphQL, .NET / Node APIs",
        desc: "Handles data persistence, serialization, and API communication. Implements repository interfaces defined in the domain layer, abstracting whether data came from memory, local cache, or cloud endpoints.",
        features: ["Offline Caching & Sync Queue", "Automatic JWT Token Refresh Interceptors", "Model DTO Serialization", "Network Failure Recovery"]
      }
    ],
    flowSteps: [
      { step: "1. User Interaction", label: "User triggers event in Widget or biometric scanner" },
      { step: "2. Controller / BLoC", label: "Receives UI event & dispatches Domain UseCase" },
      { step: "3. UseCase Execution", label: "Executes business validation & queries Repository" },
      { step: "4. Repository Mediation", label: "Inspects Local Cache first, triggers Remote API if stale" },
      { step: "5. Unidirectional Update", label: "Emits reactive Result back to UI with zero glitching" }
    ]
  },

  caseStudies: [
    {
      id: "tawuniya-insurance",
      featured: true,
      title: "Tawuniya Insurance Mobile App",
      category: "InsurTech & Enterprise Systems",
      platforms: ["iOS", "Android"],
      role: "Senior Mobile Team Lead / Flutter Developer",
      company: "Mobcoder · Jul 2025 – Present",
      tagline: "Flagship Member-Facing Insurance Mobile Platform in KSA",
      summary: "Led Flutter engineering for one of Saudi Arabia's largest insurance providers (Tawuniya). Directed architecture decisions, code reviews, sprint planning, and release management to deliver a seamless member policy management and claims experience.",
      challenge: "Coordinating multi-tier insurance policy microservices, complex claims document uploads, and biometric auth with strict regulatory compliance and zero latency.",
      solution: "Engineered scalable Clean Architecture with BLoC state management, robust offline caching for policy documents, and automated CI/CD pipeline on TestFlight & Google Play.",
      metrics: [
        { label: "Team Velocity Lift", value: "+40%" },
        { label: "Crash-Free Users", value: "99.9%" },
        { label: "Deployment Cycle", value: "Weekly Automated" }
      ],
      tags: ["Flutter", "Dart", "Clean Architecture", "Team Lead", "REST APIs", "InsurTech", "Agile / Scrum"],
      badge: "Enterprise Leadership"
    },
    {
      id: "leader-investment-group",
      featured: true,
      title: "Mobile Banking & Investment Platform",
      category: "Fintech & Wealth Management",
      platforms: ["iOS", "Android"],
      role: "Senior Flutter Developer",
      company: "Leader IT / Leader Investment Group, Riyadh · 2023 – 2025",
      tagline: "Secure Mobile Investment & Banking Solution with .NET Back End",
      summary: "Architected and delivered secure mobile banking and investment features for high-net-worth clients. Built on Flutter and .NET microservices back ends, featuring automated CI/CD via App Center and iOS beta distribution through TestFlight.",
      challenge: "Strict financial data protection, low-latency portfolio chart updates, and biometric authentication required under Saudi monetary authority guidelines.",
      solution: "Implemented SSL Certificate Pinning, Biometric Enclave integration, real-time portfolio streaming, and multi-factor authentication (MFA) with automated build verification.",
      metrics: [
        { label: "Security Benchmark", value: "OWASP MASVS L2" },
        { label: "Portfolio Refresh Latency", value: "<800ms" },
        { label: "Release Automation", value: "App Center / TestFlight" }
      ],
      tags: ["Flutter", ".NET Microservices", "Mobile Security", "Biometrics", "CI/CD", "TestFlight", "App Center"],
      badge: "FinTech & Banking"
    },
    {
      id: "physiotally",
      featured: true,
      title: "PhysioTally",
      category: "HealthTech & Clinic Management",
      platforms: ["Android (Google Play)"],
      role: "Creator & Lead Engineer",
      company: "Personal Product · Live on Google Play",
      tagline: "Offline-First Invoicing & Receipt App for Clinics & Physiotherapists",
      summary: "A production mobile app designed specifically for physiotherapists and medical clinics. Operates 100% offline without internet connection, featuring rapid patient billing, digital PDF receipt generation, and local clinic analytics.",
      challenge: "Clinic practitioners frequently consult in basements or rural facilities without reliable Wi-Fi, needing instant billing and receipt generation.",
      solution: "Engineered an offline-first transactional engine using local SQLite storage, on-device vector PDF receipt generation, and automatic data export.",
      metrics: [
        { label: "Offline Availability", value: "100% Fully Offline" },
        { label: "Receipt Generation Time", value: "<0.3s" },
        { label: "Availability", value: "Live on Google Play" }
      ],
      tags: ["Flutter", "SQLite", "Offline-first", "PDF Generation", "Google Play", "HealthTech"],
      liveUrl: "https://play.google.com/store"
    },
    {
      id: "clinical-dietitian",
      featured: true,
      title: "Clinical Dietitian Enterprise Portal",
      category: "Full-Stack Web & Healthcare Admin",
      platforms: ["Web (Desktop & Mobile)"],
      role: "Full-Stack Architect",
      company: "Client & Admin Portals",
      tagline: "Full-Stack Booking, Automated Call Reminders & Template PDF Diet Charts",
      summary: "Comprehensive healthcare portal for clinical dietitians featuring quotation management, booking records, automated admin alerts, 7-day recurring client follow-up reminder cron jobs, and template-based diet chart generation with instant PDF export.",
      challenge: "Manual client follow-up tracking was causing significant patient drop-off; diet chart formatting was taking 45+ minutes per consultation.",
      solution: "Built a reactive React frontend with PHP / MySQL microservices backend, automated cron scheduling for 7-day call reminders, and a dynamic PDF compiler.",
      metrics: [
        { label: "Consultation Efficiency", value: "3x Faster" },
        { label: "Automated Reminders", value: "Every 7 Days" },
        { label: "Tech Stack", value: "React + PHP + MySQL" }
      ],
      tags: ["React", "PHP", "MySQL", "Cron Automations", "PDF Compiler", "Healthcare Admin"],
      liveUrl: "#contact"
    },
    {
      id: "practice360",
      featured: false,
      title: "Practice360 (Healthcare SHA)",
      category: "HealthTech & Institutional Systems",
      platforms: ["iOS", "Android"],
      tagline: "National Healthcare Management Mandated by Kenyan SHA",
      summary: "A mission-critical healthcare application engineered to operate across national hospital networks and rural clinics under the Kenyan Social Health Authority (SHA). Demands offline resilience and biometric doctor verification.",
      challenge: "Healthcare practitioners in remote areas routinely experience severe internet outages lasting hours or days.",
      solution: "Engineered an offline-first transactional engine using encrypted local SQLite database with automatic background sync queues.",
      metrics: [
        { label: "Offline Sync Reliability", value: "100%" },
        { label: "Regulatory Compliance", value: "SHA Approved" }
      ],
      tags: ["Flutter", "Clean Architecture", "SQLite Encryption", "Biometrics", "REST APIs"],
      liveUrl: "https://musman.dev/#contact"
    },
    {
      id: "tapday",
      featured: false,
      title: "Tapday (Shopify App Builder)",
      category: "E-Commerce & SaaS Platforms",
      platforms: ["iOS", "Android"],
      tagline: "No-Code Mobile Application Platform for Shopify Merchants",
      summary: "A high-performance SaaS engine that turns standard Shopify web stores into native iOS and Android apps with drag-and-drop customization, push notification automations, and native checkout.",
      challenge: "Rendering dynamic merchant designs without republishing the app to App Store or Play Store for every theme edit.",
      solution: "Built a dynamic Server-Driven UI (SDUI) component parsing system in Flutter, integrated directly with Shopify Storefront GraphQL APIs.",
      metrics: [
        { label: "Conversion Lift", value: "+38%" },
        { label: "Stores Powered", value: "100+" }
      ],
      tags: ["Flutter", "Shopify GraphQL", "Server-Driven UI", "Riverpod", "Apple Pay / Google Pay"],
      liveUrl: "https://musman.dev/#contact"
    },
    {
      id: "crypto-pos",
      featured: false,
      title: "Crypto POS",
      category: "Fintech & Point-of-Sale Hardware",
      platforms: ["Android", "iOS", "Web"],
      tagline: "Cross-Platform Sales & Crypto Point-of-Sale Solution",
      summary: "A commercial sales management system powering brick-and-mortar retailers with instant fiat-to-crypto acceptance, inventory tracking, and direct hardware integration with Bluetooth thermal receipt printers.",
      challenge: "Retailers needed instantaneous receipt printing and hardware driver reliability on low-end Android POS terminals.",
      solution: "Implemented low-latency WebSocket connection and custom MethodChannels for ESC/POS thermal printers via Bluetooth SPP.",
      metrics: [
        { label: "Settlement Latency", value: "<1.2s" },
        { label: "Hardware Support", value: "50+ Printer Models" }
      ],
      tags: ["Flutter", "Method Channels", "WebSockets", "Bluetooth ESC/POS", "SQLite"],
      liveUrl: "https://musman.dev/#contact"
    },
    {
      id: "flashchat",
      featured: false,
      title: "FlashChat",
      category: "Real-Time Communications",
      platforms: ["iOS", "Android"],
      tagline: "Real-time Encrypted Chat & Media Messaging Engine",
      summary: "High-performance instant messaging application built with Firebase, GetX, and WebSockets. Features end-to-end encrypted messaging, typing indicators, read receipts, and media compression.",
      challenge: "Managing instant delivery and message states across varying connection quality with minimal battery drain.",
      solution: "Implemented local optimistic UI rendering with reactive streams and background push notifications.",
      metrics: [
        { label: "Message Delivery", value: "<250ms" },
        { label: "Image Compression", value: "70% Bandwidth Saved" }
      ],
      tags: ["Flutter", "GetX", "Firebase", "WebSockets", "Push Notifications"],
      githubUrl: "https://github.com/arshadrahiman"
    },
    {
      id: "monify",
      featured: false,
      title: "Monify",
      category: "Personal Finance & Analytics",
      platforms: ["iOS", "Android"],
      tagline: "Private Personal Finance Manager with Zero Cloud Tracking",
      summary: "Full-featured expense tracker, budget planner, and financial analytics dashboard. 100% offline-first with biometric vault locking, CSV data export, and interactive monthly spending breakdowns.",
      challenge: "Users demand privacy for financial data without sacrificing interactive analytics and category breakdowns.",
      solution: "Built entirely with local encrypted storage and reactive charts, requiring zero external server queries.",
      metrics: [
        { label: "User Privacy", value: "100% Local" },
        { label: "Cold Launch Time", value: "0.4s" }
      ],
      tags: ["Flutter", "Local Storage", "GetX", "Data Visualization", "Biometric Auth"],
      githubUrl: "https://github.com/arshadrahiman"
    },
    {
      id: "roadradar",
      featured: false,
      title: "RoadRadar",
      category: "Navigation & Crowdsourced GeoTech",
      platforms: ["iOS", "Android"],
      tagline: "Smart Road Safety & Crowdsourced Incident Navigation",
      summary: "Real-time navigation and road hazard alert system helping motorists report speed cameras, road hazards, and construction zones with geofenced radius alerts.",
      challenge: "Battery conservation during continuous background GPS tracking and rapid geolocation calculations.",
      solution: "Engineered geofence boundary caching and adaptive location sampling based on accelerometer velocity.",
      metrics: [
        { label: "Battery Conservation", value: "45% Reduction" },
        { label: "Alert Accuracy", value: "50m Geofence Radius" }
      ],
      tags: ["Flutter", "Geofencing", "Google Maps SDK", "Location Services", "REST APIs"],
      githubUrl: "https://github.com/arshadrahiman"
    }
  ],

  // Security Showcase (from README)
  securityFocus: [
    { title: "Certificate Pinning", desc: "Hardcoding public key hashes to prevent MITM proxy inspection on financial APIs.", badge: "Network Security" },
    { title: "Biometric Authentication", desc: "BiometricPrompt on Android and LocalAuthentication on iOS using hardware Secure Enclave.", badge: "Identity" },
    { title: "Encrypted Local Storage", desc: "Hardware-backed AES-256 encryption via SQLCipher, Hive AesCipher, and Flutter SecureStorage.", badge: "Data-at-Rest" },
    { title: "Root & Jailbreak Detection", desc: "Runtime binary and hook inspection to block compromised or tampered operating environments.", badge: "Integrity" },
    { title: "Code Obfuscation & R8", desc: "Bytecode scrambling, symbol stripping, and reflection protection against reverse engineering.", badge: "Anti-Reverse" },
    { title: "OWASP MASVS Standards", desc: "Strict adherence to Mobile Application Security Verification Standard levels L1 & L2.", badge: "Compliance" }
  ],

  techStack: {
    categories: [
      {
        name: "Mobile Ecosystem",
        icon: "smartphone",
        skills: [
          { name: "Flutter & Dart", level: "Senior / Expert", icon: "flutter" },
          { name: "Native Android (Kotlin / Java)", level: "Advanced", icon: "android" },
          { name: "React Native", level: "Proficient", icon: "react" },
          { name: "iOS (Swift / Xcode)", level: "Advanced", icon: "apple" },
          { name: "Method Channels & Native Bridges", level: "Expert", icon: "bridge" },
          { name: "BLoC / Riverpod / GetX", level: "Expert", icon: "state" },
          { name: "Clean Architecture & MVVM", level: "Expert", icon: "arch" }
        ]
      },
      {
        name: "Back-End & Microservices",
        icon: "server",
        skills: [
          { name: "Node.js & TypeScript", level: "Advanced", icon: "node" },
          { name: ".NET / C# Microservices", level: "Advanced", icon: "dotnet" },
          { name: "Python / FastAPI", level: "Proficient", icon: "python" },
          { name: "PHP & Laravel", level: "Advanced", icon: "php" },
          { name: "REST APIs & GraphQL", level: "Expert", icon: "api" },
          { name: "Firebase & Supabase", level: "Expert", icon: "firebase" },
          { name: "WebSockets & SignalR", level: "Advanced", icon: "socket" }
        ]
      },
      {
        name: "Databases & Local Storage",
        icon: "database",
        skills: [
          { name: "SQLite & SQLCipher", level: "Expert", icon: "sqlite" },
          { name: "MySQL & MSSQL", level: "Advanced", icon: "mysql" },
          { name: "Supabase & PostgreSQL", level: "Advanced", icon: "postgres" },
          { name: "Hive & Isar DB", level: "Expert", icon: "hive" },
          { name: "Secure Storage & KeyStore", level: "Expert", icon: "shield" }
        ]
      },
      {
        name: "Test Automation, QA & DevOps",
        icon: "git-branch",
        skills: [
          { name: "Appium (Mobile Automation)", level: "Advanced", icon: "appium" },
          { name: "Robot Framework & Selenium", level: "Advanced", icon: "selenium" },
          { name: "JMeter Performance Testing", level: "Advanced", icon: "jmeter" },
          { name: "Postman API Automation", level: "Expert", icon: "postman" },
          { name: "CI/CD & GitHub Actions", level: "Advanced", icon: "ci" },
          { name: "App Center & TestFlight", level: "Expert", icon: "testflight" },
          { name: "Docker & Linux", level: "Proficient", icon: "docker" }
        ]
      }
    ]
  },

  faq: [
    {
      q: "Are you open to relocation or on-site roles in Dubai / UAE?",
      a: "Yes! I am actively targeting Senior Flutter Developer, Mobile Team Lead, and Full-Stack Engineering roles in Dubai and the wider UAE (with immediate relocation readiness and valid passport)."
    },
    {
      q: "What domains have you built mobile solutions for?",
      a: "My deepest expertise is in Banking, FinTech, and InsurTech (such as Tawuniya Insurance and Leader Investment Group in Riyadh), alongside HealthTech (PhysioTally, Practice360) and E-Commerce SaaS."
    },
    {
      q: "How do you guarantee mobile security in production?",
      a: "I build to OWASP MASVS guidelines: SSL/TLS certificate pinning on network endpoints, biometric authentication backed by Secure Enclave / KeyStore, runtime root & jailbreak detection, and code obfuscation."
    },
    {
      q: "What is your experience in Test Automation and QA?",
      a: "Before advancing into Mobile Lead roles, I worked as a QA & Automation Engineer. I bring rigorous automated testing practices using Appium, Robot Framework, Selenium, JMeter for load simulation, and automated CI/CD release pipelines."
    }
  ],

  contact: {
    headline: "Let's build something secure and exceptional.",
    subheadline: "Available for Senior Mobile / Tech Lead roles in Dubai / UAE 🇦🇪, enterprise contracts, and legacy codebase audits.",
    directEmail: "arshadrahman.dev@gmail.com",
    secondaryEmail: "hello@musman.dev",
    calendlyLink: "https://calendly.com/software-engineer-arshadrahman",
    responseTime: "Typically replies within 2–4 hours",
    availabilityStatus: "Open to Work · Dubai / UAE & Remote",
    targetBadge: "Target: Dubai / UAE 🇦🇪"
  }
};
