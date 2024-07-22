// enum UrlEnvironment { development, production }

// class UrlConfig {
//   /// Determines environment configuration
//   static UrlEnvironment environment = UrlEnvironment.development;

//   /// Base URL based on the supplied [environment]
//   static String baseUrl = _getBaseUrl(environment) + "api/v1/";

//   static const String devBaseUrl = "http://kuepay-001-site4.atempurl.com/";
//   static const String prodBaseUrl = "http://kuepay-001-site4.atempurl.com/";

//   // http://kuepay-001-site4.atempurl.com/api/v1/recruiterauth/sign-up

//   static String _getBaseUrl(UrlEnvironment environment) {
//     switch (environment) {
//       case UrlEnvironment.production:
//         return prodBaseUrl;
//       case UrlEnvironment.development:
//       default:
//         return devBaseUrl;
//     }
//   }

//   // Auth Routes
//   static String recruiterAuth = baseUrl + "recruiterauth/";
//   static String signUp = recruiterAuth + "sign-up";






//   static String signIn = authUrl + "sign-in";
//   static String verifyEmail = authUrl + "verify-email";
//   static String passwordResetOtp = authUrl + "password-reset-otp";
//   static String passwordReset = authUrl + "password-reset";
//   static String verifyEmailOtp = authUrl + "verify-email-otp";
//   static String refresh = authUrl + "refresh";
//   static String deleteAccount = authUrl + "delete-account";








//   // Event Routes
//   static String eventUrl = baseUrl + "events/";
//   static String createEvent = eventUrl + "create";
//   static String clickEvent = eventUrl + "click";
//   static String saveEvent = eventUrl + "save";
//   static String updateEvent = eventUrl + "update";
//   static String deleteEvent = eventUrl + "delete";
//   static String getEvent = eventUrl + "eventId";
//   static String getEvents = baseUrl + "events";
//   static String userSavedEvent = eventUrl + "user-saved-events";
//   static String userClickedEvent = eventUrl + "user-clicked-events";
//   static String getUserCreatedEvents = eventUrl + "user-created-events";
//   static String getUserRegisteredEvents = eventUrl + "user-registered-events";
//   static String getUserRegForEvents = "$eventUrl/users-registered-for-event";
//   static String getUserRegisteredForEvent =
//       "$eventUrl/user-registered-for-event";
//   static String getNumberOfRegisteredUsers =
//       "$eventUrl/totalnumber-of-registered-users-for-event";
//   static String getNumberOfValidatedUsers =
//       "$eventUrl/totalnumber-of-validated-users-for-event";
//   static String getBannerImages = baseUrl + "image";

//   // User Routes
//   static String userUrl = baseUrl + "users/";
//   static String updateProfile = userUrl + "update";
//   static String getProfile = userUrl + "profile";

//   // Event Payment Routes
//   static String registerEvent = eventUrl + "register";
//   static String flutterwaveRoute = baseUrl + "flutterwave/";

//   static String cardFund = flutterwaveRoute + "cardfund";
//   static String processCardFund = flutterwaveRoute + "processcardfund";
//   static String completeCardFund = flutterwaveRoute + "completecardfund";
//   static String generateVirtualAccount = baseUrl + "virtualaccount/generate";

//   // Wallet and Settlement Routes
//   static String getBanks = baseUrl + "bankaccount/get-banks";
//   static String verifyBankAccount = baseUrl + "bankaccount/verify-bankaccount";
//   static String addSettlementAcct = baseUrl + "settlement/add";
//   static String getSettlementAcct = baseUrl + "settlement/useraccount";

//   static String getWallet = baseUrl + "wallet";
//   static String walletWithdraw = baseUrl + "wallet/withdraw";
//   static String walletWithdrawOTP = baseUrl + "wallet/wallet-withdraw-otp";
//   static String confirmWalletWithdrawOTP =
//       baseUrl + "wallet/confirm-wallet-withdraw-otp";

//   // Manual Payment Routes
//   static String manualPaymentRoute = baseUrl + "eventmanualpaymentrequest/";
//   static String requestPayment = manualPaymentRoute + "requestpayment";
//   static String uploadPaymentProof = manualPaymentRoute + "uploadpaymetproof";
//   static String confirmUserPayment = manualPaymentRoute + "comfirmuserpayment";
//   static String getCreatorEventRequests = baseUrl + "getcreatoreventrequests";
//   static String getSinglePaymentRequest = baseUrl + "getrequest";



//    static String paymentRedirecteUrl  = baseUrl + "events/pay-for-event";

//    static String verifyPayment  = baseUrl + "events/verify-payment";


   
// }

enum UrlEnvironment { development, production }

class UrlConfig {
  /// Determines environment configuration
  static UrlEnvironment environment = UrlEnvironment.development;

  /// Base URL based on the supplied [environment]
  static String baseUrl = "${_getBaseUrl(environment)}api/v1/";

  static const String devBaseUrl = "http://kuepay-001-site4.atempurl.com/";
  static const String prodBaseUrl = "http://kuepay-001-site4.atempurl.com/";

  static String _getBaseUrl(UrlEnvironment environment) {
    switch (environment) {
      case UrlEnvironment.production:
        return prodBaseUrl;
      case UrlEnvironment.development:
      default:
        return devBaseUrl;
    }
  }

  // Auth Routes
  static String recruiterAuth = "${baseUrl}recruiterauth/";
  static String signUpRecruiter = "${recruiterAuth}sign-up";
  static String signInRecruiter = "${recruiterAuth}sign-in";

  // Talent Auth Routes
  static String talentAuth = "${baseUrl}talentauth/";
  static String signUpTalent = "${talentAuth}sign-up";
  static String signInTalent = "${talentAuth}sign-in";

  // Job Routes
  static String createJob = "${baseUrl}jobs/create";
  static String updateJob = "${baseUrl}jobs/update";
  static String getJobs = "${baseUrl}jobs";
  static String getJobById = "${baseUrl}jobs/get-by-jobid";
  static String applyJob = "${baseUrl}jobs/apply";
  static String hireJob = "${baseUrl}jobs/hire";
  static String deleteJob = "${baseUrl}jobs/delete";
  static String getAllApplications = "${baseUrl}jobs/allapplication";
  static String getApplicationById = "${baseUrl}jobs/application-by-id";

  // Account Routes
  static String verifyEmail = "${baseUrl}account/verify-email";
  static String passwordResetOtp = "${baseUrl}account/password-reset-otp";
  static String passwordReset = "${baseUrl}account/password-reset";
  static String verifyEmailOtp = "${baseUrl}account/verify-email-otp";
  static String refresh = "${baseUrl}account/refresh";
  static String deleteAccount = "${baseUrl}account/delete-account";
  static String updateAccount = "${baseUrl}account/update";
  static String userProfile = "${baseUrl}account/user-profile";
}

