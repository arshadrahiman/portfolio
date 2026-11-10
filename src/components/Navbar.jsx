import React, { useState, useEffect } from 'react';
import { Menu, X, ArrowUpRight, Globe } from 'lucide-react';
import { useLanguage } from '../context/LanguageContext';
import { uiTranslations } from '../data/uiTranslations';

export default function Navbar({ profile }) {
  const [scrolled, setScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const { lang, toggleLanguage, isRTL } = useLanguage();
  const t = uiTranslations[lang]?.nav || uiTranslations.en.nav;

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 20);
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const navLinks = [
    { name: t.work, href: '#work' },
    { name: t.services, href: '#services' },
    { name: t.experience, href: '#experience' },
    { name: t.architecture, href: '#architecture' },
    { name: t.stack, href: '#stack' },
    { name: t.utilities, href: '#utilities' },
    { name: t.contact, href: '#contact' },
  ];

  return (
    <header className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${
      scrolled 
        ? 'bg-[#08080b]/90 backdrop-blur-md border-b border-white/10 py-3.5 shadow-2xl shadow-black/50' 
        : 'bg-transparent py-5'
    }`}>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between">
          
          {/* Logo & Identity */}
          <a href="#" className="flex items-center gap-3 group">
            <div className="w-10 h-10 rounded-xl bg-gradient-to-tr from-blue-600 via-cyan-500 to-indigo-600 p-[1.5px] shadow-lg shadow-blue-500/20 group-hover:scale-105 transition">
              <div className="w-full h-full bg-[#08080b] rounded-[10px] overflow-hidden flex items-center justify-center">
                <img
                  src="/profile.jpg"
                  alt={profile.name}
                  className="w-full h-full object-cover object-[center_20%]"
                  onError={(e) => {
                    e.target.style.display = 'none';
                    e.target.nextSibling.style.display = 'block';
                  }}
                />
                <span className="font-mono text-sm font-bold text-white tracking-tighter hidden">
                  A
                </span>
              </div>
            </div>
            <div className="flex flex-col">
              <span className="text-sm font-bold text-white tracking-tight group-hover:text-blue-400 transition">
                {profile.preferredName || profile.name}
              </span>
              <span className="text-[11px] font-mono text-gray-400">
                {t.roleSubtitle}
              </span>
            </div>
          </a>

          {/* Desktop Navigation Links */}
          <nav className="hidden lg:flex items-center gap-1 bg-[#12131b]/60 border border-white/5 px-3 py-1.5 rounded-full backdrop-blur-md">
            {navLinks.map((link) => (
              <a
                key={link.name}
                href={link.href}
                className="px-3 py-1.5 text-xs font-medium text-gray-300 hover:text-white hover:bg-white/5 rounded-full transition"
              >
                {link.name}
              </a>
            ))}
          </nav>

          {/* Right Action: Language Switcher + Status Pill + CTA */}
          <div className="hidden sm:flex items-center gap-3">
            
            {/* Language Toggle Button */}
            <button
              onClick={toggleLanguage}
              className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs font-semibold bg-[#12131d] hover:bg-white/10 text-gray-200 border border-white/10 transition active:scale-95 shadow-sm"
              title={lang === 'en' ? 'التحويل إلى العربية' : 'Switch to English'}
            >
              <Globe className="w-3.5 h-3.5 text-cyan-400" />
              <span>{lang === 'en' ? 'العربية' : 'English'}</span>
            </button>

            <div className="hidden md:inline-flex items-center gap-2 px-3 py-1 rounded-full text-[11px] font-medium bg-emerald-500/10 text-emerald-400 border border-emerald-500/20">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse"></span>
              {profile.availabilityBadge || 'Relocation & Contract Ready'}
            </div>

            <a
              href="#contact"
              className="inline-flex items-center gap-1.5 px-4 py-2 rounded-xl text-xs font-semibold text-white bg-blue-600 hover:bg-blue-500 shadow-md shadow-blue-600/20 transition active:scale-95"
            >
              {t.getInTouch}
              <ArrowUpRight className={`w-3.5 h-3.5 ${isRTL ? 'rotate-[-90deg]' : ''}`} />
            </a>
          </div>

          {/* Mobile Right Controls: Language Button + Hamburger */}
          <div className="flex sm:hidden items-center gap-2">
            <button
              onClick={toggleLanguage}
              className="px-2.5 py-1.5 rounded-lg text-xs font-semibold bg-[#12131d] border border-white/10 text-cyan-300"
            >
              {lang === 'en' ? 'عربي' : 'EN'}
            </button>
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="p-2 rounded-xl bg-white/5 border border-white/10 text-gray-300 hover:text-white"
              aria-label="Toggle Menu"
            >
              {mobileMenuOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
            </button>
          </div>

        </div>
      </div>

      {/* Mobile Drawer */}
      {mobileMenuOpen && (
        <div className="lg:hidden bg-[#0a0b10] border-b border-white/10 px-4 pt-3 pb-6 space-y-3">
          <div className="flex flex-col space-y-1">
            {navLinks.map((link) => (
              <a
                key={link.name}
                href={link.href}
                onClick={() => setMobileMenuOpen(false)}
                className="px-4 py-2.5 rounded-lg text-sm font-medium text-gray-300 hover:text-white hover:bg-white/5 transition"
              >
                {link.name}
              </a>
            ))}
          </div>
          <div className="pt-2 border-t border-white/5 flex flex-col gap-2">
            <a
              href={profile.calendlyUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="w-full text-center py-2.5 rounded-xl text-xs font-semibold text-gray-200 bg-white/5 border border-white/10"
            >
              Schedule 1:1 Call
            </a>
            <a
              href="#contact"
              onClick={() => setMobileMenuOpen(false)}
              className="w-full text-center py-2.5 rounded-xl text-xs font-semibold text-white bg-blue-600"
            >
              {t.getInTouch}
            </a>
          </div>
        </div>
      )}
    </header>
  );
}
