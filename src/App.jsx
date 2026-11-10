import React from 'react';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import ScrollProgressBar from './components/ScrollProgressBar';
import RevealOnScroll from './components/RevealOnScroll';
import CorePillars from './components/CorePillars';
import WhatITakeCareOf from './components/WhatITakeCareOf';
import Experience from './components/Experience';
import SecuritySection from './components/SecuritySection';
import Architecture from './components/Architecture';
import SelectedWork from './components/SelectedWork';
import TechStack from './components/TechStack';
import DevUtilities from './components/DevUtilities';
import FAQ from './components/FAQ';
import Contact from './components/Contact';
import Footer from './components/Footer';
import { portfolioData } from './data/portfolioData';
import { LanguageProvider, useLanguage } from './context/LanguageContext';

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

      {/* Main Navigation */}
      <Navbar profile={currentProfile} />

      {/* Main Content Sections */}
      <main>
        {/* Hero Section */}
        <Hero profile={currentProfile} />

        {/* 4 Core Competency Pillars */}
        <RevealOnScroll variant="fade-up">
          <CorePillars pillars={data.pillars} />
        </RevealOnScroll>

        {/* What I Take Care Of (Services) */}
        <RevealOnScroll variant="fade-up">
          <WhatITakeCareOf services={data.services} />
        </RevealOnScroll>

        {/* Career Work Experience, MBA/BCA Education & Certifications */}
        <RevealOnScroll variant="fade-up">
          <Experience
            experience={data.experience}
            qualifications={data.qualifications}
            certifications={data.certifications}
          />
        </RevealOnScroll>

        {/* Mobile Security Architecture (OWASP MASVS, Pinning, Biometrics) */}
        <RevealOnScroll variant="zoom-in">
          <SecuritySection securityFocus={data.securityFocus} />
        </RevealOnScroll>

        {/* Clean Architecture Philosophy */}
        <RevealOnScroll variant="fade-up">
          <Architecture architecture={data.architecture} />
        </RevealOnScroll>

        {/* Featured Case Studies */}
        <RevealOnScroll variant="fade-up">
          <SelectedWork caseStudies={data.caseStudies} />
        </RevealOnScroll>

        {/* Tech Arsenal & Tooling */}
        <RevealOnScroll variant="fade-up">
          <TechStack techStack={data.techStack} />
        </RevealOnScroll>

        {/* 5 In-Browser Developer Utilities */}
        <RevealOnScroll variant="zoom-in">
          <DevUtilities />
        </RevealOnScroll>

        {/* Frequently Asked Questions */}
        <RevealOnScroll variant="fade-up">
          <FAQ faq={data.faq} />
        </RevealOnScroll>

        {/* Contact Section */}
        <RevealOnScroll variant="fade-up">
          <Contact contact={data.contact} profile={currentProfile} />
        </RevealOnScroll>
      </main>

      {/* Footer */}
      <Footer profile={currentProfile} />
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
