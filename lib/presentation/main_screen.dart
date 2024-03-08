import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/main_screen_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<MainScreenCubit>().changeColor(),
      onLongPress: () => context.read<MainScreenCubit>().changeTextSize(),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: TextWidget(),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return Center(
          child: Text(
            'Hello there',
            style: TextStyle(
              fontSize: state.textSize,
              color: state.color,
            ),
          ),
        );
      },
    );
  }
}
