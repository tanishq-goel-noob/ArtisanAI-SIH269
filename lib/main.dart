import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
        scaffoldBackgroundColor: const Color(0xFFF9F5EF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7A4E2D),
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
      backgroundColor: const Color(0xFFF9F5EF),
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
                Container(
                  width: 78,
                  height: 78,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7A4E2D),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Artisan AI',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3E281B),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  tr(language, 'tagline'),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9A6B43),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8D4BC),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.handshake_outlined,
                        size: 42,
                        color: Color(0xFF6D4327),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        tr(language, 'hero'),
                        style: const TextStyle(
                          fontSize: 29,
                          height: 1.15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF3E281B),
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
                      backgroundColor: const Color(0xFF7A4E2D),
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
      backgroundColor: const Color(0xFFF9F5EF),
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
                color: Color(0xFF3E281B),
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
                  color: const Color(0xFFF0E2D3),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: const Color(0xFF7A4E2D),
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
                        color: Color(0xFF3E281B),
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
      backgroundColor: const Color(0xFFF9F5EF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Artisan AI',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF3E281B),
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
                color: Color(0xFF3E281B),
              ),
            ),
            const SizedBox(height: 22),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF7A4E2D),
                    Color(0xFF9B6944),
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
                      foregroundColor: const Color(0xFF7A4E2D),
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
                color: Color(0xFF3E281B),
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
                    onTap: () {},
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
                color: Color(0xFF3E281B),
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
                  color: const Color(0xFFF0E2D3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF7A4E2D),
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
            color: const Color(0xFF9A6B43),
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
      backgroundColor: const Color(0xFFF9F5EF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Artisan AI',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF3E281B),
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
                color: Color(0xFF3E281B),
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
                      color: const Color(0xFFE8D4BC),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Icon(
                      Icons.checkroom,
                      size: 45,
                      color: Color(0xFF7A4E2D),
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
                            color: Color(0xFF7A4E2D),
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
              color: const Color(0xFF7A4E2D),
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
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final ImagePicker _picker = ImagePicker();

  Uint8List? _selectedImage;
  bool _isUploading = false;

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

    final response = await http.post(
      Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/'
        'gemini-3.8-flash:generateContent',
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
- Do not claim a material with certainty if it cannot be identified from the image.
- For uncertain materials, use wording like "Possible material: ...".
- Use very simple and easy English.
- Write the description so that a normal buyer can understand it easily.
- Avoid difficult, fancy, technical, or uncommon English words.
- Use short and clear sentences.
- Keep the description natural and friendly.
- Do not use words like "exquisite", "intricate", "artisan craftsmanship", "earthenware", "rustic", "sophisticated", or other difficult words.
- Prefer common words like "beautiful", "handmade", "clay", "strong", "useful", "simple", and "traditional".
- Keep the description around 2-4 short sentences.
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
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Gemini API error: ${response.statusCode}\n${response.body}',
      );
    }

    final data = jsonDecode(response.body);

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

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
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
                  const Row(
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: Color(0xFF7A4E2D),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'AI Generated Listing',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _resultField(
                    'Product Name',
                    result['productName'] ?? 'Not identified',
                  ),
                  _resultField(
                    'Category',
                    result['category'] ?? 'Not identified',
                  ),
                  _resultField(
                    'Description',
                    result['description'] ?? 'No description generated',
                  ),
                  _resultField(
                    'Materials',
                    (result['materials'] as List?)?.join(', ') ??
                        'Not identified',
                  ),
                  _resultField(
                    'Tags',
                    (result['tags'] as List?)?.join(', ') ??
                        'No tags generated',
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('Confirm Listing'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7A4E2D),
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
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not read AI response: $e'),
        ),
      );
    }
  }

  Widget _resultField(String title, String value) {
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
              color: Color(0xFF7A4E2D),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F5EF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
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
      backgroundColor: const Color(0xFFF7F8FC),

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
            GestureDetector(
              onTap: _pickImage,

              child: Container(
                width: double.infinity,
                height: 280,

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
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 20),

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
