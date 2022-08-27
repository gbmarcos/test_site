'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest.json": "d580e32bd77fcb37e38ef71f2b81a0d6",
"vercel.json": "d32327b548505f90564281b39bc97014",
"main.dart.js": "d0b95a2f1027ca267126dd74a185305a",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"icons/Icon-192.png": "12d05db1c0b26d429b54e3f8c946a496",
"icons/Icon-512.png": "aabba36693aba0ec8d954adf297d3125",
"icons/favicon.png": "7a26ea9d4e61122fc023b84e5acdb148",
"version.json": "584718c013ad33ad3f95c86ba8515e36",
"favicon.png": "7a26ea9d4e61122fc023b84e5acdb148",
"index.html": "afab71af6db3429f3e63a5d9c33a3da4",
"/": "afab71af6db3429f3e63a5d9c33a3da4",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "c7b23b2b47c8b38abc0c6378585ad7bb",
"assets/FontManifest.json": "5e6352e891db62ab6e81fe73d72d9a57",
"assets/assets/fonts/montserrat/Montserrat-BlackItalic.ttf": "5811e69d2c096d8ad480f5796e3344ea",
"assets/assets/fonts/montserrat/Montserrat-BoldItalic.ttf": "5de9b5743038b63008bf9294cad5c0ba",
"assets/assets/fonts/montserrat/Montserrat-Italic.ttf": "8777b44e5f19cd64f83171126db732f0",
"assets/assets/fonts/montserrat/Montserrat-Bold.ttf": "a8de8ffe262db7e277deb8f1c439c518",
"assets/assets/fonts/montserrat/Montserrat-SemiBoldItalic.ttf": "abfff4a0713e68d64a737e744490b7ac",
"assets/assets/fonts/montserrat/Montserrat-LightItalic.ttf": "179eed84529839d2edf706b20eedcf72",
"assets/assets/fonts/montserrat/Montserrat-Medium.ttf": "5f797490f806b3b229299f0a66de89c9",
"assets/assets/fonts/montserrat/Montserrat-Light.ttf": "9e52b00d737492e337b2498406aef98f",
"assets/assets/fonts/montserrat/Montserrat-Thin.ttf": "bbf2ff5d3749f144925150eee4c35caa",
"assets/assets/fonts/montserrat/Montserrat-ExtraLightItalic.ttf": "d27df57dc92f77b422ff6f976973924b",
"assets/assets/fonts/montserrat/Montserrat-Black.ttf": "054ffd1ba6a6c109b3ccee195074f928",
"assets/assets/fonts/montserrat/Montserrat-ExtraBold.ttf": "5e81217f7e141ed72533cde11d1252fa",
"assets/assets/fonts/montserrat/Montserrat-SemiBold.ttf": "31e34a4dc526ffb104e2d988f6f52516",
"assets/assets/fonts/montserrat/Montserrat-ExtraLight.ttf": "b415dcea9b371c36eaf4a23e4fa1f5dc",
"assets/assets/fonts/montserrat/Montserrat-MediumItalic.ttf": "b74481b36cffbfa8ed83838da96e7ed1",
"assets/assets/fonts/montserrat/Montserrat-ThinItalic.ttf": "81fbc50801009bb840b3c91a4d2ffb6b",
"assets/assets/fonts/montserrat/Montserrat-ExtraBoldItalic.ttf": "ae2ace44e8b700f5b0cb25cbbc291d60",
"assets/assets/fonts/montserrat/Montserrat-Regular.ttf": "f7213526ec9296ff43426bfe3eae8926",
"assets/assets/images/Rectangle%25204.png": "99e3a53eb21e81ecad9391814aa1351d",
"assets/assets/images/Rectangle%25205.png": "db7951d2a3f2b5c79bf3f2de4c34688c",
"assets/assets/images/Rectangle%25203.png": "91044fbfe2d2e5405e9695ee2414d307",
"assets/assets/images/Rectangle%252023.png": "26f151e376b92fa88d0cf327526fb90a",
"assets/assets/images/pexels-aleksandar-pasaric-356286.jpg": "3e4f2c77551a7c3050254697c87f5dc2",
"assets/assets/images/AdobeStock_342564835_Editorial_Use_Only_1.png": "03d3933acc011ad80d7105bd9bc0509b",
"assets/assets/images/pexels-gizem-8893821.jpg": "aeca8fa831ae4e45104f0ac89d379b24",
"assets/AssetManifest.json": "148343361ce0acebcce597a59cdca329"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
