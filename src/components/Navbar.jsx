import React, { useState, useEffect } from 'react';
import { Menu, X, ArrowUpRight, Sparkles, Terminal } from 'lucide-react';

export default function Navbar({ profile }) {
  const [scrolled, setScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 20);
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const navLinks = [
    { name: 'Selected Work', href: '#work' },
    { name: 'Services', href: '#services' },
    { name: 'Experience', href: '#experience' },
    { name: 'Architecture', href: '#architecture' },
    { name: 'Tech Stack', href: '#stack' },
    { name: 'Utilities', href: '#utilities' },
    { name: 'Contact', href: '#contact' },
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
                  alt="Arshad Rahman"
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
                Arshad Rahman
              </span>
              <span className="text-[11px] font-mono text-gray-400">
                mobile team lead
              </span>
            </div>
          </a>

          {/* Desktop Navigation Links */}
          <nav className="hidden md:flex items-center gap-1 bg-[#12131b]/60 border border-white/5 px-3 py-1.5 rounded-full backdrop-blur-md">
            {navLinks.map((link) => (
              <a
                key={link.name}
                href={link.href}
                className="px-3.5 py-1.5 text-xs font-medium text-gray-300 hover:text-white hover:bg-white/5 rounded-full transition"
              >
                {link.name}
              </a>
            ))}
          </nav>

          {/* Right Action: Status Pill + Book Call */}
          <div className="hidden lg:flex items-center gap-3">
            <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full text-[11px] font-medium bg-emerald-500/10 text-emerald-400 border border-emerald-500/20">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse"></span>
              Relocation &amp; Contract Ready
            </div>

            <a
              href="#contact"
              className="inline-flex items-center gap-1.5 px-4 py-2 rounded-xl text-xs font-semibold text-white bg-blue-600 hover:bg-blue-500 shadow-md shadow-blue-600/20 transition active:scale-95"
            >
              Get in touch
              <ArrowUpRight className="w-3.5 h-3.5" />
            </a>
          </div>

          {/* Mobile Menu Toggle Button */}
          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="md:hidden p-2 rounded-xl bg-white/5 border border-white/10 text-gray-300 hover:text-white"
            aria-label="Toggle Menu"
          >
            {mobileMenuOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
          </button>
        </div>
      </div>

      {/* Mobile Drawer */}
      {mobileMenuOpen && (
        <div className="md:hidden bg-[#0a0b10] border-b border-white/10 px-4 pt-3 pb-6 space-y-3">
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
              Contact Me
            </a>
          </div>
        </div>
      )}
    </header>
  );
}
