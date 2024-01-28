import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';
import 'package:motivational/src/features/home/bloc/get_random/get_random_quotes_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetRandomQuotesCubit>().getRandomQuotes();
    return ScaffoldWrapper(
      body: Stack(
        children: [
          Container(
            color: AppColors.white,
          ),
          BlocBuilder<GetRandomQuotesCubit, GetRandomQuotesState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: SizedBox.shrink,
                  success: (data, _, hasMoreItems) {
                    return Center(
                      child: Text(data[0].content),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
