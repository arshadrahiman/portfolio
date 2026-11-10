import React, { useState, useEffect, useRef } from 'react';
import { Terminal, Code2, Copy, Check, QrCode, Search, FileText, ArrowRight, RefreshCw, KeyRound, Download } from 'lucide-react';
import QRCode from 'qrcode';
import { useLanguage } from '../context/LanguageContext';
import { uiTranslations } from '../data/uiTranslations';

export default function DevUtilities() {
  const [activeTab, setActiveTab] = useState('json2code');
  const [copiedId, setCopiedId] = useState(null);
  const { lang } = useLanguage();
  const t = uiTranslations[lang]?.utilities || uiTranslations.en.utilities;

  const handleCopy = (text, id) => {
    navigator.clipboard.writeText(text);
    setCopiedId(id);
    setTimeout(() => setCopiedId(null), 2000);
  };

  return (
    <section id="utilities" className="py-24 relative border-t border-white/5 bg-[#0a0b10]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-12">
          <div>
            <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold tracking-wider uppercase bg-blue-500/10 text-blue-400 border border-blue-500/20 mb-4">
              <Terminal className="w-3.5 h-3.5" />
              {t.badge}
            </div>
            <h2 className="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">
              {t.title}
            </h2>
            <p className="mt-3 text-base text-gray-400 max-w-2xl">
              {t.desc}
            </p>
          </div>

          {/* Utility Tab Switcher */}
          <div className="mt-6 md:mt-0 flex flex-wrap gap-1.5 p-1.5 bg-[#12131c] rounded-xl border border-white/5">
            {[
              { id: 'json2code', label: t.tabJson, icon: Code2 },
              { id: 'regex', label: t.tabRegex, icon: Search },
              { id: 'case', label: t.tabCase, icon: FileText },
              { id: 'jwt', label: t.tabJwt, icon: KeyRound },
              { id: 'qr', label: t.tabQr, icon: QrCode },
            ].map(tab => {
              const Icon = tab.icon;
              return (
                <button
                  key={tab.id}
                  onClick={() => setActiveTab(tab.id)}
                  className={`inline-flex items-center gap-2 px-3.5 py-2 rounded-lg text-xs font-medium transition-all ${
                    activeTab === tab.id
                      ? 'bg-blue-600 text-white shadow-lg shadow-blue-600/30 font-semibold'
                      : 'text-gray-400 hover:text-white hover:bg-white/5'
                  }`}
                >
                  <Icon className="w-3.5 h-3.5" />
                  {tab.label}
                </button>
              );
            })}
          </div>
        </div>

        {/* Utility Container Card */}
        <div className="glass-panel rounded-2xl p-6 sm:p-8 border border-white/10 glow-blue">
          {activeTab === 'json2code' && <JsonToCodeUtility onCopy={handleCopy} copiedId={copiedId} />}
          {activeTab === 'regex' && <RegexTesterUtility />}
          {activeTab === 'case' && <CaseConverterUtility onCopy={handleCopy} copiedId={copiedId} />}
          {activeTab === 'jwt' && <JwtInspectorUtility onCopy={handleCopy} copiedId={copiedId} />}
          {activeTab === 'qr' && <QrGeneratorUtility />}
        </div>
      </div>
    </section>
  );
}

