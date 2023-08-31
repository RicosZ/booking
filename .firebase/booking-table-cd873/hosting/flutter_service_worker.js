'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "9937fff5557720e6a83f4d3086303d49",
"assets/AssetManifest.json": "256362623e4b03837cf86785e4b86ba5",
"assets/assets/image/banner.jpg": "507ab75f7bd0c86e7781baffed34e8a9",
"assets/assets/svg/cancel.svg": "fb211c89dfbe50d2d4cc490adcc7e953",
"assets/assets/svg/checked.svg": "08e17a7e4ebc77855c14de5019abcbf5",
"assets/assets/ticket/Ticket_1.png": "e111637025bdc45cc45a1c6a6a0ec277",
"assets/assets/ticket/Ticket_10.png": "30d7459d80f14ba2c64d81fc04a64d86",
"assets/assets/ticket/Ticket_100.png": "02abf33f7ddcb1c83e64f4f264dc1faa",
"assets/assets/ticket/Ticket_11.png": "bc509d6fa615c5adced35b215955626c",
"assets/assets/ticket/Ticket_12.png": "aac929be4a4eef37fd7b8c5607f2f81d",
"assets/assets/ticket/Ticket_13.png": "b0039a901cfbaaec7e2289b3cb687a9a",
"assets/assets/ticket/Ticket_14.png": "3cc2d0f502db49f1208cc6497cb60a82",
"assets/assets/ticket/Ticket_15.png": "789a4e598c62fe05b9a10e6ae3a0b456",
"assets/assets/ticket/Ticket_16.png": "f6dbd2c12e157a0223a0d1ba7beaad19",
"assets/assets/ticket/Ticket_17.png": "ee4ec476f42b03d3224654d1a29e5fa3",
"assets/assets/ticket/Ticket_18.png": "e65725906ef3de37e4c509681066f2f2",
"assets/assets/ticket/Ticket_19.png": "8abed709b676932d08ebe1b93e913dc0",
"assets/assets/ticket/Ticket_2.png": "1b73ef96360fc8f64dfd4ad0917bbc78",
"assets/assets/ticket/Ticket_20.png": "35948d1c45f3018e331d0d3e038a652c",
"assets/assets/ticket/Ticket_21.png": "5584f71fe6a598f468e48492ea0bfe53",
"assets/assets/ticket/Ticket_22.png": "c01ac5f9dbf4902464f8aa457b6da896",
"assets/assets/ticket/Ticket_23.png": "e237ade268f38ebe29fe937512fb3e2e",
"assets/assets/ticket/Ticket_24.png": "cfdd78d219222bcae64147e8db766c58",
"assets/assets/ticket/Ticket_25.png": "49a68cee9e670936e122bf7d3670e8a4",
"assets/assets/ticket/Ticket_26.png": "6585fa80d2bb6d6b834cf42bf5b9bda0",
"assets/assets/ticket/Ticket_27.png": "142798b7d84cc22e08ef15b50e3ecd81",
"assets/assets/ticket/Ticket_28.png": "5101cad2989ace795433719ea5c70b33",
"assets/assets/ticket/Ticket_29.png": "f8d6a577268a541779439462d8a03c22",
"assets/assets/ticket/Ticket_3.png": "2fa875fd560161f304a58052d96916c6",
"assets/assets/ticket/Ticket_30.png": "d3bb07383a7a81d5df6bd7dce40eae7f",
"assets/assets/ticket/Ticket_31.png": "b2791b9fef10b01c2966acde2edc976b",
"assets/assets/ticket/Ticket_32.png": "0a055f8a64c8fdab45547cf9f92dec1c",
"assets/assets/ticket/Ticket_33.png": "5440a8c31b4f9052148b5d6afe83edc8",
"assets/assets/ticket/Ticket_34.png": "75563f3ebd742397bfb5c769f8de81d2",
"assets/assets/ticket/Ticket_35.png": "18deb739becf0a9d05397461acf2358d",
"assets/assets/ticket/Ticket_36.png": "f2e57a1d5cc86abda4936fb1ac022b2d",
"assets/assets/ticket/Ticket_37.png": "49c92944f4d45ea77525b78c7cd0a425",
"assets/assets/ticket/Ticket_38.png": "4785a4b8cbefd0b1ef7bffe1a20f7e69",
"assets/assets/ticket/Ticket_39.png": "70f5d4935a30666af99b7391800176f6",
"assets/assets/ticket/Ticket_4.png": "75551e9d32b30ed288d447388177f94f",
"assets/assets/ticket/Ticket_40.png": "397de1a639bc7e99fb80790ffe9e9329",
"assets/assets/ticket/Ticket_41.png": "a1523f2d52149f3001009507fb1e9d0b",
"assets/assets/ticket/Ticket_42.png": "61f97b3036539c00cb4c0ef59b7915d9",
"assets/assets/ticket/Ticket_43.png": "6251396e11bff3b0046b3277d1a76eff",
"assets/assets/ticket/Ticket_44.png": "604744f81794b3542de991b61846010b",
"assets/assets/ticket/Ticket_45.png": "ba99c7da7c472cda8e35f4f2bca9e2ca",
"assets/assets/ticket/Ticket_46.png": "d82954c724a807abe66caf436e5f5ce1",
"assets/assets/ticket/Ticket_47.png": "8545671928bc7fe7335052af0ce4fcf2",
"assets/assets/ticket/Ticket_48.png": "d6a44d5ad4493c740733c14d4cd8e8de",
"assets/assets/ticket/Ticket_49.png": "c27ccc6e34dc19f3c8a33b7df23cc896",
"assets/assets/ticket/Ticket_5.png": "1e24aea32aca44da1b5edd0354b2eacc",
"assets/assets/ticket/Ticket_50.png": "6c616548f908b1e9bc1f8a8c14c009ee",
"assets/assets/ticket/Ticket_51.png": "361801907d802cb55873b50649150da7",
"assets/assets/ticket/Ticket_52.png": "1ae84de863d69eca5a310ddecd91e725",
"assets/assets/ticket/Ticket_53.png": "9f5773ecb4219ab524b338821a74c48f",
"assets/assets/ticket/Ticket_54.png": "ef5826bb09bbab180712d8e2d01d6969",
"assets/assets/ticket/Ticket_55.png": "ccdcdb87ac7308b1a702e5e23b257e66",
"assets/assets/ticket/Ticket_56.png": "e92d881bb1a70144382cfbfe79bb15df",
"assets/assets/ticket/Ticket_57.png": "c16e5f196e57cba5f6ce6f0662a30ee2",
"assets/assets/ticket/Ticket_58.png": "ccdcdb87ac7308b1a702e5e23b257e66",
"assets/assets/ticket/Ticket_59.png": "e1f2b4b2b3033bd4acedcd3af62f155c",
"assets/assets/ticket/Ticket_6.png": "eaf800dda597acc76872f91a87c8476f",
"assets/assets/ticket/Ticket_60.png": "2d5a4030180c31c66f06d03f68073481",
"assets/assets/ticket/Ticket_61.png": "5ac7626a2ab9c6bf16c8f2bd9939fd71",
"assets/assets/ticket/Ticket_62.png": "6b403d03c9640b308c7b988217b774ba",
"assets/assets/ticket/Ticket_63.png": "e71cb3786087d2794e83fc6c84492548",
"assets/assets/ticket/Ticket_64.png": "c13a304c5a08962b00cc182c276c35f6",
"assets/assets/ticket/Ticket_65.png": "d60d4b7bb91c8725923f026bcbf0230a",
"assets/assets/ticket/Ticket_66.png": "b6c7ab29744c1dbddea9a9c10af9087c",
"assets/assets/ticket/Ticket_67.png": "db97d0d4495209c6e9bf3aa0cbaafe1c",
"assets/assets/ticket/Ticket_68.png": "9f8e39a5901f94241279b3b2353b9a93",
"assets/assets/ticket/Ticket_69.png": "b26d42467b5347354ba3f97519624c8c",
"assets/assets/ticket/Ticket_7.png": "647710fe726287b298fe5e78a71b1713",
"assets/assets/ticket/Ticket_70.png": "cc7ac8b75347a4851dc5884a09f388a9",
"assets/assets/ticket/Ticket_71.png": "416b0732c6f4e51b55d6aa935bcf8092",
"assets/assets/ticket/Ticket_72.png": "eb1dc9d1e7298535d015a1f953ab36c6",
"assets/assets/ticket/Ticket_73.png": "2e0559be826b1bc5cf3024dfc77f53ad",
"assets/assets/ticket/Ticket_74.png": "bcf35a8d98399d82b2769b45587a1fcf",
"assets/assets/ticket/Ticket_75.png": "4693383afe6dfe5fb93018ae716373ea",
"assets/assets/ticket/Ticket_76.png": "678553b5793186c5a73a6fe90dbf9aa8",
"assets/assets/ticket/Ticket_77.png": "b8edece45f32298499dc2f7320ebaf4a",
"assets/assets/ticket/Ticket_78.png": "6d074dafd8da7039acf8370b707544b1",
"assets/assets/ticket/Ticket_79.png": "a531b5d9519eaef61dfaf1ad4676d372",
"assets/assets/ticket/Ticket_8.png": "91c7a268534d74fd8c02fd3d538e4a1c",
"assets/assets/ticket/Ticket_80.png": "ae2c2adec57aa52f62cc7a457f7e8d9d",
"assets/assets/ticket/Ticket_81.png": "03f059841eb8c3fa5d8dbb02892730c8",
"assets/assets/ticket/Ticket_82.png": "51a5e3e2cb451edf7c0c33b63fad1037",
"assets/assets/ticket/Ticket_83.png": "dbbfcfa169c446b6d5daa9cc69b76866",
"assets/assets/ticket/Ticket_84.png": "b17facfdf7dd2cc1bc463dc4d43a44f2",
"assets/assets/ticket/Ticket_85.png": "4678469260d2dc929048b45cb7bbfd87",
"assets/assets/ticket/Ticket_86.png": "5511aded10577907eab15a0edae0aaf9",
"assets/assets/ticket/Ticket_87.png": "1104087a40ee84bf3e6987bc3934b86c",
"assets/assets/ticket/Ticket_88.png": "f37999dce5c6c4d68b1c1607e2c391e3",
"assets/assets/ticket/Ticket_89.png": "fed78c03ae6fa329b74199134cdc51f8",
"assets/assets/ticket/Ticket_9.png": "0452fd9024846c60b65f121669ab7d1c",
"assets/assets/ticket/Ticket_90.png": "dc5dd8b637319d6b0c07148e3b5b399c",
"assets/assets/ticket/Ticket_91.png": "57fe5e14027e5948670e1990ac0120cf",
"assets/assets/ticket/Ticket_92.png": "2cd27a57e5b68495799cc8fe8dbd60db",
"assets/assets/ticket/Ticket_93.png": "df52b2ddbb7232b81225284e8b06a22e",
"assets/assets/ticket/Ticket_94.png": "c8d1614c1ca89a7158ff0b8455e4b915",
"assets/assets/ticket/Ticket_95.png": "81f88ddb26889b83a78a9d24477cab55",
"assets/assets/ticket/Ticket_96.png": "6deda6118e5c954fd9bd8330647da398",
"assets/assets/ticket/Ticket_97.png": "fb0c2af7c30131d83424a0fb0414f405",
"assets/assets/ticket/Ticket_98.png": "476f4d6adb238581851c938b71d7aaa5",
"assets/assets/ticket/Ticket_99.png": "41c611cf23c2b816b862c398ed78d43a",
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
"index.html": "d57f38938e189cfe043782f4dc6131f7",
"/": "d57f38938e189cfe043782f4dc6131f7",
"main.dart.js": "d882e240e73689a7378764125f94f6d3",
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
