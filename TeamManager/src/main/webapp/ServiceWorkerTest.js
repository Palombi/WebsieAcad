const PRECACHE = 'precache-v1';
const RUNTIME = 'runtime';
var defaultrequest;

// A list of local resources we always want to be cached.
const PRECACHE_URLS = [
	'home.jsp',
	'homeOffline.jsp',
	'ServiceWorkerTest.js'
];

// The install handler takes care of precaching the resources we always need.
self.addEventListener('install', event => {
	event.waitUntil(
		caches.open(PRECACHE)
			.then(cache => cache.addAll(PRECACHE_URLS))
			.then(self.skipWaiting())
	);
});

 //The activate handler takes care of cleaning up old caches.
self.addEventListener('activate', event => {
	const currentCaches = [PRECACHE, RUNTIME];
	event.waitUntil(
		caches.keys().then(cacheNames => {
			return cacheNames.filter(cacheName => !currentCaches.includes(cacheName));
		})
	);
});


self.addEventListener('fetch', (event) => {
  event.respondWith(
    fetch(event.request).catch(async ()=>{
	
	//Cache or FallBack
	
	var response = await caches.match('homeOffline.jsp')
	
	
	return response;

	 		
})
	
	


  );

});