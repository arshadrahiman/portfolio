import React from 'react';
import { Rocket, RefreshCw, Cpu, WifiOff, CheckCircle2, ArrowRight } from 'lucide-react';

export default function WhatITakeCareOf({ services }) {
  const iconMap = {
    'zero-to-app-store': Rocket,
    'legacy-takeovers': RefreshCw,
    'complex-integrations': Cpu,
    'offline-first-resilience': WifiOff,
  };

  return (
    <section id="services" className="py-24 relative border-t border-white/5 bg-[#08080b]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Heading */}
        <div className="max-w-3xl mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-blue-500/10 text-blue-400 border border-blue-500/20 mb-4">
            Specialized Mobile Services
          </div>
          <h2 className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">
            What I Take Care Of
          </h2>
          <p className="mt-4 text-base sm:text-lg text-gray-400 leading-relaxed">
            I don't just write UI code. I manage the high-risk, technically demanding areas that separate fragile prototypes from resilient, revenue-generating mobile products.
          </p>
        </div>

        {/* Services Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {services.map((service) => {
            const Icon = iconMap[service.id] || Rocket;
            return (
              <div
                key={service.id}
                className="glass-panel glass-panel-hover rounded-2xl p-8 border border-white/10 flex flex-col justify-between group"
              >
                <div>
                  {/* Card Header: Icon + Badge */}
                  <div className="flex items-center justify-between mb-6">
                    <div className="w-12 h-12 rounded-xl bg-blue-500/10 border border-blue-500/20 flex items-center justify-center text-blue-400 group-hover:scale-110 group-hover:bg-blue-500/20 transition">
                      <Icon className="w-6 h-6" />
                    </div>
                    <span className="text-[11px] font-mono uppercase tracking-wider font-semibold px-2.5 py-1 rounded-full bg-white/5 text-gray-400 border border-white/5">
                      {service.badge}
                    </span>
                  </div>

                  {/* Title & Tagline */}
                  <h3 className="text-xl font-bold text-white mb-2 group-hover:text-blue-400 transition">
                    {service.title}
                  </h3>
                  <p className="text-xs font-medium text-cyan-400/90 mb-4">
                    {service.tagline}
                  </p>

                  {/* Description */}
                  <p className="text-sm text-gray-400 leading-relaxed mb-6">
                    {service.description}
                  </p>

                  {/* Bullet Points */}
                  <ul className="space-y-2.5 border-t border-white/5 pt-6">
                    {service.points.map((pt, idx) => (
                      <li key={idx} className="flex items-start gap-2.5 text-xs text-gray-300">
                        <CheckCircle2 className="w-4 h-4 text-blue-400 shrink-0 mt-0.5" />
                        <span className="leading-snug">{pt}</span>
                      </li>
                    ))}
                  </ul>
                </div>

                {/* Bottom link to contact */}
                <div className="mt-8 pt-4 border-t border-white/5 flex items-center justify-between">
                  <a
                    href="#contact"
                    className="inline-flex items-center gap-1.5 text-xs font-semibold text-blue-400 hover:text-blue-300 transition"
                  >
                    Discuss this requirement
                    <ArrowRight className="w-3.5 h-3.5" />
                  </a>
                </div>
              </div>
            );
          })}
        </div>

      </div>
    </section>
  );
}

