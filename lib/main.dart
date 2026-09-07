import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const ArtisanAI());
}

class ArtisanAI extends StatefulWidget {
  const ArtisanAI({super.key});

  @override
  State<ArtisanAI> createState() => _ArtisanAIState();
}

class _ArtisanAIState extends State<ArtisanAI> {
  String language = 'English';

  void changeLanguage(String value) {
    setState(() => language = value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artisan AI',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F4EC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF283D63),
          primary: const Color(0xFF283D63),
          secondary: const Color(0xFFB85C38),
          surface: const Color(0xFFFFFDF8),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F4EC),
          foregroundColor: Color(0xFF1B2438),
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Color(0xFF1B2438),
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFFFFFDF8),
          elevation: 0,
          margin: EdgeInsets.zero,
          surfaceTintColor: Colors.transparent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFFFFDF8),
          contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
          labelStyle: const TextStyle(color: Color(0xFF667085)),
          hintStyle: const TextStyle(color: Color(0xFF98A2B3)),
          prefixIconColor: const Color(0xFF283D63),
          suffixIconColor: const Color(0xFF667085),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Color(0xFFE3DED4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Color(0xFFE3DED4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Color(0xFF283D63), width: 1.5),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF283D63),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF283D63),
            side: const BorderSide(color: Color(0xFFCBD3DF)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFFB85C38),
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color(0xFFFFFDF8),
          indicatorColor: Color(0xFFE8E1D4),
          elevation: 8,
          height: 72,
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color(0xFF1B2438),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
        ),
      ),
      home: WelcomeScreen(
        language: language,
        onLanguageChanged: changeLanguage,
      ),
    );
  }
}

const languages = [
  'English',
  'Hindi',
  'Tamil',
  'Telugu',
  'Malayalam',
  'Kannada',
  'Bengali',
  'Marathi',
  'Gujarati',
  'Punjabi',
  'Odia',
  'Assamese',
];

