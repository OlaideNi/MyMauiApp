; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [130 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [260 x i32] [
	i32 39109920, ; 0: Newtonsoft.Json.dll => 0x254c520 => 48
	i32 42639949, ; 1: System.Threading.Thread => 0x28aa24d => 120
	i32 67008169, ; 2: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 3: Microsoft.Maui.Graphics.dll => 0x44bb714 => 47
	i32 117431740, ; 4: System.Runtime.InteropServices => 0x6ffddbc => 109
	i32 165246403, ; 5: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 53
	i32 182336117, ; 6: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 71
	i32 195452805, ; 7: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 8: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 9: System.ComponentModel => 0xc38ff48 => 85
	i32 230752869, ; 10: Microsoft.CSharp.dll => 0xdc10265 => 78
	i32 246610117, ; 11: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 107
	i32 280992041, ; 12: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 13: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 14: Xamarin.AndroidX.Activity.dll => 0x13031348 => 49
	i32 336156722, ; 15: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 16: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 60
	i32 356389973, ; 17: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 18: System.Threading.Thread.dll => 0x16a510e1 => 120
	i32 385762202, ; 19: System.Memory.dll => 0x16fe439a => 96
	i32 395744057, ; 20: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 21: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 22: System.Collections => 0x1a61054f => 82
	i32 450948140, ; 23: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 59
	i32 459347974, ; 24: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 469710990, ; 25: System.dll => 0x1bff388e => 125
	i32 498788369, ; 26: System.ObjectModel => 0x1dbae811 => 102
	i32 500358224, ; 27: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 28: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 29: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 42
	i32 539058512, ; 30: Microsoft.Extensions.Logging => 0x20216150 => 39
	i32 592146354, ; 31: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 32: Xamarin.AndroidX.CustomView => 0x2568904f => 57
	i32 627931235, ; 33: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 34: System.Text.Encodings.Web.dll => 0x27787397 => 117
	i32 672442732, ; 35: System.Collections.Concurrent => 0x2814a96c => 79
	i32 688181140, ; 36: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 37: System.Xml.Linq.dll => 0x29293ff5 => 122
	i32 706645707, ; 38: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 39: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 40: System.Runtime.Loader.dll => 0x2b15ed29 => 110
	i32 759454413, ; 41: System.Net.Requests => 0x2d445acd => 100
	i32 775507847, ; 42: System.IO.Compression => 0x2e394f87 => 93
	i32 777317022, ; 43: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 44: Microsoft.Extensions.Options => 0x2f0980eb => 41
	i32 804715423, ; 45: System.Data.Common => 0x2ff6fb9f => 87
	i32 823281589, ; 46: System.Private.Uri.dll => 0x311247b5 => 103
	i32 830298997, ; 47: System.IO.Compression.Brotli => 0x317d5b75 => 92
	i32 878954865, ; 48: System.Net.Http.Json => 0x3463c971 => 97
	i32 904024072, ; 49: System.ComponentModel.Primitives.dll => 0x35e25008 => 83
	i32 926902833, ; 50: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 51: Newtonsoft.Json => 0x38f24a24 => 48
	i32 967690846, ; 52: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 60
	i32 975874589, ; 53: System.Xml.XDocument => 0x3a2aaa1d => 124
	i32 992768348, ; 54: System.Collections.dll => 0x3b2c715c => 82
	i32 1012816738, ; 55: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 70
	i32 1019214401, ; 56: System.Drawing => 0x3cbffa41 => 91
	i32 1028951442, ; 57: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 38
	i32 1029334545, ; 58: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 59: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 50
	i32 1036536393, ; 60: System.Drawing.Primitives.dll => 0x3dc84a49 => 90
	i32 1044663988, ; 61: System.Linq.Expressions.dll => 0x3e444eb4 => 94
	i32 1052210849, ; 62: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 62
	i32 1082857460, ; 63: System.ComponentModel.TypeConverter => 0x408b17f4 => 84
	i32 1084122840, ; 64: Xamarin.Kotlin.StdLib => 0x409e66d8 => 75
	i32 1098259244, ; 65: System => 0x41761b2c => 125
	i32 1118262833, ; 66: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 67: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 68: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 67
	i32 1203215381, ; 69: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 70: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 71: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 72: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 58
	i32 1315149055, ; 73: interviewMobile => 0x4e6394ff => 77
	i32 1324164729, ; 74: System.Linq => 0x4eed2679 => 95
	i32 1373134921, ; 75: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 76: Xamarin.AndroidX.SavedState => 0x52114ed3 => 70
	i32 1406073936, ; 77: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 54
	i32 1408764838, ; 78: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 112
	i32 1430672901, ; 79: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 80: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 81: System.IO.Compression.dll => 0x57261233 => 93
	i32 1469204771, ; 82: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 51
	i32 1470490898, ; 83: Microsoft.Extensions.Primitives => 0x57a5e912 => 42
	i32 1480492111, ; 84: System.IO.Compression.Brotli.dll => 0x583e844f => 92
	i32 1493001747, ; 85: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 86: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 87: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 119
	i32 1551623176, ; 88: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 89: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 64
	i32 1624863272, ; 90: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 73
	i32 1636350590, ; 91: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 56
	i32 1639515021, ; 92: System.Net.Http.dll => 0x61b9038d => 98
	i32 1639986890, ; 93: System.Text.RegularExpressions => 0x61c036ca => 119
	i32 1657153582, ; 94: System.Runtime => 0x62c6282e => 114
	i32 1658251792, ; 95: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 74
	i32 1677501392, ; 96: System.Net.Primitives.dll => 0x63fca3d0 => 99
	i32 1679769178, ; 97: System.Security.Cryptography => 0x641f3e5a => 115
	i32 1729485958, ; 98: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 52
	i32 1736233607, ; 99: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 100: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 101: System.Diagnostics.TraceSource.dll => 0x69239124 => 89
	i32 1766324549, ; 102: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 71
	i32 1770582343, ; 103: Microsoft.Extensions.Logging.dll => 0x6988f147 => 39
	i32 1780572499, ; 104: Mono.Android.Runtime.dll => 0x6a216153 => 128
	i32 1782862114, ; 105: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 106: Xamarin.AndroidX.Fragment => 0x6a96652d => 59
	i32 1793755602, ; 107: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 108: Xamarin.AndroidX.Loader => 0x6bcd3296 => 64
	i32 1813058853, ; 109: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 75
	i32 1813201214, ; 110: Xamarin.Google.Android.Material => 0x6c13413e => 74
	i32 1818569960, ; 111: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 68
	i32 1824175904, ; 112: System.Text.Encoding.Extensions => 0x6cbab720 => 116
	i32 1824722060, ; 113: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 112
	i32 1828688058, ; 114: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 40
	i32 1842015223, ; 115: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 116: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 117: System.Linq.Expressions => 0x6ec71a65 => 94
	i32 1870277092, ; 118: System.Reflection.Primitives => 0x6f7a29e4 => 108
	i32 1875935024, ; 119: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 120: System.Collections.NonGeneric.dll => 0x71dc7c8b => 80
	i32 1939592360, ; 121: System.Private.Xml.Linq => 0x739bd4a8 => 104
	i32 1968388702, ; 122: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 35
	i32 2003115576, ; 123: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 124: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 62
	i32 2025202353, ; 125: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 126: System.Private.Xml => 0x79eb68ee => 105
	i32 2055257422, ; 127: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 61
	i32 2066184531, ; 128: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 129: System.Diagnostics.TraceSource => 0x7b6f419e => 89
	i32 2079903147, ; 130: System.Runtime.dll => 0x7bf8cdab => 114
	i32 2090596640, ; 131: System.Numerics.Vectors => 0x7c9bf920 => 101
	i32 2127167465, ; 132: System.Console => 0x7ec9ffe9 => 86
	i32 2142473426, ; 133: System.Collections.Specialized => 0x7fb38cd2 => 81
	i32 2159891885, ; 134: Microsoft.Maui => 0x80bd55ad => 45
	i32 2169148018, ; 135: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 136: Microsoft.Extensions.Options.dll => 0x820d22b3 => 41
	i32 2192057212, ; 137: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 40
	i32 2193016926, ; 138: System.ObjectModel.dll => 0x82b6c85e => 102
	i32 2201107256, ; 139: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 76
	i32 2201231467, ; 140: System.Net.Http => 0x8334206b => 98
	i32 2207618523, ; 141: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 142: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 36
	i32 2270573516, ; 143: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 144: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 69
	i32 2303942373, ; 145: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 146: System.Private.CoreLib.dll => 0x896b7878 => 126
	i32 2353062107, ; 147: System.Net.Primitives => 0x8c40e0db => 99
	i32 2368005991, ; 148: System.Xml.ReaderWriter.dll => 0x8d24e767 => 123
	i32 2371007202, ; 149: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 35
	i32 2395872292, ; 150: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 151: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 152: System.Console.dll => 0x912896e5 => 86
	i32 2475788418, ; 153: Java.Interop.dll => 0x93918882 => 127
	i32 2480646305, ; 154: Microsoft.Maui.Controls => 0x93dba8a1 => 43
	i32 2538310050, ; 155: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 107
	i32 2550873716, ; 156: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 157: Microsoft.CSharp => 0x98ba5a04 => 78
	i32 2570120770, ; 158: System.Text.Encodings.Web => 0x9930ee42 => 117
	i32 2585220780, ; 159: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 116
	i32 2593496499, ; 160: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 161: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 76
	i32 2617129537, ; 162: System.Private.Xml.dll => 0x9bfe3a41 => 105
	i32 2620871830, ; 163: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 56
	i32 2626831493, ; 164: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 165: System.Runtime.Loader => 0x9ec4cf01 => 110
	i32 2664396074, ; 166: System.Xml.XDocument.dll => 0x9ecf752a => 124
	i32 2665622720, ; 167: System.Drawing.Primitives => 0x9ee22cc0 => 90
	i32 2676780864, ; 168: System.Data.Common.dll => 0x9f8c6f40 => 87
	i32 2724373263, ; 169: System.Runtime.Numerics.dll => 0xa262a30f => 111
	i32 2732626843, ; 170: Xamarin.AndroidX.Activity => 0xa2e0939b => 49
	i32 2737747696, ; 171: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 51
	i32 2752995522, ; 172: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 173: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 44
	i32 2764765095, ; 174: Microsoft.Maui.dll => 0xa4caf7a7 => 45
	i32 2778768386, ; 175: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 72
	i32 2785988530, ; 176: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 177: Microsoft.Maui.Graphics => 0xa7008e0b => 47
	i32 2806116107, ; 178: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 179: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 54
	i32 2810484732, ; 180: interviewMobile.dll => 0xa78497fc => 77
	i32 2831556043, ; 181: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 182: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 72
	i32 2861189240, ; 183: Microsoft.Maui.Essentials => 0xaa8a4878 => 46
	i32 2909740682, ; 184: System.Private.CoreLib => 0xad6f1e8a => 126
	i32 2916838712, ; 185: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 73
	i32 2919462931, ; 186: System.Numerics.Vectors.dll => 0xae037813 => 101
	i32 2959614098, ; 187: System.ComponentModel.dll => 0xb0682092 => 85
	i32 2978675010, ; 188: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 58
	i32 3038032645, ; 189: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 190: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 65
	i32 3059408633, ; 191: Mono.Android.Runtime => 0xb65adef9 => 128
	i32 3059793426, ; 192: System.ComponentModel.Primitives => 0xb660be12 => 83
	i32 3077302341, ; 193: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3159123045, ; 194: System.Reflection.Primitives.dll => 0xbc4c6465 => 108
	i32 3178803400, ; 195: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 66
	i32 3220365878, ; 196: System.Threading => 0xbff2e236 => 121
	i32 3258312781, ; 197: Xamarin.AndroidX.CardView => 0xc235e84d => 52
	i32 3305363605, ; 198: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 199: System.Net.Requests.dll => 0xc5b097e4 => 100
	i32 3317135071, ; 200: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 57
	i32 3346324047, ; 201: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 67
	i32 3357674450, ; 202: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 203: System.Text.Json => 0xc82afec1 => 118
	i32 3362522851, ; 204: Xamarin.AndroidX.Core => 0xc86c06e3 => 55
	i32 3366347497, ; 205: Java.Interop => 0xc8a662e9 => 127
	i32 3374999561, ; 206: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 69
	i32 3381016424, ; 207: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 208: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 37
	i32 3463511458, ; 209: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 210: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 84
	i32 3476120550, ; 211: Mono.Android => 0xcf3163e6 => 129
	i32 3479583265, ; 212: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 213: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 214: System.Text.Json.dll => 0xcfbaacae => 118
	i32 3509114376, ; 215: System.Xml.Linq => 0xd128d608 => 122
	i32 3580758918, ; 216: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 217: System.Linq.dll => 0xd715a361 => 95
	i32 3641597786, ; 218: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 61
	i32 3643446276, ; 219: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 220: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 66
	i32 3657292374, ; 221: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 36
	i32 3672681054, ; 222: Mono.Android.dll => 0xdae8aa5e => 129
	i32 3697841164, ; 223: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 224: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 65
	i32 3737834244, ; 225: System.Net.Http.Json.dll => 0xdecad304 => 97
	i32 3748608112, ; 226: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 88
	i32 3786282454, ; 227: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 53
	i32 3792276235, ; 228: System.Collections.NonGeneric => 0xe2098b0b => 80
	i32 3802395368, ; 229: System.Collections.Specialized.dll => 0xe2a3f2e8 => 81
	i32 3823082795, ; 230: System.Security.Cryptography.dll => 0xe3df9d2b => 115
	i32 3841636137, ; 231: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 38
	i32 3849253459, ; 232: System.Runtime.InteropServices.dll => 0xe56ef253 => 109
	i32 3889960447, ; 233: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 234: System.Collections.Concurrent.dll => 0xe839deed => 79
	i32 3896760992, ; 235: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 55
	i32 3928044579, ; 236: System.Xml.ReaderWriter => 0xea213423 => 123
	i32 3931092270, ; 237: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 68
	i32 3955647286, ; 238: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 50
	i32 3980434154, ; 239: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 240: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 241: System.Memory => 0xeff49a63 => 96
	i32 4046471985, ; 242: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 44
	i32 4054681211, ; 243: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 106
	i32 4068434129, ; 244: System.Private.Xml.Linq.dll => 0xf27f60d1 => 104
	i32 4073602200, ; 245: System.Threading.dll => 0xf2ce3c98 => 121
	i32 4094352644, ; 246: Microsoft.Maui.Essentials.dll => 0xf40add04 => 46
	i32 4099507663, ; 247: System.Drawing.dll => 0xf45985cf => 91
	i32 4100113165, ; 248: System.Private.Uri => 0xf462c30d => 103
	i32 4102112229, ; 249: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 250: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 251: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 37
	i32 4147896353, ; 252: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 106
	i32 4150914736, ; 253: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 254: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 255: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 63
	i32 4213026141, ; 256: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 88
	i32 4271975918, ; 257: Microsoft.Maui.Controls.dll => 0xfea12dee => 43
	i32 4274976490, ; 258: System.Runtime.Numerics => 0xfecef6ea => 111
	i32 4292120959 ; 259: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 63
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [260 x i32] [
	i32 48, ; 0
	i32 120, ; 1
	i32 33, ; 2
	i32 47, ; 3
	i32 109, ; 4
	i32 53, ; 5
	i32 71, ; 6
	i32 30, ; 7
	i32 31, ; 8
	i32 85, ; 9
	i32 78, ; 10
	i32 107, ; 11
	i32 2, ; 12
	i32 30, ; 13
	i32 49, ; 14
	i32 15, ; 15
	i32 60, ; 16
	i32 14, ; 17
	i32 120, ; 18
	i32 96, ; 19
	i32 34, ; 20
	i32 26, ; 21
	i32 82, ; 22
	i32 59, ; 23
	i32 113, ; 24
	i32 125, ; 25
	i32 102, ; 26
	i32 13, ; 27
	i32 7, ; 28
	i32 42, ; 29
	i32 39, ; 30
	i32 21, ; 31
	i32 57, ; 32
	i32 19, ; 33
	i32 117, ; 34
	i32 79, ; 35
	i32 1, ; 36
	i32 122, ; 37
	i32 16, ; 38
	i32 4, ; 39
	i32 110, ; 40
	i32 100, ; 41
	i32 93, ; 42
	i32 25, ; 43
	i32 41, ; 44
	i32 87, ; 45
	i32 103, ; 46
	i32 92, ; 47
	i32 97, ; 48
	i32 83, ; 49
	i32 28, ; 50
	i32 48, ; 51
	i32 60, ; 52
	i32 124, ; 53
	i32 82, ; 54
	i32 70, ; 55
	i32 91, ; 56
	i32 38, ; 57
	i32 3, ; 58
	i32 50, ; 59
	i32 90, ; 60
	i32 94, ; 61
	i32 62, ; 62
	i32 84, ; 63
	i32 75, ; 64
	i32 125, ; 65
	i32 16, ; 66
	i32 22, ; 67
	i32 67, ; 68
	i32 20, ; 69
	i32 18, ; 70
	i32 2, ; 71
	i32 58, ; 72
	i32 77, ; 73
	i32 95, ; 74
	i32 32, ; 75
	i32 70, ; 76
	i32 54, ; 77
	i32 112, ; 78
	i32 0, ; 79
	i32 6, ; 80
	i32 93, ; 81
	i32 51, ; 82
	i32 42, ; 83
	i32 92, ; 84
	i32 10, ; 85
	i32 5, ; 86
	i32 119, ; 87
	i32 25, ; 88
	i32 64, ; 89
	i32 73, ; 90
	i32 56, ; 91
	i32 98, ; 92
	i32 119, ; 93
	i32 114, ; 94
	i32 74, ; 95
	i32 99, ; 96
	i32 115, ; 97
	i32 52, ; 98
	i32 23, ; 99
	i32 1, ; 100
	i32 89, ; 101
	i32 71, ; 102
	i32 39, ; 103
	i32 128, ; 104
	i32 17, ; 105
	i32 59, ; 106
	i32 9, ; 107
	i32 64, ; 108
	i32 75, ; 109
	i32 74, ; 110
	i32 68, ; 111
	i32 116, ; 112
	i32 112, ; 113
	i32 40, ; 114
	i32 29, ; 115
	i32 26, ; 116
	i32 94, ; 117
	i32 108, ; 118
	i32 8, ; 119
	i32 80, ; 120
	i32 104, ; 121
	i32 35, ; 122
	i32 5, ; 123
	i32 62, ; 124
	i32 0, ; 125
	i32 105, ; 126
	i32 61, ; 127
	i32 4, ; 128
	i32 89, ; 129
	i32 114, ; 130
	i32 101, ; 131
	i32 86, ; 132
	i32 81, ; 133
	i32 45, ; 134
	i32 12, ; 135
	i32 41, ; 136
	i32 40, ; 137
	i32 102, ; 138
	i32 76, ; 139
	i32 98, ; 140
	i32 14, ; 141
	i32 36, ; 142
	i32 8, ; 143
	i32 69, ; 144
	i32 18, ; 145
	i32 126, ; 146
	i32 99, ; 147
	i32 123, ; 148
	i32 35, ; 149
	i32 13, ; 150
	i32 10, ; 151
	i32 86, ; 152
	i32 127, ; 153
	i32 43, ; 154
	i32 107, ; 155
	i32 11, ; 156
	i32 78, ; 157
	i32 117, ; 158
	i32 116, ; 159
	i32 20, ; 160
	i32 76, ; 161
	i32 105, ; 162
	i32 56, ; 163
	i32 15, ; 164
	i32 110, ; 165
	i32 124, ; 166
	i32 90, ; 167
	i32 87, ; 168
	i32 111, ; 169
	i32 49, ; 170
	i32 51, ; 171
	i32 21, ; 172
	i32 44, ; 173
	i32 45, ; 174
	i32 72, ; 175
	i32 27, ; 176
	i32 47, ; 177
	i32 6, ; 178
	i32 54, ; 179
	i32 77, ; 180
	i32 19, ; 181
	i32 72, ; 182
	i32 46, ; 183
	i32 126, ; 184
	i32 73, ; 185
	i32 101, ; 186
	i32 85, ; 187
	i32 58, ; 188
	i32 34, ; 189
	i32 65, ; 190
	i32 128, ; 191
	i32 83, ; 192
	i32 12, ; 193
	i32 108, ; 194
	i32 66, ; 195
	i32 121, ; 196
	i32 52, ; 197
	i32 7, ; 198
	i32 100, ; 199
	i32 57, ; 200
	i32 67, ; 201
	i32 24, ; 202
	i32 118, ; 203
	i32 55, ; 204
	i32 127, ; 205
	i32 69, ; 206
	i32 3, ; 207
	i32 37, ; 208
	i32 11, ; 209
	i32 84, ; 210
	i32 129, ; 211
	i32 24, ; 212
	i32 23, ; 213
	i32 118, ; 214
	i32 122, ; 215
	i32 31, ; 216
	i32 95, ; 217
	i32 61, ; 218
	i32 28, ; 219
	i32 66, ; 220
	i32 36, ; 221
	i32 129, ; 222
	i32 33, ; 223
	i32 65, ; 224
	i32 97, ; 225
	i32 88, ; 226
	i32 53, ; 227
	i32 80, ; 228
	i32 81, ; 229
	i32 115, ; 230
	i32 38, ; 231
	i32 109, ; 232
	i32 32, ; 233
	i32 79, ; 234
	i32 55, ; 235
	i32 123, ; 236
	i32 68, ; 237
	i32 50, ; 238
	i32 27, ; 239
	i32 9, ; 240
	i32 96, ; 241
	i32 44, ; 242
	i32 106, ; 243
	i32 104, ; 244
	i32 121, ; 245
	i32 46, ; 246
	i32 91, ; 247
	i32 103, ; 248
	i32 22, ; 249
	i32 17, ; 250
	i32 37, ; 251
	i32 106, ; 252
	i32 29, ; 253
	i32 113, ; 254
	i32 63, ; 255
	i32 88, ; 256
	i32 43, ; 257
	i32 111, ; 258
	i32 63 ; 259
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
