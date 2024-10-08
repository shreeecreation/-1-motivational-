import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';
import 'package:motivational/src/features/home/bloc/quotes_of_the_day/quote_of_the_cubit.dart';

class QuotesOfDayPage extends StatelessWidget {
  const QuotesOfDayPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteOfTheCubit()..getQuoteOfTheDay(),
      child: ScaffoldWrapper(
        appBar: AppBar(
          title: const Text('Quote of the Day'),
          centerTitle: true,
        ),
        body: BlocBuilder<QuoteOfTheCubit, QuoteOfTheDayState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => SizedBox(),
              loading: () => Center(child: CircularProgressIndicator()),
              success: (quote) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Quote content
                      Text(
                        quote.content,
                        textAlign: TextAlign.center,
                        style: AppStyles.text16PxMedium,
                      ),
                      const SizedBox(height: 20),
                      // Author
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '- ${quote.author}',
                          style: AppStyles.text12Px,
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