// 1. JSON to Dart / TypeScript Converter
function JsonToCodeUtility({ onCopy, copiedId }) {
  const [jsonInput, setJsonInput] = useState(`{\n  "id": 101,\n  "title": "Clean Architecture Mobile",\n  "isPublished": true,\n  "rating": 4.95,\n  "tags": ["flutter", "architecture"]\n}`);
  const [className, setClassName] = useState('AppModel');
  const [outputLang, setOutputLang] = useState('dart');
  const [generatedCode, setGeneratedCode] = useState('');
  const [error, setError] = useState('');

  useEffect(() => {
    generateCode();
  }, [jsonInput, className, outputLang]);

  const generateCode = () => {
    try {
      setError('');
      const parsed = JSON.parse(jsonInput);
      if (typeof parsed !== 'object' || parsed === null || Array.isArray(parsed)) {
        setError('Please provide a valid JSON object (key: value pairs)');
        setGeneratedCode('');
        return;
      }

      if (outputLang === 'dart') {
        const fields = Object.entries(parsed).map(([key, val]) => {
          let dartType = 'dynamic';
          if (typeof val === 'string') dartType = 'String';
          else if (typeof val === 'number') dartType = Number.isInteger(val) ? 'int' : 'double';
          else if (typeof val === 'boolean') dartType = 'bool';
          else if (Array.isArray(val)) dartType = 'List<dynamic>';
          else if (typeof val === 'object' && val !== null) dartType = 'Map<String, dynamic>';
          return { key, type: dartType };
        });

        const lines = [
          `class ${className} {`,
          ...fields.map(f => `  final ${f.type} ${f.key};`),
          '',
          `  const ${className}({`,
          ...fields.map(f => `    required this.${f.key},`),
          `  });`,
          '',
          `  factory ${className}.fromJson(Map<String, dynamic> json) {`,
          `    return ${className}(`,
          ...fields.map(f => `      ${f.key}: json['${f.key}'] as ${f.type},`),
          `    );`,
          `  }`,
          '',
          `  Map<String, dynamic> toJson() => {`,
          ...fields.map(f => `    '${f.key}': ${f.key},`),
          `  };`,
          `}`
        ];
        setGeneratedCode(lines.join('\n'));
      } else {
        const fields = Object.entries(parsed).map(([key, val]) => {
          let tsType = 'any';
          if (typeof val === 'string') tsType = 'string';
          else if (typeof val === 'number') tsType = 'number';
          else if (typeof val === 'boolean') tsType = 'boolean';
          else if (Array.isArray(val)) tsType = 'any[]';
          else if (typeof val === 'object' && val !== null) tsType = 'Record<string, any>';
          return `  ${key}: ${tsType};`;
        });
        setGeneratedCode([`export interface ${className} {`, ...fields, `}`].join('\n'));
      }
    } catch (e) {
      setError('Invalid JSON syntax: ' + e.message);
      setGeneratedCode('');
    }
  };

  return (
    <div className="space-y-6" dir="ltr">
      <div className="flex flex-wrap items-center justify-between gap-4 border-b border-white/5 pb-4">
        <div className="flex items-center gap-3">
          <label className="text-xs text-gray-400 font-medium">Model Name:</label>
          <input
            type="text"
            value={className}
            onChange={(e) => setClassName(e.target.value.replace(/[^a-zA-Z0-9_]/g, '') || 'Model')}
            className="px-3 py-1 bg-[#151722] border border-white/10 rounded-lg text-sm text-white focus:outline-none focus:border-blue-500 font-mono w-40"
          />
        </div>

        <div className="flex items-center gap-2">
          <button
            onClick={() => setOutputLang('dart')}
            className={`px-3 py-1.5 rounded-lg text-xs font-semibold transition ${
              outputLang === 'dart' ? 'bg-cyan-500/20 text-cyan-400 border border-cyan-500/30' : 'text-gray-400 hover:text-white'
            }`}
          >
            Flutter / Dart
          </button>
          <button
            onClick={() => setOutputLang('ts')}
            className={`px-3 py-1.5 rounded-lg text-xs font-semibold transition ${
              outputLang === 'ts' ? 'bg-blue-500/20 text-blue-400 border border-blue-500/30' : 'text-gray-400 hover:text-white'
            }`}
          >
            TypeScript
          </button>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div>
          <div className="flex items-center justify-between mb-2">
            <span className="text-xs font-semibold uppercase tracking-wider text-gray-400">Input JSON</span>
            <button
              onClick={() => setJsonInput('{\n  "status": "success",\n  "code": 200,\n  "data": {\n    "uuid": "usr_arshad",\n    "active": true\n  }\n}')}
              className="text-xs text-blue-400 hover:text-blue-300 flex items-center gap-1"
            >
              <RefreshCw className="w-3 h-3" /> Load Sample
            </button>
          </div>
          <textarea
            value={jsonInput}
            onChange={(e) => setJsonInput(e.target.value)}
            rows={12}
            className="w-full bg-[#0d0e15] border border-white/10 rounded-xl p-4 font-mono text-xs text-gray-200 focus:outline-none focus:border-blue-500/50 resize-none"
            placeholder="Paste raw JSON here..."
          />
          {error && <p className="text-xs text-red-400 mt-2">{error}</p>}
        </div>

        <div>
          <div className="flex items-center justify-between mb-2">
            <span className="text-xs font-semibold uppercase tracking-wider text-gray-400">
              Generated {outputLang === 'dart' ? 'Dart Class (Clean Arch)' : 'TypeScript Interface'}
            </span>
            <button
              onClick={() => onCopy(generatedCode, 'json-code')}
              disabled={!generatedCode}
              className="text-xs inline-flex items-center gap-1.5 px-3 py-1 bg-white/5 hover:bg-white/10 border border-white/10 rounded-lg text-gray-200 transition disabled:opacity-40"
            >
              {copiedId === 'json-code' ? <Check className="w-3 h-3 text-green-400" /> : <Copy className="w-3 h-3" />}
              {copiedId === 'json-code' ? 'Copied' : 'Copy Code'}
            </button>
          </div>
          <div className="relative w-full bg-[#0d0e15] border border-white/10 rounded-xl p-4 font-mono text-xs text-emerald-300 overflow-x-auto h-[288px]">
            <pre>{generatedCode || '// Valid code will be previewed here...'}</pre>
          </div>
        </div>
      </div>
    </div>
  );
}