final Map<String, Map<String, String>> translations = {
  'English': {
    'tagline': 'From Craft to Market',
    'hero': 'Your craft deserves to be seen.',
    'heroSub': 'Create professional product listings, discover fair prices, and connect with buyers — all in one place.',
    'start': 'Get Started',
    'language': 'Language',
    'choose': 'How would you like to continue?',
    'artisan': "I'm an Artisan",
    'artisanSub': 'Create listings, get pricing guidance and reach more buyers.',
    'buyer': "I'm a Buyer",
    'buyerSub': 'Discover authentic handmade products and connect directly with artisans.',
    'goodMorning': 'Good morning! 👋',
    'today': 'What would you like to do today?',
    'newProduct': 'Create a Product Listing',
    'newProductSub': 'Upload one photo and let AI help you create the product details.',
    'addProduct': 'Add Product',
    'tools': 'Your Tools',
    'pricing': 'Pricing Recommendation',
    'pricingSub': 'Get a fair price based on your costs and market trends.',
    'market': 'Market Insights',
    'marketSub': 'See what is popular and what buyers are looking for.',
    'overview': 'Your Overview',
    'products': 'Products',
    'views': 'Views',
    'orders': 'Orders',
    'home': 'Home',
    'productTab': 'Products',
    'orderTab': 'Orders',
    'profile': 'Profile',
    'buyerGreeting': 'Good morning! 👋',
    'buyerQuestion': 'Looking for something special?',
    'search': 'Search handmade products...',
    'categories': 'Explore Categories',
    'textiles': 'Textiles',
    'pottery': 'Pottery',
    'jewellery': 'Jewellery',
    'woodcraft': 'Woodcraft',
    'featured': 'Featured Crafts',
    'textileProduct': 'Handwoven Textile',
    'traditional': 'Traditional handmade craft',
  },
  'Hindi': {
    'tagline': 'हुनर से बाज़ार तक',
    'hero': 'आपका हुनर दुनिया तक पहुँचना चाहिए।',
    'heroSub': 'अपने उत्पादों की प्रोफेशनल लिस्टिंग बनाएं, सही कीमत जानें और नए खरीदारों से जुड़ें — एक ही जगह।',
    'start': 'शुरू करें',
    'language': 'भाषा',
    'choose': 'आप कैसे आगे बढ़ना चाहते हैं?',
    'artisan': 'मैं एक Artisan हूँ',
    'artisanSub': 'प्रोडक्ट लिस्ट करें, कीमत की सलाह पाएं और खरीदारों तक पहुँचें।',
    'buyer': 'मैं Buyer हूँ',
    'buyerSub': 'हाथ से बने असली उत्पाद खोजें और सीधे Artisans से जुड़ें।',
    'goodMorning': 'सुप्रभात! 👋',
    'today': 'आज आप क्या करना चाहते हैं?',
    'newProduct': 'Product Listing बनाएं',
    'newProductSub': 'एक फोटो अपलोड करें और AI की मदद से प्रोडक्ट की जानकारी तैयार करें।',
    'addProduct': 'Product जोड़ें',
    'tools': 'आपके Tools',
    'pricing': 'Price Recommendation',
    'pricingSub': 'आपकी लागत और market trends के आधार पर सही price range पाएं।',
    'market': 'Market Insights',
    'marketSub': 'जानें क्या popular है और buyers क्या खोज रहे हैं।',
    'overview': 'आपका Overview',
    'products': 'Products',
    'views': 'Views',
    'orders': 'Orders',
    'home': 'Home',
    'productTab': 'Products',
    'orderTab': 'Orders',
    'profile': 'Profile',
    'buyerGreeting': 'सुप्रभात! 👋',
    'buyerQuestion': 'कुछ खास ढूंढ रहे हैं?',
    'search': 'Handmade products खोजें...',
    'categories': 'Categories देखें',
    'textiles': 'Textiles',
    'pottery': 'Pottery',
    'jewellery': 'Jewellery',
    'woodcraft': 'Woodcraft',
    'featured': 'Featured Crafts',
    'textileProduct': 'Handwoven Textile',
    'traditional': 'Traditional handmade craft',
  },
  'Tamil': {
    'tagline': 'கைவினையிலிருந்து சந்தை வரை',
    'hero': 'உங்கள் கைவினை உலகம் முழுவதும் சென்றடையட்டும்.',
    'heroSub': 'தயாரிப்பு பட்டியலை உருவாக்கி, சரியான விலையை அறிந்து, வாங்குபவர்களுடன் இணையுங்கள்.',
    'start': 'தொடங்குங்கள்',
    'language': 'மொழி',
    'choose': 'எப்படி தொடர விரும்புகிறீர்கள்?',
    'artisan': 'நான் ஒரு கைவினைஞர்',
    'artisanSub': 'தயாரிப்புகளை பட்டியலிட்டு வாங்குபவர்களை சென்றடையுங்கள்.',
    'buyer': 'நான் வாங்குபவர்',
    'buyerSub': 'கைவினைப் பொருட்களை கண்டுபிடித்து கைவினைஞர்களுடன் இணையுங்கள்.',
    'goodMorning': 'காலை வணக்கம்! 👋',
    'today': 'இன்று என்ன செய்ய விரும்புகிறீர்கள்?',
    'newProduct': 'தயாரிப்பு பட்டியல் உருவாக்கவும்',
    'newProductSub': 'ஒரு புகைப்படத்தை பதிவேற்றி AI மூலம் விவரங்களை உருவாக்குங்கள்.',
    'addProduct': 'தயாரிப்பை சேர்க்கவும்',
    'tools': 'உங்கள் கருவிகள்',
    'pricing': 'விலை பரிந்துரை',
    'pricingSub': 'உங்கள் செலவு மற்றும் சந்தை போக்குகளின் அடிப்படையில் விலையைப் பெறுங்கள்.',
    'market': 'சந்தை தகவல்கள்',
    'marketSub': 'எது பிரபலமானது என்பதை அறிந்து கொள்ளுங்கள்.',
    'overview': 'உங்கள் Overview',
    'products': 'Products',
    'views': 'Views',
    'orders': 'Orders',
    'home': 'Home',
    'productTab': 'Products',
    'orderTab': 'Orders',
    'profile': 'Profile',
    'buyerGreeting': 'காலை வணக்கம்! 👋',
    'buyerQuestion': 'ஏதாவது சிறப்பானதை தேடுகிறீர்களா?',
    'search': 'கைவினைப் பொருட்களை தேடுங்கள்...',
    'categories': 'வகைகளை ஆராயுங்கள்',
    'textiles': 'Textiles',
    'pottery': 'Pottery',
    'jewellery': 'Jewellery',
    'woodcraft': 'Woodcraft',
    'featured': 'Featured Crafts',
    'textileProduct': 'கைத்தறி துணி',
    'traditional': 'பாரம்பரிய கைவினைப் பொருள்',
  },
  'Telugu': {
    'tagline': 'కళ నుండి మార్కెట్ వరకు',
    'hero': 'మీ కళ ప్రపంచానికి కనిపించాలి.',
    'heroSub': 'ఉత్పత్తి జాబితాలను రూపొందించండి, సరైన ధరను తెలుసుకోండి మరియు కొనుగోలుదారులతో కనెక్ట్ అవ్వండి.',
    'start': 'ప్రారంభించండి',
    'language': 'భాష',
    'choose': 'మీరు ఎలా కొనసాగాలనుకుంటున్నారు?',
    'artisan': 'నేను కళాకారుడిని',
    'artisanSub': 'ఉత్పత్తులను జాబితా చేసి మరింత మంది కొనుగోలుదారులను చేరుకోండి.',
    'buyer': 'నేను కొనుగోలుదారుని',
    'buyerSub': 'చేతితో తయారు చేసిన ఉత్పత్తులను కనుగొని కళాకారులతో నేరుగా కనెక్ట్ అవ్వండి.',
    'goodMorning': 'శుభోదయం! 👋',
    'today': 'ఈ రోజు మీరు ఏమి చేయాలనుకుంటున్నారు?',
    'newProduct': 'ఉత్పత్తి జాబితాను రూపొందించండి',
    'newProductSub': 'ఒక ఫోటోను అప్‌లోడ్ చేసి AI సహాయంతో వివరాలను రూపొందించండి.',
    'addProduct': 'ఉత్పత్తిని జోడించండి',
    'tools': 'మీ Tools',
    'pricing': 'ధర సిఫార్సు',
    'pricingSub': 'మీ ఖర్చులు మరియు మార్కెట్ ట్రెండ్స్ ఆధారంగా సరైన ధరను పొందండి.',
    'market': 'మార్కెట్ సమాచారం',
    'marketSub': 'ఏ ఉత్పత్తులు ప్రాచుర్యంలో ఉన్నాయో చూడండి.',
    'overview': 'మీ Overview',
    'products': 'Products',
    'views': 'Views',
    'orders': 'Orders',
    'home': 'Home',
    'productTab': 'Products',
    'orderTab': 'Orders',
    'profile': 'Profile',
    'buyerGreeting': 'శుభోదయం! 👋',
    'buyerQuestion': 'ఏదైనా ప్రత్యేకమైనది వెతుకుతున్నారా?',
    'search': 'చేతితో తయారు చేసిన ఉత్పత్తులను వెతకండి...',
    'categories': 'వర్గాలను చూడండి',
    'textiles': 'Textiles',
    'pottery': 'Pottery',
    'jewellery': 'Jewellery',
    'woodcraft': 'Woodcraft',
    'featured': 'Featured Crafts',
    'textileProduct': 'చేతితో నేసిన వస్త్రం',
    'traditional': 'సాంప్రదాయ చేతిపని',
  },
  'Malayalam': {
    'tagline': 'കരകൗശലത്തിൽ നിന്ന് വിപണിയിലേക്ക്',
    'hero': 'നിങ്ങളുടെ കരകൗശലത്തിന് ലോകം കാണട്ടെ.',
    'heroSub': 'ഉൽപ്പന്ന ലിസ്റ്റിംഗ് തയ്യാറാക്കുക, ന്യായമായ വില കണ്ടെത്തുക, വാങ്ങുന്നവരുമായി ബന്ധപ്പെടുക.',
    'start': 'തുടങ്ങാം',
    'language': 'ഭാഷ',
    'choose': 'എങ്ങനെ തുടരാൻ ആഗ്രഹിക്കുന്നു?',
    'artisan': 'ഞാൻ ഒരു കരകൗശല വിദഗ്ധനാണ്',
    'artisanSub': 'ഉൽപ്പന്നങ്ങൾ ലിസ്റ്റ് ചെയ്ത് കൂടുതൽ വാങ്ങുന്നവരിലേക്ക് എത്തുക.',
    'buyer': 'ഞാൻ ഒരു വാങ്ങുന്നയാളാണ്',
    'buyerSub': 'കൈകൊണ്ട് നിർമ്മിച്ച ഉൽപ്പന്നങ്ങൾ കണ്ടെത്തി കരകൗശല വിദഗ്ധരുമായി ബന്ധപ്പെടുക.',
    'goodMorning': 'സുപ്രഭാതം! 👋',
    'today': 'ഇന്ന് എന്താണ് ചെയ്യേണ്ടത്?',
    'newProduct': 'ഉൽപ്പന്ന ലിസ്റ്റിംഗ് തയ്യാറാക്കുക',
    'newProductSub': 'ഒരു ഫോട്ടോ അപ്‌ലോഡ് ചെയ്ത് AI സഹായത്തോടെ വിവരങ്ങൾ തയ്യാറാക്കുക.',
    'addProduct': 'ഉൽപ്പന്നം ചേർക്കുക',
    'tools': 'നിങ്ങളുടെ Tools',
    'pricing': 'വില നിർദ്ദേശം',
    'pricingSub': 'നിങ്ങളുടെ ചെലവും വിപണി ട്രെൻഡുകളും അടിസ്ഥാനമാക്കി വില നേടുക.',
    'market': 'വിപണി വിവരങ്ങൾ',
    'marketSub': 'ജനപ്രിയമായ ഉൽപ്പന്നങ്ങൾ കാണുക.',
    'overview': 'നിങ്ങളുടെ Overview',
    'products': 'Products',
    'views': 'Views',
    'orders': 'Orders',
    'home': 'Home',
    'productTab': 'Products',
    'orderTab': 'Orders',
    'profile': 'Profile',
    'buyerGreeting': 'സുപ്രഭാതം! 👋',
    'buyerQuestion': 'പ്രത്യേകമായി എന്തെങ്കിലും അന്വേഷിക്കുകയാണോ?',
    'search': 'കൈകൊണ്ട് നിർമ്മിച്ച ഉൽപ്പന്നങ്ങൾ തിരയുക...',
    'categories': 'വിഭാഗങ്ങൾ',
    'textiles': 'Textiles',
    'pottery': 'Pottery',
    'jewellery': 'Jewellery',
    'woodcraft': 'Woodcraft',
    'featured': 'Featured Crafts',
    'textileProduct': 'കൈത്തറി തുണി',
    'traditional': 'പരമ്പരാഗത കരകൗശല ഉൽപ്പന്നം',
  },
};

