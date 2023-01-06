class Appurl {
  static const String _apikey = "bd15f686c9ee4b1490ca80a9706e5d24";

  static String trendingUrl =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=$_apikey";
  static String businessUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=$_apikey";
  static String healthUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=$_apikey";
  static String entertainmentUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=$_apikey";
  static String technologyUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=$_apikey";
  static String sportUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=$_apikey";
  static String scienceUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=$_apikey";

  ///*******************************************************************************************/
  static String teslaUrl =
      "https://newsapi.org/v2/everything?q=tesla&apiKey=$_apikey";
  static String appleUrl =
      "https://newsapi.org/v2/everything?q=apple&from=2022-12-07&to=2022-12-07&sortBy=popularity&apiKey=$_apikey";
  static String techcruchUrl =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$_apikey";
}
