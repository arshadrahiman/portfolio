import React from 'react';
import { ArrowUp, Github, Linkedin, Twitter, Instagram } from 'lucide-react';

export default function Footer({ profile }) {
  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  return (
    <footer className="py-16 border-t border-white/5 bg-[#050608] text-gray-400">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        <div className="flex flex-col md:flex-row items-center justify-between gap-8 pb-12 border-b border-white/5">
          
          {/* Identity & Mission */}
          <div className="space-y-2 text-center md:text-left">
            <div className="flex items-center justify-center md:justify-start gap-2.5">
              <span className="font-bold text-white text-base">
                {profile.name}
              </span>
              <span className="text-xs px-2 py-0.5 rounded-full bg-blue-500/10 text-blue-400 font-mono border border-blue-500/20">
                Senior Mobile Engineer
              </span>
            </div>
            <p className="text-xs text-gray-500 max-w-sm">
              Cross-platform mobile applications engineered with Clean Architecture, offline resilience, and zero unhandled errors.
            </p>
          </div>

          {/* Social Links */}
          <div className="flex items-center gap-3">
            {profile.socialLinks.github && (
              <a
                href={profile.socialLinks.github}
                target="_blank"
                rel="noopener noreferrer"
                className="p-2.5 rounded-xl bg-white/5 hover:bg-white/10 text-gray-400 hover:text-white transition border border-white/5"
                aria-label="GitHub"
              >
                <Github className="w-4 h-4" />
              </a>
            )}
            {profile.socialLinks.linkedin && (
              <a
                href={profile.socialLinks.linkedin}
                target="_blank"
                rel="noopener noreferrer"
                className="p-2.5 rounded-xl bg-white/5 hover:bg-white/10 text-gray-400 hover:text-white transition border border-white/5"
                aria-label="LinkedIn"
              >
                <Linkedin className="w-4 h-4" />
              </a>
            )}
            {profile.socialLinks.twitter && (
              <a
                href={profile.socialLinks.twitter}
                target="_blank"
                rel="noopener noreferrer"
                className="p-2.5 rounded-xl bg-white/5 hover:bg-white/10 text-gray-400 hover:text-white transition border border-white/5"
                aria-label="Twitter"
              >
                <Twitter className="w-4 h-4" />
              </a>
            )}
            {profile.socialLinks.instagram && (
              <a
                href={profile.socialLinks.instagram}
                target="_blank"
                rel="noopener noreferrer"
                className="p-2.5 rounded-xl bg-white/5 hover:bg-white/10 text-gray-400 hover:text-white transition border border-white/5"
                aria-label="Instagram"
              >
                <Instagram className="w-4 h-4" />
              </a>
            )}
            <button
              onClick={scrollToTop}
              className="p-2.5 rounded-xl bg-blue-600/10 hover:bg-blue-600/20 text-blue-400 transition border border-blue-500/20 ml-2"
              title="Back to Top"
            >
              <ArrowUp className="w-4 h-4" />
            </button>
          </div>

        </div>

        {/* Bottom Credits & Copyright */}
        <div className="pt-8 flex flex-col sm:flex-row items-center justify-between text-xs text-gray-500 gap-4">
          <div>
            © {new Date().getFullYear()} {profile.name}. All rights reserved.
          </div>
          <div className="flex items-center gap-1">
            Built with React, Vite & Tailwind CSS · Clean Architecture Powered
          </div>
        </div>

      </div>
    </footer>
  );
}