String tr(String language, String key) {
  return translations[language]?[key] ??
      translations['English']![key] ??
      key;
}

class LanguageButton extends StatelessWidget {
  final String language;
  final ValueChanged<String> onChanged;

  const LanguageButton({
    super.key,
    required this.language,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'Language',
      onSelected: onChanged,
      itemBuilder: (context) => languages
          .map(
            (lang) => PopupMenuItem<String>(
              value: lang,
              child: Row(
                children: [
                  if (lang == language)
                    const Icon(Icons.check, size: 18)
                  else
                    const SizedBox(width: 18),
                  const SizedBox(width: 8),
                  Text(lang),
                ],
              ),
            ),
          )
          .toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language, size: 18),
            const SizedBox(width: 5),
            Text(language),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final String language;
  final ValueChanged<String> onLanguageChanged;

  const WelcomeScreen({
    super.key,
    required this.language,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4EC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerRight,
                  child: LanguageButton(
                    language: language,
                    onChanged: onLanguageChanged,
                  ),
                ),
                const SizedBox(height: 28),
                // People-in-Harmony logo — blue is kept as the site's existing primary color.
                const HarmonyLogo(size: 155),
                const SizedBox(height: 25),
                const Text(
                  'Artisan AI',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1B2438),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  tr(language, 'tagline'),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFB85C38),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6D5C3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.handshake_outlined,
                        size: 42,
                        color: Color(0xFF1F3152),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        tr(language, 'hero'),
                        style: const TextStyle(
                          fontSize: 29,
                          height: 1.15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1B2438),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        tr(language, 'heroSub'),
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Colors.brown.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RoleScreen(
                            language: language,
                            onLanguageChanged: onLanguageChanged,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF283D63),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: Text(
                      '${tr(language, 'start')}  →',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  'Made for artisans across India',
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoleScreen extends StatelessWidget {
  final String language;
  final ValueChanged<String> onLanguageChanged;

  const RoleScreen({
    super.key,
    required this.language,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4EC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: LanguageButton(
              language: language,
              onChanged: onLanguageChanged,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              tr(language, 'choose'),
              style: const TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1B2438),
              ),
            ),
            const SizedBox(height: 35),
            RoleCard(
              icon: Icons.handyman_outlined,
              title: tr(language, 'artisan'),
              subtitle: tr(language, 'artisanSub'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ArtisanDashboard(
                      language: language,
                      onLanguageChanged: onLanguageChanged,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 18),
            RoleCard(
              icon: Icons.shopping_bag_outlined,
              title: tr(language, 'buyer'),
              subtitle: tr(language, 'buyerSub'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BuyerDashboard(
                      language: language,
                      onLanguageChanged: onLanguageChanged,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Row(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E1D4),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: const Color(0xFF283D63),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B2438),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.35,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
                color: Colors.black38,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArtisanDashboard extends StatefulWidget {
  final String language;
  final ValueChanged<String> onLanguageChanged;

  const ArtisanDashboard({
    super.key,
    required this.language,
    required this.onLanguageChanged,
  });

  @override
  State<ArtisanDashboard> createState() => _ArtisanDashboardState();
}

class _ArtisanDashboardState extends State<ArtisanDashboard> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l = widget.language;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4EC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Artisan AI',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF1B2438),
          ),
        ),
        actions: [
          LanguageButton(
            language: l,
            onChanged: widget.onLanguageChanged,
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr(l, 'goodMorning'),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              tr(l, 'today'),
              style: const TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1B2438),
              ),
            ),
            const SizedBox(height: 22),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF283D63),
                    Color(0xFF3C5278),
                  ],
                ),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 27,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'AI Smart Catalog',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    tr(l, 'newProduct'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      height: 1.15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    tr(l, 'newProductSub'),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                onPressed: () {
                    Navigator.push(
                    context,
                  MaterialPageRoute(
                  builder: (context) => const AddProductScreen(),
                  ), 
                );
              },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF283D63),
                      elevation: 0,
                    ),
                    child: Text(
                      tr(l, 'addProduct'),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Text(
              tr(l, 'tools'),
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1B2438),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: SmallFeatureCard(
                    icon: Icons.currency_rupee_rounded,
                    title: tr(l, 'pricing'),
                    subtitle: tr(l, 'pricingSub'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PricingScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: SmallFeatureCard(
                    icon: Icons.trending_up_rounded,
                    title: tr(l, 'market'),
                    subtitle: tr(l, 'marketSub'),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              tr(l, 'overview'),
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1B2438),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: OverviewCard(
                    number: '12',
                    title: tr(l, 'products'),
                    icon: Icons.inventory_2_outlined,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OverviewCard(
                    number: '48',
                    title: tr(l, 'views'),
                    icon: Icons.visibility_outlined,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OverviewCard(
                    number: '5',
                    title: tr(l, 'orders'),
                    icon: Icons.shopping_bag_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        backgroundColor: Colors.white,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: tr(l, 'home'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.inventory_2_outlined),
            label: tr(l, 'productTab'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.shopping_bag_outlined),
            label: tr(l, 'orderTab'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            label: tr(l, 'profile'),
          ),
        ],
      ),
    );
  }
}

class SmallFeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SmallFeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(21),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(21),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E1D4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF283D63),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OverviewCard extends StatelessWidget {
  final String number;
  final String title;
  final IconData icon;

