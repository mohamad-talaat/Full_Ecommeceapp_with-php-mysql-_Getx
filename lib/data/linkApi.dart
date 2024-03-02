class AppLink {
  static const String linkServerName = "http://10.0.2.2/ecommerce";
  static const String linkTest = "$linkServerName/test.php";

  //========================== Image ============================
  static const String imageststatic = "$linkServerName/upload";
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";
// =============================================================

////////////////////////////////////// Auth  //////////////////////////////////////////

  static const String LinkSignUp = "$linkServerName/auth/signup.php";
  static const String LinkLogin = "$linkServerName/auth/signin.php";
  static const String LinkVerfiyCodeSignUp =
      "$linkServerName/auth/verfiycode.php";

  static const String LinkForResendVerfiyCode =
      "$linkServerName/auth/resend.php";

  ////////////////////////////////////// forget password  //////////////////////////////////////////

  static const String LinkCheckEmail =
      "$linkServerName/forgetpassword/checkemail.php";
  static const String LinkResetPassword =
      "$linkServerName/forgetpassword/resetpassword.php";
  static const String Linkverfiycodeforgetpassword =
      "$linkServerName/forgetpassword/verfiycode.php";

  ////////////////////////////////////// Data  //////////////////////////////////////////

  static const String LinkHomeData = "$linkServerName/home.php";
  static const String LinkItemData = "$linkServerName/items/items.php";

  ////////////////////////////////////// favorite  //////////////////////////////////////////

  static const String addfavorite = "$linkServerName/favorite/add.php";
  static const String removefavorite = "$linkServerName/favorite/remove.php";
  static const String viewfavorite = "$linkServerName/favorite/view.php";
  static const String deleteFromMyfavorite =
      "$linkServerName/favorite/deletefrommyfavorite.php"; 
      
      
       ////////////////////////////////////// cart  //////////////////////////////////////////

  static const String addCart = "$linkServerName/cart/add.php";
  static const String removeCart = "$linkServerName/cart/delete.php";
  static const String viewCart  = "$linkServerName/cart/view.php";
  static const String countcart  = "$linkServerName/cart/getcountitems.php";




}

/*  //const String linkServerName2 = "https://waelabohamza.com/coursephp" ;
const String linkServerName = "http://10.0.2.2/noteapp" ;
//const String linkServerName = "http://192.168.1.6/noteapp" ;

 */
