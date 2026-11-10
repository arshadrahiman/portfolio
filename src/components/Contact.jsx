import React, { useState } from 'react';
import { Mail, Calendar, Copy, Check, Send, Sparkles, Clock, MessageSquare, ArrowRight, ShieldCheck } from 'lucide-react';
import confetti from 'canvas-confetti';

export default function Contact({ contact, profile }) {
  const [copiedEmail, setCopiedEmail] = useState(false);
  const [submitted, setSubmitted] = useState(false);
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    projectType: 'Zero-to-App Store (Greenfield)',
    timeline: 'Within 1-2 months',
    budget: '$5k - $15k',
    message: ''
  });

  const handleCopy = (text) => {
    navigator.clipboard.writeText(text);
    setCopiedEmail(true);
    setTimeout(() => setCopiedEmail(false), 2000);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!formData.name || !formData.email || !formData.message) return;

    // Trigger celebratory confetti
    confetti({
      particleCount: 80,
      spread: 70,
      origin: { y: 0.6 }
    });

    setSubmitted(true);

    // Optional mailto backup trigger
    const subject = encodeURIComponent(`Project Inquiry: ${formData.projectType} from ${formData.name}`);
    const body = encodeURIComponent(
      `Name: ${formData.name}\nEmail: ${formData.email}\nProject Type: ${formData.projectType}\nTimeline: ${formData.timeline}\nEstimated Budget: ${formData.budget}\n\nProject Details:\n${formData.message}`
    );
    window.open(`mailto:${contact.directEmail}?subject=${subject}&body=${body}`, '_blank');
  };

  return (
    <section id="contact" className="py-24 relative border-t border-white/5 bg-[#08080b]">
      {/* Background glow */}
      <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[350px] bg-gradient-to-tr from-blue-600/10 via-cyan-500/10 to-indigo-600/10 blur-[140px] pointer-events-none -z-10" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Header */}
        <div className="max-w-3xl mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-blue-500/10 text-blue-400 border border-blue-500/20 mb-4">
            <Mail className="w-3.5 h-3.5" />
            Get In Touch
          </div>
          <h2 className="text-3xl sm:text-5xl font-extrabold text-white tracking-tight">
            {contact.headline}
          </h2>
          <p className="mt-4 text-base sm:text-lg text-gray-400 leading-relaxed">
            {contact.subheadline}
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
          
          {/* Left Column: Direct Communication Cards */}
          <div className="lg:col-span-5 space-y-6">
            
            {/* Primary Email Card */}
            <div className="glass-panel rounded-2xl p-6 sm:p-8 border border-white/10 glow-blue">
              <div className="flex items-center justify-between mb-4">
                <div className="w-12 h-12 rounded-xl bg-blue-500/10 border border-blue-500/20 flex items-center justify-center text-blue-400">
                  <Mail className="w-6 h-6" />
                </div>
                <span className="text-[11px] font-mono uppercase text-emerald-400 bg-emerald-500/10 px-2.5 py-1 rounded-full font-semibold border border-emerald-500/20">
                  {contact.availabilityStatus}
                </span>
              </div>

              <h3 className="text-lg font-bold text-white mb-1">
                Direct Email Inquiry
              </h3>
              <p className="text-xs text-gray-400 mb-6">
                Preferred for initial specs, contract briefs, or architecture inquiries.
              </p>

              <div className="p-3.5 rounded-xl bg-[#0d0e15] border border-white/5 flex items-center justify-between mb-4">
                <span className="font-mono text-sm text-cyan-300 select-all">
                  {contact.directEmail}
                </span>
                <button
                  onClick={() => handleCopy(contact.directEmail)}
                  className="p-2 rounded-lg bg-white/5 hover:bg-white/10 text-gray-300 hover:text-white transition"
                  title="Copy Email"
                >
                  {copiedEmail ? <Check className="w-4 h-4 text-green-400" /> : <Copy className="w-4 h-4" />}
                </button>
              </div>

              {contact.secondaryEmail && (
                <div className="p-3 rounded-xl bg-[#0d0e15]/50 border border-white/5 flex items-center justify-between text-xs text-gray-400">
                  <span>Alternate: {contact.secondaryEmail}</span>
                  <button
                    onClick={() => handleCopy(contact.secondaryEmail)}
                    className="hover:text-white"
                  >
                    <Copy className="w-3.5 h-3.5" />
                  </button>
                </div>
              )}

              <div className="mt-6 pt-4 border-t border-white/5 flex items-center gap-2 text-xs text-gray-400">
                <Clock className="w-3.5 h-3.5 text-blue-400" />
                <span>{contact.responseTime}</span>
              </div>
            </div>

            {/* 1:1 Call Booking Card */}
            <div className="glass-panel rounded-2xl p-6 sm:p-8 border border-white/10">
              <div className="flex items-center gap-4 mb-4">
                <div className="w-12 h-12 rounded-xl bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center text-cyan-400">
                  <Calendar className="w-6 h-6" />
                </div>
                <div>
                  <h3 className="text-lg font-bold text-white">
                    Schedule a 1:1 Discovery Call
                  </h3>
                  <p className="text-xs text-gray-400">
                    30 minutes on Google Meet / Zoom
                  </p>
                </div>
              </div>

              <p className="text-xs text-gray-300 leading-relaxed mb-6">
                Discuss roadmap viability, technical scoping, codebase takeover evaluation, or contract fit.
              </p>

              <a
                href={contact.calendlyLink}
                target="_blank"
                rel="noopener noreferrer"
                className="w-full inline-flex items-center justify-center gap-2 py-3 rounded-xl text-xs font-semibold text-white bg-blue-600 hover:bg-blue-500 shadow-md shadow-blue-600/20 transition"
              >
                Book Discovery Call on Calendly
                <ArrowRight className="w-3.5 h-3.5" />
              </a>
            </div>

          </div>

          {/* Right Column: Direct Project Inquiry Form */}
          <div className="lg:col-span-7">
            <div className="glass-panel rounded-3xl p-8 sm:p-10 border border-white/10 glow-accent">
              <div className="flex items-center gap-2 mb-2">
                <MessageSquare className="w-4 h-4 text-blue-400" />
                <span className="text-xs font-mono uppercase font-bold text-gray-400 tracking-wider">
                  Direct Project Inquiry
                </span>
              </div>
              <h3 className="text-2xl font-black text-white mb-6">
                Send Project Details
              </h3>

              {submitted ? (
                <div className="p-8 rounded-2xl bg-emerald-500/10 border border-emerald-500/20 text-center space-y-4">
                  <div className="w-14 h-14 rounded-full bg-emerald-500/20 text-emerald-400 flex items-center justify-center mx-auto">
                    <Check className="w-7 h-7" />
                  </div>
                  <h4 className="text-xl font-bold text-white">Inquiry Received</h4>
                  <p className="text-sm text-gray-300 max-w-md mx-auto">
                    Thank you, {formData.name}. Your project details have been noted. I'll review and respond to <strong className="text-white">{formData.email}</strong> within 2–4 hours.
                  </p>
                  <button
                    onClick={() => setSubmitted(false)}
                    className="text-xs text-blue-400 hover:underline pt-2"
                  >
                    Send another message
                  </button>
                </div>
              ) : (
                <form onSubmit={handleSubmit} className="space-y-6">
                  
                  {/* Name & Email Row */}
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label className="block text-xs font-semibold text-gray-300 mb-2">
                        Your Name *
                      </label>
                      <input
                        type="text"
                        required
                        value={formData.name}
                        onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                        className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 text-sm text-white focus:outline-none focus:border-blue-500/50"
                        placeholder="e.g. Alex Henderson"
                      />
                    </div>
                    <div>
                      <label className="block text-xs font-semibold text-gray-300 mb-2">
                        Work Email *
                      </label>
                      <input
                        type="email"
                        required
                        value={formData.email}
                        onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                        className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 text-sm text-white focus:outline-none focus:border-blue-500/50"
                        placeholder="alex@company.com"
                      />
                    </div>
                  </div>

                  {/* Project Type */}
                  <div>
                    <label className="block text-xs font-semibold text-gray-300 mb-2">
                      Project Type / Scope
                    </label>
                    <select
                      value={formData.projectType}
                      onChange={(e) => setFormData({ ...formData, projectType: e.target.value })}
                      className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 text-sm text-white focus:outline-none focus:border-blue-500/50"
                    >
                      <option value="Zero-to-App Store (Greenfield)">Zero-to-App Store (Greenfield Build)</option>
                      <option value="Legacy App Audit & Takeover">Legacy App Audit & Codebase Takeover</option>
                      <option value="Complex Integration (Hardware / Payments)">Complex Integration (Hardware / Native SDKs / Payments)</option>
                      <option value="Clean Architecture Consulting">Architecture Consulting & Senior Advisory</option>
                    </select>
                  </div>

                  {/* Budget & Timeline Row */}
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label className="block text-xs font-semibold text-gray-300 mb-2">
                        Estimated Timeline
                      </label>
                      <select
                        value={formData.timeline}
                        onChange={(e) => setFormData({ ...formData, timeline: e.target.value })}
                        className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 text-sm text-white focus:outline-none focus:border-blue-500/50"
                      >
                        <option value="Immediately (ASAP)">Immediately (ASAP)</option>
                        <option value="Within 1-2 months">Within 1–2 months</option>
                        <option value="Within 3-6 months">Within 3–6 months</option>
                        <option value="Exploring Feasibility">Exploring Feasibility</option>
                      </select>
                    </div>

                    <div>
                      <label className="block text-xs font-semibold text-gray-300 mb-2">
                        Estimated Budget
                      </label>
                      <select
                        value={formData.budget}
                        onChange={(e) => setFormData({ ...formData, budget: e.target.value })}
                        className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 text-sm text-white focus:outline-none focus:border-blue-500/50"
                      >
                        <option value="$5k - $15k">$5,000 – $15,000</option>
                        <option value="$15k - $30k">$15,000 – $30,000</option>
                        <option value="$30k+">$30,000+</option>
                        <option value="Hourly / Retainer">Hourly / Retainer Based</option>
                      </select>
                    </div>
                  </div>

                  {/* Message */}
                  <div>
                    <label className="block text-xs font-semibold text-gray-300 mb-2">
                      Project Overview & Objectives *
                    </label>
                    <textarea
                      required
                      rows={4}
                      value={formData.message}
                      onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                      className="w-full bg-[#0d0e15] border border-white/10 rounded-xl p-4 text-sm text-white focus:outline-none focus:border-blue-500/50 resize-none"
                      placeholder="Briefly describe the product vision, current pain points, target platforms, or tech stack..."
                    />
                  </div>

                  {/* Submit Button */}
                  <button
                    type="submit"
                    className="w-full py-4 rounded-xl text-sm font-bold text-white bg-gradient-to-r from-blue-600 to-cyan-600 hover:from-blue-500 hover:to-cyan-500 shadow-xl shadow-blue-600/25 transition active:scale-[0.99] flex items-center justify-center gap-2"
                  >
                    <Send className="w-4 h-4" />
                    Submit Project Inquiry
                  </button>

                  <div className="flex items-center justify-center gap-2 text-[11px] text-gray-500 pt-1 font-mono">
                    <ShieldCheck className="w-3.5 h-3.5 text-emerald-400" />
                    Strict NDA compliant. Your product IP is 100% safeguarded.
                  </div>

                </form>
              )}
            </div>
          </div>

        </div>

      </div>
    </section>
  );
}

