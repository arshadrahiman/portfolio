import React from 'react';
import { Smartphone, Server, Database, GitBranch, Cpu } from 'lucide-react';
import { useLanguage } from '../context/LanguageContext';
import { uiTranslations } from '../data/uiTranslations';

export default function TechStack({ techStack }) {
  const { lang } = useLanguage();
  const t = uiTranslations[lang]?.techStack || uiTranslations.en.techStack;

  const iconMap = {
    smartphone: Smartphone,
    server: Server,
    database: Database,
    'git-branch': GitBranch,
  };

  return (
    <section id="stack" className="py-24 relative border-t border-white/5 bg-[#090a0f]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Header */}
        <div className="max-w-3xl mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-blue-500/10 text-blue-400 border border-blue-500/20 mb-4">
            <Cpu className="w-3.5 h-3.5" />
            {t.badge}
          </div>
          <h2 className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">
            {t.title}
          </h2>
          <p className="mt-4 text-base sm:text-lg text-gray-400 leading-relaxed">
            {t.desc}
          </p>
        </div>

        {/* Tech Categories Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {techStack.categories.map((cat, idx) => {
            const Icon = iconMap[cat.icon] || Cpu;
            return (
              <div
                key={idx}
                className="glass-panel rounded-2xl p-6 sm:p-8 border border-white/10 glow-blue"
              >
                <div className="flex items-center gap-3 mb-6 pb-4 border-b border-white/5">
                  <div className="w-10 h-10 rounded-xl bg-blue-500/10 border border-blue-500/20 flex items-center justify-center text-blue-400">
                    <Icon className="w-5 h-5" />
                  </div>
                  <div>
                    <h3 className="text-lg font-bold text-white tracking-tight">
                      {cat.name}
                    </h3>
                    <span className="text-xs text-gray-400 font-mono">
                      {cat.skills.length} {t.competencies}
                    </span>
                  </div>
                </div>

                {/* Skills Chips */}
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  {cat.skills.map((skill, sIdx) => (
                    <div
                      key={sIdx}
                      className="p-3 rounded-xl bg-[#12131d] border border-white/5 flex items-center justify-between hover:border-white/15 transition group"
                    >
                      <span className="text-xs font-semibold text-gray-200 group-hover:text-blue-300 transition">
                        {skill.name}
                      </span>
                      <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-white/5 text-gray-400">
                        {skill.level}
                      </span>
                    </div>
                  ))}
                </div>
              </div>
            );
          })}
        </div>

      </div>
    </section>
  );
}
