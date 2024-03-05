//
//  VideoView.h
//  CallDetectApp
//
//  Created by Ashir Khan on 01/03/24.
//



#import <UIKit/UIKit.h>
#import <React/RCTViewManager.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface VideoView : RCTViewManager<AVPictureInPictureControllerDelegate>
@property (nonatomic, strong) AVPlayer  *player;
@property (nonatomic, strong) AVPlayerViewController *playerViewController;
@property (nonatomic, strong) AVPictureInPictureController *pipController;
@end

