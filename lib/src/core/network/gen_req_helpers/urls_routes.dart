//this dart file contains all urls for requests

class AuthUrls {
  static const String loginUser = "/login";
  static const String registerUser = "/register";
  static const String validateOtp = "/validateOTP";
  static const String generateOtp = "/otp";
}

class QuestionUrls {
  static const String fetchQuestions = "/fetch_questions";
  static const String submitQuestions = "/submit_question";
  static const String fetchResult = "/fetch_score";
}

class SubscriptionUrls {
  static const String subscribePlan = "/subscribe";
  static const String unsubscribePlan = "/unsubscribe";
}

class ProfileUrls {
  static const String resetPassword = "/resetpassword";
  static const String changePassword = "/changepassword";
  static const String updateProfile = "/updateProfile";
  static const String fetchScores = "/fetch_score";
  static const String fetchProfile = "/profile?msisdn=";
}
