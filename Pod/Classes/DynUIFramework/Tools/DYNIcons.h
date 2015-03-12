//
//  DYNIcons.h
//  DynUI-Example
//
//  Created by Dan Pourhadi on 5/25/13.
//  Copyright (c) 2013 Dan Pourhadi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DYNIcons : NSObject

+ (NSArray*)availableIconKeys;

+ (UIBezierPath*)iconPathForKey:(NSString*)key fitInSize:(CGSize)size;
+ (UIBezierPath*)iconPathForKey:(NSString*)key forHeight:(CGFloat)height;
+ (UIBezierPath*)iconPathForKey:(NSString*)key forWidth:(CGFloat)width;
@end

// icon keys

static NSString * const kDYNIconCrossKey = @"cross";
static NSString * const kDYNIconRefreshKey = @"refresh";
static NSString * const kDYNIconAumadeKey = @"aumade";
static NSString * const kDYNIconLoaction2Key = @"loaction2";
static NSString * const kDYNIconFolderKey = @"folder";
static NSString * const kDYNIconSafariKey = @"safari";
static NSString * const kDYNIconArrowupKey = @"arrowup";
static NSString * const kDYNIconViewKey = @"view";
static NSString * const kDYNIconFlickrKey = @"flickr";
static NSString * const kDYNIconGreenKey = @"green";
static NSString * const kDYNIconPageKey = @"page";
static NSString * const kDYNIconMuteKey = @"mute";
static NSString * const kDYNIconBugKey = @"bug";
static NSString * const kDYNIconBookmarkKey = @"bookmark";
static NSString * const kDYNIconGlobeKey = @"globe";
static NSString * const kDYNIconMailKey = @"mail";
static NSString * const kDYNIconRoadmapKey = @"roadmap";
static NSString * const kDYNIconFlagKey = @"flag";
static NSString * const kDYNIconOperaKey = @"opera";
static NSString * const kDYNIconConnectKey = @"connect";
static NSString * const kDYNIconPickerKey = @"picker";
static NSString * const kDYNIconTalkqKey = @"talkq";
static NSString * const kDYNIconWrench2Key = @"wrench2";
static NSString * const kDYNIconDocktopKey = @"docktop";
static NSString * const kDYNIconInstagramKey = @"instagram";
static NSString * const kDYNIconLocationKey = @"location";
static NSString * const kDYNIconCheckKey = @"check";
static NSString * const kDYNIconGithubaltKey = @"githubalt";
static NSString * const kDYNIconPowerKey = @"power";
static NSString * const kDYNIconExchangeKey = @"exchange";
static NSString * const kDYNIconLockKey = @"lock";
static NSString * const kDYNIconCodeKey = @"code";
static NSString * const kDYNIconSenchaKey = @"sencha";
static NSString * const kDYNIconHistoryKey = @"history";
static NSString * const kDYNIconPackageKey = @"package";
static NSString * const kDYNIconStar2Key = @"star2";
static NSString * const kDYNIconRunKey = @"run";
static NSString * const kDYNIconTrainKey = @"train";
static NSString * const kDYNIconCodetalkKey = @"codetalk";
static NSString * const kDYNIconImacKey = @"imac";
static NSString * const kDYNIconSkullKey = @"skull";
static NSString * const kDYNIconStaroffKey = @"staroff";
static NSString * const kDYNIconDbKey = @"db";
static NSString * const kDYNIconCartKey = @"cart";
static NSString * const kDYNIconPhoneKey = @"phone";
static NSString * const kDYNIconPaintKey = @"paint";
static NSString * const kDYNIconGlobealt2Key = @"globeAlt2";
static NSString * const kDYNIconRotateKey = @"rotate";
static NSString * const kDYNIconFilterKey = @"filter";
static NSString * const kDYNIconTicketKey = @"ticket";
static NSString * const kDYNIconIe9Key = @"ie9";
static NSString * const kDYNIconArrowleft2Key = @"arrowleft2";
static NSString * const kDYNIconReflecthKey = @"reflecth";
static NSString * const kDYNIconImportKey = @"import";
static NSString * const kDYNIconShuffleKey = @"shuffle";
static NSString * const kDYNIconStar3Key = @"star3";
static NSString * const kDYNIconDownloadKey = @"download";
static NSString * const kDYNIconLampKey = @"lamp";
static NSString * const kDYNIconTwitterbirdKey = @"twitterbird";
static NSString * const kDYNIconSunKey = @"sun";
static NSString * const kDYNIconMagicKey = @"magic";
static NSString * const kDYNIconCloud2Key = @"cloud2";
static NSString * const kDYNIconPluginKey = @"plugin";
static NSString * const kDYNIconKeyKey = @"key";
static NSString * const kDYNIconVolume0Key = @"volume0";
static NSString * const kDYNIconBusKey = @"bus";
static NSString * const kDYNIconPeopleKey = @"people";
static NSString * const kDYNIconGlassesKey = @"glasses";
static NSString * const kDYNIconForkKey = @"fork";
static NSString * const kDYNIconSearchKey = @"search";
static NSString * const kDYNIconAcwKey = @"acw";
static NSString * const kDYNIconNotebookKey = @"notebook";
static NSString * const kDYNIconTrashKey = @"trash";
static NSString * const kDYNIconArrowleftKey = @"arrowleft";
static NSString * const kDYNIconDockrightKey = @"dockright";
static NSString * const kDYNIconBoltKey = @"bolt";
static NSString * const kDYNIconFfKey = @"ff";
static NSString * const kDYNIconJqueryKey = @"jquery";
static NSString * const kDYNIconDetourKey = @"detour";
static NSString * const kDYNIconGlobealtKey = @"globeAlt";
static NSString * const kDYNIconPalleteKey = @"pallete";
static NSString * const kDYNIconCommandlineKey = @"commandline";
static NSString * const kDYNIconLabKey = @"lab";
static NSString * const kDYNIconStopKey = @"stop";
static NSString * const kDYNIconLowBatteryKey = @"low-battery";
static NSString * const kDYNIconPage2Key = @"page2";
static NSString * const kDYNIconBubbleKey = @"bubble";
static NSString * const kDYNIconPlusKey = @"plus";
static NSString * const kDYNIconWomanKey = @"woman";
static NSString * const kDYNIconWrench3Key = @"wrench3";
static NSString * const kDYNIconTshirtKey = @"tshirt";
static NSString * const kDYNIconExportKey = @"export";
static NSString * const kDYNIconWrenchKey = @"wrench";
static NSString * const kDYNIconClouddownKey = @"cloudDown";
static NSString * const kDYNIconSmile2Key = @"smile2";
static NSString * const kDYNIconLinkedinKey = @"linkedin";
static NSString * const kDYNIconPhotoKey = @"photo";
static NSString * const kDYNIconClockKey = @"clock";
static NSString * const kDYNIconNewwindowKey = @"newwindow";
static NSString * const kDYNIconIeKey = @"ie";
static NSString * const kDYNIconTempKey = @"temp";
static NSString * const kDYNIconCcwKey = @"ccw";
static NSString * const kDYNIconIphoneKey = @"iphone";
static NSString * const kDYNIconLandscape2Key = @"landscape2";
static NSString * const kDYNIconPenKey = @"pen";
static NSString * const kDYNIconWheelchairKey = @"wheelchair";
static NSString * const kDYNIconTakeoffKey = @"takeoff";
static NSString * const kDYNIconQuestionMarkKey = @"!";
static NSString * const kDYNIconHangupKey = @"hangup";
static NSString * const kDYNIconChromeKey = @"chrome";
static NSString * const kDYNIconVimKey = @"vim";
static NSString * const kDYNIconNomagnetKey = @"nomagnet";
static NSString * const kDYNIconDollarSignKey = @"$";
static NSString * const kDYNIconMicmuteKey = @"micmute";
static NSString * const kDYNIconHelpKey = @"help";
static NSString * const kDYNIconStopwatchKey = @"stopwatch";
static NSString * const kDYNIconStopsignKey = @"stopsign";
static NSString * const kDYNIconStarKey = @"star";
static NSString * const kDYNIconHpKey = @"hp";
static NSString * const kDYNIconAnonymousKey = @"anonymous";
static NSString * const kDYNIconSplitKey = @"split";
static NSString * const kDYNIconQuestionMark2Key = @"?2";
static NSString * const kDYNIconVolume1Key = @"volume1";
static NSString * const kDYNIconUnlockKey = @"unlock";
static NSString * const kDYNIconDryKey = @"dry";
static NSString * const kDYNIconGithubKey = @"github";
static NSString * const kDYNIconArrowrightKey = @"arrowright";
static NSString * const kDYNIconRulerKey = @"ruler";
static NSString * const kDYNIconListKey = @"list";
static NSString * const kDYNIconGplusKey = @"gplus";
static NSString * const kDYNIconSkypeKey = @"skype";
static NSString * const kDYNIconSlideshareKey = @"slideshare";
static NSString * const kDYNIconBrushKey = @"brush";
static NSString * const kDYNIconFaveKey = @"fave";
static NSString * const kDYNIconRaphaelKey = @"raphael";
static NSString * const kDYNIconRainKey = @"rain";
static NSString * const kDYNIconCoffeeKey = @"coffee";
static NSString * const kDYNIconTalkeKey = @"talke";
static NSString * const kDYNIconFacebookKey = @"facebook";
static NSString * const kDYNIconParentKey = @"parent";
static NSString * const kDYNIconPensilKey = @"pensil";
static NSString * const kDYNIconEmployeeKey = @"employee";
static NSString * const kDYNIconScissorsKey = @"scissors";
static NSString * const kDYNIconJigsawKey = @"jigsaw";
static NSString * const kDYNIconCrownKey = @"crown";
static NSString * const kDYNIconJsKey = @"js";
static NSString * const kDYNIconWrench4Key = @"wrench4";
static NSString * const kDYNIconQuestionMark3Key = @"?";
static NSString * const kDYNIconManKey = @"man";
static NSString * const kDYNIconAlarmKey = @"alarm";
static NSString * const kDYNIconCloudyKey = @"cloudy";
static NSString * const kDYNIconHomeKey = @"home";
static NSString * const kDYNIconLinuxKey = @"linux";
static NSString * const kDYNIconIpadKey = @"ipad";
static NSString * const kDYNIconOpensourceKey = @"opensource";
static NSString * const kDYNIconFeedKey = @"feed";
static NSString * const kDYNIconEndKey = @"end";
static NSString * const kDYNIconBellKey = @"bell";
static NSString * const kDYNIconTaxiKey = @"taxi";
static NSString * const kDYNIconEditKey = @"edit";
static NSString * const kDYNIconDockbottomKey = @"dockbottom";
static NSString * const kDYNIconSettingsKey = @"settings";
static NSString * const kDYNIconSmileKey = @"smile";
static NSString * const kDYNIconAppleKey = @"apple";
static NSString * const kDYNIconCustomerKey = @"customer";
static NSString * const kDYNIconWindowsKey = @"windows";
static NSString * const kDYNIconArrowaltKey = @"arrowalt";
static NSString * const kDYNIconHammerKey = @"hammer";
static NSString * const kDYNIconUmbrellaKey = @"umbrella";
static NSString * const kDYNIconArrowright2Key = @"arrowright2";
static NSString * const kDYNIconUsersKey = @"users";
static NSString * const kDYNIconVideoKey = @"video";
static NSString * const kDYNIconSpeakerKey = @"speaker";
static NSString * const kDYNIconMinusKey = @"minus";
static NSString * const kDYNIconBarchartKey = @"barchart";
static NSString * const kDYNIconLinkKey = @"link";
static NSString * const kDYNIconSmallgearKey = @"smallgear";
static NSString * const kDYNIconStartKey = @"start";
static NSString * const kDYNIconFullcubeKey = @"fullcube";
static NSString * const kDYNIconArrowleftaltKey = @"arrowleftalt";
static NSString * const kDYNIconPcKey = @"pc";
static NSString * const kDYNIconChatKey = @"chat";
static NSString * const kDYNIconGearKey = @"gear";
static NSString * const kDYNIconMergeKey = @"merge";
static NSString * const kDYNIconDribbbleKey = @"dribbble";
static NSString * const kDYNIconNoKey = @"no";
static NSString * const kDYNIconLinechartKey = @"linechart";
static NSString * const kDYNIconFitocracyKey = @"fitocracy";
static NSString * const kDYNIconVolume2Key = @"volume2";
static NSString * const kDYNIconCloudupKey = @"cloudUp";
static NSString * const kDYNIconZoomoutKey = @"zoomout";
static NSString * const kDYNIconDiagramKey = @"diagram";
static NSString * const kDYNIcon500PxKey = @"500px";
static NSString * const kDYNIconResize2Key = @"resize2";
static NSString * const kDYNIconHammerandscrewdriverKey = @"hammerandscrewdriver";
static NSString * const kDYNIconStickerKey = @"sticker";
static NSString * const kDYNIconPaperKey = @"paper";
static NSString * const kDYNIconInboxKey = @"inbox";
static NSString * const kDYNIconArrowdownKey = @"arrowdown";
static NSString * const kDYNIconMicKey = @"mic";
static NSString * const kDYNIconClipKey = @"clip";
static NSString * const kDYNIconBooksKey = @"books";
static NSString * const kDYNIconAppsKey = @"apps";
static NSString * const kDYNIconCheckboxKey = @"checkbox";
static NSString * const kDYNIconFork_AltKey = @"fork_alt";
static NSString * const kDYNIconHailKey = @"hail";
static NSString * const kDYNIconIKey = @"i";
static NSString * const kDYNIconQuoteKey = @"quote";
static NSString * const kDYNIconDisconnectKey = @"disconnect";
static NSString * const kDYNIconUndoKey = @"undo";
static NSString * const kDYNIconLandscape1Key = @"landscape1";
static NSString * const kDYNIconDockleftKey = @"dockleft";
static NSString * const kDYNIconNodejsKey = @"nodejs";
static NSString * const kDYNIconInkscapeKey = @"inkscape";
static NSString * const kDYNIconAndroidKey = @"android";
static NSString * const kDYNIconTerminalKey = @"terminal";
static NSString * const kDYNIconSvgKey = @"svg";
static NSString * const kDYNIconContractKey = @"contract";
static NSString * const kDYNIconPptKey = @"ppt";
static NSString * const kDYNIconSnowKey = @"snow";
static NSString * const kDYNIconNoviewKey = @"noview";
static NSString * const kDYNIconFontKey = @"font";
static NSString * const kDYNIconBookKey = @"book";
static NSString * const kDYNIconCheckedKey = @"checked";
static NSString * const kDYNIconMagnetKey = @"magnet";
static NSString * const kDYNIconGraphaelKey = @"graphael";
static NSString * const kDYNIconIconsKey = @"icons";
static NSString * const kDYNIconScrewdriverKey = @"screwdriver";
static NSString * const kDYNIconCalendar2Key = @"calendar2";
static NSString * const kDYNIconLockedKey = @"locked";
static NSString * const kDYNIconUsbKey = @"usb";
static NSString * const kDYNIconRwKey = @"rw";
static NSString * const kDYNIconWarningKey = @"warning";
static NSString * const kDYNIconVolume3Key = @"volume3";
static NSString * const kDYNIconPrinterKey = @"printer";
static NSString * const kDYNIconEthernetKey = @"ethernet";
static NSString * const kDYNIconExpandKey = @"expand";
static NSString * const kDYNIconTagKey = @"tag";
static NSString * const kDYNIconBiohazardKey = @"biohazard";
static NSString * const kDYNIconZoominKey = @"zoomin";
static NSString * const kDYNIconPalmKey = @"palm";
static NSString * const kDYNIconTwitterKey = @"twitter";
static NSString * const kDYNIconReflectvKey = @"reflectv";
static NSString * const kDYNIconChargingKey = @"charging";
static NSString * const kDYNIconIosKey = @"iOS";
static NSString * const kDYNIconPictureKey = @"picture";
static NSString * const kDYNIconCloudKey = @"cloud";
static NSString * const kDYNIconStar3OffKey = @"star3off";
static NSString * const kDYNIconThunderKey = @"thunder";
static NSString * const kDYNIconFlagAltKey = @"flag-alt";
static NSString * const kDYNIconCalendarKey = @"calendar";
static NSString * const kDYNIconLamp_AltKey = @"lamp_alt";
static NSString * const kDYNIconStar2OffKey = @"star2off";
static NSString * const kDYNIconPiechartKey = @"piechart";
static NSString * const kDYNIconCropKey = @"crop";
static NSString * const kDYNIconBucketKey = @"bucket";
static NSString * const kDYNIconFullBatteryKey = @"full-battery";
static NSString * const kDYNIconFirefoxKey = @"firefox";
static NSString * const kDYNIconMusicKey = @"music";
static NSString * const kDYNIconCarKey = @"car";
static NSString * const kDYNIconPlaneKey = @"plane";
static NSString * const kDYNIconFutureKey = @"future";
static NSString * const kDYNIconCubeKey = @"cube";
static NSString * const kDYNIconPlayKey = @"play";
static NSString * const kDYNIconLandingKey = @"landing";
static NSString * const kDYNIconSettingsaltKey = @"settingsalt";
static NSString * const kDYNIconUserKey = @"user";
static NSString * const kDYNIconSortKey = @"sort";
static NSString * const kDYNIconXKey = @"x";
static NSString * const kDYNIconArrowright3Key = @"arrowright3";
static NSString * const kDYNIconFastForwardKey = @"fastforward";
static NSString * const kDYNIconRewindKey = @"rewind";
static NSString * const kDYNIconScrubKey = @"scrub";
static NSString * const kDYNIconShareKey = @"share";
static NSString * const kDYNIconPauseKey = @"pause";
static NSString * const kDYNIconEllipseKey = @"ellipse";
static NSString * const kDYNIconNextKey = @"next";
static NSString * const kDYNIconThumbsUpKey = @"thumbsUp";
static NSString * const kDYNIconThumbsDownKey = @"thumbsDown";
static NSString * const kDYNIconArtistsKey = @"artists";
static NSString * const kDYNIconAlbumsKey = @"albums";
static NSString * const kDYNIconPlaylistsKey = @"playlists";
