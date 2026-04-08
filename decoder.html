<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ballon Turbo - Omega Decoder</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;700;900&display=swap');
        body { background-color: #020617; color: #f1f5f9; font-family: 'Cairo', sans-serif; }
        .glass { background: rgba(15, 23, 42, 0.8); backdrop-filter: blur(12px); border: 1px solid rgba(239, 68, 68, 0.2); }
        .result-card { border-right: 4px solid #ef4444; background: rgba(239, 68, 68, 0.05); transition: 0.3s; position: relative; overflow: hidden; }
        .result-card::before { content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: linear-gradient(45deg, transparent, rgba(239, 68, 68, 0.03)); pointer-events: none; }
        input, textarea { background: #0f172a !important; border: 1px solid #1e293b !important; color: #fff !important; }
        input:focus, textarea:focus { border-color: #ef4444 !important; outline: none; box-shadow: 0 0 10px rgba(239, 68, 68, 0.3); }
        .badge { background: rgba(239, 68, 68, 0.2); color: #f87171; padding: 2px 10px; border-radius: 8px; font-size: 10px; font-weight: bold; border: 1px solid rgba(239, 68, 68, 0.3); }
        .engine-badge { background: #ef4444; color: #fff; padding: 2px 12px; border-radius: 20px; font-size: 10px; font-weight: 900; text-transform: uppercase; }
    </style>
</head>
<body class="p-4 md:p-10">

    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <h1 class="text-5xl font-black text-red-600 mb-4 tracking-tighter" style="text-shadow: 0 0 15px rgba(239,68,68,0.5);">OMEGA DECODER V300</h1>
            <p class="text-slate-400 text-lg">تحليل وفك مصفوفات Ballon Turbo الذكية واستخراج محركات التشغيل</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
            
            <!-- Right: Input Form (5 Columns) -->
            <div class="lg:col-span-5 space-y-6">
                <div class="glass p-8 rounded-3xl shadow-2xl border-red-500/30">
                    <h2 class="text-xl font-bold mb-6 flex items-center gap-3 text-red-400">
                        <i class="fas fa-terminal"></i> إدخال البيانات المشفرة
                    </h2>
                    
                    <div class="space-y-5">
                        <div>
                            <label class="block text-xs font-bold text-slate-500 mb-2 uppercase tracking-widest">رابط الأنتينت أو كود Base64</label>
                            <textarea id="inputEnc" placeholder="الصق الرابط الذي يبدأ بـ intent:// أو كود التشفير مباشرة..." class="w-full rounded-2xl px-4 py-4 text-xs font-mono h-48 leading-relaxed"></textarea>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-500 mb-2 uppercase tracking-widest">المعرف السري (Channel ID)</label>
                            <input type="text" id="secretKey" value="1717" placeholder="المعرف الافتراضي 1717" class="w-full rounded-xl px-4 py-3 text-sm text-center font-black tracking-widest text-red-500">
                        </div>

                        <button onclick="decryptAndParse()" class="w-full bg-red-600 hover:bg-red-500 text-white font-black py-4 rounded-2xl transition-all shadow-lg shadow-red-900/40 flex justify-center items-center gap-3 text-xl">
                            <i class="fas fa-unlock"></i> بدء الفحص الفوري
                        </button>
                    </div>
                </div>

                <div class="text-center">
                    <p class="text-slate-600 text-xs italic">نظام فك التشفير هذا متوافق مع كافة إصدارات Ballon Turbo 2026</p>
                </div>
            </div>

            <!-- Left: Decrypted Analysis (7 Columns) -->
            <div class="lg:col-span-7 space-y-6">
                
                <!-- Detailed Analysis Result -->
                <div id="resultBox" class="glass p-8 rounded-3xl min-h-[500px] hidden">
                    <h2 class="text-xl font-bold mb-8 flex justify-between items-center text-green-400 border-b border-green-900/20 pb-4">
                        <span><i class="fas fa-satellite ml-2"></i> المصفوفة المستخرجة</span>
                        <span class="engine-badge" id="masterEngine">Detecting...</span>
                    </h2>
                    
                    <div id="analysisContent" class="space-y-6">
                        <!-- البيانات المستخرجة ستظهر هنا -->
                    </div>
                </div>

                <!-- Error Placeholder -->
                <div id="errorBox" class="glass p-12 rounded-3xl text-center hidden border-red-500/50">
                    <i class="fas fa-skull-crossbones text-6xl text-red-600 mb-4 animate-pulse"></i>
                    <p class="text-red-400 font-black text-xl">فشل في اختراق التشفير!</p>
                    <p class="text-slate-500 text-sm mt-2">تأكد من صحة الرابط أو المعرف السري (ID) المستخدم.</p>
                </div>

                <!-- Initial Placeholder -->
                <div id="placeholderBox" class="glass p-20 rounded-3xl text-center border-dashed border-2 border-slate-800">
                    <i class="fas fa-radar text-7xl text-slate-800 mb-6"></i>
                    <p class="text-slate-600 font-bold">بانتظار إشارة البيانات للتحليل التقني...</p>
                </div>
            </div>

        </div>
    </div>

    <script>
        function decryptAndParse() {
            let input = document.getElementById('inputEnc').value.trim();
            const salt = document.getElementById('secretKey').value || "1717";
            const resultBox = document.getElementById('resultBox');
            const errorBox = document.getElementById('errorBox');
            const placeholder = document.getElementById('placeholderBox');
            const content = document.getElementById('analysisContent');

            // تنظيف الرابط إذا كان رابط Intent
            if (input.includes("url=")) {
                input = input.split("url=")[1].split("#")[0];
            }

            placeholder.classList.add('hidden');
            resultBox.classList.add('hidden');
            errorBox.classList.add('hidden');

            try {
                // 1. فك تشفير Base64 (دعم اللغة العربية والرموز)
                const decoded = decodeURIComponent(escape(atob(input)));
                
                content.innerHTML = ""; // تصفير النتائج

                // 2. التحقق من وجود مصفوفة سيرفرات متعددة (Commas)
                const serverEntries = decoded.split(",");

                serverEntries.forEach((entry, idx) => {
                    parseSingleServer(entry, idx, salt);
                });

                resultBox.classList.remove('hidden');

            } catch (e) {
                console.error(e);
                errorBox.classList.remove('hidden');
            }
        }

        function parseSingleServer(entry, index, expectedSalt) {
            const container = document.getElementById('analysisContent');
            
            // تقسيم السلسلة: [الأمر والمحرك والملح] :: [الرابط والهيدرز]
            if (!entry.includes("::")) return;

            const commandPart = entry.split("::")[0]; // مثلاً: player exoplayer 1717
            const linkPart = entry.split("::")[1];    // مثلاً: http://...|Referer=...

            // استخراج المحرك والملح
            const engine = commandPart.match(/player\s+(\w+)/) ? commandPart.match(/player\s+(\w+)/)[1] : "AUTO";
            const currentSalt = commandPart.split(" ").pop(); // آخر كلمة هي الملح غالباً

            // تحديث المحرك الرئيسي في الواجهة لأول سيرفر
            if (index === 0) document.getElementById('masterEngine').innerText = engine;

            // تقسيم الرابط عن الهيدرز
            const linkSegments = linkPart.split("|");
            const finalUrl = linkSegments[0];
            const headers = linkSegments.slice(1);

            let headersHtml = "";
            headers.forEach(h => {
                const [key, val] = h.split("=");
                headersHtml += `
                    <div class="flex items-center gap-2">
                        <span class="badge">${key}</span>
                        <span class="text-[10px] text-slate-400 font-mono truncate">${val || 'True'}</span>
                    </div>
                `;
            });

            const saltMatch = (currentSalt === expectedSalt);

            container.innerHTML += `
                <div class="result-card glass p-5 rounded-3xl border-l-4 ${saltMatch ? 'border-green-500' : 'border-red-600'}">
                    <div class="flex justify-between items-start">
                        <div class="flex-1">
                            <div class="flex items-center gap-3 mb-2">
                                <span class="text-xs font-black text-red-500 uppercase tracking-widest">SERVER #${index + 1}</span>
                                <span class="text-[10px] ${saltMatch ? 'text-green-500' : 'text-red-600'} font-bold">
                                    <i class="fas ${saltMatch ? 'fa-check-circle' : 'fa-times-circle'}"></i> 
                                    ID: ${currentSalt}
                                </span>
                            </div>
                            <p class="text-[12px] font-bold text-white break-all font-mono bg-black/40 p-2 rounded-xl border border-white/5">${finalUrl}</p>
                        </div>
                    </div>

                    <div class="mt-4 grid grid-cols-1 md:grid-cols-2 gap-3 bg-white/5 p-3 rounded-2xl">
                        ${headersHtml || '<p class="text-[10px] text-slate-600">لا توجد بارامترات إضافية</p>'}
                    </div>
                    
                    <div class="absolute top-4 left-4">
                        <i class="fas fa-microchip text-slate-800 text-2xl opacity-20"></i>
                    </div>
                </div>
            `;
        }
    </script>
</body>
</html>
