import React, { useState } from 'react';
import { ExternalLink, Github, Smartphone, TrendingUp, CheckCircle } from 'lucide-react';
import { useLanguage } from '../context/LanguageContext';
import { uiTranslations } from '../data/uiTranslations';

export default function SelectedWork({ caseStudies }) {
  const [filter, setFilter] = useState('featured');
  const { lang, isRTL } = useLanguage();
  const t = uiTranslations[lang]?.work || uiTranslations.en.work;

  const filteredStudies = filter === 'featured'
    ? caseStudies.filter(c => c.featured)
    : caseStudies;

  return (
    <section id="work" className="py-24 relative border-t border-white/5 bg-[#08080b]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-16">
          <div className="max-w-2xl">
            <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-blue-500/10 text-blue-400 border border-blue-500/20 mb-4">
              <Smartphone className="w-3.5 h-3.5" />
              {t.badge}
            </div>
            <h2 className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">
              {t.title}
            </h2>
            <p className="mt-3 text-base text-gray-400">
              {t.desc}
            </p>
          </div>

          {/* Filter Pills */}
          <div className="mt-6 md:mt-0 flex items-center gap-2 p-1 bg-[#12131c] rounded-xl border border-white/5">
            <button
              onClick={() => setFilter('featured')}
              className={`px-4 py-2 rounded-lg text-xs font-medium transition ${
                filter === 'featured'
                  ? 'bg-blue-600 text-white font-semibold shadow-md shadow-blue-600/30'
                  : 'text-gray-400 hover:text-white'
              }`}
            >
              {t.filterFeatured}
            </button>
            <button
              onClick={() => setFilter('all')}
              className={`px-4 py-2 rounded-lg text-xs font-medium transition ${
                filter === 'all'
                  ? 'bg-blue-600 text-white font-semibold shadow-md shadow-blue-600/30'
                  : 'text-gray-400 hover:text-white'
              }`}
            >
              {t.filterAll} ({caseStudies.length})
            </button>
          </div>
        </div>

        {/* Case Studies Cards */}
        <div className="space-y-12">
          {filteredStudies.map((study) => (
            <div
              key={study.id}
              className="glass-panel glass-panel-hover rounded-3xl p-8 sm:p-10 border border-white/10 glow-blue overflow-hidden relative"
            >
              <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
                
                {/* Left Side: Project Metadata & Description */}
                <div className="lg:col-span-7 space-y-6">
                  
                  {/* Category & Platforms Badge Row */}
                  <div className="flex flex-wrap items-center gap-3">
                    <span className="text-xs font-mono uppercase font-bold tracking-wider text-blue-400 px-3 py-1 rounded-full bg-blue-500/10 border border-blue-500/20">
                      {study.category}
                    </span>
                    <div className="flex items-center gap-1.5 text-xs text-gray-400">
                      {study.platforms.map((p, pIdx) => (
                        <span key={pIdx} className="px-2.5 py-0.5 rounded-md bg-white/5 border border-white/5 font-mono text-[11px]">
                          {p}
                        </span>
                      ))}
                    </div>
                  </div>

                  {/* Title & Tagline */}
                  <div>
                    <h3 className="text-2xl sm:text-3xl font-black text-white tracking-tight">
                      {study.title}
                    </h3>
                    <p className="text-sm font-semibold text-cyan-300 mt-1">
                      {study.tagline}
                    </p>
                  </div>

                  {/* Summary & Solution */}
                  <p className="text-sm text-gray-300 leading-relaxed">
                    {study.summary}
                  </p>

                  {/* Challenge & Solution Callout */}
                  <div className="space-y-3 pt-2 text-xs text-gray-400 border-t border-white/5">
                    <div>
                      <strong className="text-gray-200">{t.problemSpace}</strong>
                      {study.challenge}
                    </div>
                    <div>
                      <strong className="text-gray-200">{t.solution}</strong>
                      {study.solution}
                    </div>
                  </div>

                  {/* Tech Stack Chips */}
                  <div className="flex flex-wrap gap-2 pt-2">
                    {study.tags.map((tag, tIdx) => (
                      <span
                        key={tIdx}
                        className="px-2.5 py-1 rounded-lg bg-white/5 border border-white/5 text-[11px] font-mono text-gray-300"
                      >
                        {tag}
                      </span>
                    ))}
                  </div>

                  {/* Action Link */}
                  <div className="pt-4 flex flex-wrap items-center gap-3">
                    {study.liveUrl && study.liveUrl !== '#contact' && (
                      <a
                        href={study.liveUrl}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-xs font-semibold text-white bg-blue-600 hover:bg-blue-500 shadow-md shadow-blue-600/20 transition"
                      >
                        <ExternalLink className="w-3.5 h-3.5" />
                        {study.id === 'physiotally' ? t.viewPlayStore : t.viewLive}
                      </a>
                    )}
                    {study.githubUrl && (
                      <a
                        href={study.githubUrl}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-xs font-semibold text-white bg-white/5 hover:bg-white/10 border border-white/10 transition"
                      >
                        <Github className="w-4 h-4" />
                        {t.viewCode}
                      </a>
                    )}
                    {(!study.githubUrl && (!study.liveUrl || study.liveUrl === '#contact')) && (
                      <a
                        href="#contact"
                        className="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-xs font-semibold text-white bg-blue-600 hover:bg-blue-500 shadow-md shadow-blue-600/20 transition"
                      >
                        {t.discussArchitecture}
                        <ExternalLink className="w-3.5 h-3.5" />
                      </a>
                    )}
                  </div>

                </div>

                {/* Right Side: Key Production Metrics Panel */}
                <div className="lg:col-span-5 bg-[#12131e] rounded-2xl p-6 sm:p-8 border border-white/5 flex flex-col justify-between space-y-6">
                  <div>
                    <div className="flex items-center gap-2 text-xs font-mono font-bold text-gray-400 uppercase tracking-wider mb-6 pb-3 border-b border-white/5">
                      <TrendingUp className="w-4 h-4 text-emerald-400" />
                      {t.metricsHeader}
                    </div>

                    <div className="space-y-6">
                      {study.metrics.map((metric, mIdx) => (
                        <div key={mIdx} className="space-y-1">
                          <div className="text-2xl sm:text-3xl font-extrabold text-white font-mono tracking-tight text-blue-300">
                            {metric.value}
                          </div>
                          <div className="text-xs text-gray-400 font-medium">
                            {metric.label}
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>

                  <div className="pt-4 border-t border-white/5 flex items-center gap-2 text-[11px] font-mono text-emerald-400">
                    <CheckCircle className="w-3.5 h-3.5" />
                    {t.verified}
                  </div>
                </div>

              </div>
            </div>
          ))}
        </div>

      </div>
    </section>
  );
}
