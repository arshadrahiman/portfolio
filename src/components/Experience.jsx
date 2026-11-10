import React, { useState } from 'react';
import { Briefcase, GraduationCap, Award, MapPin, Calendar, CheckCircle2, ChevronRight } from 'lucide-react';

export default function Experience({ experience, qualifications, certifications }) {
  const [activeTab, setActiveTab] = useState('experience'); // 'experience' | 'credentials'

  return (
    <section id="experience" className="py-24 relative border-t border-white/5 bg-[#0a0b12]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-16">
          <div className="max-w-2xl">
            <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-blue-500/10 text-blue-400 border border-blue-500/20 mb-4">
              <Briefcase className="w-3.5 h-3.5" />
              Career Track Record
            </div>
            <h2 className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">
              Experience &amp; Leadership
            </h2>
            <p className="mt-3 text-base text-gray-400">
              7+ years delivering high-impact mobile solutions across Riyadh (KSA), Dubai (UAE), and India.
            </p>
          </div>

          {/* Tab Switcher */}
          <div className="mt-6 md:mt-0 flex items-center gap-2 p-1 bg-[#12131c] rounded-xl border border-white/5">
            <button
              onClick={() => setActiveTab('experience')}
              className={`inline-flex items-center gap-2 px-4 py-2 rounded-lg text-xs font-medium transition ${
                activeTab === 'experience'
                  ? 'bg-blue-600 text-white font-semibold shadow-md shadow-blue-600/30'
                  : 'text-gray-400 hover:text-white'
              }`}
            >
              <Briefcase className="w-3.5 h-3.5" />
              Work History
            </button>
            <button
              onClick={() => setActiveTab('credentials')}
              className={`inline-flex items-center gap-2 px-4 py-2 rounded-lg text-xs font-medium transition ${
                activeTab === 'credentials'
                  ? 'bg-blue-600 text-white font-semibold shadow-md shadow-blue-600/30'
                  : 'text-gray-400 hover:text-white'
              }`}
            >
              <GraduationCap className="w-3.5 h-3.5" />
              Education &amp; Certifications
            </button>
          </div>
        </div>

        {/* Work Experience Tab */}
        {activeTab === 'experience' && (
          <div className="relative border-l border-white/10 ml-4 md:ml-6 space-y-12">
            {experience.map((item, idx) => (
              <div key={idx} className="relative pl-8 md:pl-10 group">
                {/* Timeline Node Dot */}
                <div className={`absolute -left-[9px] top-1.5 w-4 h-4 rounded-full border-2 transition-all ${
                  item.endDate === 'Present'
                    ? 'bg-emerald-500 border-emerald-300 ring-4 ring-emerald-500/20 animate-pulse'
                    : 'bg-[#121422] border-blue-500 group-hover:bg-blue-500'
                }`} />

                {/* Experience Card */}
                <div className="glass-panel glass-panel-hover rounded-2xl p-6 md:p-8 border border-white/10">
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 mb-3">
                    <h3 className="text-xl font-bold text-white group-hover:text-blue-400 transition">
                      {item.designation}
                    </h3>
                    <div className="flex items-center gap-2 font-mono text-xs text-gray-400">
                      <Calendar className="w-3.5 h-3.5 text-blue-400" />
                      <span>{item.startDate} – {item.endDate}</span>
                    </div>
                  </div>

                  <div className="flex items-center gap-2 text-xs font-medium text-cyan-400 mb-4">
                    <span className="font-semibold text-gray-300">{item.company}</span>
                    <span>·</span>
                    <span className="flex items-center gap-1 text-gray-400">
                      <MapPin className="w-3 h-3 text-cyan-400" />
                      {item.location}
                    </span>
                  </div>

                  <p className="text-sm text-gray-300 leading-relaxed mb-5">
                    {item.description}
                  </p>

                  <div className="flex flex-wrap gap-2 pt-2 border-t border-white/5">
                    {item.tags.map((tag, tIdx) => (
                      <span
                        key={tIdx}
                        className="px-2.5 py-0.5 rounded-md bg-white/5 border border-white/5 text-[11px] font-mono text-gray-300"
                      >
                        {tag}
                      </span>
                    ))}
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}

        {/* Credentials Tab: Academic Degrees & Certifications */}
        {activeTab === 'credentials' && (
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            
            {/* Academic Qualifications */}
            <div className="glass-panel rounded-2xl p-6 sm:p-8 border border-white/10">
              <div className="flex items-center gap-2 mb-6 pb-4 border-b border-white/5">
                <GraduationCap className="w-5 h-5 text-blue-400" />
                <h3 className="text-lg font-bold text-white">Academic Qualifications</h3>
              </div>

              <div className="space-y-6">
                {qualifications.map((edu, idx) => (
                  <div key={idx} className="p-4 rounded-xl bg-[#12131d] border border-white/5">
                    <div className="flex items-center justify-between mb-1">
                      <h4 className="text-sm font-bold text-white">{edu.degree}</h4>
                      <span className="text-[11px] font-mono text-blue-400 bg-blue-500/10 px-2 py-0.5 rounded">
                        {edu.startDate} – {edu.endDate}
                      </span>
                    </div>
                    <p className="text-xs text-gray-400">{edu.institution}</p>
                  </div>
                ))}
              </div>
            </div>

            {/* Professional Certifications */}
            <div className="glass-panel rounded-2xl p-6 sm:p-8 border border-white/10">
              <div className="flex items-center gap-2 mb-6 pb-4 border-b border-white/5">
                <Award className="w-5 h-5 text-cyan-400" />
                <h3 className="text-lg font-bold text-white">Certifications &amp; Courses</h3>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                {certifications.map((cert, idx) => (
                  <div key={idx} className="p-3.5 rounded-xl bg-[#12131d] border border-white/5 flex flex-col justify-between">
                    <div>
                      <span className="text-[10px] font-mono uppercase text-cyan-400 font-semibold block mb-1">
                        {cert.badge}
                      </span>
                      <h4 className="text-xs font-bold text-gray-200 leading-snug mb-2">
                        {cert.title}
                      </h4>
                    </div>
                    <div className="flex items-center justify-between text-[11px] text-gray-500 font-mono pt-2 border-t border-white/5">
                      <span>{cert.issuer}</span>
                      <span>{cert.date}</span>
                    </div>
                  </div>
                ))}
              </div>
            </div>

          </div>
        )}

      </div>
    </section>
  );
}
