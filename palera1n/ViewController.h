//
//  ViewController.h
//  palera1n
//
//  Created by kristenlc on 12/18/22.
//  Copyright © 2022 woofy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *statusTextField;

@property (weak) IBOutlet NSButton *optionsButton;
@property (weak) IBOutlet NSButton *startButton;

@property (weak) IBOutlet NSImageView *line1;
@property (weak) IBOutlet NSImageView *line2;

@property (weak) IBOutlet NSButton *quickMode;

@property NSArray* compatibleDevicesList;

@property BOOL started;

- (IBAction)optionsButton_DoClick:(id)sender;

- (IBAction)startButton_DoClick:(id)sender;

@end

