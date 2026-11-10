import React, { useState } from 'react';
import { Layers, Workflow, Shield, Database, Layout, Sparkles, Check } from 'lucide-react';
import { useLanguage } from '../context/LanguageContext';
import { uiTranslations } from '../data/uiTranslations';

export default function Architecture({ architecture }) {
  const [activeLayer, setActiveLayer] = useState(0);
  const { lang } = useLanguage();
  const t = uiTranslations[lang]?.architecture || uiTranslations.en.architecture;

  const layerIcons = [Layout, Shield, Database];

  return (
    <section id="architecture" className="py-24 relative border-t border-white/5 bg-[#090a0f]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Header */}
        <div className="max-w-3xl mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-cyan-500/10 text-cyan-400 border border-cyan-500/20 mb-4">
            <Workflow className="w-3.5 h-3.5" />
            {t.badge}
          </div>
          <h2 className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">
            {architecture.title}
          </h2>
          <p className="mt-4 text-base sm:text-lg text-gray-400 leading-relaxed">
            {architecture.philosophy}
          </p>
        </div>

        {/* Clean Architecture Layer Tabs & Card */}
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start mb-16">
          
          {/* Layer Selector Tabs */}
          <div className="lg:col-span-5 space-y-3">
            {architecture.layers.map((layer, idx) => {
              const Icon = layerIcons[idx] || Layers;
              const isActive = activeLayer === idx;
              return (
                <button
                  key={idx}
                  onClick={() => setActiveLayer(idx)}
                  className={`w-full text-left p-5 rounded-2xl border transition-all flex items-start gap-4 ${
                    isActive
                      ? 'bg-[#151724] border-blue-500/40 shadow-xl shadow-blue-500/10'
                      : 'bg-[#0f1016]/50 border-white/5 hover:border-white/10 hover:bg-[#12131b]'
                  }`}
                >
                  <div className={`p-3 rounded-xl shrink-0 transition ${
                    isActive ? 'bg-blue-600 text-white' : 'bg-white/5 text-gray-400'
                  }`}>
                    <Icon className="w-5 h-5" />
                  </div>
                  <div>
                    <div className="flex items-center gap-2">
                      <span className={`text-sm font-bold ${isActive ? 'text-white' : 'text-gray-300'}`}>
                        {layer.name}
                      </span>
                      {isActive && (
                        <span className="text-[10px] uppercase font-mono px-2 py-0.5 rounded-full bg-blue-500/20 text-blue-300 font-semibold">
                          {t.activeLayer}
                        </span>
                      )}
                    </div>
                    <p className="text-xs text-cyan-400 mt-1 font-medium">{layer.role}</p>
                    <p className="text-xs text-gray-400 mt-1.5 line-clamp-2 leading-relaxed">
                      {layer.desc}
                    </p>
                  </div>
                </button>
              );
            })}
          </div>

          {/* Layer Deep-Dive Display Card */}
          <div className="lg:col-span-7">
            {architecture.layers[activeLayer] && (
              <div className="glass-panel rounded-2xl p-8 border border-white/10 shadow-2xl glow-accent">
                <div className="flex items-center justify-between pb-6 border-b border-white/5 mb-6">
                  <div>
                    <span className="text-xs font-mono uppercase text-blue-400 font-bold tracking-wider">
                      {t.layerBreakdown}
                    </span>
                    <h3 className="text-2xl font-black text-white mt-1">
                      {architecture.layers[activeLayer].name}
                    </h3>
                  </div>
                  <span className="text-xs font-mono text-gray-400 px-3 py-1 bg-white/5 rounded-lg border border-white/5">
                    {architecture.layers[activeLayer].tech}
                  </span>
                </div>

                <p className="text-sm text-gray-300 leading-relaxed mb-6">
                  {architecture.layers[activeLayer].desc}
                </p>

                <div className="space-y-3 pt-2">
                  <span className="text-xs font-semibold text-gray-400 uppercase tracking-wider block">
                    {t.guarantees}
                  </span>
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                    {architecture.layers[activeLayer].features.map((feat, i) => (
                      <div key={i} className="flex items-center gap-2.5 p-3 rounded-xl bg-white/5 border border-white/5 text-xs text-gray-200">
                        <Check className="w-4 h-4 text-emerald-400 shrink-0" />
                        <span>{feat}</span>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            )}
          </div>

        </div>

        {/* Unidirectional Data Flow Timeline */}
        <div className="p-8 rounded-2xl bg-[#0e0f18] border border-white/5">
          <div className="flex items-center gap-2 mb-6">
            <Sparkles className="w-4 h-4 text-blue-400" />
            <h4 className="text-sm font-bold text-white uppercase tracking-wider font-mono">
              {t.flowLifecycle}
            </h4>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-5 gap-4 relative">
            {architecture.flowSteps.map((flow, idx) => (
              <div key={idx} className="p-4 rounded-xl bg-[#141622] border border-white/5 relative group hover:border-blue-500/30 transition">
                <div className="text-[11px] font-mono text-blue-400 font-bold mb-1">
                  {flow.step}
                </div>
                <p className="text-xs text-gray-300 leading-snug">
                  {flow.label}
                </p>
              </div>
            ))}
          </div>
        </div>

      </div>
    </section>
  );
}