  const OverviewCard({
    super.key,
    required this.number,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 22,
            color: const Color(0xFFB85C38),
          ),
          const SizedBox(height: 8),
          Text(
            number,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}

class BuyerDashboard extends StatelessWidget {
  final String language;
  final ValueChanged<String> onLanguageChanged;

  const BuyerDashboard({
    super.key,
    required this.language,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l = language;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4EC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Artisan AI',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF1B2438),
          ),
        ),
        actions: [
          LanguageButton(
            language: l,
            onChanged: onLanguageChanged,
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr(l, 'buyerGreeting'),
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 5),
            Text(
              tr(l, 'buyerQuestion'),
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1B2438),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: tr(l, 'search'),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              tr(l, 'categories'),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                CategoryCard(icon: Icons.checkroom, title: tr(l, 'textiles')),
                CategoryCard(icon: Icons.local_florist_outlined, title: tr(l, 'pottery')),
                CategoryCard(icon: Icons.diamond_outlined, title: tr(l, 'jewellery')),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              tr(l, 'featured'),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6D5C3),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Icon(
                      Icons.checkroom,
                      size: 45,
                      color: Color(0xFF283D63),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr(l, 'textileProduct'),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          tr(l, 'traditional'),
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 9),
                        const Text(
                          '₹950',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF283D63),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 9),
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 27,
              color: const Color(0xFF283D63),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  final materialController = TextEditingController();
  final labourController = TextEditingController();
  final timeController = TextEditingController();
  final quantityController = TextEditingController();
  


  double? totalCost;
  double? minPrice;
  double? maxPrice;

Future<void> calculatePrice() async {
  final materialCost =
      double.tryParse(materialController.text) ?? 0;

  final labourCost =
      double.tryParse(labourController.text) ?? 0;

  final timeTaken =
      double.tryParse(timeController.text) ?? 0;

  if (materialCost <= 0 ||
      labourCost <= 0 ||
      timeTaken <= 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Please enter valid material, labour cost and time.',
        ),
      ),
    );
    return;
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                'AI is finding a fair price...',
              ),
            ),
          ],
        ),
      );
    },
  );

  try {
    const apiKey =
        String.fromEnvironment('GEMINI_API_KEY');

    final models = [
      'gemini-3.8-flash',
      'gemini-3.7-flash',
      'gemini-3.6-flash',
      'gemini-3.5-flash',
    ];

    http.Response? successfulResponse;

    for (final model in models) {
      try {
        final response = await http.post(
          Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/'
            '$model:generateContent',
          ),
          headers: {
            'Content-Type': 'application/json',
            'x-goog-api-key': apiKey,
          },
          body: jsonEncode({
            'contents': [
              {
                'parts': [
                  {
                    'text': '''
You are an AI pricing assistant for marginalized artisans.

Calculate a fair selling price using:

Material Cost: ₹$materialCost
Labour Cost: ₹$labourCost
Time Taken: $timeTaken hours

Rules:
- Consider material cost.
- Consider labour cost.firebase --version
- Consider the time and effort of the artisan.
- Recommend a reasonable profit.
- Do not give an extremely high or unrealistic price.
- Give a price RANGE, not one exact price.
- Do not invent market data.
- Use simple English.

Return ONLY valid JSON:

{
  "minimumPrice": 900,
  "maximumPrice": 1100,
  "reason": "This price covers your costs and gives a reasonable profit for your time and effort."
}
'''
                  }
                ]
              }
            ]
          }),
        );

        if (response.statusCode == 200) {
          successfulResponse = response;
          break;
        }

        // Try next model for temporary/server errors.
        if (![429, 500, 502, 503, 504]
            .contains(response.statusCode)) {
          throw Exception(
            'Gemini API error: ${response.statusCode}',
          );
        }
      } catch (e) {
        // Try the next model.
        continue;
      }
    }

    // Close loading dialog
    if (context.mounted) {
      Navigator.pop(context);
    }

    if (successfulResponse == null) {
      throw Exception(
        'All AI pricing models are currently unavailable. '
        'Please try again.',
      );
    }

    final data = jsonDecode(successfulResponse.body);

    String aiText =
        data['candidates'][0]['content']['parts'][0]['text'];

    aiText = aiText.trim();

    // Remove ```json ... ``` if Gemini adds it.
    if (aiText.startsWith('```')) {
      aiText = aiText
          .replaceFirst(
            RegExp(r'^```json\s*'),
            '',
          )
          .replaceFirst(
            RegExp(r'^```\s*'),
            '',
          )
          .replaceFirst(
            RegExp(r'\s*```$'),
            '',
          );
    }

    final aiResult = jsonDecode(aiText);

    final aiMinimum =
        (aiResult['minimumPrice'] as num).toDouble();

    final aiMaximum =
        (aiResult['maximumPrice'] as num).toDouble();

    final reason =
        aiResult['reason'] ??
        'This price provides a reasonable return for your work.';

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'AI Price Recommendation 🤖',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                'Recommended Selling Price:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                '₹${aiMinimum.toStringAsFixed(0)} – '
                '₹${aiMaximum.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF283D63),
                ),
              ),

              const SizedBox(height: 16),

              Text(reason),

              const SizedBox(height: 20),

              const Text(
                'Are you satisfied with this price?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                _askArtisanPrice();
              },
              child: const Text(
                'No, I want to set my price',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                setState(() {
                  totalCost =
                      materialCost + labourCost;
                  minPrice = aiMinimum;
                  maxPrice = aiMaximum;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF283D63),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Yes, I am satisfied',
              ),
            ),
          ],
        );
      },
    );
  } catch (e) {
    if (context.mounted) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'AI pricing error: $e',
          ),
        ),
      );
    }
  }
}

