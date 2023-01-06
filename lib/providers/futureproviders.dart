import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/news_decode.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/resource/app_url.dart';

final businessnewsprovider = Provider<String>(((ref) => Appurl.businessUrl));
final trendingnewsprovider = Provider<String>(((ref) => Appurl.trendingUrl));
final sportnewsprovider = Provider<String>(((ref) => Appurl.sportUrl));
final healthnewsprovider = Provider<String>(((ref) => Appurl.healthUrl));
final entertainmentnewsprovider =
    Provider<String>(((ref) => Appurl.entertainmentUrl));
final sciencenewsprovider = Provider<String>(((ref) => Appurl.scienceUrl));
final technologynewsprovider =
    Provider<String>(((ref) => Appurl.technologyUrl));

final teslanewsprovider = Provider<String>(((ref) => Appurl.teslaUrl));
final applenewsprovider = Provider<String>(((ref) => Appurl.appleUrl));
final techcrunchnewsprovider = Provider<String>(((ref) => Appurl.techcruchUrl));

///************************************************************/
final bnewsprovider = FutureProvider<newsdecode?>((ref) {
  final apiurl = ref.watch(businessnewsprovider);
  return news(apiurl);
});
final healnewsprovider = FutureProvider<newsdecode?>((ref) {
  final apiurl = ref.watch(healthnewsprovider);
  return news(apiurl);
});
final tnewsprovider = FutureProvider<newsdecode?>((ref) {
  final apiurl = ref.watch(trendingnewsprovider);
  return news(apiurl);
});
final enewsprovider = FutureProvider<newsdecode?>((ref) {
  final apiurl = ref.watch(entertainmentnewsprovider);
  return news(apiurl);
});
final technewsprovider = FutureProvider<newsdecode?>((ref) {
  final apiurl = ref.watch(technologynewsprovider);
  return news(apiurl);
});
final spnewsprovider = FutureProvider<newsdecode?>((ref) {
  final apiurl = ref.watch(sportnewsprovider);
  return news(apiurl);
});
final scnewsprovider = FutureProvider<newsdecode?>((ref) {
  final apiurl = ref.watch(sciencenewsprovider);
  return news(apiurl);
});
final tesnewsprovider = FutureProvider<newsdecode?>((ref) {
  final apiurl = ref.watch(teslanewsprovider);
  return news(apiurl);
});
final appleNewsprovider = FutureProvider<newsdecode?>((ref) {
  final apiurl = ref.watch(applenewsprovider);
  return news(apiurl);
});
final techCruchprovider = FutureProvider<newsdecode?>((ref) {
  final apiurl = ref.watch(techcrunchnewsprovider);
  return news(apiurl);
});
