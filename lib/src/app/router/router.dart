// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kisaan_station/src/app/router/auth_guard.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint("going to: ${route.settings.name}");
  }
}

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/language',
      page: ChooseLanguageRoute.page,
    ),
    AutoRoute(page: RegistrationRoute.page),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: NoInternetRoute.page),
    CustomRoute(
        page: LandingRoute.page,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 1000),
    AutoRoute(path: '/signIn', page: SignInRoute.page),
    AutoRoute(path: '/signUp', page: SignUpRoute.page),
    AutoRoute(page: WebRoute.page),
    AutoRoute(
        initial: true,
        guards: [AuthGuard()],
        page: KisaanHomeRoute.page,
        children: [
          AutoRoute(path: '', page: HomeRoute.page),
          AutoRoute(path: '', page: StationRoute.page),
          AutoRoute(path: '', page: BazarRoute.page),
          AutoRoute(path: '', page: FarmListRoute.page),
          AutoRoute(path: '', page: GyanRoute.page),
        ]),
    AutoRoute(
        guards: [AuthGuard()],
        page: SellerRoute.page,
        children: [
          AutoRoute(
            path: '',
            page: SellerHomeRoute.page,
          ),
          AutoRoute(path: 'SellerProfile', page: SellerProfileRoute.page),
          AutoRoute(path: '', page: MySellerServicesRoute.page),
          AutoRoute(
              path: 'sellerListing',
              page: SellerListingRoute.page,
              children: [
                AutoRoute(path: 'sellerListing', page: SellerListingRoute.page),
              ]),
          AutoRoute(
              path: 'sellerOrder',
              page: SellerOrderRoute.page,
              children: [
                AutoRoute(path: 'sellerOrder', page: SellerOrderRoute.page),
              ]),
          AutoRoute(path: '', page: SellerAccountRoute.page),
          AutoRoute(path: 'SellerProfile', page: SellerProfileRoute.page),
        ]),
    AutoRoute(page: MyFarmNetworkRoute.page, path: "/myFarmNetwork"),

    AutoRoute(path: '/aboutOrder', page: AboutOrderRoute.page),
    AutoRoute(path: '/sellersubmitPage', page: SellerSubmitRoute.page),
    AutoRoute(path: '/sellersubmitPage', page: SellerInactiveRoute.page),
    AutoRoute(
        path: '/uploadsellerservices', page: UploadDroneSprayFormRoute.page),
    AutoRoute(path: '/uploadtransport', page: UploadLogisticsFormRoute.page),
    AutoRoute(path: "/statusPage", page: SellerStatusRoute.page),
    AutoRoute(path: '/completeorder', page: SellerOrderCompleteRoute.page),
    AutoRoute(
        path: '/sellerstations', page: SellerselectKisaanStationListRoute.page),
    AutoRoute(path: '/orderDone', page: OrderSubmitRoute.page),
    AutoRoute(path: '/signUp', page: SignUpRoute.page),
    AutoRoute(path: '/otpPage', page: OTPRoute.page),
    AutoRoute(path: '/agriNews', page: AgriNewsRoute.page),
    AutoRoute(path: '/newsroute', page: NewsRoute.page),
    AutoRoute(path: '/profile', page: ProfileRoute.page),
    AutoRoute(path: '/fileImagePreview', page: MuiltiFileImageRoute.page),
    AutoRoute(path: '/urlImagePreview', page: MuiltiUrlImageRoute.page),
    AutoRoute(path: '/fullVideoPlayer', page: FullVideoPlayerRoute.page),
    AutoRoute(path: '/fullYoutubeScreen', page: FullYoutubePlayerRoute.page),
    AutoRoute(path: '/agriNewsDetailPage', page: AgriDetailedNewsRoute.page),
    AutoRoute(path: '/sellerVerification', page: SellerVericationRoute.page),
    AutoRoute(path: '/viewdetails', page: ListingDetailsRoute.page),
    AutoRoute(path: '/buyDetailPage', page: BuyDetailRoute.page),
    AutoRoute(path: '/rentDetailPage', page: RentDetailRoute.page),
    AutoRoute(path: '/selectRentingPage', page: SelectRentingProductRoute.page),
    AutoRoute(path: '/selectSellingPage', page: SelectSellingProductRoute.page),
    AutoRoute(path: '/sellingItem', page: SellingItemRoute.page),
    AutoRoute(path: '/rentingItemPage', page: RentItemRoute.page),
    AutoRoute(path: '/searchPage', page: SearchRoute.page),
    AutoRoute(path: '/createPostPage', page: CreatePostRoute.page),
    AutoRoute(path: '/othersProfilePage', page: OtherProfileRoute.page),
    AutoRoute(path: '/UserBlockPagedList', page: UserBlockRoutedList.page),
    AutoRoute(path: '/weatherDetailedPage', page: WeatherDetailedRoute.page),
    AutoRoute(path: '/careerPage', page: CareerRoute.page),
    AutoRoute(path: '/invitePage', page: InviteFriendRoute.page),
    AutoRoute(path: '/kycPage', page: KycRoute.page),
    AutoRoute(path: '/personalDetailsPage', page: PersonalDetailsRoute.page),
    AutoRoute(path: '/farmDetailsPage', page: FarmDetailsRoute.page),
    AutoRoute(path: '/cropDetailsPage', page: CropDetailsRoute.page),
    // AutoRoute(page: '/farmDetai')
    AutoRoute(path: '/expenseDetailsPage', page: ExpenseDetailRoute.page),
    AutoRoute(path: '/notificationPage', page: NotificationRoute.page),
    AutoRoute(path: '/editProfilePage', page: EditProfileRoute.page),
    AutoRoute(path: '/postDetailPage', page: PostDetailRoute.page),
    AutoRoute(path: '/commentPage', page: CommentRoute.page),
    AutoRoute(path: '/replyPage', page: ReplyRoute.page),
    AutoRoute(path: '/suggestedUsers', page: SuggestedUserRoute.page),
    AutoRoute(path: '/followerPage', page: UserFollowersRoute.page),
    AutoRoute(path: '/inshotlikePage', page: InshotLikeDisplayRoute.page),
    AutoRoute(path: '/inAppWebView', page: InAppViewRoute.page),
    AutoRoute(path: '/settingPage', page: SettingsRoute.page),
    AutoRoute(path: '/accountPrivacy', page: AccountPrivacyRoute.page),
    AutoRoute(path: '/mandiRate', page: MandiBhavRoute.page),
    AutoRoute(path: '/nearbyMandiListPage', page: NearByMarketListRoute.page),
    AutoRoute(
        path: '/nearbyMandiListPage', page: CommodityPriceGridViewRoute.page),
    AutoRoute(path: '/marketGridPage', page: CommodityMarketViewRoute.page),
    AutoRoute(path: '/addNewAddressPage', page: AddNewAddressRoute.page),
    AutoRoute(path: '/selectAddressPage', page: SelectAddressRoute.page),
    AutoRoute(path: '/MapPage', page: MapRoute.page),
    AutoRoute(path: '/bazarSearchPage', page: BazarSearchRoute.page),
    AutoRoute(path: '/myProductPage', page: MyProductListDrawerRoute.page),
    AutoRoute(path: '/droneSprayingPage', page: DroneSprayingRoute.page),
    AutoRoute(path: '/transportationService', page: LogisticsServiceRoute.page),
    AutoRoute(
        path: '/requestDroneSprayFormPage',
        page: RequestDroneSprayFormRoute.page),
    AutoRoute(path: '/successBookingPage', page: BookingSuccessRoute.page),
    AutoRoute(path: '/bookingStatus', page: BookingStatusRoute.page),
    AutoRoute(path: '/bookingDetailsPage', page: BookingDetailsRoute.page),
    AutoRoute(path: '/myOrderPage', page: MyOrderRoute.page),
    AutoRoute(path: '/editSellItemPage', page: EditSellingItemRoute.page),
    AutoRoute(path: '/editRentPage', page: EditRentRoute.page),
    AutoRoute(
        path: '/stationPartnerFormPage', page: StationPatnerFormRoute.page),
    AutoRoute(
        path: '/addAddressStationPartnerPage',
        page: AddAddressStationPartnerRoute.page),
    AutoRoute(
        path: '/droneSprayingServiceForm',
        page: DroneSprayingServiceFormRoute.page),
    AutoRoute(
        path: '/myStationSellCategories',
        page: MyStationSellCategoriesRoute.page),
    AutoRoute(
        path: '/successDroneSprayingPage',
        page: SuccessDroneSprayingRoute.page),
    AutoRoute(
        path: '/selectKisaanStationListPage',
        page: SelectKisaanStationListRoute.page),
    AutoRoute(path: '/addFarmPage', page: AddFarmRoute.page),
    AutoRoute(path: '/chooseFarmPage', page: ChooseFarmLocationRoute.page),
    AutoRoute(path: '/editFarmPage', page: EditFarmRoute.page),
    AutoRoute(path: '/farmCropDetailPage', page: FarmCropDetailRoute.page),
    AutoRoute(path: '/farmDetailPage', page: FarmRoute.page),
    AutoRoute(path: '/farmMapView', page: FarmMapViewRoute.page),
    AutoRoute(path: '/cropReportRoute', page: CropReportRoute.page),
    AutoRoute(path: '/DownloadsPage', page: DownloadsRoute.page),
    AutoRoute(path: '/singleOrder', page: SellerSingleOrderDetailsRoute.page),
    AutoRoute(path: '/historyOrder', page: SellerHistoryOrderDetailsRoute.page),
    AutoRoute(
        path: '/chooseLogisticLocation',
        page: ChooseLogisticLocationRoute.page),
    AutoRoute(path: '/chooseDcLocation', page: ChooseDCLocationRoute.page),
    AutoRoute(path: '/postImagePreviewer', page: PostImagePreviewerRoute.page),
    AutoRoute(
        path: '/fullScreenPostVideoPlayer',
        page: FullScreenPostVideoPlayerRoute.page),
    AutoRoute(path: '/diseaseDetection', page: DiseaseDetectionRoute.page),
    AutoRoute(path: '/selectFarm', page: SelectFarmRoute.page),
  ];
}
