import React, { useState } from 'react';
import { HelpCircle, ChevronDown, ChevronUp } from 'lucide-react';
import { useLanguage } from '../context/LanguageContext';
import { uiTranslations } from '../data/uiTranslations';

export default function FAQ({ faq = [] }) {
  const [openIndex, setOpenIndex] = useState(0);
  const { lang, isRTL } = useLanguage();
  const t = uiTranslations[lang]?.faq || uiTranslations.en.faq;

  return (
    <section className="py-24 relative border-t border-white/5 bg-[#090a0f]">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Header */}
        <div className="text-center mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-blue-500/10 text-blue-400 border border-blue-500/20 mb-4">
            <HelpCircle className="w-3.5 h-3.5" />
            {t.badge}
          </div>
          <h2 className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">
            {t.title}
          </h2>
          <p className="mt-3 text-base text-gray-400">
            {t.desc}
          </p>
        </div>

        {/* FAQ Accordion */}
        <div className="space-y-4">
          {faq.map((item, idx) => {
            const isOpen = openIndex === idx;
            return (
              <div
                key={idx}
                className="glass-panel rounded-2xl border border-white/10 overflow-hidden transition"
              >
                <button
                  onClick={() => setOpenIndex(isOpen ? -1 : idx)}
                  className={`w-full p-6 flex items-center justify-between gap-4 hover:bg-white/5 transition ${
                    isRTL ? 'text-right' : 'text-left'
                  }`}
                >
                  <span className="text-base font-bold text-white">
                    {item.q}
                  </span>
                  <div className="p-1 rounded-lg bg-white/5 text-gray-400 shrink-0">
                    {isOpen ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
                  </div>
                </button>

                {isOpen && (
                  <div className={`px-6 pb-6 pt-1 text-sm text-gray-300 leading-relaxed border-t border-white/5 ${
                    isRTL ? 'text-right' : 'text-left'
                  }`}>
                    {item.a}
                  </div>
                )}
              </div>
            );
          })}
        </div>

      </div>
    </section>
  );
}
