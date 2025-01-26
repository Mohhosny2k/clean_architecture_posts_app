import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_theme.dart';
import 'features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'features/posts/presentation/pages/posts_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [

          BlocProvider(
              create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
              // .. انفذ علطول واجيب الدتا اول ما يشتغل
          BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            title: 'Posts App',
            home: PostsPage()));
  }
}
 //! Features - posts
/*  
اول ما نفتح التطبيق بنعمل ايفينت لل بلوك
+
بلوك بيكلم ال يوزكاس
+
يوزكاس بيكلم الريبو
+
unit: remote data source
no unit : local data source
الريبو بيشوف لو في دتا بيكلم ال ريموت دتا سورس لو مفيش ال لوكل الريموت دتا سورس
+
unit: نفترض في 
اليموت بيبعت ريكوست لل api 
ويستني الريسبونس
____________________
الدتا سورس بتوصل الرسبونس ده و تحوله لدتا مودل 
وترجعه للريبو
____________________
respostiry :list postmodel  convert list post entity
بترجع بوست انتتي ل يوزكاس
 post entity    => usecase
 usecase => bloc
*/

///
///
/// bloc =>  usecase => respostiry => data source => api => model => entity => ui  => bloc
/// 
/// 
/// ///////////////////////////////////////////////////

//prentation => bloc  {event , state}
// Dependency Injection   {getit}
//Ui