import React, { useEffect, useRef, useState } from 'react';

export default function RevealOnScroll({ 
  children, 
  variant = 'fade-up', // 'fade-up' | 'zoom-in' | 'fade'
  delay = 0, 
  className = '',
  threshold = 0.05,
  once = true
}) {
  const [isVisible, setIsVisible] = useState(false);
  const domRef = useRef(null);

  useEffect(() => {
    if (typeof window === 'undefined' || !('IntersectionObserver' in window)) {
      setIsVisible(true);
      return;
    }

    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
          if (once && domRef.current) {
            observer.unobserve(domRef.current);
          }
        } else if (!once) {
          setIsVisible(false);
        }
      });
    }, {
      threshold,
      // Generous rootMargin so elements trigger before entering viewport
      rootMargin: '250px 0px 80px 0px'
    });

    const el = domRef.current;
    if (el) {
      observer.observe(el);
    }

    return () => {
      if (el) observer.unobserve(el);
    };
  }, [threshold, once]);

  const initClass = variant === 'zoom-in' 
    ? 'reveal-zoom-init' 
    : variant === 'fade' 
      ? 'reveal-fade-init' 
      : 'reveal-init';

  const visibleClass = variant === 'zoom-in' 
    ? 'reveal-zoom-visible' 
    : variant === 'fade' 
      ? 'reveal-fade-visible' 
      : 'reveal-visible';

  return (
    <div
      ref={domRef}
      style={{ transitionDelay: `${delay}ms` }}
      className={`${initClass} ${isVisible ? visibleClass : ''} ${className}`}
    >
      {children}
    </div>
  );
}
