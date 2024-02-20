



import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sellingportal/data/model/category_model.dart';
import 'package:sellingportal/data/model/product_model.dart';
import 'package:sellingportal/data/model/user_model.dart';
import 'package:sellingportal/logic/cubits/category_product/category_product_cubit.dart';
import 'package:sellingportal/logic/cubits/products/product_cubit.dart';
import 'package:sellingportal/logic/cubits/products/product_upload_cubit.dart';
import 'package:sellingportal/logic/cubits/user/user_cubit.dart';
import 'package:sellingportal/presentation/screens/Auth/loginPage.dart';
import 'package:sellingportal/presentation/screens/Auth/provider/login_provider.dart';
import 'package:sellingportal/presentation/screens/Auth/provider/signup_provider.dart';
import 'package:sellingportal/presentation/screens/Auth/signupPage.dart';
import 'package:sellingportal/presentation/screens/screen/Myitems.dart';
import 'package:sellingportal/presentation/screens/screen/WishList.dart';
import 'package:sellingportal/presentation/screens/screen/category/categoryPage.dart';
import 'package:sellingportal/presentation/screens/screen/category/category_screen.dart';
import 'package:sellingportal/presentation/screens/screen/home/explorePage.dart';
import 'package:sellingportal/presentation/screens/screen/home/homescreen.dart';
import 'package:sellingportal/presentation/screens/screen/home/productPage2.dart';
import 'package:sellingportal/presentation/screens/screen/productPage.dart';
import 'package:sellingportal/presentation/screens/screen/profile/profile_screen.dart';
import 'package:sellingportal/presentation/screens/screen/search_screen.dart';
import 'package:sellingportal/presentation/screens/screen/sellFormScreens/stepperMainPage.dart';
import 'package:sellingportal/presentation/screens/screen/sellPage.dart';
import 'package:sellingportal/presentation/screens/screen/settingsScreen/registrationPage.dart';

import '../presentation/screens/splash/splash_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return CupertinoPageRoute(builder: (context)=>ChangeNotifierProvider(create:(context)=>LoginProvider(context) ,child: LoginPage()));
      case homeScreen.routeName:
        return CupertinoPageRoute(builder: (context)=>homeScreen());
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => SplashScreen());
      case explorePage.routeName:
        return CupertinoPageRoute(builder: (context) => explorePage());
      case productScreen.routeName:
        return CupertinoPageRoute(builder: (context)=>productScreen(productModel: settings.arguments as ProductModel));
      case FormPage.routeName:
        return CupertinoPageRoute(builder: (context)=>BlocProvider(create: (context)=>ProductUploadCubit(),child: FormPage(catId: settings.arguments as String)));
      case sellPage.routeName:
        return CupertinoPageRoute(builder: (context) => sellPage());
      case categoryPage.routeName:
        return CupertinoPageRoute(builder: (context)=>BlocProvider(create: (context)=>CategoryProductCubit(settings.arguments as CategoryModel),child: categoryPage()));
      case ProfileScreen.routeName:
        return CupertinoPageRoute(builder: (context)=>ProfileScreen());
      case signup.routeName:
        return CupertinoPageRoute(builder: (context)=>ChangeNotifierProvider(create:(context)=>(SignupProvider(context)),child: signup()));

      case registration.routeName:
        return CupertinoPageRoute(builder: (context) => registration(userModel: settings.arguments as UserModel));


      case MyWishListScreen.routeName:
        return CupertinoPageRoute(builder: (context) => MyWishListScreen());

      case Items.routeName:
        return CupertinoPageRoute(builder: (context) => Items());
      case SearchScreen.routeName:
        return CupertinoPageRoute(builder: (context) => SearchScreen(productList: settings.arguments as List<ProductModel>,));

      case CategorySelectionPage.routeName:
        return CupertinoPageRoute(builder: (context)=>CategorySelectionPage());
        default:
        return null;
    }
  }
}
