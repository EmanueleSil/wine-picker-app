'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "38ce1f9680ce7b06b652f8d41ca35fbb",
"assets/AssetManifest.bin.json": "0c805fe6d04e43a61b0912fdda0c97a8",
"assets/AssetManifest.json": "5eeb118028699dd0b6e05c6e06e36c6a",
"assets/assets/data/combinations.json": "9d7dc8b294f9919507a63b8143cf168e",
"assets/assets/data/winedetail.json": "e8b1cec89b42b67226448e58f3b82ad0",
"assets/assets/images/Antipasto-Bruschette.jpg": "6eedb59249344b94cfeb837337f0e752",
"assets/assets/images/Antipasto-Carne.jpg": "fc8f61669124108e35536f6bb6414fb8",
"assets/assets/images/Antipasto-Pesce.jpg": "f57f6bc5d35c7dc4743ae8295991d4ef",
"assets/assets/images/carta.jpg": "b583ad64145eec0d63493abb4754dd70",
"assets/assets/images/Dolci-Cioccolato.jpg": "22a2bc155681e8210745e098f7577d6f",
"assets/assets/images/Dolci-Cremosi.jpg": "76106a74a808fac9f25b8ce76f4abb1a",
"assets/assets/images/Dolci-Frutta.jpg": "32f520557f9a6ab45d8a346c4eb3becc",
"assets/assets/images/Dolci-Secchi.jpg": "f1f51c72b8e3ad2f6e4fab9f52f8a2b7",
"assets/assets/images/percorso.jpg": "6bb85c00f981e9f69ad66fec2d9e4cfd",
"assets/assets/images/Primi-Carne.jpg": "99c295e9c06f812c80648fa25373c4cf",
"assets/assets/images/Primi-Cremosi.jpg": "53673847ba93bde6c12d169975660bc5",
"assets/assets/images/Primi-Pesce.jpg": "56e0b9ded20f3e0946e53afa5d11a108",
"assets/assets/images/Primi-Zuppe.jpg": "9631712d3c1975d0547557c5e2114f93",
"assets/assets/images/PrimoGenerico.jpg": "63fc0951f88930b6d20c1d44185b5de6",
"assets/assets/images/Salumi-Formaggi.jpg": "d0bb796d566a2f23a68e17b8a03b117d",
"assets/assets/images/Secondi-Bianchi.jpg": "3294b1d780804f77981a27e90f071d4c",
"assets/assets/images/Secondi-Maiale.jpg": "8354e206ee4dc34e83d6ea6eea163a05",
"assets/assets/images/Secondi-Rossa.jpg": "b88f82f7213b6cab0759a3df206aaa4b",
"assets/assets/images/Secondi-Umido.jpg": "a9a800554c68df50dd150afd9eb3e5a8",
"assets/assets/images/SecondiPesce-Crostacei.jpg": "7edc38780a7d0960fdef67d39acee3b8",
"assets/assets/images/SecondiPesce-Fritto.jpg": "33712837ae671ec0921a2c63de98b5b0",
"assets/assets/images/SecondiPesce-LagoMare.jpg": "7f427d5d4b7f34f4c9275ed2337421c2",
"assets/assets/images/SecondiPesce-Umido.jpg": "b6367f7186bd72082f48fd7424edd7b7",
"assets/assets/images/SecondoGenericoCarne.jpg": "450dc159abb1d896b96d51b071a64835",
"assets/assets/images/SecondoGenericoPesce.jpg": "4312d4ada2e589879ee10a3255622c14",
"assets/assets/images/Vegetariano.jpg": "76cb3ecb4ddeaa920141a55bc42a818d",
"assets/FontManifest.json": "68b194d2e2ab1b177d17c2518f908c10",
"assets/fonts/Epilogue-Regular.ttf": "2c092196a0c31438829ac67a5bd07255",
"assets/fonts/MaterialIcons-Regular.otf": "54c38061cefa0e0c5495d8a77056b7ae",
"assets/fonts/NotoSans-Regular.ttf": "c8e58befd2433eb89589dd1d23225c4e",
"assets/NOTICES": "b51047f40b7f722e63da2a62afaecff9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "4476583b43d774ee72fa7899e300a66d",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "20cfa173c40caab0d8789726b02a2cb4",
"/": "20cfa173c40caab0d8789726b02a2cb4",
"main.dart.js": "f748d62b3f7f4a2ca30bb695acee0139",
"manifest.json": "43a0a6a2b0b6e2b8059853bd79b19d55",
"version.json": "7a5a6686b9cabbb1ba48751f338441fb"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