void _askArtisanPrice() {
  final customPriceController = TextEditingController();

  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text(
          'Enter Your Price',
        ),
        content: TextField(
          controller: customPriceController,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          decoration: const InputDecoration(
            labelText: 'Your Selling Price',
            prefixText: '₹ ',
            hintText: 'Example: 1200',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final price = double.tryParse(
                customPriceController.text,
              );

              if (price == null || price <= 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Please enter a valid price.',
                    ),
                  ),
                );
                return;
              }

              Navigator.pop(dialogContext);

              final materialCost =
                  double.tryParse(
                        materialController.text,
                      ) ??
                      0;

              final labourCost =
                  double.tryParse(
                        labourController.text,
                      ) ??
                      0;

              setState(() {
                totalCost =
                    materialCost + labourCost;

                // Artisan's own price becomes final price
                minPrice = price;
                maxPrice = price;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF283D63),
              foregroundColor: Colors.white,
            ),
            child: const Text('Use My Price'),
          ),
        ],
      );
    },
  );
}

  @override
  void dispose() {
    materialController.dispose();
    labourController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4EC),
      appBar: AppBar(
        title: const Text('Pricing Recommendation'),
        backgroundColor: const Color(0xFFF7F4EC),
        foregroundColor: const Color(0xFF1B2438),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find a Fair Price 💰',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1B2438),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Enter your production costs and get a suggested selling price.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 28),

            _priceInput(
              controller: materialController,
              label: 'Material Cost',
              hint: 'Example: ₹200',
              icon: Icons.inventory_2_outlined,
            ),

            const SizedBox(height: 16),

            _priceInput(
              controller: labourController,
              label: 'Labour Cost',
              hint: 'Example: ₹150',
              icon: Icons.person_outline,
            ),

            const SizedBox(height: 16),

DropdownButtonFormField<double>(
  value: timeController.text.isEmpty
      ? null
      : double.tryParse(timeController.text),
  decoration: InputDecoration(
    labelText: 'Time Taken',
    prefixIcon: const Icon(
      Icons.access_time,
      color: Color(0xFF283D63),
    ),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
  ),
  items: const [
    DropdownMenuItem(
      value: 0.5,
      child: Text('30 minutes'),
    ),
    DropdownMenuItem(
      value: 1,
      child: Text('1 hour'),
    ),
    DropdownMenuItem(
      value: 2,
      child: Text('2 hours'),
    ),
    DropdownMenuItem(
      value: 3,
      child: Text('3 hours'),
    ),
    DropdownMenuItem(
      value: 4,
      child: Text('4 hours'),
    ),
    DropdownMenuItem(
      value: 5,
      child: Text('5 hours'),
    ),
    DropdownMenuItem(
      value: 6,
      child: Text('6 hours'),
    ),
    DropdownMenuItem(
      value: 8,
      child: Text('8 hours'),
    ),
    DropdownMenuItem(
      value: 10,
      child: Text('10 hours'),
    ),
    DropdownMenuItem(
      value: 12,
      child: Text('12 hours'),
    ),
  ],
  onChanged: (value) {
    if (value != null) {
      timeController.text = value.toString();
    }
  },
),

const SizedBox(height: 16),

_priceInput(
  controller: quantityController,
  label: 'Quantity',
  hint: 'Example: 5 pieces',
  icon: Icons.inventory_2_outlined,
),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: calculatePrice,
                icon: const Icon(Icons.calculate_outlined),
                label: const Text(
                  'Calculate Fair Price',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF283D63),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            if (totalCost != null) ...[
              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommended Price',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF283D63),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      '₹${minPrice!.toStringAsFixed(0)} – ₹${maxPrice!.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1B2438),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Production Cost: ₹${totalCost!.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'This range covers your production cost and provides a reasonable profit margin.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _priceInput({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF283D63),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final ImagePicker _picker = ImagePicker();
  final Map<String, String> artisanMemory = {};

  Uint8List? _selectedImage;
  final productNameController = TextEditingController();
  final categoryController = TextEditingController();
  final materialController = TextEditingController();
  final tagsController = TextEditingController();
  final descriptionController = TextEditingController();
  final colorController = TextEditingController();
  final craftController = TextEditingController();
  final storyController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();
  bool _isUploading = false;
  bool _listingConfirmed = false;
  String _confirmedDescription = '';

  Future<void> _speakDescription() async {
  final text = descriptionController.text.trim();

  if (text.isEmpty) return;

  await flutterTts.stop();
  await flutterTts.speak(text);
}

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return;

    final bytes = await image.readAsBytes();

    setState(() {
      _selectedImage = bytes;
    });
    
  }
  Widget _inputField({
  required TextEditingController controller,
  required String label,
  required String hint,
  int maxLines = 1,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF7F4EC),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Future<void> _generateListing() async {
  if (_selectedImage == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please upload a product photo first.'),
      ),
    );
    return;
  }

  setState(() {
    _isUploading = true;
  });

  try {
    const apiKey = String.fromEnvironment('GEMINI_API_KEY');

    if (apiKey.isEmpty) {
      throw Exception('Gemini API key not found.');
    }

    final base64Image = base64Encode(_selectedImage!);

    // Automatic fallback models
    final models = [
      'gemini-3.8-flash',
      'gemini-3.6-flash',
      'gemini-3.5-flash',
      'gemini-2.5-flash',
    ];

    http.Response? successfulResponse;
    String? lastError;

    for (final model in models) {
      try {
        final response = await http
            .post(
              Uri.parse(
                'https://generativelanguage.googleapis.com/v1beta/models/'
                '$model:generateContent',
              ),
              headers: {
                'Content-Type': 'application/json',
                'x-goog-api-key': apiKey,
              },
              body: jsonEncode({
                'contents': [
                  {
                    'parts': [
                      {
                        'text': '''
You are an AI assistant for Indian artisans.

Analyze this handmade product image and create a marketplace-ready product listing.

Return ONLY valid JSON in this exact format:

{
  "productName": "...",
  "category": "...",
  "description": "...",
  "materials": ["...", "..."],
  "tags": ["...", "..."]
}

Important:
- Use very simple and easy English.
- Write the description so a normal buyer can understand it easily.
- Use short and clear sentences.
- Keep the description natural and friendly.
- Avoid difficult, fancy, technical, or uncommon English words.
- Keep the description around 2-4 short sentences.
- Do not claim a material with certainty if it cannot be identified from the image.
- For uncertain materials, use wording like "Possible material: ...".
- Focus on handmade/artisan context.
- Do not invent a specific region or craft tradition unless visually supported.
''',
                      },
                      {
                        'inline_data': {
                          'mime_type': 'image/jpeg',
                          'data': base64Image,
                        },
                      },
                    ],
                  },
                ],
              }),
            )
            .timeout(const Duration(seconds: 20));

        if (response.statusCode == 200) {
          successfulResponse = response;
          break;
        }

        lastError = '$model returned ${response.statusCode}';

        // Small delay before trying the next model
        await Future.delayed(const Duration(seconds: 1));
      } catch (e) {
        lastError = '$model failed: $e';

        // Try the next model automatically
        await Future.delayed(const Duration(seconds: 1));
      }
    }

    if (successfulResponse == null) {
      throw Exception(
        'All AI models are temporarily unavailable. Last error: $lastError',
      );
    }

    final data = jsonDecode(successfulResponse.body);
    final text = data['candidates'][0]['content']['parts'][0]['text'];

    setState(() {
      _isUploading = false;
    });

    _showAIResult(text);
  } catch (e) {
    setState(() {
      _isUploading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('AI error: $e'),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}

void _showAIResult(String text) {
  try {
    String cleanText = text.trim();

    if (cleanText.startsWith('```')) {
      cleanText = cleanText
          .replaceFirst(RegExp(r'^```json\s*'), '')
          .replaceFirst(RegExp(r'^```\s*'), '')
          .replaceFirst(RegExp(r'\s*```$'), '');
    }

final result = jsonDecode(cleanText);

// Load AI-generated values into editable fields
productNameController.text =
    result['productName'] ?? '';

materialController.text =
    (result['materials'] as List?)?.join(', ') ?? '';

colorController.text =
    result['colour'] ?? '';

craftController.text =
    result['craftTechnique'] ?? '';

storyController.text =
    result['description'] ?? '';

String selectedLanguage = 'English';

String trResult(String key) {
  final lang = selectedLanguage;

  const uiTranslations = {
    'English': {
      'aiListing': 'AI Generated Listing',
      'language': 'Language',
      'productName': 'Product Name',
      'category': 'Category',
      'description': 'Description',
      'materials': 'Materials',
      'tags': 'Tags',
      'confirm': 'Confirm Listing',
    },
    'Hindi': {
      'aiListing': 'AI द्वारा बनाई गई लिस्टिंग',
      'language': 'भाषा',
      'productName': 'उत्पाद का नाम',
      'category': 'श्रेणी',
      'description': 'विवरण',
      'materials': 'सामग्री',
      'tags': 'टैग',
      'confirm': 'लिस्टिंग की पुष्टि करें',
    },
    'Tamil': {
  'aiListing': 'AI உருவாக்கிய பட்டியல்',
  'language': 'மொழி',
  'productName': 'தயாரிப்பு பெயர்',
  'category': 'வகை',
  'description': 'விளக்கம்',
  'materials': 'பொருட்கள்',
  'tags': 'குறிச்சொற்கள்',
  'confirm': 'பட்டியலை உறுதிப்படுத்தவும்',
},
'Telugu': {
  'aiListing': 'AI రూపొందించిన జాబితా',
  'language': 'భాష',
  'productName': 'ఉత్పత్తి పేరు',
  'category': 'వర్గం',
  'description': 'వివరణ',
  'materials': 'పదార్థాలు',
  'tags': 'ట్యాగ్‌లు',
  'confirm': 'జాబితాను నిర్ధారించండి',
},
'Malayalam': {
  'aiListing': 'AI തയ്യാറാക്കിയ ലിസ്റ്റിംഗ്',
  'language': 'ഭാഷ',
  'productName': 'ഉൽപ്പന്നത്തിന്റെ പേര്',
  'category': 'വിഭാഗം',
  'description': 'വിവരണം',
  'materials': 'സാമഗ്രികൾ',
  'tags': 'ടാഗുകൾ',
  'confirm': 'ലിസ്റ്റിംഗ് സ്ഥിരീകരിക്കുക',
},
'Kannada': {
  'aiListing': 'AI ರಚಿಸಿದ ಪಟ್ಟಿ',
  'language': 'ಭಾಷೆ',
  'productName': 'ಉತ್ಪನ್ನದ ಹೆಸರು',
  'category': 'ವರ್ಗ',
  'description': 'ವಿವರಣೆ',
  'materials': 'ವಸ್ತುಗಳು',
  'tags': 'ಟ್ಯಾಗ್‌ಗಳು',
  'confirm': 'ಪಟ್ಟಿಯನ್ನು ದೃಢೀಕರಿಸಿ',
},
'Bengali': {
  'aiListing': 'AI তৈরি করা তালিকা',
  'language': 'ভাষা',
  'productName': 'পণ্যের নাম',
  'category': 'বিভাগ',
  'description': 'বিবরণ',
  'materials': 'উপকরণ',
  'tags': 'ট্যাগ',
  'confirm': 'তালিকা নিশ্চিত করুন',
},
'Marathi': {
  'aiListing': 'AI द्वारे तयार केलेली सूची',
  'language': 'भाषा',
  'productName': 'उत्पादनाचे नाव',
  'category': 'श्रेणी',
  'description': 'वर्णन',
  'materials': 'साहित्य',
  'tags': 'टॅग',
  'confirm': 'सूचीची पुष्टी करा',
},
'Gujarati': {
  'aiListing': 'AI દ્વારા બનાવેલી લિસ્ટિંગ',
  'language': 'ભાષા',
  'productName': 'ઉત્પાદનનું નામ',
  'category': 'શ્રેણી',
  'description': 'વર્ણન',
  'materials': 'સામગ્રી',
  'tags': 'ટૅગ્સ',
  'confirm': 'લિસ્ટિંગની પુષ્ટિ કરો',
},
'Punjabi': {
  'aiListing': 'AI ਦੁਆਰਾ ਬਣਾਈ ਗਈ ਲਿਸਟਿੰਗ',
  'language': 'ਭਾਸ਼ਾ',
  'productName': 'ਉਤਪਾਦ ਦਾ ਨਾਮ',
  'category': 'ਸ਼੍ਰੇਣੀ',
  'description': 'ਵੇਰਵਾ',
  'materials': 'ਸਮੱਗਰੀ',
  'tags': 'ਟੈਗ',
  'confirm': 'ਲਿਸਟਿੰਗ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ',
},
'Odia': {
  'aiListing': 'AI ଦ୍ୱାରା ତିଆରି ତାଲିକା',
  'language': 'ଭାଷା',
  'productName': 'ଉତ୍ପାଦର ନାମ',
  'category': 'ବର୍ଗ',
  'description': 'ବର୍ଣ୍ଣନା',
  'materials': 'ସାମଗ୍ରୀ',
  'tags': 'ଟ୍ୟାଗ୍',
  'confirm': 'ତାଲିକା ନିଶ୍ଚିତ କରନ୍ତୁ',
},
'Assamese': {
  'aiListing': 'AI দ্বাৰা সৃষ্টি কৰা তালিকা',
  'language': 'ভাষা',
  'productName': 'উৎপাদনৰ নাম',
  'category': 'শ্ৰেণী',
  'description': 'বিৱৰণ',
  'materials': 'সামগ্ৰী',
  'tags': 'টেগ',
  'confirm': 'তালিকা নিশ্চিত কৰক',
},
  };

  return uiTranslations[lang]?[key] ??
      uiTranslations['English']![key]!;
}

descriptionController.text =
    result['description'] ?? '';
categoryController.text =
    result['category'] ?? '';
materialController.text =
    (result['materials'] as List?)?.join(', ') ?? '';

String currentDescription =
    result['description'] ?? 'No description generated';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
Future<void> translateWholeResult(String language) async {
  if (language == 'English') {
    setModalState(() {
      productNameController.text =
          result['productName'] ?? '';

      categoryController.text =
          result['category'] ?? '';

      descriptionController.text =
          result['description'] ?? '';

      materialController.text =
          (result['materials'] as List?)?.join(', ') ?? '';

      tagsController.text =
          (result['tags'] as List?)?.join(', ') ?? '';
    });

    return;
  }

  setModalState(() {
    productNameController.text = 'Translating...';
    categoryController.text = 'Translating...';
    descriptionController.text = 'Translating...';
    materialController.text = 'Translating...';
    tagsController.text = 'Translating...';
  });

  try {
    const apiKey =
        String.fromEnvironment('GEMINI_API_KEY');

    final models = [
      'gemini-3.8-flash',
      'gemini-3.7-flash',
      'gemini-3.6-flash',
      'gemini-3.5-flash',
      'gemini-2.5-flash',
    ];

    http.Response? response;
    String? lastError;

    for (final model in models) {
      try {
        final candidateResponse = await http.post(
          Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/'
            '$model:generateContent',
          ),
          headers: {
            'Content-Type': 'application/json',
            'x-goog-api-key': apiKey,
          },
          body: jsonEncode({
            'contents': [
              {
                'parts': [
                  {
                    'text': '''
Translate the following artisan product listing into $language.

Return ONLY valid JSON.

Do not change the meaning.
Do not add information.
Do not remove information.

Translate all text fields naturally and simply.

Return exactly this structure:

{
  "productName": "...",
  "category": "...",
  "description": "...",
  "materials": ["...", "..."],
  "tags": ["...", "..."]
}

Original product listing:

{
  "productName": "${result['productName'] ?? ''}",
  "category": "${result['category'] ?? ''}",
  "description": "${result['description'] ?? ''}",
  "materials": ${jsonEncode(result['materials'] ?? [])},
  "tags": ${jsonEncode(result['tags'] ?? [])}
}
'''
                  }
                ]
              }
            ]
          }),
        );

        if (candidateResponse.statusCode == 200) {
          response = candidateResponse;
          break;
        }

        lastError =
            '${candidateResponse.statusCode}: ${candidateResponse.body}';

        if (candidateResponse.statusCode == 429 ||
            candidateResponse.statusCode == 500 ||
            candidateResponse.statusCode == 502 ||
            candidateResponse.statusCode == 503 ||
            candidateResponse.statusCode == 504) {
          await Future.delayed(
            const Duration(seconds: 1),
          );
          continue;
        }

        // Try next model for model-related errors
        continue;
      } catch (e) {
        lastError = e.toString();
      }
    }

    if (response == null) {
      throw Exception(
        'Translation failed. $lastError',
      );
    }

    final data = jsonDecode(response.body);

    String translatedText =
        data['candidates'][0]['content']['parts'][0]['text'];

    translatedText = translatedText.trim();

    if (translatedText.startsWith('```')) {
      translatedText = translatedText
          .replaceFirst(RegExp(r'^```json\s*'), '')
          .replaceFirst(RegExp(r'^```\s*'), '')
          .replaceFirst(RegExp(r'\s*```$'), '');
    }

    final translated = jsonDecode(translatedText);

    setModalState(() {
      productNameController.text =
          translated['productName'] ?? '';

      categoryController.text =
          translated['category'] ?? '';

      descriptionController.text =
          translated['description'] ?? '';

      materialController.text =
          (translated['materials'] as List?)?.join(', ') ?? '';

      tagsController.text =
          (translated['tags'] as List?)?.join(', ') ?? '';
    });
  } catch (e) {
    setModalState(() {
      productNameController.text =
          result['productName'] ?? '';

      categoryController.text =
          result['category'] ?? '';

      descriptionController.text =
          result['description'] ?? '';

      materialController.text =
          (result['materials'] as List?)?.join(', ') ?? '';

      tagsController.text =
          (result['tags'] as List?)?.join(', ') ?? '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Translation error: $e',
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}

            return Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          color: Color(0xFF283D63),
                        ),
                        SizedBox(width: 10),
                        Text(
                          trResult('aiListing'),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Language selector
                    Row(
                      children: [
                        const Icon(
                          Icons.language,
                          color: Color(0xFF283D63),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${trResult('language')}:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),

                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: selectedLanguage,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                            items: const [
                              'English',
                              'Hindi',
                              'Tamil',
                              'Telugu',
                              'Malayalam',
                              'Kannada',
                              'Bengali',
                              'Marathi',
                              'Gujarati',
                              'Punjabi',
                              'Odia',
                              'Assamese',
                            ].map((language) {
                              return DropdownMenuItem(
                                value: language,
                                child: Text(language),
                              );
                            }).toList(),
                            onChanged: (language) {
                              if (language == null) return;

                              setModalState(() {
                                selectedLanguage = language;
                              });

                              translateWholeResult(language);
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    _editableResultField(
                      title: trResult('productName'),
                      controller: productNameController,
                    ),

                    _editableResultField(
                      title: trResult('category'),
                      controller: categoryController,
                    ),

                    _editableResultField(
                      title: trResult('description'),
                      controller: descriptionController,
                      maxLines: 4,
                    ),

                    _editableResultField(
                      title: trResult('materials'),
                      controller: materialController,
                    ),

                    _editableResultField(
                      title: trResult('tags'),
                      controller: tagsController,
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _confirmedDescription = descriptionController.text;
                            _listingConfirmed = true;
                          });

  Navigator.pop(sheetContext);
},
                        icon: const Icon(Icons.check),
                        label: Text(trResult('confirm')),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF283D63),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Could not read AI response: $e'),
      ),
    );
  }
}

  Widget _editableResultField({
  required String title,
  required TextEditingController controller,
  int maxLines = 1,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF283D63),
          ),
        ),

        const SizedBox(height: 6),

        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF7F4EC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Create your product listing',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Upload one photo and let AI help you create the product details.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 28),

            // PHOTO SECTION
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),
                  child: _selectedImage == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                size: 42,
                                color: Colors.blue,
                              ),
                            ),

                            const SizedBox(height: 18),

                            const Text(
                              'Upload Product Photo',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            const Text(
                              'Tap here to choose a photo',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.memory(
                            _selectedImage!,
                            width: 320,
                            height: 320,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ),

            const SizedBox(height: 20),

                        if (_listingConfirmed) ...[
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.brown.shade100,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Confirmed Product Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF283D63),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      _confirmedDescription,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // CHANGE PHOTO BUTTON
            if (_selectedImage != null)
              SizedBox(
                width: double.infinity,

                child: OutlinedButton.icon(
                  onPressed: _pickImage,

                  icon: const Icon(Icons.refresh),

                  label: const Text(
                    'Change Photo',
                  ),

                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 24),

            // AI GENERATE BUTTON
            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: _isUploading
                    ? null
                    : _generateListing,

                icon: _isUploading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(
                        Icons.auto_awesome,
                      ),

                label: Text(
                  _isUploading
                      ? 'Analyzing Product...'
                      : 'Generate AI Listing',
                ),

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                  ),

                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // AI INFO
            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
              ),

              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Icon(
                    Icons.auto_awesome,
                    color: Colors.blue,
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      'AI will analyze your product photo and suggest its name, category, description, materials and tags.',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HarmonyLogo extends StatelessWidget {
  final double size;

  const HarmonyLogo({
    super.key,
    this.size = 155,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size * 0.78,
      child: CustomPaint(
        painter: _HarmonyLogoPainter(),
      ),
    );
  }
}

class _HarmonyLogoPainter extends CustomPainter {
  // Keep the exact blue used throughout the current website.
  static const blue = Color(0xFF283D63);
  static const terracotta = Color(0xFFC96B3C);
  static const leaf = Color(0xFF5C806F);
  static const accent = Color(0xFFC96B3C);

  @override
  void paint(Canvas canvas, Size size) {
    final sx = size.width / 155;
    final sy = size.height / 121;
    canvas.save();
    canvas.scale(sx, sy);

    final fill = Paint()..style = PaintingStyle.fill;

    // Left person's head.
    fill.color = terracotta;
    canvas.drawCircle(const Offset(35, 22), 13, fill);

    // Right person's head — same blue as the website.
    fill.color = blue;
    canvas.drawCircle(const Offset(120, 22), 13, fill);

    // Left person / artisan.
    fill.color = terracotta;
    final left = Path()
      ..moveTo(25, 39)
      ..cubicTo(8, 43, 7, 61, 15, 76)
      ..cubicTo(23, 91, 43, 99, 60, 94)
      ..cubicTo(69, 91, 79, 84, 89, 76)
      ..lineTo(80, 65)
      ..cubicTo(69, 73, 61, 82, 51, 84)
      ..cubicTo(40, 86, 31, 81, 26, 73)
      ..cubicTo(21, 65, 25, 56, 34, 52)
      ..cubicTo(39, 50, 44, 51, 48, 55)
      ..lineTo(65, 72)
      ..lineTo(76, 62)
      ..lineTo(56, 43)
      ..cubicTo(48, 35, 36, 35, 25, 39)
      ..close();
    canvas.drawPath(left, fill);

    // Right person / buyer — same blue as the site's primary buttons and icon.
    fill.color = blue;
    final right = Path()
      ..moveTo(130, 39)
      ..cubicTo(147, 43, 148, 61, 140, 76)
      ..cubicTo(132, 91, 112, 99, 95, 94)
      ..cubicTo(86, 91, 76, 84, 66, 76)
      ..lineTo(75, 65)
      ..cubicTo(86, 73, 94, 82, 104, 84)
      ..cubicTo(115, 86, 124, 81, 129, 73)
      ..cubicTo(134, 65, 130, 56, 121, 52)
      ..cubicTo(116, 50, 111, 51, 107, 55)
      ..lineTo(90, 72)
      ..lineTo(79, 62)
      ..lineTo(99, 43)
      ..cubicTo(107, 35, 119, 35, 130, 39)
      ..close();
    canvas.drawPath(right, fill);

    // Shared-growth sprout in the centre.
    fill.color = leaf;

    final stem = Paint()
      ..color = leaf
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      const Offset(77.5, 75),
      const Offset(77.5, 57),
      stem,
    );

    final leftLeaf = Path()
      ..moveTo(76, 61)
      ..cubicTo(67, 57, 64, 51, 64, 45)
      ..cubicTo(72, 46, 77, 51, 77, 58)
      ..close();
    canvas.drawPath(leftLeaf, fill);

    final rightLeaf = Path()
      ..moveTo(79, 61)
      ..cubicTo(88, 57, 91, 51, 91, 45)
      ..cubicTo(83, 46, 78, 51, 78, 58)
      ..close();
    canvas.drawPath(rightLeaf, fill);

    // Small sparkle = AI, using the same warm accent as the left figure.
    fill.color = accent;
    final sparkle = Path()
      ..moveTo(77.5, 4)
      ..lineTo(80.5, 11)
      ..lineTo(88, 14)
      ..lineTo(80.5, 17)
      ..lineTo(77.5, 24)
      ..lineTo(74.5, 17)
      ..lineTo(67, 14)
      ..lineTo(74.5, 11)
      ..close();
    canvas.drawPath(sparkle, fill);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
