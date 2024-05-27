// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:furnix_store/bloc/auth/auth.bloc.dart';
// import 'package:furnix_store/views/screens/home/home_page.dart';
// import 'package:furnix_store/views/screens/on_boarding/pages/on_boarding_1.dart';
// import 'package:furnix_store/utils/constants/route_names.dart';
// import 'package:go_router/go_router.dart';

// class ManageLogin extends StatelessWidget {
//   const ManageLogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print('chekc');
//     context.read<AuthBloc>().add(CheckLoginEvent());
//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         if (state is Authenticated) {
//           print('if case');
//           return HomePage(
//             uid: state.uid,
//           );
//           //  context.goNamed(Go.home,);
//         } else {
//           print('i am in else case');
//           return OnBoarding1();
//           //  context.goNamed(Go.onboarding);
//         }
//       },
//     );
//   }
// }
