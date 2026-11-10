import React from 'react';
import { Lock, ShieldCheck, Key, EyeOff, Smartphone, ShieldAlert, Cpu } from 'lucide-react';

export default function SecuritySection({ securityFocus }) {
  const iconList = [Lock, Key, ShieldCheck, ShieldAlert, EyeOff, Cpu];

  return (
    <section className="py-20 relative border-t border-white/5 bg-[#08080b]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-12">
          <div className="max-w-2xl">
            <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-rose-500/10 text-rose-400 border border-rose-500/20 mb-3">
              <Lock className="w-3.5 h-3.5" />
              Security Architecture
            </div>
            <h2 className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">
              Enterprise Mobile Security & OWASP MASVS
            </h2>
            <p className="mt-3 text-sm sm:text-base text-gray-400">
              In banking and insurance, security is a non-negotiable prerequisite. Every application is hardened at compile-time and runtime against compromise.
            </p>
          </div>

          <div className="mt-4 md:mt-0">
            <span className="text-xs font-mono px-3.5 py-1.5 rounded-xl bg-rose-500/10 border border-rose-500/20 text-rose-300 font-semibold">
              OWASP MASVS L1 & L2 Compliant
            </span>
          </div>
        </div>

        {/* Security Cards Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {securityFocus.map((item, idx) => {
            const Icon = iconList[idx] || ShieldCheck;
            return (
              <div
                key={idx}
                className="glass-panel rounded-2xl p-6 border border-white/10 hover:border-rose-500/30 transition group"
              >
                <div className="flex items-center justify-between mb-4">
                  <div className="w-10 h-10 rounded-xl bg-rose-500/10 border border-rose-500/20 flex items-center justify-center text-rose-400 group-hover:scale-110 transition">
                    <Icon className="w-5 h-5" />
                  </div>
                  <span className="text-[10px] font-mono uppercase tracking-wider font-semibold px-2 py-0.5 rounded bg-white/5 text-gray-400">
                    {item.badge}
                  </span>
                </div>

                <h3 className="text-base font-bold text-white mb-2 group-hover:text-rose-300 transition">
                  {item.title}
                </h3>
                <p className="text-xs text-gray-400 leading-relaxed">
                  {item.desc}
                </p>
              </div>
            );
          })}
        </div>

      </div>
    </section>
  );
}

