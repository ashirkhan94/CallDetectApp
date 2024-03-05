//
//  VideoView.m
//  CallDetectApp
//
//  Created by Ashir Khan on 01/03/24.
//

#import "VideoView.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@implementation VideoView


static NSMutableDictionary<NSString*, NSValue*> *videoMap;



RCT_EXPORT_MODULE(VideoView);



- (UIView *)view
{
    NSURL *videoURL = [NSURL URLWithString:@"https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"];
    
    _player = [AVPlayer playerWithURL:videoURL];
  _playerViewController = [AVPlayerViewController new];
    _playerViewController.player = _player;
  
  // Enable Picture-in-Picture
  if ([AVPictureInPictureController isPictureInPictureSupported]) {
      AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
      self.pipController = [[AVPictureInPictureController alloc] initWithPlayerLayer:playerLayer];
      self.pipController.delegate = self;
  }
  
  
      _playerViewController = [AVPlayerViewController new];
      _playerViewController.player = _player;
      
      // Enable Picture-in-Picture
     
    
    UIView *view = _playerViewController.view;
    return view;
}





@end
