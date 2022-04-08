import 'package:flutter/material.dart';
import 'package:my_app/util/routers.dart';
import 'package:my_app/viewmodel/new_view_model.dart';
import 'package:provider/provider.dart';


void main() {
  //widget ağacının en tepesinde bulunan kısmı haberdar etmek
  runApp(MultiProvider(
    providers: [
      //Değişecek olan verinin nerede olduğunu gösterir
      ChangeNotifierProvider<NewsViewModel>(create: (_) => NewsViewModel()),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey,fontFamily: "RobotoMono",
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.red[900],titleTextStyle:
          const TextStyle(color: Colors.white)
          ),
      ),
      initialRoute: "/",
      onGenerateRoute: AppRouters.onGenerateRoute,
    );
  }
}
