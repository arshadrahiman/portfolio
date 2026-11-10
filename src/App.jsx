import React, { useState } from 'react';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import CorePillars from './components/CorePillars';
import SecuritySection from './components/SecuritySection';
import WhatITakeCareOf from './components/WhatITakeCareOf';
import Architecture from './components/Architecture';
import SelectedWork from './components/SelectedWork';
import TechStack from './components/TechStack';
import DevUtilities from './components/DevUtilities';
import FAQ from './components/FAQ';
import Contact from './components/Contact';
import Footer from './components/Footer';
import { portfolioData } from './data/portfolioData';

export default function App() {
  const currentProfile = portfolioData.profile;

  return (
    <div className="min-h-screen bg-[#08080b] text-[#f1f2f6] selection:bg-blue-500/30 selection:text-blue-200">
      
      {/* Main Navigation */}
      <Navbar profile={currentProfile} />

      {/* Main Content Sections */}
      <main>
        {/* Hero Section */}
        <Hero profile={currentProfile} />

        {/* 4 Core Competency Pillars from GitHub README */}
        <CorePillars pillars={portfolioData.pillars} />

        {/* What I Take Care Of (Services) */}
        <WhatITakeCareOf services={portfolioData.services} />

        {/* Mobile Security Architecture (OWASP MASVS, Pinning, Biometrics) */}
        <SecuritySection securityFocus={portfolioData.securityFocus} />

        {/* Clean Architecture Philosophy */}
        <Architecture architecture={portfolioData.architecture} />

        {/* Featured Case Studies (Tawuniya, Leader Investment, PhysioTally, Clinical Dietitian, musman.dev studies) */}
        <SelectedWork caseStudies={portfolioData.caseStudies} />

        {/* Tech Arsenal & Tooling */}
        <TechStack techStack={portfolioData.techStack} />

        {/* 5 In-Browser Developer Utilities */}
        <DevUtilities />

        {/* Frequently Asked Questions */}
        <FAQ faq={portfolioData.faq} />

        {/* Contact Section matching musman.dev/#contact */}
        <Contact contact={portfolioData.contact} profile={currentProfile} />
      </main>

      {/* Footer */}
      <Footer profile={currentProfile} />
    </div>
  );
}
