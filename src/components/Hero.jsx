import React, { useState, useEffect } from 'react';
import { ArrowRight, Calendar, Copy, Check, ShieldCheck, Sparkles, Smartphone, Terminal, MapPin, Briefcase, ExternalLink } from 'lucide-react';

export default function Hero({ profile }) {
  const [copiedEmail, setCopiedEmail] = useState(false);
  
  // Rotating typing text from README
  const typingLines = [
    "Crafting secure, high-performance mobile apps 🛡️",
    "Flutter · Kotlin · React Native · Java · Swift",
    "Node.js · TypeScript · Python · PHP · .NET",
    "Banking · Fintech · Insurance · 7+ Years Experience",
    "Ready to relocate to any location globally ✈️",
    "Available for Full-Time & Contract roles 💼"
  ];
  const [lineIndex, setLineIndex] = useState(0);

  useEffect(() => {
    const timer = setInterval(() => {
      setLineIndex((prev) => (prev + 1) % typingLines.length);
    }, 3200);
    return () => clearInterval(timer);
  }, [typingLines.length]);

  const handleCopyEmail = () => {
    navigator.clipboard.writeText(profile.email);
    setCopiedEmail(true);
    setTimeout(() => setCopiedEmail(false), 2000);
  };

  return (
    <section className="relative pt-32 pb-20 md:pt-40 md:pb-28 overflow-hidden">
      {/* Background radial glow */}
      <div className="absolute top-1/4 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[650px] h-[380px] bg-gradient-to-tr from-blue-600/15 via-cyan-500/10 to-indigo-600/15 blur-[130px] pointer-events-none -z-10" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-8 items-center">
          
          {/* Left Column: Headline & Value Proposition */}
          <div className="lg:col-span-7 space-y-7">
            
            {/* Status & Location Badges */}
            <div className="flex flex-wrap items-center gap-2">
              <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold bg-emerald-500/10 border border-emerald-500/25 text-emerald-400">
                <span className="flex h-2 w-2 relative">
                  <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                  <span className="relative inline-flex rounded-full h-2 w-2 bg-emerald-500"></span>
                </span>
                <span>OPEN TO WORK</span>
              </div>

              <div className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-semibold bg-cyan-500/10 border border-cyan-500/20 text-cyan-300">
                <MapPin className="w-3.5 h-3.5 text-cyan-400" />
                <span>READY TO RELOCATE ANYWHERE 🌍</span>
              </div>

              <div className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-semibold bg-purple-500/10 border border-purple-500/20 text-purple-300">
                <Briefcase className="w-3.5 h-3.5 text-purple-400" />
                <span>FULL-TIME &amp; CONTRACT READY</span>
              </div>

              <div className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-semibold bg-blue-500/10 border border-blue-500/20 text-blue-300">
                <span>7+ YEARS EXP</span>
              </div>
            </div>

            {/* Profile Avatar + Name */}
            <div className="flex items-center gap-4">
              <div className="relative group shrink-0">
                <div className="w-16 h-16 sm:w-20 sm:h-20 rounded-2xl p-[2px] bg-gradient-to-tr from-blue-500 via-cyan-400 to-indigo-500 shadow-xl shadow-blue-500/25">
                  <img
                    src="/profile.jpg"
                    alt="Abdullah Arshadul Rahman"
                    className="w-full h-full object-cover object-[center_20%] rounded-[14px]"
                    onError={(e) => { e.target.src = '/assets/icons/profile_pic.jpg'; }}
                  />
                </div>
                <div className="absolute -bottom-1 -right-1 w-5 h-5 rounded-full bg-[#08080b] flex items-center justify-center">
                  <div className="w-3 h-3 rounded-full bg-emerald-500 ring-2 ring-[#08080b] animate-pulse"></div>
                </div>
              </div>
              <div>
                <span className="text-xs font-mono uppercase tracking-wider text-cyan-400 font-bold block">
                  Abdullah Arshadul Rahman
                </span>
                <span className="text-sm font-semibold text-gray-200">
                  Senior Mobile Team Lead & Full-Stack Architect
                </span>
                <p className="text-xs text-gray-400 mt-0.5">
                  Mobcoder (Tawuniya Insurance) · Formerly Leader IT Riyadh
                </p>
              </div>
            </div>

            {/* Main Headline */}
            <div>
              <h1 className="text-4xl sm:text-5xl lg:text-6xl font-black text-white tracking-tight leading-[1.12]">
                Crafting secure, high-performance mobile apps that{' '}
                <span className="bg-gradient-to-r from-blue-400 via-cyan-300 to-indigo-300 bg-clip-text text-transparent">
                  hold up
                </span>{' '}
                in production.
              </h1>
            </div>

            {/* Dynamic Typing Banner */}
            <div className="p-3 rounded-xl bg-[#12131e] border border-white/5 font-mono text-xs sm:text-sm text-cyan-300 flex items-center gap-2 shadow-inner">
              <span className="text-gray-500">~/</span>
              <span className="text-gray-400 font-semibold">$</span>
              <span className="transition-opacity duration-300">
                {typingLines[lineIndex]}
              </span>
              <span className="w-2 h-4 bg-cyan-400 animate-pulse ml-auto inline-block"></span>
            </div>

            {/* Subheadline */}
            <p className="text-sm sm:text-base text-gray-400 leading-relaxed max-w-2xl">
              {profile.hero.subheadline}
            </p>

            {/* Action Buttons */}
            <div className="flex flex-wrap items-center gap-3.5 pt-2">
              <a
                href="#work"
                className="inline-flex items-center gap-2 px-6 py-3.5 rounded-xl text-sm font-semibold text-white bg-blue-600 hover:bg-blue-500 shadow-xl shadow-blue-600/25 transition active:scale-95"
              >
                Explore Case Studies
                <ArrowRight className="w-4 h-4" />
              </a>

              <a
                href={profile.calendlyUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 px-5 py-3.5 rounded-xl text-sm font-medium text-gray-200 bg-[#12131b] hover:bg-[#181a25] border border-white/10 transition active:scale-95"
              >
                <Calendar className="w-4 h-4 text-blue-400" />
                Schedule 1:1 Call
              </a>

              {/* Quick Copy Email Button */}
              <button
                onClick={handleCopyEmail}
                className="inline-flex items-center gap-2 px-4 py-3.5 rounded-xl text-xs font-mono text-gray-300 hover:text-white bg-white/5 hover:bg-white/10 border border-white/10 transition active:scale-95"
                title="Copy Direct Email"
              >
                {copiedEmail ? <Check className="w-4 h-4 text-green-400" /> : <Copy className="w-4 h-4" />}
                <span>{profile.email}</span>
                {copiedEmail && <span className="text-green-400 font-sans text-[11px]">(Copied!)</span>}
              </button>
            </div>

            {/* Stats Grid */}
            <div className="grid grid-cols-2 sm:grid-cols-4 gap-4 pt-6 border-t border-white/5">
              {profile.hero.stats.map((stat, idx) => (
                <div key={idx} className="space-y-1">
                  <div className="text-2xl sm:text-3xl font-extrabold text-white font-mono tracking-tight">
                    {stat.value}
                  </div>
                  <div className="text-xs font-semibold text-gray-300">
                    {stat.label}
                  </div>
                  <div className="text-[11px] text-gray-500">
                    {stat.detail}
                  </div>
                </div>
              ))}
            </div>

          </div>

          {/* Right Column: Code & Architecture Terminal Card */}
          <div className="lg:col-span-5">
            <div className="relative glass-panel rounded-2xl p-5 border border-white/10 shadow-2xl glow-blue">
              
              {/* Terminal Window Header */}
              <div className="flex items-center justify-between pb-4 mb-4 border-b border-white/5">
                <div className="flex items-center gap-2">
                  <div className="w-3 h-3 rounded-full bg-red-500/80"></div>
                  <div className="w-3 h-3 rounded-full bg-yellow-500/80"></div>
                  <div className="w-3 h-3 rounded-full bg-green-500/80"></div>
                  <span className="ml-2 font-mono text-[11px] text-gray-400">security_certificate_pinning.dart</span>
                </div>
                <span className="text-[10px] uppercase font-mono px-2 py-0.5 rounded bg-rose-500/10 text-rose-300 border border-rose-500/20 font-bold">
                  OWASP MASVS
                </span>
              </div>

              {/* Code Snippet Display with Pinning & Secure Enclave */}
              <pre className="font-mono text-[12px] leading-relaxed text-gray-300 overflow-x-auto space-y-1">
                <code>
                  <span className="text-purple-400">class</span> <span className="text-yellow-300">SecureFintechClient</span> {'{\n'}
                  {'  '}<span className="text-purple-400">final</span> <span className="text-blue-300">Dio</span> _dio = <span className="text-blue-300">Dio</span>();{'\n\n'}
                  {'  '}<span className="text-cyan-300">void</span> <span className="text-green-300">enableCertificatePinning</span>() {'{\n'}
                  {'    '}<span className="text-gray-500">// 1. Pin SHA-256 Public Key SPKI</span>{'\n'}
                  {'    '}_dio.httpClientAdapter = <span className="text-yellow-300">DefaultHttpClientAdapter</span>({'\n'}
                  {'      '}onHttpClientCreate: (client) {'{\n'}
                  {'        '}client.badCertificateCallback = (cert, host, port) {'{\n'}
                  {'          '}<span className="text-purple-400">return</span> <span className="text-yellow-300">CryptoUtils</span>.verifyHash(cert);{'\n'}
                  {'        }'};{'\n'}
                  {'      }'},{'\n'}
                  {'    '});{'\n'}
                  {'  }'}{'\n\n'}
                  {'  '}<span className="text-gray-500">// 2. Hardware Biometric Enclave</span>{'\n'}
                  {'  '}<span className="text-blue-400">Future</span>&lt;<span className="text-yellow-300">bool</span>&gt; <span className="text-cyan-300">authenticateBiometrics</span>() <span className="text-purple-400">async</span> {'{\n'}
                  {'    '}<span className="text-purple-400">return</span> <span className="text-purple-400">await</span> <span className="text-yellow-300">LocalAuth</span>.authenticate({'\n'}
                  {'      '}localizedReason: <span className="text-green-300">"Authorize Banking Transaction"</span>,{'\n'}
                  {'      '}options: <span className="text-yellow-300">AuthenticationOptions</span>(biometricOnly: <span className="text-purple-400">true</span>),{'\n'}
                  {'    '});{'\n'}
                  {'  }'}{'\n'}
                  {'}'}
                </code>
              </pre>

              {/* Footer Meta inside Card */}
              <div className="mt-4 pt-3 border-t border-white/5 flex items-center justify-between text-[11px] font-mono text-gray-500">
                <span className="flex items-center gap-1.5 text-emerald-400">
                  <ShieldCheck className="w-3.5 h-3.5" />
                  SSL Pinning & Hardware Biometrics
                </span>
                <span>Zero MITM Vulnerabilities</span>
              </div>
            </div>
          </div>

        </div>
      </div>
    </section>
  );
}
