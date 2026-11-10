import React, { useState } from 'react';
import { Mail, Calendar, Copy, Check, Send, Clock, MessageSquare, ArrowRight, ShieldCheck } from 'lucide-react';
import confetti from 'canvas-confetti';
import { useLanguage } from '../context/LanguageContext';
import { uiTranslations } from '../data/uiTranslations';

export default function Contact({ contact, profile }) {
  const [copiedEmail, setCopiedEmail] = useState(false);
  const [submitted, setSubmitted] = useState(false);
  const { lang, isRTL } = useLanguage();
  const t = uiTranslations[lang]?.contact || uiTranslations.en.contact;

  const projectTypeOptions = lang === 'ar' ? [
    { value: 'Senior Role / Tech Lead (Ready to Relocate)', label: 'منصب قيادي / مطور أول (جاهز للانتقال الفوري)' },
    { value: 'Contract / Freelance Engagement', label: 'عقد عمل / استشارات تقنية (مشروع قصير أو طويل المدى)' },
    { value: 'Zero-to-App Store (Greenfield)', label: 'بناء تطبيق متكامل من الصفر حتى متاجر التطبيقات' },
    { value: 'Legacy App Audit & Takeover', label: 'تدقيق واستلام كود تطبيق قائم (Codebase Takeover)' },
    { value: 'Clean Architecture & Security Consulting', label: 'استشارات معمارية وتأمين تطبيقات الجوال (OWASP)' },
  ] : [
    { value: 'Senior Role / Tech Lead (Ready to Relocate)', label: 'Senior Role / Tech Lead (Full-Time - Relocation Ready)' },
    { value: 'Contract / Freelance Engagement', label: 'Contract Engagement (Short or Long-Term)' },
    { value: 'Zero-to-App Store (Greenfield)', label: 'Zero-to-App Store (Greenfield Build)' },
    { value: 'Legacy App Audit & Takeover', label: 'Legacy App Audit & Codebase Takeover' },
    { value: 'Clean Architecture & Security Consulting', label: 'Architecture & OWASP Security Consulting' },
  ];

  const timelineOptions = lang === 'ar' ? [
    { value: 'Immediately (ASAP)', label: 'فوراً وبشكل عاجل (ASAP)' },
    { value: 'Within 1-2 months', label: 'خلال شهر إلى شهرين' },
    { value: 'Within 3-6 months', label: 'خلال ٣ إلى ٦ أشهر' },
    { value: 'Exploring Feasibility', label: 'استكشاف الجدوى الفنية' },
  ] : [
    { value: 'Immediately (ASAP)', label: 'Immediately (ASAP)' },
    { value: 'Within 1-2 months', label: 'Within 1–2 months' },
    { value: 'Within 3-6 months', label: 'Within 3–6 months' },
    { value: 'Exploring Feasibility', label: 'Exploring Feasibility' },
  ];

  const budgetOptions = lang === 'ar' ? [
    { value: 'Competitive Full-Time / Relocation', label: 'حزمة تعويض بدوام كامل (مع حزمة الانتقال)' },
    { value: 'Hourly / Daily Retainer', label: 'عقد بالساعة أو باليوم (Retainer)' },
    { value: '$5k - $15k Project', label: 'مشروع بقيمة ٥,٠٠٠ – ١٥,٠٠٠ دولار' },
    { value: '$15k - $30k Project', label: 'مشروع بقيمة ١٥,٠٠٠ – ٣٠,٠٠٠ دولار' },
    { value: '$30k+ Project', label: 'مشروع مؤسسي بقيمة +٣٠,٠٠٠ دولار' },
  ] : [
    { value: 'Competitive Full-Time / Relocation', label: 'Full-Time Compensation (Relocation Package)' },
    { value: 'Hourly / Daily Retainer', label: 'Contract / Retainer (Hourly / Daily Rate)' },
    { value: '$5k - $15k Project', label: '$5,000 – $15,000 Project' },
    { value: '$15k - $30k Project', label: '$15,000 – $30,000 Project' },
    { value: '$30k+ Project', label: '$30,000+ Enterprise Scope' },
  ];

  const [formData, setFormData] = useState({
    name: '',
    email: '',
    projectType: 'Senior Role / Tech Lead (Ready to Relocate)',
    timeline: 'Immediately (ASAP)',
    budget: 'Competitive Full-Time / Relocation',
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

    // mailto trigger
    const directEmail = contact?.directEmail || profile?.email || 'arshadrahman.dev@gmail.com';
    const subject = encodeURIComponent(`Project / Role Inquiry: ${formData.projectType} from ${formData.name}`);
    const body = encodeURIComponent(
      `Name: ${formData.name}\nEmail: ${formData.email}\nProject Type: ${formData.projectType}\nTimeline: ${formData.timeline}\nEstimated Budget: ${formData.budget}\n\nProject Details:\n${formData.message}`
    );
    window.open(`mailto:${directEmail}?subject=${subject}&body=${body}`, '_blank');
  };

  const directEmail = contact?.directEmail || profile?.email || 'arshadrahman.dev@gmail.com';
  const calendlyLink = contact?.calendlyLink || profile?.calendlyUrl || 'https://calendly.com/software-engineer-arshadrahman';

  return (
    <section id="contact" className="py-24 relative border-t border-white/5 bg-[#08080b]">
      {/* Background glow */}
      <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[350px] bg-gradient-to-tr from-blue-600/10 via-cyan-500/10 to-indigo-600/10 blur-[140px] pointer-events-none -z-10" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Header */}
        <div className={`max-w-3xl mb-16 ${isRTL ? 'text-right' : 'text-left'}`}>
          <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-blue-500/10 text-blue-400 border border-blue-500/20 mb-4">
            <Mail className="w-3.5 h-3.5" />
            {t.badge}
          </div>
          <h2 className="text-3xl sm:text-5xl font-extrabold text-white tracking-tight">
            {contact?.headline || (lang === 'ar' ? 'فلنبنِ معاً حلولاً آمنة واستثنائية.' : "Let's build something secure and exceptional.")}
          </h2>
          <p className="mt-4 text-base sm:text-lg text-gray-400 leading-relaxed">
            {contact?.subheadline || (lang === 'ar' ? 'متاح للوظائف القيادية في هندسة الجوال عالمياً (جاهز للانتقال الفوري)، ولعقود العمل البرمجية.' : 'Available for Senior Mobile / Tech Lead roles globally (Ready to Relocate), contract engagements, and enterprise codebase takeovers.')}
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
                  {contact?.availabilityStatus || (lang === 'ar' ? 'متاح فوراً · جاهز للانتقال والعقود' : 'Immediately Available · Global Relocation')}
                </span>
              </div>

              <h3 className="text-lg font-bold text-white mb-1">
                {t.emailInquiry}
              </h3>
              <p className="text-xs text-gray-400 mb-6">
                {t.emailDesc}
              </p>

              <div className="p-3.5 rounded-xl bg-[#0d0e15] border border-white/5 flex items-center justify-between mb-4">
                <span className="font-mono text-sm text-cyan-300 select-all" dir="ltr">
                  {directEmail}
                </span>
                <button
                  onClick={() => handleCopy(directEmail)}
                  className="p-2 rounded-lg bg-white/5 hover:bg-white/10 text-gray-300 hover:text-white transition"
                  title={lang === 'ar' ? 'نسخ البريد' : 'Copy Email'}
                >
                  {copiedEmail ? <Check className="w-4 h-4 text-green-400" /> : <Copy className="w-4 h-4" />}
                </button>
              </div>

              <div className="mt-6 pt-4 border-t border-white/5 flex items-center gap-2 text-xs text-gray-400">
                <Clock className="w-3.5 h-3.5 text-blue-400" />
                <span>{contact?.responseTime || (lang === 'ar' ? 'رد معتاد خلال ساعتين إلى ٤ ساعات' : 'Typical response within 2–4 hours')}</span>
              </div>
            </div>

            {/* 1:1 Call Booking Card */}
            <div className="glass-panel rounded-2xl p-6 sm:p-8 border border-white/10">
              <div className="flex items-center gap-4 mb-4">
                <div className="w-12 h-12 rounded-xl bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center text-cyan-400 shrink-0">
                  <Calendar className="w-6 h-6" />
                </div>
                <div>
                  <h3 className="text-lg font-bold text-white">
                    {t.scheduleCallTitle}
                  </h3>
                  <p className="text-xs text-gray-400">
                    {t.scheduleCallSubtitle}
                  </p>
                </div>
              </div>

              <p className="text-xs text-gray-300 leading-relaxed mb-6">
                {t.scheduleCallDesc}
              </p>

              <a
                href={calendlyLink}
                target="_blank"
                rel="noopener noreferrer"
                className="w-full inline-flex items-center justify-center gap-2 py-3 rounded-xl text-xs font-semibold text-white bg-blue-600 hover:bg-blue-500 shadow-md shadow-blue-600/20 transition active:scale-[0.99]"
              >
                {t.scheduleCallBtn}
                <ArrowRight className={`w-3.5 h-3.5 ${isRTL ? 'rotate-180' : ''}`} />
              </a>
            </div>

          </div>

          {/* Right Column: Direct Project Inquiry Form */}
          <div className="lg:col-span-7">
            <div className="glass-panel rounded-3xl p-8 sm:p-10 border border-white/10 glow-accent">
              <div className="flex items-center gap-2 mb-2">
                <MessageSquare className="w-4 h-4 text-blue-400" />
                <span className="text-xs font-mono uppercase font-bold text-gray-400 tracking-wider">
                  {t.formHeader}
                </span>
              </div>
              <h3 className="text-2xl font-black text-white mb-6">
                {t.formTitle}
              </h3>

              {submitted ? (
                <div className="p-8 rounded-2xl bg-emerald-500/10 border border-emerald-500/20 text-center space-y-4">
                  <div className="w-14 h-14 rounded-full bg-emerald-500/20 text-emerald-400 flex items-center justify-center mx-auto">
                    <Check className="w-7 h-7" />
                  </div>
                  <h4 className="text-xl font-bold text-white">{t.successTitle}</h4>
                  <p className="text-sm text-gray-300 max-w-md mx-auto">
                    {t.successDesc.replace('{name}', formData.name).replace('{email}', formData.email)}
                  </p>
                  <button
                    onClick={() => setSubmitted(false)}
                    className="text-xs text-blue-400 hover:underline pt-2 inline-block cursor-pointer"
                  >
                    {t.sendAnother}
                  </button>
                </div>
              ) : (
                <form onSubmit={handleSubmit} className="space-y-6">
                  
                  {/* Name & Email Row */}
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label className="block text-xs font-semibold text-gray-300 mb-2">
                        {t.nameLabel}
                      </label>
                      <input
                        type="text"
                        required
                        value={formData.name}
                        onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                        className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 text-sm text-white focus:outline-none focus:border-blue-500/50"
                        placeholder={lang === 'ar' ? 'مثال: عبد الله أحمد' : 'e.g. Alex Henderson'}
                      />
                    </div>
                    <div>
                      <label className="block text-xs font-semibold text-gray-300 mb-2">
                        {t.emailLabel}
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
                      {t.scopeLabel}
                    </label>
                    <select
                      value={formData.projectType}
                      onChange={(e) => setFormData({ ...formData, projectType: e.target.value })}
                      className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 text-sm text-white focus:outline-none focus:border-blue-500/50"
                    >
                      {projectTypeOptions.map((opt) => (
                        <option key={opt.value} value={opt.value}>
                          {opt.label}
                        </option>
                      ))}
                    </select>
                  </div>

                  {/* Budget & Timeline Row */}
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                      <label className="block text-xs font-semibold text-gray-300 mb-2">
                        {t.timelineLabel}
                      </label>
                      <select
                        value={formData.timeline}
                        onChange={(e) => setFormData({ ...formData, timeline: e.target.value })}
                        className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 text-sm text-white focus:outline-none focus:border-blue-500/50"
                      >
                        {timelineOptions.map((opt) => (
                          <option key={opt.value} value={opt.value}>
                            {opt.label}
                          </option>
                        ))}
                      </select>
                    </div>

                    <div>
                      <label className="block text-xs font-semibold text-gray-300 mb-2">
                        {t.budgetLabel}
                      </label>
                      <select
                        value={formData.budget}
                        onChange={(e) => setFormData({ ...formData, budget: e.target.value })}
                        className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 text-sm text-white focus:outline-none focus:border-blue-500/50"
                      >
                        {budgetOptions.map((opt) => (
                          <option key={opt.value} value={opt.value}>
                            {opt.label}
                          </option>
                        ))}
                      </select>
                    </div>
                  </div>

                  {/* Message */}
                  <div>
                    <label className="block text-xs font-semibold text-gray-300 mb-2">
                      {t.messageLabel}
                    </label>
                    <textarea
                      required
                      rows={4}
                      value={formData.message}
                      onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                      className="w-full bg-[#0d0e15] border border-white/10 rounded-xl p-4 text-sm text-white focus:outline-none focus:border-blue-500/50 resize-none"
                      placeholder={t.messagePlaceholder}
                    />
                  </div>

                  {/* Submit Button */}
                  <button
                    type="submit"
                    className="w-full py-4 rounded-xl text-sm font-bold text-white bg-gradient-to-r from-blue-600 to-cyan-600 hover:from-blue-500 hover:to-cyan-500 shadow-xl shadow-blue-600/25 transition active:scale-[0.99] flex items-center justify-center gap-2 cursor-pointer"
                  >
                    <Send className={`w-4 h-4 ${isRTL ? 'rotate-180' : ''}`} />
                    {t.submitBtn}
                  </button>

                  <div className="flex items-center justify-center gap-2 text-[11px] text-gray-500 pt-1 font-mono">
                    <ShieldCheck className="w-3.5 h-3.5 text-emerald-400" />
                    {t.ndaNote}
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
