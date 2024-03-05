//
//  ViewController.m
//  CallDetectApp
//
//  Created by Ashir Khan on 01/03/24.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@implementation ViewController

// To export a module named RCTCalendarModule
RCT_EXPORT_MODULE();



RCT_EXPORT_METHOD(play) {
  NSLog(@"Test Play");
   // [_player play];
}

RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(renderVideoFromUrl: (NSString *)urlString) {
  // Create an NSURL object from the provided string
  NSURL *url = [NSURL URLWithString:urlString];
  // Initialize the AVPlayer with the url
  AVPlayer *player = [[AVPlayer alloc] initWithURL:url];
  // Check if the url is a valid video link
  BOOL isPlayable = [[AVAsset assetWithURL:url] isPlayable];
  if(!isPlayable){
    return @(NO);
  }
  // Dispatch the following code asynchronously on the main queue
  dispatch_async(dispatch_get_main_queue(), ^{
    // Create the AVPlayerViewController
    AVPlayerViewController *viewController = [[AVPlayerViewController alloc] init];
    // Set the AVPlayer for the controller
    viewController.player = player;
    // Set some settings like volume, playback controls visibility and video gravity
    viewController.player.volume = 1;
    viewController.showsPlaybackControls = YES;
    viewController.videoGravity = AVLayerVideoGravityResizeAspect;
    
    // Get the key window and the root ViewController for the application
    UIWindow *window = [[UIApplication sharedApplication] delegate].window;
    UIViewController *rootViewController = window.rootViewController;
    // Present the AVPlayer modally
    [rootViewController presentViewController:viewController animated:true completion:^{
      [player play];
    }];
  });
  // Return the original urlString
  return urlString;
}

RCT_EXPORT_METHOD(pause) {
  NSLog(@"Test pause");
   // [_player pause];
}

RCT_EXPORT_METHOD(stop) {
  NSLog(@"Test stop");
   // [_player seekToTime:CMTimeMake(0, 1)];
    //[_player pause];
}

@end
