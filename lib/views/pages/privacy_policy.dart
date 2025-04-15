import 'package:dapperz/config.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final aboutUsCtrl = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(builder: (_) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: const BackArrowButton(),
            backgroundColor: aboutUsCtrl.appCtrl.appTheme.whiteColor,
            title: const LatoFontStyle(
              text: "Privacy Policy",
              fontSize: FontSizes.f15,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutUsWidget().commonDescText(
                    "This privacy policy has been compiled to better serve those who are concerned with how their Personal information is being used online. Privacy Policy tells about the information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual in context. Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Personally Identifiable Information in accordance with our website."),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "What personal information do we collect from the people that visit our blog, website or app?",
                    FontWeight.w700,
                    FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "When ordering or registering on our site, as appropriate, you may be asked to enter your name, email address, mailing address, phone number or other details to help you with your experience."),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "We use personal information to provide the services you request. To the extent we use your personal information to market to you, we will provide you the ability to opt-out of such uses. We use your personal information to assist sellers in handling and fulfilling orders, enhancing customer experience, resolve disputes; troubleshoot problems; help promote a safe service; collect money; measure consumer interest in our products and services, inform you about online and offline offers, products, services, and updates; customize and enhance your experience; detect and protect us against error, fraud and other criminal activity; enforce our terms and conditions; and as otherwise described to you at the time of collection."),
                const Space(0, 20),
                //description2 text layout
                AboutUsWidget().commonText("How do we use your information?",
                    FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                //description2 text layout
                AboutUsWidget().commonDescText(
                    "We may use the information we collect from you when you register, make a purchase, sign up for our newsletter, respond to a survey or marketing communication, surf the website, or use certain other site features in the following ways:"),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "- To personalize user’s experience and to allow us to deliver the type of content and product offerings in which you are most interested."),
                AboutUsWidget().commonDescText(
                    "- To improve our website in order to better serve you."),
                AboutUsWidget().commonDescText(
                    "- To allow us to better service you in responding to your customer service requests."),
                AboutUsWidget().commonDescText(
                    "- To ask for ratings and reviews of services or products"),
                AboutUsWidget().commonDescText(
                    "- To follow up with them after correspondence (live chat, email or phone inquiries)"),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "How do we protect visitor information?",
                    FontWeight.w700,
                    FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "Our website is scanned on a regular basis for security holes and known vulnerabilities in order to make your visit to our site as safe as possible. Your personal information is contained behind secured networks and is only accessible by a limited number of persons who have special access rights to such systems, and are required to keep the information confidential. In addition, all sensitive/credit information you supply is encrypted via Secure Socket Layer (SSL) technology. We implement a variety of security measures when a user places an order enters, submits, or accesses their information to maintain the safety of your personal information. All transactions are processed through a gateway provider and are not stored or processed on our servers."),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "Do we use ‘cookies’?", FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                //description2 text layout
                AboutUsWidget().commonDescText(
                    "Yes. Cookies are small files that a site or its service provider transfers to your computer’s hard drive through your Web browser (if you allow) that enables the site’s or service provider’s systems to recognize your browser and capture and remember certain information. For instance, we use cookies to help us remember and process the items in your shopping cart. They are also used to help us understand your preferences based on previous or current site activity, which enables us to provide you with improved services. We also use cookies to help us compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future."),
                const Space(0, 20),
                AboutUsWidget().commonDescText("We use cookies to:"),
                AboutUsWidget().commonDescText(
                    "- Help remember and process the items in the shopping cart."),
                AboutUsWidget().commonDescText(
                    "- Understand and save user’s preferences for future visits."),
                AboutUsWidget()
                    .commonDescText("- Keep track of advertisements."),
                AboutUsWidget().commonDescText(
                    "- Compile aggregate data about site traffic and site interactions in order to offer better site experiences and tools in the future. We may also use trusted third-party services that track this information on our behalf."),
                AboutUsWidget().commonDescText(
                    "You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies. You do this through your browser (like Internet Explorer) settings. Each browser is a little different, so look at your browser’s Help menu to learn the correct way to modify your cookies. If you disable cookies off, some features will be disabled It won’t affect the user’s experience that make your site experience more efficient and some of our services will not function properly."),
                AboutUsWidget()
                    .commonDescText("However, you can still place orders."),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "Third-party disclosure", FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information unless we provide users with advance notice. This does not include website hosting partners and other parties who assist us in operating our website, conducting our business, or serving our users, so long as those parties agree to keep this information confidential."),
                AboutUsWidget().commonDescText(
                    "We may also release information when it’s release is appropriate to comply with the law, enforce our site policies, or protect ours or others’ rights, property or safety. However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses."),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "Third-party links", FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "Occasionally, at our discretion, we may include or offer third-party products or services on our website. These third-party sites have separate and independent privacy policies. We therefore have no responsibility or liability for the content and activities of these linked sites. Nonetheless, we seek to protect the integrity of our site and welcome any feedback about these sites."),
                const Space(0, 20),
                AboutUsWidget()
                    .commonText("Google", FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "Google’s advertising requirements can be summed up by Google’s Advertising Principles. They are put in place to provide a positive experience for users. https://support.google.com/adwordspolicy/answer/1316548?hl=en We have not enabled Google AdSense on our site but we may do so in the future."),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "How do I get Updates on privacy Policy?",
                    FontWeight.w700,
                    FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "Users can visit our site anonymously. Once this privacy policy is created, we will add a link to it on our home page or as a minimum on the first significant page after entering our website. Our Privacy Policy link includes the word ‘Privacy’ and can be easily be found on the page specified above."),
                const Space(0, 5),
                AboutUsWidget().commonDescText(
                    "Users will be notified of any privacy policy changes:"),
                AboutUsWidget().commonDescText("• On our Privacy Policy Page"),
                const Space(0, 5),
                AboutUsWidget().commonDescText(
                    "Users are able to change their personal information:"),
                AboutUsWidget()
                    .commonDescText("• By logging in to their account"),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "How does our site handle do not track signals?",
                    FontWeight.w700,
                    FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "We honor do not track signals and do not track, plant cookies, or use advertising when a Do Not Track (DNT) browser mechanism is in place."),
                AboutUsWidget().commonDescText(
                    "We collect your email address in order to:"),
                AboutUsWidget().commonDescText(
                    "• Send information, respond to inquiries, and/or other requests or questions."),
                AboutUsWidget().commonDescText(
                    "• Process orders and to send information and updates pertaining to orders."),
                AboutUsWidget().commonDescText(
                    "• We may also send you additional information related to your product and/or service."),
                AboutUsWidget().commonDescText(
                    "• Market to our mailing list or continue to send emails to our clients after the original transact"),
                const Space(0, 5),
                AboutUsWidget().commonDescText(
                    "If at any time you would like to unsubscribe from receiving future emails, you can email us at info@dapperz.in  and we will promptly remove you from ALL correspondence."),
                const Space(0, 20),
                AboutUsWidget()
                    .commonText("Contact Us :", FontWeight.w700, FontSizes.f16),
                AboutUsWidget().commonDescText("info@dapperz.in"),
                AboutUsWidget().commonDescText("+91 990 990 6954"),
                AboutUsWidget().commonDescText("+91 990 990 6964"),
                const Space(0, 30),
              ],
            ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          ),
        ),
      );
    });
  }
}
