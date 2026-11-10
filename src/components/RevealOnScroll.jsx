import React from 'react';

export default function RevealOnScroll({ children, className = '' }) {
  return (
    <div className={`transition-opacity duration-300 ${className}`}>
      {children}
    </div>
  );
}
