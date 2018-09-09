//
//  GADNativeMuteThisAdLoaderOptions.h
//  Google Mobile Ads SDK
//
//  Copyright 2018 Google Inc. All rights reserved.
//

#import <GoogleMobileAds/GADAdLoader.h>

@interface GADNativeMuteThisAdLoaderOptions : GADAdLoaderOptions

/// Set to YES to request the custom Mute This Ad feature. By default, this property's value is YES.
@property(nonatomic) BOOL customMuteThisAdRequested;

@end
