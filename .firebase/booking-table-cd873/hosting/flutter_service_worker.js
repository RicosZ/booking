'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "c428c4b137bdbbc989de3ac9e3002fcd",
"assets/AssetManifest.json": "43af35945c46c4ae2e6eb0b1f601c2f8",
"assets/assets/image/banner.jpg": "507ab75f7bd0c86e7781baffed34e8a9",
"assets/assets/svg/cancel.svg": "fb211c89dfbe50d2d4cc490adcc7e953",
"assets/assets/svg/checked.svg": "08e17a7e4ebc77855c14de5019abcbf5",
"assets/assets/ticket/Ticket_0.png": "c2f233c84678ec05310b352342cf9752",
"assets/assets/ticket/Ticket_1.png": "c4bfd4a2b9ec3e7cbe64c4a2f78a142e",
"assets/assets/ticket/Ticket_10.png": "3178e9b78881961bb14f8f9c4d63bc6f",
"assets/assets/ticket/Ticket_11.png": "100aa0fefc98216d0137959cb3a53821",
"assets/assets/ticket/Ticket_12.png": "a87279cba43caef94204ca9201f2680d",
"assets/assets/ticket/Ticket_13.png": "6d386c2358e4897768a87e1f43565bee",
"assets/assets/ticket/Ticket_14.png": "d349d57209ee3a2b70fc3371ef525942",
"assets/assets/ticket/Ticket_15.png": "07f2b0c14e400d16cf8ea0b9d3778fbb",
"assets/assets/ticket/Ticket_16.png": "c9e4e602bfe2cdff8124552b4621a4a7",
"assets/assets/ticket/Ticket_17.png": "cbe3ecd1a3e187566319104444ec0979",
"assets/assets/ticket/Ticket_18.png": "349d12085f8c5e08d153e26f6133c65a",
"assets/assets/ticket/Ticket_19.png": "5ac99e1fbc99e99204ed012239c8a3a0",
"assets/assets/ticket/Ticket_2.png": "f375c309d02466a504b9498eb7f9e995",
"assets/assets/ticket/Ticket_20.png": "7d9fbaacb152459acc03e843e82e3a95",
"assets/assets/ticket/Ticket_21.png": "10f77a9ed5acc176c8df8a13454795d6",
"assets/assets/ticket/Ticket_22.png": "d2cbf5e80963d662868eaf45a6d43f67",
"assets/assets/ticket/Ticket_23.png": "2e3cd857eceea19ec594d6e292e1dab4",
"assets/assets/ticket/Ticket_24.png": "368e2741a04bdb4107badd92fc2c2666",
"assets/assets/ticket/Ticket_25.png": "540395f1f214a43243a8932488432eff",
"assets/assets/ticket/Ticket_26.png": "ce75bb648e533372234d4f0ec6bd4b11",
"assets/assets/ticket/Ticket_27.png": "2f2be3555551c809086a7b0eb89ff3b2",
"assets/assets/ticket/Ticket_28.png": "7fb6a05492c67b52b06d94b67f745487",
"assets/assets/ticket/Ticket_29.png": "cbcea5550a9f010e277d036a6655f9a7",
"assets/assets/ticket/Ticket_3.png": "05d1df938c5c745c436049b090109a2a",
"assets/assets/ticket/Ticket_30.png": "b9d58e0e28939581a174c9e849ef3642",
"assets/assets/ticket/Ticket_31.png": "8ce6a5ee9c2052d425b1db1433a5c572",
"assets/assets/ticket/Ticket_32.png": "6865a82834ad9865e1772d957475eb88",
"assets/assets/ticket/Ticket_33.png": "7c059154f635c2dd7b2065ee95df9a63",
"assets/assets/ticket/Ticket_34.png": "3102fad7c21520bb2f3a1b2a62fea0a1",
"assets/assets/ticket/Ticket_35.png": "23f42e90236db7b327fa9093793f21cd",
"assets/assets/ticket/Ticket_36.png": "d377fa439bb59ef6d9105c7ff3747ccd",
"assets/assets/ticket/Ticket_37.png": "c64fb903924d71d52329704d624f6fa9",
"assets/assets/ticket/Ticket_38.png": "c9bd1cf28e7c53631ac7ad444f9a4625",
"assets/assets/ticket/Ticket_39.png": "aa89e00eec3b81ac2ed417bd27058be8",
"assets/assets/ticket/Ticket_4.png": "79fd15a9ccebf04b2959d81d475bbb33",
"assets/assets/ticket/Ticket_40.png": "ace409a9b0375b9ffed5e8082c7cabfe",
"assets/assets/ticket/Ticket_41.png": "ae3b3edfde08f4b21e77fa912f6a6f16",
"assets/assets/ticket/Ticket_42.png": "c36dfdb364223552d7d11083aab403d4",
"assets/assets/ticket/Ticket_43.png": "dbe638423d44ec9008e149500f246cc7",
"assets/assets/ticket/Ticket_44.png": "c50550a6db91564d5f567913d8e84968",
"assets/assets/ticket/Ticket_45.png": "2e983bd2d6c4ccbfb1d0be42d9c35720",
"assets/assets/ticket/Ticket_46.png": "38cdceb9401a8095b084c2155d55c037",
"assets/assets/ticket/Ticket_47.png": "cce4ba987dc5573bf20ef0606c2a877a",
"assets/assets/ticket/Ticket_48.png": "e1d4d80e46c872ec5132a2e704428d44",
"assets/assets/ticket/Ticket_49.png": "d42559e184a69abff177113da009ed54",
"assets/assets/ticket/Ticket_5.png": "a27d57f00226094dd829eebf1780e286",
"assets/assets/ticket/Ticket_50.png": "1db27dee9a02d5c8cace92648050a1d9",
"assets/assets/ticket/Ticket_51.png": "eb3e703f78f60b881a9cbde81da3d084",
"assets/assets/ticket/Ticket_52.png": "db53f19ff1a48292e4c60f8ab390a27a",
"assets/assets/ticket/Ticket_53.png": "f7b3fd2a0d31e2a713e28f00be6a4706",
"assets/assets/ticket/Ticket_54.png": "c5aea900be0831b81e419503575b92d7",
"assets/assets/ticket/Ticket_55.png": "ec76fb6926e7acab6feba13e1502fed6",
"assets/assets/ticket/Ticket_56.png": "7a143a54699ab2893473f9e9ce4daa7a",
"assets/assets/ticket/Ticket_57.png": "c5aea900be0831b81e419503575b92d7",
"assets/assets/ticket/Ticket_58.png": "58413129004e14643102a77041053e94",
"assets/assets/ticket/Ticket_59.png": "f49b9e02609dafce0db1d58e8a143d83",
"assets/assets/ticket/Ticket_6.png": "e62d1047a31fbab7586f56d1e4d5023d",
"assets/assets/ticket/Ticket_60.png": "3a27200b75706bdd08a1f6f93f45dea5",
"assets/assets/ticket/Ticket_61.png": "fe35f5fa3d7d4db64cd1fdcefa2b1a22",
"assets/assets/ticket/Ticket_62.png": "850d7459338b92c77e9355822b391b96",
"assets/assets/ticket/Ticket_63.png": "6f77efcb9ca190111968a8dca2b99f4f",
"assets/assets/ticket/Ticket_64.png": "4533d587ea0016ac2c63cc3c796b98c9",
"assets/assets/ticket/Ticket_65.png": "cc9e5217de11c4368dcb73546ac43634",
"assets/assets/ticket/Ticket_66.png": "5486243322d1febc09d4c2fcf6e244d5",
"assets/assets/ticket/Ticket_67.png": "0cc3a0a2e043e8f07afbf7fb3fb59c50",
"assets/assets/ticket/Ticket_68.png": "43c69ca838de12351d237a3ec84ea86d",
"assets/assets/ticket/Ticket_69.png": "db343e6f80837cd53679c25fb96ab299",
"assets/assets/ticket/Ticket_7.png": "19e0219e52ab5193f8ebd48bd46b7d00",
"assets/assets/ticket/Ticket_70.png": "422c8fb739e80171a0fdfb72e16481de",
"assets/assets/ticket/Ticket_71.png": "fa2ee247351294cefef67a0bdbfc99e9",
"assets/assets/ticket/Ticket_72.png": "b3ef2e2e003ab970ddf7b9f1950e706c",
"assets/assets/ticket/Ticket_73.png": "6b712f074d60b3a328d70d2ebd54a8df",
"assets/assets/ticket/Ticket_74.png": "f9c186ea54c5a1743351049619e34fbc",
"assets/assets/ticket/Ticket_75.png": "1605d3d3fe95247e1ff358d8e73969a8",
"assets/assets/ticket/Ticket_76.png": "14f5215467da7beb082261aff29bf8c2",
"assets/assets/ticket/Ticket_77.png": "e84476c1f67e741a526816de308b1774",
"assets/assets/ticket/Ticket_78.png": "9c348331ce7b3e742a53b3419a18c3b0",
"assets/assets/ticket/Ticket_79.png": "17034dab70fbb677482791ae7389212a",
"assets/assets/ticket/Ticket_8.png": "985cefb369ac9784420134d53f810274",
"assets/assets/ticket/Ticket_80.png": "10d387315675acf9dae94705f35e0097",
"assets/assets/ticket/Ticket_81.png": "bedf4c8e7152ee335a33d56470ea4d6e",
"assets/assets/ticket/Ticket_82.png": "83cdc2dc6f228db09d2448104b306ea5",
"assets/assets/ticket/Ticket_83.png": "524ca8517e12af5b34be88e28b402626",
"assets/assets/ticket/Ticket_84.png": "6a7e9cd94fdc875a1399f4bba41667a2",
"assets/assets/ticket/Ticket_85.png": "6778a787a77ad56730efc866467218f2",
"assets/assets/ticket/Ticket_86.png": "3b3177314a3a70d85a14b1a952c8cd2e",
"assets/assets/ticket/Ticket_87.png": "4dc4428c14a1eab6ac65b7dc8810752b",
"assets/assets/ticket/Ticket_88.png": "3a8b18e9f95f2cd3afa32a93d4a867ba",
"assets/assets/ticket/Ticket_89.png": "1eb1fcb2004076fef2e51d4dcdb517f0",
"assets/assets/ticket/Ticket_9.png": "5656fd9ed0d3de3bc7d59370e86f579a",
"assets/assets/ticket/Ticket_90.png": "cf5d86c3fb162b8b7405c757a57ea307",
"assets/assets/ticket/Ticket_91.png": "fc8cdfd955dca6906924a99f19b91677",
"assets/assets/ticket/Ticket_92.png": "fdd25874d327b415b13820d9a6605d9b",
"assets/assets/ticket/Ticket_93.png": "28789eb5050963f9ed6456d329175b7d",
"assets/assets/ticket/Ticket_94.png": "868c8893dfaa3c4e5b7b4a4431ae647f",
"assets/assets/ticket/Ticket_95.png": "f836c983c8f8a6b272911e8b2c4e04ff",
"assets/assets/ticket/Ticket_96.png": "27b6cdb6dff41021d0592000ead7bf4b",
"assets/assets/ticket/Ticket_97.png": "3d9dcbea56d6b497f93a6fef76b55cbd",
"assets/assets/ticket/Ticket_98.png": "3bbc99970d24e4baf95f86bf18be5937",
"assets/assets/ticket/Ticket_99.png": "609e58190cd24330c7bc4a65c14344ea",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "0f97895e9ecd824677568598935e34a5",
"assets/NOTICES": "3579078e8ffdf0bf6c0db632d6b7a37b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "063a8dcb318ebe2a7e526445ae6c4d8d",
"/": "063a8dcb318ebe2a7e526445ae6c4d8d",
"main.dart.js": "11ec944b9d7464ffb823a47e06667bc7",
"manifest.json": "a7125503e5ca65d4b1ce56a0dea07b7f",
"version.json": "e988a8ce9636fda87222a128912b7c1f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
