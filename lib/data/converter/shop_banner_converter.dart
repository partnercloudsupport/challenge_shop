import 'package:challenge_shop/data/model/my_score_info_model.dart';
import 'package:challenge_shop/data/viewModel/shop_banner_viewmodel.dart';
import 'package:challenge_shop/util/TimeUtil.dart';

class ShopBannerConverter {
  static ShopBannerViewmodel conver(MyScoreInfoModel myScoreInfoModel) {
    ShopBannerViewmodel vm = ShopBannerViewmodel();
    vm.score = myScoreInfoModel.totalPoint;
    if (myScoreInfoModel.pointExpireNotice != null &&
        myScoreInfoModel.pointExpireNotice.visible &&
        myScoreInfoModel.pointExpireNotice.point > 0) {
      vm.pointExpireNotice =
          "有${myScoreInfoModel.pointExpireNotice.point}积分即将在${myScoreInfoModel.pointExpireNotice.date}过期";
    }

    vm.latestExchangeStatus =
        myScoreInfoModel.latestExchangeStatus.map((exchangeStatus) {
      BannerNews bannerNews = BannerNews();
      bannerNews.productName = exchangeStatus.product.title;
      bannerNews.userName = exchangeStatus.user.nickname;
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(exchangeStatus.createTime * 1000);
      if (TimeUtil.isToday(dateTime)) {
        bannerNews.createTime = "${dateTime.hour}:${dateTime.minute}";
      } else {
        bannerNews.createTime = "${dateTime.month}-${dateTime.day}";
      }
      return bannerNews;
    }).toList();

    return vm;
  }
}
