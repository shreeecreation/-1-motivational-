import 'package:flutter/material.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';

import '../domain/constant/painter_constant.dart';

class PainterPage extends StatelessWidget {
  const PainterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text("Choose background"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Plain",
              style: AppStyles.text20PxMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: PainterConstatnt.painterConstant.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Card(
                        elevation: 0.8,
                        color: PainterConstatnt.painterConstant[index],
                        child: const SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
