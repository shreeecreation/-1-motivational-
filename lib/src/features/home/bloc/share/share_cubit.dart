import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motivational/src/features/home/presentation/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

part 'share_state.dart';
part 'share_cubit.freezed.dart';

class ShareCubit extends Cubit<ShareState> {
  ShareCubit() : super(const ShareState.initial());

  Future<void> share(
    ScreenshotController screenshotController,
  ) async {
    try {
      emit(const ShareState.inProgress());
      final tempDir = await getTemporaryDirectory();
      final image = await screenshotController.captureAndSave(tempDir.path);
      if (image != null) {
        emit(ShareState.success(image: image));
      } else {
        emit(const ShareState.error());
      }
    } catch (e) {
      emit(const ShareState.error());
    }
  }
}
