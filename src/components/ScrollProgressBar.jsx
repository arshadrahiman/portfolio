import React, { useState, useEffect } from 'react';

export default function ScrollProgressBar() {
  const [scrollProgress, setScrollProgress] = useState(0);

  useEffect(() => {
    const handleScroll = () => {
      const totalScroll = document.documentElement.scrollTop || document.body.scrollTop;
      const windowHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
      if (windowHeight > 0) {
        setScrollProgress((totalScroll / windowHeight) * 100);
      }
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <div className="fixed top-0 left-0 right-0 h-[2.5px] z-[60] pointer-events-none bg-transparent">
      <div
        className="h-full bg-gradient-to-r from-blue-500 via-cyan-400 to-indigo-500 transition-all duration-75 ease-out shadow-sm shadow-cyan-500/50"
        style={{ width: `${scrollProgress}%` }}
      />
    </div>
  );
}
