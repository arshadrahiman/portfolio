import React, { Suspense, lazy } from 'react';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import ScrollProgressBar from './components/ScrollProgressBar';
import RevealOnScroll from './components/RevealOnScroll';
import { portfolioData } from './data/portfolioData';
import { LanguageProvider, useLanguage } from './context/LanguageContext';

// Below-the-fold components lazy-loaded for maximum initial load performance
const CorePillars = lazy(() => import('./components/CorePillars'));
const WhatITakeCareOf = lazy(() => import('./components/WhatITakeCareOf'));
const Experience = lazy(() => import('./components/Experience'));
const SecuritySection = lazy(() => import('./components/SecuritySection'));
const Architecture = lazy(() => import('./components/Architecture'));
const SelectedWork = lazy(() => import('./components/SelectedWork'));
const TechStack = lazy(() => import('./components/TechStack'));
const DevUtilities = lazy(() => import('./components/DevUtilities'));
const FAQ = lazy(() => import('./components/FAQ'));
const Contact = lazy(() => import('./components/Contact'));
const Footer = lazy(() => import('./components/Footer'));

function PortfolioApp() {
  const { lang, isRTL } = useLanguage();
  const data = portfolioData[lang] || portfolioData.en;
  const currentProfile = data.profile;

  return (
    <div
      dir={isRTL ? 'rtl' : 'ltr'}
      className="min-h-screen bg-[#08080b] text-[#f1f2f6] selection:bg-blue-500/30 selection:text-blue-200 transition-colors duration-300 relative"
    >
      {/* Top Reading Scroll Progress Indicator */}
      <ScrollProgressBar />

      {/* Main Navigation (Eagerly Loaded) */}
      <Navbar profile={currentProfile} />

      {/* Main Content Sections */}
      <main>
        {/* Hero Section (Eagerly Loaded for Immediate First Paint) */}
        <Hero profile={currentProfile} />

        {/* Below-the-fold sections with Scroll-Triggered Reveal Animations */}
        <Suspense fallback={<div className="py-20 min-h-[200px] flex items-center justify-center text-gray-600 text-xs font-mono">Loading modules...</div>}>
          
          {/* 4 Core Competency Pillars */}
          <RevealOnScroll variant="fade-up" delay={50}>
            <CorePillars pillars={data.pillars} />
          </RevealOnScroll>

          {/* What I Take Care Of (Services) */}
          <RevealOnScroll variant="fade-up" delay={50}>
            <WhatITakeCareOf services={data.services} />
          </RevealOnScroll>

          {/* Career Work Experience, MBA/BCA Education & Certifications */}
          <RevealOnScroll variant="fade-up" delay={50}>
            <Experience
              experience={data.experience}
              qualifications={data.qualifications}
              certifications={data.certifications}
            />
          </RevealOnScroll>

          {/* Mobile Security Architecture (OWASP MASVS, Pinning, Biometrics) */}
          <RevealOnScroll variant="zoom-in" delay={50}>
            <SecuritySection securityFocus={data.securityFocus} />
          </RevealOnScroll>

          {/* Clean Architecture Philosophy */}
          <RevealOnScroll variant="fade-up" delay={50}>
            <Architecture architecture={data.architecture} />
          </RevealOnScroll>

          {/* Featured Case Studies */}
          <RevealOnScroll variant="fade-up" delay={50}>
            <SelectedWork caseStudies={data.caseStudies} />
          </RevealOnScroll>

          {/* Tech Arsenal & Tooling */}
          <RevealOnScroll variant="fade-up" delay={50}>
            <TechStack techStack={data.techStack} />
          </RevealOnScroll>

          {/* 5 In-Browser Developer Utilities */}
          <RevealOnScroll variant="zoom-in" delay={50}>
            <DevUtilities />
          </RevealOnScroll>

          {/* Frequently Asked Questions */}
          <RevealOnScroll variant="fade-up" delay={50}>
            <FAQ faq={data.faq} />
          </RevealOnScroll>

          {/* Contact Section */}
          <RevealOnScroll variant="fade-up" delay={50}>
            <Contact contact={data.contact} profile={currentProfile} />
          </RevealOnScroll>

        </Suspense>
      </main>

      {/* Footer */}
      <Suspense fallback={null}>
        <Footer profile={currentProfile} />
      </Suspense>
    </div>
  );
}

export default function App() {
  return (
    <LanguageProvider>
      <PortfolioApp />
    </LanguageProvider>
  );
}
