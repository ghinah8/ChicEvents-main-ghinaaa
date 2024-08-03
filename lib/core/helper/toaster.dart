import 'package:bot_toast/bot_toast.dart';

class Toaster {
  Toaster._();
  void showLoading() {
    BotToast.showLoading();
  }

  void closeLoading() {
    BotToast.closeAllLoading();
  }

  void showToast(String text) {
    BotToast.showText(text: text);
  }
}
