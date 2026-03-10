const CACHE_NAME = 'madaris-v1';
const ASSETS = [
  './',
  './index.html',
  './style.css',
  './database.js',
  './register.html',
  './dashboard.html',
  './lessons.html',
  './logo.png'
];

// تثبيت ملفات الموقع في ذاكرة الهاتف/الكمبيوتر
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => cache.addAll(ASSETS))
  );
});

// تشغيل الموقع من الذاكرة عند غياب الإنترنت
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request).then(response => {
      return response || fetch(event.request);
    })
  );
});

