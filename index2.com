<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ballon Turbo - Royal Decoder</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;700;900&display=swap');
        body { background-color: #020617; color: #f1f5f9; font-family: 'Cairo', sans-serif; }
        .glass { background: rgba(15, 23, 42, 0.8); backdrop-filter: blur(12px); border: 1px solid rgba(239, 68, 68, 0.2); }
        .result-card { border-right: 4px solid #ef4444; background: rgba(239, 68, 68, 0.05); transition: 0.3s; }
        input, textarea { background: #0f172a !important; border: 1px solid #1e293b !important; color: #fff !important; }
        input:focus { border-color: #ef4444 !important; outline: none; box-shadow: 0 0 10px rgba(239, 68, 68, 0.3); }
        .badge { background: rgba(239, 68, 68, 0.2); color: #f87171; padding: 2px 8px; rounded: 6px; font-size: 10px; font-weight: bold; }
    </style>
</head>
<body class="p-4 md:p-10">

    <div class="max-w-5xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <h1 class="text-5xl font-black text-red-500 mb-4 tracking-tighter">مفكك الشفرات الملكي V200</h1>
            <p class="text-slate-400 text-lg">تحليل واستخراج بيانات المصفوفات المشفرة لمشغل Ballon Turbo</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
            
            <!-- Right: Decryption Form (5 Columns) -->
            <div class="lg:col-span-5 space-y-6">
                <div class="glass p-6 rounded-3xl shadow-2xl border-red-500/30">
                    <h2 class="text-xl font-bold mb-6 flex items-center gap-2 text-red-400">
                        <i class="fas fa-unlock-alt"></i> فك تشفير الرابط
                    </h2>
                    
                    <div class="space-y-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-500 mb-1 uppercase">الرابط المشفر (Base64) *</label>
                            <textarea id="inputEnc" placeholder="الصق الرابط المشفر هنا..." class="w-full rounded-xl px-4 py-3 text-xs font-mono h-32"></textarea>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-500 mb-1 uppercase">الرمز السري (Security Key)</label>
                            <input type="password" id="secretKey" placeholder="ادخل كلمة السر لفك الحماية..." class="w-full rounded-xl px-4 py-3 text-sm">
                        </div>

                        <button onclick="decryptAndParse()" class="w-full bg-red-600 hover:bg-red-500 text-white font-black py-4 rounded-2xl transition-all shadow-lg shadow-red-900/40 flex justify-center items-center gap-2 text-lg">
                            <i class="fas fa-microchip"></i> تحليل ومعالجة البيانات
                        </button>
                    </div>
                </div>

                <div class="text-center">
                    <a href="index.html" class="text-slate-500 hover:text-blue-400 text-sm transition-all italic">
                        <i class="fas fa-arrow-right ml-1"></i> العودة لمصنع الروابط
                    </a>
                </div>
            </div>

            <!-- Left: Decrypted Analysis (7 Columns) -->
            <div class="lg:col-span-7 space-y-6">
                
                <!-- Detailed Analysis Result -->
                <div id="resultBox" class="glass p-6 rounded-3xl min-h-[450px] hidden">
                    <h2 class="text-xl font-bold mb-6 flex justify-between items-center text-green-400 border-b border-green-900/30 pb-4">
                        <span><i class="fas fa-vial ml-2"></i> نتيجة التحليل التقني</span>
                        <span id="statusBadge" class="bg-green-900/30 text-green-400 px-3 py-1 rounded-full text-xs font-bold uppercase">Success</span>
                    </h2>
                    
                    <div id="analysisContent" class="space-y-6">
                        <!-- البيانات المحللة ستظهر هنا -->
                    </div>
                </div>

                <!-- Error Placeholder -->
                <div id="errorBox" class="glass p-10 rounded-3xl text-center hidden">
                    <i class="fas fa-exclamation-triangle text-5xl text-red-500 mb-4 opacity-50"></i>
                    <p class="text-red-400 font-bold">فشل فك التشفير!</p>
                    <p class="text-slate-500 text-sm mt-2">تأكد من الرابط المشفر أو صحة الرمز السري.</p>
                </div>

                <!-- Initial Placeholder -->
                <div id="placeholderBox" class="glass p-10 rounded-3xl text-center opacity-40">
                    <i class="fas fa-satellite-dish text-6xl text-slate-500 mb-4"></i>
                    <p class="text-slate-400">بانتظار إدخال البيانات للبدء في التحليل...</p>
                </div>
            </div>

        </div>
    </div>

    <script>
        function decryptAndParse() {
            const input = document.getElementById('inputEnc').value.trim();
            const key = document.getElementById('secretKey').value || "ballon";
            const resultBox = document.getElementById('resultBox');
            const errorBox = document.getElementById('errorBox');
            const placeholder = document.getElementById('placeholderBox');
            const content = document.getElementById('analysisContent');

            placeholder.classList.add('hidden');
            resultBox.classList.add('hidden');
            errorBox.classList.add('hidden');

            try {
                // 1. فك تشفير Base64
                const decryptedRaw = decodeURIComponent(escape(atob(input)));
                
                // 2. التحقق من الرمز السري (Salt Check)
                const parts = decryptedRaw.split("::");
                if (parts[0] !== key) {
                    throw new Error("رمز سري غير صحيح");
                }

                const masterString = parts[1];
                content.innerHTML = ""; // تنظيف المحتوى السابق

                // 3. تحليل الرابط الرئيسي والسيرفرات البديلة
                const mainPart = masterString.split("|servers=")[0];
                const serversPart = masterString.includes("|servers=") ? masterString.split("|servers=")[1] : "";

                // عرض الرابط الرئيسي (u)
                renderServerInfo(mainPart, "u", "السيرفر الرئيسي (المصفوفة 0)");

                // عرض السيرفرات البديلة (u1, u2...)
                if (serversPart) {
                    const serverArray = serversPart.split(",");
                    serverArray.forEach((s, index) => {
                        renderServerInfo(s, `u${index+1}`, `سيرفر بديل رقم ${index+1}`);
                    });
                }

                resultBox.classList.remove('hidden');

            } catch (e) {
                console.error(e);
                errorBox.classList.remove('hidden');
            }
        }

        function renderServerInfo(fullUrl, id, title) {
            const container = document.getElementById('analysisContent');
            
            // تحليل الترويسات داخل كل رابط
            const urlOnly = fullUrl.split("|")[0];
            const metadata = fullUrl.split("|").slice(1);
            
            let metadataHtml = "";
            metadata.forEach(m => {
                const [key, val] = m.split("=");
                metadataHtml += `
                    <div class="flex items-center gap-2 mt-1">
                        <span class="badge">${key}</span>
                        <span class="text-[11px] text-slate-400 truncate">${val || 'True'}</span>
                    </div>
                `;
            });

            // فحص وجود DRM
            const isDRM = fullUrl.includes("drmLicense=");
            const drmKey = isDRM ? fullUrl.substringAfter("drmLicense=").substringBefore("|").substringBefore("&") : null;

            container.innerHTML += `
                <div class="result-card glass p-4 rounded-2xl relative overflow-hidden group">
                    <div class="flex justify-between items-start mb-2">
                        <div>
                            <h3 class="text-sm font-black text-blue-400">${title} <span class="text-[10px] text-slate-600 font-normal mr-2">ID: ${id}</span></h3>
                            <p class="text-[11px] font-mono text-slate-300 mt-1 break-all">${urlOnly}</p>
                        </div>
                        ${isDRM ? '<i class="fas fa-lock text-yellow-500 text-xs" title="محمي بـ ClearKey"></i>' : ''}
                    </div>
                    
                    <div class="mt-3 grid grid-cols-1 md:grid-cols-2 gap-2">
                        ${metadataHtml || '<p class="text-[10px] text-slate-600">لا توجد ترويسات إضافية لهذا السيرفر</p>'}
                    </div>
                </div>
            `;
        }

        // Helper functions for string manipulation
        String.prototype.substringAfter = function(delim) {
            var parts = this.split(delim);
            return parts.length > 1 ? parts.slice(1).join(delim) : "";
        };
        String.prototype.substringBefore = function(delim) {
            return this.split(delim)[0];
        };
    </script>
</body>
</html>
