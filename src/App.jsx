import React from 'react';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import CorePillars from './components/CorePillars';
import SecuritySection from './components/SecuritySection';
import WhatITakeCareOf from './components/WhatITakeCareOf';
import Experience from './components/Experience';
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
      className="min-h-screen bg-[#08080b] text-[#f1f2f6] selection:bg-blue-500/30 selection:text-blue-200 transition-colors duration-300"
    >
      {/* Main Navigation */}
      <Navbar profile={currentProfile} />

      {/* Main Content Sections */}
      <main>
        {/* Hero Section */}
        <Hero profile={currentProfile} />

        {/* 4 Core Competency Pillars */}
        <CorePillars pillars={data.pillars} />

        {/* What I Take Care Of (Services) */}
        <WhatITakeCareOf services={data.services} />

        {/* Career Work Experience, MBA/BCA Education & Certifications */}
        <Experience
          experience={data.experience}
          qualifications={data.qualifications}
          certifications={data.certifications}
        />

        {/* Mobile Security Architecture (OWASP MASVS, Pinning, Biometrics) */}
        <SecuritySection securityFocus={data.securityFocus} />

        {/* Clean Architecture Philosophy */}
        <Architecture architecture={data.architecture} />

        {/* Featured Case Studies */}
        <SelectedWork caseStudies={data.caseStudies} />

        {/* Tech Arsenal & Tooling */}
        <TechStack techStack={data.techStack} />

        {/* 5 In-Browser Developer Utilities */}
        <DevUtilities />

        {/* Frequently Asked Questions */}
        <FAQ faq={data.faq} />

        {/* Contact Section */}
        <Contact contact={data.contact} profile={currentProfile} />
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