// 2. Regex Tester Utility
function RegexTesterUtility() {
  const [pattern, setPattern] = useState('([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+\\.[a-zA-Z]{2,})');
  const [flags, setFlags] = useState('g');
  const [testString, setTestString] = useState('Contact us at arshadrahiman007@gmail.com or arshadrahman.dev@gmail.com for production inquiries.');
  const [matches, setMatches] = useState([]);
  const [regexError, setRegexError] = useState('');

  useEffect(() => {
    try {
      setRegexError('');
      if (!pattern) {
        setMatches([]);
        return;
      }
      const regex = new RegExp(pattern, flags);
      const found = [];
      let match;
      if (flags.includes('g')) {
        while ((match = regex.exec(testString)) !== null) {
          found.push({ text: match[0], index: match.index, groups: match.slice(1) });
          if (match.index === regex.lastIndex) regex.lastIndex++;
        }
      } else {
        match = regex.exec(testString);
        if (match) found.push({ text: match[0], index: match.index, groups: match.slice(1) });
      }
      setMatches(found);
    } catch (e) {
      setRegexError(e.message);
      setMatches([]);
    }
  }, [pattern, flags, testString]);

  return (
    <div className="space-y-6" dir="ltr">
      <div className="grid grid-cols-1 sm:grid-cols-4 gap-4">
        <div className="sm:col-span-3">
          <label className="block text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Regex Pattern</label>
          <div className="relative flex items-center">
            <span className="absolute left-3 text-gray-500 font-mono text-sm">/</span>
            <input
              type="text"
              value={pattern}
              onChange={(e) => setPattern(e.target.value)}
              className="w-full bg-[#0d0e15] border border-white/10 rounded-xl pl-7 pr-3 py-2.5 font-mono text-sm text-cyan-300 focus:outline-none focus:border-cyan-500/50"
              placeholder="e.g. \b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b"
            />
            <span className="absolute right-3 text-gray-500 font-mono text-sm">/</span>
          </div>
        </div>

        <div>
          <label className="block text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Flags</label>
          <input
            type="text"
            value={flags}
            onChange={(e) => setFlags(e.target.value)}
            className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-3 py-2.5 font-mono text-sm text-gray-200 focus:outline-none focus:border-blue-500/50"
            placeholder="g, i, m"
          />
        </div>
      </div>

      {regexError && <p className="text-xs text-red-400">{regexError}</p>}

      <div>
        <label className="block text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Test String</label>
        <textarea
          value={testString}
          onChange={(e) => setTestString(e.target.value)}
          rows={4}
          className="w-full bg-[#0d0e15] border border-white/10 rounded-xl p-4 font-mono text-xs text-gray-200 focus:outline-none focus:border-blue-500/50 resize-none"
        />
      </div>

      <div className="bg-[#12141e] border border-white/5 rounded-xl p-4">
        <div className="flex items-center justify-between mb-3">
          <span className="text-xs font-semibold text-gray-300">Match Results</span>
          <span className="text-xs px-2.5 py-0.5 rounded-full bg-blue-500/20 text-blue-300 font-mono font-medium">
            {matches.length} matches found
          </span>
        </div>
        {matches.length === 0 ? (
          <p className="text-xs text-gray-500 italic">No matches in current test string.</p>
        ) : (
          <div className="space-y-2 max-h-48 overflow-y-auto pr-2">
            {matches.map((m, idx) => (
              <div key={idx} className="flex items-center justify-between p-2.5 rounded-lg bg-[#0d0e15] border border-white/5 text-xs font-mono">
                <span className="text-green-400 font-bold bg-green-500/10 px-2 py-0.5 rounded">
                  Match {idx + 1}: {m.text}
                </span>
                <span className="text-gray-500">Index {m.index}</span>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}

// 3. Case Converter Utility
function CaseConverterUtility({ onCopy, copiedId }) {
  const [input, setInput] = useState('Flutter Clean Architecture Mobile App');

  const toCamel = (str) => str.toLowerCase().replace(/[^a-zA-Z0-9]+(.)/g, (m, chr) => chr.toUpperCase());
  const toPascal = (str) => {
    const camel = toCamel(str);
    return camel.charAt(0).toUpperCase() + camel.slice(1);
  };
  const toSnake = (str) => str.replace(/([a-z])([A-Z])/g, '$1_$2').replace(/[^a-zA-Z0-9]+/g, '_').toLowerCase().replace(/^_+|_+$/g, '');
  const toKebab = (str) => toSnake(str).replace(/_/g, '-');
  const toConstant = (str) => toSnake(str).toUpperCase();
  const toTitle = (str) => str.replace(/\w\S*/g, (txt) => txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase());

  const cases = [
    { label: 'camelCase', value: toCamel(input), id: 'case-camel' },
    { label: 'PascalCase', value: toPascal(input), id: 'case-pascal' },
    { label: 'snake_case', value: toSnake(input), id: 'case-snake' },
    { label: 'kebab-case', value: toKebab(input), id: 'case-kebab' },
    { label: 'CONSTANT_CASE', value: toConstant(input), id: 'case-const' },
    { label: 'Title Case', value: toTitle(input), id: 'case-title' },
  ];

  return (
    <div className="space-y-6" dir="ltr">
      <div>
        <label className="block text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Input String</label>
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 font-mono text-sm text-white focus:outline-none focus:border-blue-500/50"
          placeholder="Enter text to convert..."
        />
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {cases.map((c) => (
          <div key={c.id} className="p-3.5 rounded-xl bg-[#0d0e15] border border-white/5 flex items-center justify-between group hover:border-white/15 transition">
            <div className="overflow-hidden mr-3">
              <span className="text-[11px] font-semibold text-gray-400 uppercase tracking-wider block mb-1">{c.label}</span>
              <p className="font-mono text-xs text-blue-300 truncate">{c.value || '—'}</p>
            </div>
            <button
              onClick={() => onCopy(c.value, c.id)}
              className="p-2 rounded-lg bg-white/5 hover:bg-white/10 text-gray-400 hover:text-white transition"
              title="Copy"
            >
              {copiedId === c.id ? <Check className="w-4 h-4 text-green-400" /> : <Copy className="w-4 h-4" />}
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}

// 4. JWT Inspector Utility
function JwtInspectorUtility({ onCopy, copiedId }) {
  const sampleJwt = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c3JfYXJzaGFkIiwibmFtZSI6IkFyc2hhZCBSYWhtYW4iLCJyb2xlIjoic2VuaW9yX2ZsdXR0ZXJfbGVhZCIsImlhdCI6MTcwOTgyMDAwMCwiZXhwIjoxNzk2MjI0MDAwfQ.signature_verification";
  const [token, setToken] = useState(sampleJwt);
  const [header, setHeader] = useState(null);
  const [payload, setPayload] = useState(null);
  const [jwtError, setJwtError] = useState('');
  const [expStatus, setExpStatus] = useState(null);

  useEffect(() => {
    try {
      setJwtError('');
      if (!token.trim()) {
        setHeader(null);
        setPayload(null);
        return;
      }
      const parts = token.trim().split('.');
      if (parts.length < 2) {
        setJwtError('A valid JWT must contain at least Header and Payload separated by dots.');
        setHeader(null);
        setPayload(null);
        return;
      }

      const decodePart = (b64) => {
        let clean = b64.replace(/-/g, '+').replace(/_/g, '/');
        while (clean.length % 4) clean += '=';
        return JSON.parse(decodeURIComponent(escape(atob(clean))));
      };

      const parsedHeader = decodePart(parts[0]);
      const parsedPayload = decodePart(parts[1]);

      setHeader(parsedHeader);
      setPayload(parsedPayload);

      if (parsedPayload.exp) {
        const expDate = new Date(parsedPayload.exp * 1000);
        const isExpired = expDate < new Date();
        setExpStatus({ isExpired, dateStr: expDate.toLocaleString() });
      } else {
        setExpStatus(null);
      }
    } catch (e) {
      setJwtError('Failed to parse JWT: ' + e.message);
      setHeader(null);
      setPayload(null);
      setExpStatus(null);
    }
  }, [token]);

  return (
    <div className="space-y-6" dir="ltr">
      <div>
        <div className="flex items-center justify-between mb-2">
          <label className="text-xs font-semibold text-gray-400 uppercase tracking-wider">Encoded JWT String</label>
          <button
            onClick={() => setToken(sampleJwt)}
            className="text-xs text-blue-400 hover:text-blue-300 flex items-center gap-1"
          >
            <RefreshCw className="w-3 h-3" /> Sample Token
          </button>
        </div>
        <textarea
          value={token}
          onChange={(e) => setToken(e.target.value)}
          rows={3}
          className="w-full bg-[#0d0e15] border border-white/10 rounded-xl p-3 font-mono text-xs text-yellow-300 focus:outline-none focus:border-yellow-500/50 break-all resize-none"
          placeholder="Paste JWT here..."
        />
        {jwtError && <p className="text-xs text-red-400 mt-2">{jwtError}</p>}
      </div>

      {expStatus && (
        <div className={`p-3 rounded-xl border flex items-center justify-between text-xs font-mono ${
          expStatus.isExpired ? 'bg-red-500/10 border-red-500/20 text-red-300' : 'bg-emerald-500/10 border-emerald-500/20 text-emerald-300'
        }`}>
          <span>Expiration: {expStatus.dateStr}</span>
          <span className="font-bold uppercase tracking-wider">{expStatus.isExpired ? 'Status: Expired' : 'Status: Active'}</span>
        </div>
      )}

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="bg-[#0d0e15] border border-white/10 rounded-xl p-4">
          <div className="flex items-center justify-between mb-2">
            <span className="text-xs font-bold text-red-400 uppercase font-mono">Header (Algorithm & Type)</span>
            {header && (
              <button
                onClick={() => onCopy(JSON.stringify(header, null, 2), 'jwt-header')}
                className="text-gray-400 hover:text-white"
              >
                {copiedId === 'jwt-header' ? <Check className="w-3.5 h-3.5 text-green-400" /> : <Copy className="w-3.5 h-3.5" />}
              </button>
            )}
          </div>
          <pre className="text-xs font-mono text-gray-300 overflow-x-auto">
            {header ? JSON.stringify(header, null, 2) : '// No Header'}
          </pre>
        </div>

        <div className="bg-[#0d0e15] border border-white/10 rounded-xl p-4">
          <div className="flex items-center justify-between mb-2">
            <span className="text-xs font-bold text-purple-400 uppercase font-mono">Payload (Claims & Data)</span>
            {payload && (
              <button
                onClick={() => onCopy(JSON.stringify(payload, null, 2), 'jwt-payload')}
                className="text-gray-400 hover:text-white"
              >
                {copiedId === 'jwt-payload' ? <Check className="w-3.5 h-3.5 text-green-400" /> : <Copy className="w-3.5 h-3.5" />}
              </button>
            )}
          </div>
          <pre className="text-xs font-mono text-gray-300 overflow-x-auto">
            {payload ? JSON.stringify(payload, null, 2) : '// No Payload'}
          </pre>
        </div>
      </div>
    </div>
  );
}

// 5. QR Code Generator Utility
function QrGeneratorUtility() {
  const [text, setText] = useState('https://arshadrahman.in/#contact');
  const canvasRef = useRef(null);

  useEffect(() => {
    if (canvasRef.current && text.trim()) {
      QRCode.toCanvas(
        canvasRef.current,
        text,
        {
          width: 220,
          margin: 2,
          color: {
            dark: '#08080b',
            light: '#ffffff'
          }
        },
        (error) => {
          if (error) console.error(error);
        }
      );
    }
  }, [text]);

  const handleDownload = () => {
    if (!canvasRef.current) return;
    const url = canvasRef.current.toDataURL('image/png');
    const a = document.createElement('a');
    a.download = 'qrcode.png';
    a.href = url;
    a.click();
  };

  return (
    <div className="flex flex-col md:flex-row items-center gap-8 justify-between">
      <div className="flex-1 space-y-4 w-full">
        <label className="block text-xs font-semibold text-gray-400 uppercase tracking-wider">
          Target URL or Text Payload
        </label>
        <input
          type="text"
          value={text}
          onChange={(e) => setText(e.target.value)}
          className="w-full bg-[#0d0e15] border border-white/10 rounded-xl px-4 py-3 font-mono text-sm text-white focus:outline-none focus:border-blue-500/50"
          placeholder="https://yourlink.com or any text"
          dir="ltr"
        />
        <p className="text-xs text-gray-400">
          Generated entirely client-side using JavaScript canvas. Zero data is sent to any server.
        </p>

        <div className="pt-2">
          <button
            onClick={handleDownload}
            className="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl bg-blue-600 hover:bg-blue-500 text-white text-xs font-semibold shadow-lg shadow-blue-600/30 transition"
          >
            <Download className="w-3.5 h-3.5" />
            Download High-Res PNG
          </button>
        </div>
      </div>

      <div className="p-4 bg-white rounded-2xl shadow-2xl flex flex-col items-center">
        <canvas ref={canvasRef} className="rounded-lg" />
        <span className="text-[10px] text-gray-500 mt-2 font-mono">Scan with iOS / Android Camera</span>
      </div>
    </div>
  );
}
