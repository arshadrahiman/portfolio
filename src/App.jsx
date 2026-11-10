import React from 'react';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import ScrollProgressBar from './components/ScrollProgressBar';
import RevealOnScroll from './components/RevealOnScroll';
import CorePillars from './components/CorePillars';
import SelectedWork from './components/SelectedWork';
import Experience from './components/Experience';
import TechStack from './components/TechStack';
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
        {/* 1. Hero Section */}
        <Hero profile={currentProfile} />

        {/* 2. Core Engineering Pillars (Mobile, Security, Back-End, Test Automation) */}
        <RevealOnScroll variant="fade-up">
          <CorePillars pillars={data.pillars} />
        </RevealOnScroll>

        {/* 3. Featured Production Projects & Case Studies */}
        <RevealOnScroll variant="fade-up">
          <SelectedWork caseStudies={data.caseStudies} />
        </RevealOnScroll>

        {/* 4. Career Track Record, MBA/BCA Education & Certifications */}
        <RevealOnScroll variant="fade-up">
          <Experience
            experience={data.experience}
            qualifications={data.qualifications}
            certifications={data.certifications}
          />
        </RevealOnScroll>

        {/* 5. Tech Arsenal & Tooling Grid */}
        <RevealOnScroll variant="fade-up">
          <TechStack techStack={data.techStack} />
        </RevealOnScroll>

        {/* 6. Contact, 1:1 Calendly Booking & Direct Inquiry */}
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
