import React from 'react';
import { Smartphone, Shield, Server, TestTube, CheckCircle } from 'lucide-react';

export default function CorePillars({ pillars }) {
  const iconMap = {
    smartphone: Smartphone,
    shield: Shield,
    server: Server,
    'test-tube': TestTube,
  };

  return (
    <section className="py-20 relative border-t border-white/5 bg-[#0a0b12]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Heading */}
        <div className="text-center max-w-3xl mx-auto mb-14">
          <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-blue-500/10 text-blue-400 border border-blue-500/20 mb-3">
            Core Engineering Competencies
          </div>
          <h2 className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">
            Architected for FinTech, Banking & InsurTech
          </h2>
          <p className="mt-3 text-sm sm:text-base text-gray-400">
            Balancing rapid product delivery with military-grade mobile security, enterprise backend integration, and end-to-end test automation.
          </p>
        </div>

        {/* 4 Pillars Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {pillars.map((pillar, idx) => {
            const Icon = iconMap[pillar.icon] || Smartphone;
            return (
              <div
                key={idx}
                className="glass-panel glass-panel-hover rounded-2xl p-6 border border-white/10 flex flex-col justify-between group"
              >
                <div>
                  <div className="w-12 h-12 rounded-xl bg-blue-500/10 border border-blue-500/20 flex items-center justify-center text-blue-400 mb-5 group-hover:scale-110 group-hover:bg-blue-500/20 transition">
                    <Icon className="w-6 h-6" />
                  </div>
                  <h3 className="text-lg font-bold text-white mb-1 group-hover:text-cyan-400 transition">
                    {pillar.title}
                  </h3>
                  <p className="text-xs font-semibold text-blue-400/90 mb-3 font-mono">
                    {pillar.tagline}
                  </p>
                  <p className="text-xs text-gray-400 leading-relaxed">
                    {pillar.skills}
                  </p>
                </div>
                
                <div className="mt-6 pt-4 border-t border-white/5 flex items-center gap-2 text-[11px] font-mono text-emerald-400">
                  <CheckCircle className="w-3.5 h-3.5" />
                  <span>Production Tested</span>
                </div>
              </div>
            );
          })}
        </div>

      </div>
    </section>
  );
}

