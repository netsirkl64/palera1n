//
//  ViewController.m
//  palera1n
//
//  Created by kristenlc on 12/18/22.
//  Copyright © 2022 woofy. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _compatibleDevicesList =    @[@"iPhone8,1",
                                  @"iPhone8,2",
                                  @"iPhone8,4",
                                  @"iPhone9,1",
                                  @"iPhone9,2",
                                  @"iPhone9,3",
                                  @"iPhone9,4",
                                  @"iPhone10,1",
                                  @"iPhone10,2",
                                  @"iPhone10,3",
                                  @"iPhone10,4",
                                  @"iPhone10,5",
                                  @"iPhone10,6",
                                  @"iPad5,1",
                                  @"iPad5,2",
                                  @"iPad5,3",
                                  @"iPad5,4",
                                  @"iPad6,7",
                                  @"iPad6,8",
                                  @"iPad6,3",
                                  @"iPad6,4",
                                  @"iPad7,1",
                                  @"iPad7,2",
                                  @"iPad7,3",
                                  @"iPad7,4",
                                  @"iPad8,1",
                                  @"iPad8,2",
                                  @"iPad8,3",
                                  @"iPad8,4",
                                  @"iPad8,5",
                                  @"iPad8,6",
                                  @"iPad8,7",
                                  @"iPad8,8",
                                  @"iPad8,9",
                                  @"iPad8,10",
                                  @"iPad8,11",
                                  @"iPad8,12",
                                  @"iPad11,1",
                                  @"iPad11,2",
                                  @"iPad11,3",
                                  @"iPad11,4",
                                  @"iPad13,1",
                                  @"iPad13,2",
                                  @"iPod9,1"];
    
    NSString* get_device_mode = [[NSBundle mainBundle] pathForResource:@"get_device_mode" ofType:@"sh"];
    NSString* get_device_info = [[NSBundle mainBundle] pathForResource:@"get_device_info" ofType:@"sh"];
    NSString* gtar = [[NSBundle mainBundle] pathForResource:@"gtar" ofType:@""];
    NSString* palera1n = [[NSBundle mainBundle] pathForResource:@"palera1n" ofType:@"tar.gz"];
    [self posix_spawn:@"/bin/mkdir" args:@[@"/tmp/palera1n"] cdp:nil];
    [self posix_spawn:@"/bin/pwd" args:@[@"-P"] cdp:@"/tmp/palera1n"];
    [self posix_spawn:@"/bin/cp" args:@[palera1n, @"/tmp/palera1n"] cdp:@"/tmp/palera1n"];
    [self posix_spawn:gtar args:@[@"-xzvf", @"palera1n.tar.gz"] cdp:@"/tmp/palera1n"];
    [[self startButton] setEnabled:false];
    [[self optionsButton] setEnabled:false];
    _started = false;
    [self tick:nil];
}

- (NSString*) prompt_user_for_version:(NSString*)ecid {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:[[@"/tmp/palera1n/palera1n-High-Sierra/" stringByAppendingString:ecid] stringByAppendingString: @"/version.txt"]]){
        NSString* version = [self posix_spawn:@"/bin/cat" args:@[@"version.txt"] cdp:[@"/tmp/palera1n/palera1n-High-Sierra/" stringByAppendingString:ecid]];
        return version;
    } else {
        NSAlert *alert = [NSAlert alertWithMessageText:@"palera1n.sh" defaultButton:@"OK" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"What is the iOS version of this device?\n\nWe have to ask you this only because you started the jailbreak process in dfu instead of Normal mode\n\nThis should only be used if your device is stuck in a boot loop or recovery mode"];
        
        NSComboBox* comboBox = [[NSComboBox alloc] initWithFrame:NSMakeRect(0, 0, 120, 24)];
        [comboBox addItemWithObjectValue:@"16.2"];
        [comboBox addItemWithObjectValue:@"16.1.2"];
        [comboBox addItemWithObjectValue:@"16.1.1"];
        [comboBox addItemWithObjectValue:@"16.1"];
        [comboBox addItemWithObjectValue:@"16.0"];
        [comboBox addItemWithObjectValue:@"15.7"];
        [comboBox addItemWithObjectValue:@"15.6.1"];
        [comboBox addItemWithObjectValue:@"15.6"];
        [comboBox addItemWithObjectValue:@"15.5"];
        [comboBox addItemWithObjectValue:@"15.4.1"];
        [comboBox addItemWithObjectValue:@"15.4"];
        [comboBox addItemWithObjectValue:@"15.3.1"];
        [comboBox addItemWithObjectValue:@"15.3"];
        [comboBox addItemWithObjectValue:@"15.2.1"];
        [comboBox addItemWithObjectValue:@"15.2"];
        [comboBox addItemWithObjectValue:@"15.1"];
        [comboBox addItemWithObjectValue:@"15.0.2"];
        [comboBox addItemWithObjectValue:@"15.0.1"];
        [comboBox addItemWithObjectValue:@"15.0"];
        
        [alert setAccessoryView:comboBox];
        
        [comboBox becomeFirstResponder];
        
        NSInteger button = [alert runModal];
        if (button == NSAlertDefaultReturn) {
            [self posix_spawn:@"/bin/mkdir" args:@[@"-p", [@"/tmp/palera1n/palera1n-High-Sierra/" stringByAppendingString:ecid]] cdp:nil];
            [[comboBox stringValue] writeToFile:[[@"/tmp/palera1n/palera1n-High-Sierra/" stringByAppendingString:ecid] stringByAppendingString: @"/version.txt"]
                      atomically:NO
                        encoding:NSStringEncodingConversionAllowLossy
                           error:nil];
            return [comboBox stringValue];
        } else if (button == NSAlertSecondButtonReturn) {
            
        }
        return nil;
    }
}

- (void) run_command_in_terminal:(NSString*)cmd {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:@"/tmp/palera1n/palera1n-High-Sierra/bash.sh"]){
        [self posix_spawn:@"/bin/rm" args:@[@"bash.sh"] cdp:@"/tmp/palera1n/palera1n-High-Sierra/"];
    }
    cmd = [cmd stringByReplacingOccurrencesOfString:@"19G69" withString:@"15.6"];
    [[[@"#!/usr/bin/env bash\n\nmkdir -p /tmp/palera1n/palera1n-High-Sierra\ncd /tmp/palera1n/palera1n-High-Sierra\nsleep 1\n" stringByAppendingString:[@"sudo sh " stringByAppendingString:cmd]] stringByAppendingString:@"\nosascript -e 'tell application \"Terminal\" to quit' & exit 0"] writeToFile:@"/tmp/palera1n/palera1n-High-Sierra/bash.sh" atomically:NO encoding:NSUTF8StringEncoding error:nil];
    [self posix_spawn:@"/bin/chmod" args:@[@"+x", @"/tmp/palera1n/palera1n-High-Sierra/bash.sh"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
    [self posix_spawn:@"/usr/bin/open" args:@[@"-W", @"-a", @"Terminal", @"bash.sh"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
}

- (NSString*) posix_spawn:(NSString*)path args:(NSArray*)args cdp:(NSString*)cdp{
    NSLog(path);
    NSPipe *pipe = [NSPipe pipe];
    NSFileHandle *file = pipe.fileHandleForReading;
    
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = path;
    if (args != nil) {
        task.arguments = args;
    }
    if (cdp != nil) {
        task.currentDirectoryPath = cdp;
    }
    task.standardOutput = pipe;
    
    [task launch];
    
    NSData *data = [file readDataToEndOfFile];
    [file closeFile];
    
    NSString *grepOutput = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSLog (@"%@", grepOutput);
    
    return [grepOutput stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (void) tick:(NSTimer *)timer
{
    if (_started) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [NSThread sleepForTimeInterval:1.0f];
            [self tick:nil];
        });
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString* get_device_info = [[NSBundle mainBundle] pathForResource:@"get_device_info" ofType:@"sh"];
        NSString* get_device_mode = [[NSBundle mainBundle] pathForResource:@"get_device_mode" ofType:@"sh"];
        NSString* mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
        if ([mode isEqualToString:@"none"]) {
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                if (_started == false) {
                    [[self statusTextField] setStringValue:@"Connect your iPhone, iPod touch, or iPad to begin."];
                    [[self startButton] setEnabled:false];
                    [self tick:nil];
                }
            });
            return;
        }
        NSString* device_id = nil;
        NSString* version = nil;
        NSString* ecid = nil;
        if ([mode isEqualToString:@"normal"]) {
            if (_started == false) {
                device_id = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ProductType"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                if ([device_id isEqualToString:@""]) {
                    [self tick:nil];
                    return;
                }
            }
            if (_started == false) {
                version = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ProductVersion"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                if ([version isEqualToString:@""]) {
                    [self tick:nil];
                    return;
                }
            }
            if (_started == false) {
                ecid = [@"0x" stringByAppendingString:[[NSString stringWithFormat:@"%2lX", (unsigned long)[[self posix_spawn:@"/bin/sh" args:@[get_device_info, @"UniqueChipID"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"] integerValue]] lowercaseString]];
                if ([ecid isEqualToString:@""]) {
                    [self tick:nil];
                    return;
                }
                NSFileManager *fileManager = [NSFileManager defaultManager];
                if ([fileManager fileExistsAtPath:[[@"/tmp/palera1n/palera1n-High-Sierra/" stringByAppendingString:ecid] stringByAppendingString: @"/version.txt"]]){
                    [self posix_spawn:@"/bin/rm" args:@[@"version.txt"] cdp:[@"/tmp/palera1n/palera1n-High-Sierra/" stringByAppendingString:ecid]];
                }
            }
        } else {
            if (_started == false) {
                device_id = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"PRODUCT"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                if ([device_id isEqualToString:@""]) {
                    [self tick:nil];
                    return;
                }
            }
            version = @"";
            if (_started == false) {
                ecid = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ECID"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                if ([ecid isEqualToString:@""]) {
                    [self tick:nil];
                    return;
                }
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            if (_started == false) {
                if ([mode isEqualToString:@"normal"]) {
                    if ([[self compatibleDevicesList] containsObject:device_id]) {
                        if ([version doubleValue] < 15.0) {
                            [[self statusTextField] setStringValue:[[[[@"Sorry, " stringByAppendingString:device_id] stringByAppendingString:@" is supported but, iOS "] stringByAppendingString:version] stringByAppendingString:@" is not.\nSupported versions are 15.0 - 16.2."]];
                            [[self startButton] setEnabled:false];
                            [[self optionsButton] setEnabled:false];
                        } else if ([version isEqualToString:@"19G69"]) {
                            [[self statusTextField] setStringValue:[[[[device_id stringByAppendingString:@" (iOS "] stringByAppendingString:version] stringByAppendingString:@") connected in Normal mode.\nECID: "] stringByAppendingString:ecid]];
                            [[self startButton] setEnabled:true];
                            [[self optionsButton] setEnabled:true];
                        } else if ([version doubleValue] > 16.2) {
                            [[self statusTextField] setStringValue:[[[[[device_id stringByAppendingString:@" (iOS "] stringByAppendingString:version] stringByAppendingString:@") connected in Normal mode.\nWARNING: iOS "] stringByAppendingString:version] stringByAppendingString:@" is untested, continue at your own risk."]];
                            [[self startButton] setEnabled:true];
                            [[self optionsButton] setEnabled:true];
                        } else {
                            [[self statusTextField] setStringValue:[[[[device_id stringByAppendingString:@" (iOS "] stringByAppendingString:version] stringByAppendingString:@") connected in Normal mode.\nECID: "] stringByAppendingString:ecid]];
                            [[self startButton] setEnabled:true];
                            [[self optionsButton] setEnabled:true];
                        }
                    } else {
                        [[self statusTextField] setStringValue:[[[[[@"Sorry, " stringByAppendingString:device_id] stringByAppendingString:@" is not supported on iOS "] stringByAppendingString:version] stringByAppendingString:@" at this point.\nECID: "] stringByAppendingString:ecid]];
                        [[self startButton] setEnabled:false];
                        [[self optionsButton] setEnabled:false];
                    }
                } else if ([mode isEqualToString:@"recovery"]) {
                    if ([[self compatibleDevicesList] containsObject:device_id]) {
                        [[self statusTextField] setStringValue:[[[device_id stringByAppendingString:@" connected in Recovery mode.\nECID: "] stringByAppendingString:ecid] stringByAppendingString:@""]];
                        [[self startButton] setEnabled:true];
                        [[self optionsButton] setEnabled:true];
                    } else {
                        [[self statusTextField] setStringValue:[[[@"Sorry, " stringByAppendingString:device_id] stringByAppendingString:@" is not supported at this point.\nECID: "] stringByAppendingString:ecid]];
                        [[self startButton] setEnabled:false];
                        [[self optionsButton] setEnabled:false];
                    }
                } else if ([mode isEqualToString:@"dfu"]) {
                    if ([[self compatibleDevicesList] containsObject:device_id]) {
                        [[self statusTextField] setStringValue:[[[device_id stringByAppendingString:@" connected in DFU mode.\nECID: "] stringByAppendingString:ecid] stringByAppendingString:@""]];
                        [[self startButton] setEnabled:true];
                        [[self optionsButton] setEnabled:true];
                    } else {
                        [[self statusTextField] setStringValue:[[[@"Sorry, " stringByAppendingString:device_id] stringByAppendingString:@" is not supported at this point.\nECID: "] stringByAppendingString:ecid]];
                        [[self startButton] setEnabled:false];
                        [[self optionsButton] setEnabled:false];
                    }
                } else {
                    [[self statusTextField] setStringValue:@"Connect your iPhone, iPod touch, or iPad to begin."];
                    [[self startButton] setEnabled:false];
                    [[self optionsButton] setEnabled:false];
                }
            }
            [self tick:nil];
        });
    });
}

- (IBAction)optionsButton_DoClick:(id)sender {
    NSAlert *alert = [NSAlert alertWithMessageText:@"palera1n.sh" defaultButton:@"--restorerootfs" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@""];
    [alert beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
        if (returnCode == NSAlertDefaultReturn) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                _started = true;
                NSString* fix_python_env = [[NSBundle mainBundle] pathForResource:@"fix_python_env" ofType:@"sh"];
                [self run_command_in_terminal:fix_python_env];
                NSString* dfuhelper = [[NSBundle mainBundle] pathForResource:@"dfuhelper" ofType:@"sh"];
                NSString* get_device_info = [[NSBundle mainBundle] pathForResource:@"get_device_info" ofType:@"sh"];
                NSString* get_device_mode = [[NSBundle mainBundle] pathForResource:@"get_device_mode" ofType:@"sh"];
                NSString* mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                if ([mode isEqualToString:@"normal"]) {
                    dispatch_async(dispatch_get_main_queue(), ^(void) {
                        [[self startButton] setEnabled:false];
                        [[self optionsButton] setEnabled:false];
                    });
                    NSString* version = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ProductVersion"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    NSString* reboot_into_recovery = [[NSBundle mainBundle] pathForResource:@"reboot_into_recovery" ofType:@"sh"];
                    [self posix_spawn:@"/bin/sh" args:@[reboot_into_recovery] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    [self posix_spawn:@"/usr/bin/open" args:@[@"-W", @"-a", @"Terminal", dfuhelper] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    dispatch_async(dispatch_get_main_queue(), ^(void) {
                        [[self startButton] setEnabled:true];
                        [[self optionsButton] setEnabled:true];
                    });
                    if ([mode isEqualToString:@"dfu"]) {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Device entered DFU!"];
                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                if (returnCode == NSAlertDefaultReturn) {
                                    [self jelbrak:version restorerootfs:true];
                                }
                            }];
                        });
                    } else {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"Device did not enter DFU mode"];
                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                            }];
                        });
                        return;
                    }
                } else if ([mode isEqualToString:@"recovery"]) {
                    [self posix_spawn:@"/usr/bin/open" args:@[@"-W", @"-a", @"Terminal", dfuhelper] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    NSString* mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    if ([mode isEqualToString:@"dfu"]) {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Device entered DFU!"];
                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                if (returnCode == NSAlertDefaultReturn) {
                                    NSAlert* alert2 = [NSAlert alertWithMessageText:@"palera1n.sh" defaultButton:@"OK" alternateButton:@"Proceed in dfu" otherButton:nil informativeTextWithFormat:@"Device must be in Normal mode to continue"];
                                    [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                        if (returnCode == NSAlertDefaultReturn) {
                                            dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                [[self startButton] setEnabled:false];
                                                [[self optionsButton] setEnabled:false];
                                            });
                                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                NSString* reboot_into_normal_mode = [[NSBundle mainBundle] pathForResource:@"reboot_into_normal_mode" ofType:@"sh"];
                                                [self posix_spawn:@"/bin/sh" args:@[reboot_into_normal_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                                NSString* version = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ProductVersion"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                                NSString* reboot_into_recovery = [[NSBundle mainBundle] pathForResource:@"reboot_into_recovery" ofType:@"sh"];
                                                [self posix_spawn:@"/bin/sh" args:@[reboot_into_recovery] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                                dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                    [[self startButton] setEnabled:true];
                                                    [[self optionsButton] setEnabled:true];
                                                });
                                                [self posix_spawn:@"/usr/bin/open" args:@[@"-W", @"-a", @"Terminal", dfuhelper] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                                NSString* mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                                dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                    if ([mode isEqualToString:@"dfu"]) {
                                                        NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Device entered DFU!"];
                                                        [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                                            if (returnCode == NSAlertDefaultReturn) {
                                                                [self jelbrak:version restorerootfs:true];
                                                            }
                                                        }];
                                                    } else {
                                                        NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"Device did not enter DFU mode"];
                                                        [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                                        }];
                                                    }
                                                });
                                            });
                                        } else {
                                            NSString* ecid = ecid = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ECID"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                            NSString* version = [self prompt_user_for_version:ecid];
                                            [self jelbrak:version restorerootfs:true];
                                        }
                                    }];
                                    return;
                                }
                            }];
                        });
                    } else {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"Device did not enter DFU mode"];
                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                            }];
                        });
                    }
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^(void) {
                        NSAlert* alert2 = [NSAlert alertWithMessageText:@"palera1n.sh" defaultButton:@"OK" alternateButton:[@"Proceed in " stringByAppendingString:mode] otherButton:nil informativeTextWithFormat:@"Device must be in Normal mode to continue"];
                        [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                            if (returnCode == NSAlertDefaultReturn) {
                                dispatch_async(dispatch_get_main_queue(), ^(void) {
                                    [[self startButton] setEnabled:false];
                                    [[self optionsButton] setEnabled:false];
                                });
                                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                    NSString* reboot_into_normal_mode = [[NSBundle mainBundle] pathForResource:@"reboot_into_normal_mode" ofType:@"sh"];
                                    [self posix_spawn:@"/bin/sh" args:@[reboot_into_normal_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                    NSString* version = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ProductVersion"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                    NSString* reboot_into_recovery = [[NSBundle mainBundle] pathForResource:@"reboot_into_recovery" ofType:@"sh"];
                                    [self posix_spawn:@"/bin/sh" args:@[reboot_into_recovery] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                                            [[self startButton] setEnabled:true];
                                            [[self optionsButton] setEnabled:true];
                                        });
                                    [self posix_spawn:@"/usr/bin/open" args:@[@"-W", @"-a", @"Terminal", dfuhelper] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                    NSString* mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                    dispatch_async(dispatch_get_main_queue(), ^(void) {
                                        if ([mode isEqualToString:@"dfu"]) {
                                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Device entered DFU!"];
                                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                                if (returnCode == NSAlertDefaultReturn) {
                                                    [self jelbrak:version restorerootfs:true];
                                                }
                                            }];
                                        } else {
                                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"Device did not enter DFU mode"];
                                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                            }];
                                        }
                                    });
                                });
                            } else {
                                NSString* ecid = ecid = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ECID"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                NSString* version = [self prompt_user_for_version:ecid];
                                [self jelbrak:version restorerootfs:true];
                            }
                        }];
                    });
                    return;
                }
                return;
            });
        }
    }];
}

- (void)jelbrak:(NSString*)version restorerootfs:(BOOL)restorerootfs {
    [[self startButton] setEnabled:false];
    [[self optionsButton] setEnabled:false];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (restorerootfs == true) {
            [self run_command_in_terminal:[@"/tmp/palera1n/palera1n-High-Sierra/palera1n.sh --restorerootfs " stringByAppendingString:version]];
        } else {
            [self run_command_in_terminal:[[@"/tmp/palera1n/palera1n-High-Sierra/palera1n.sh --tweaks " stringByAppendingString:version] stringByAppendingString:@" --semi-tethered"]];
        }
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [[self startButton] setEnabled:true];
            [[self optionsButton] setEnabled:true];
        });
        _started = false;
    });
}

- (IBAction)startButton_DoClick:(id)sender {
    NSAlert *alert = [NSAlert alertWithMessageText:@"WARNING WARNING WARNING" defaultButton:@"OK" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"This flag will add tweaks BUT IT WILL BE UNDER A SEPARATE ROOT PARTITION\nTHIS ALSO MEANS THAT YOU WILL NEED A PC TO BOOT TO KEEP JAILBREAK\nTHIS WORKS ON 15.0-16.2\nDO NOT GET ANGRY AT US IF YOUR DEVICE IS BORKED, IT IS YOUR OWN FAULT AND WE WARNED YOU\nDO YOU UNDERSTAND? HIT OK TO CONTINUE"];
    [alert beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
        if (returnCode == NSAlertDefaultReturn) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                _started = true;
                NSString* fix_python_env = [[NSBundle mainBundle] pathForResource:@"fix_python_env" ofType:@"sh"];
                [self run_command_in_terminal:fix_python_env];
                NSString* dfuhelper = [[NSBundle mainBundle] pathForResource:@"dfuhelper" ofType:@"sh"];
                NSString* get_device_info = [[NSBundle mainBundle] pathForResource:@"get_device_info" ofType:@"sh"];
                NSString* get_device_mode = [[NSBundle mainBundle] pathForResource:@"get_device_mode" ofType:@"sh"];
                NSString* mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                if ([mode isEqualToString:@"normal"]) {
                    dispatch_async(dispatch_get_main_queue(), ^(void) {
                        [[self startButton] setEnabled:false];
                        [[self optionsButton] setEnabled:false];
                    });
                    NSString* version = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ProductVersion"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    NSString* reboot_into_recovery = [[NSBundle mainBundle] pathForResource:@"reboot_into_recovery" ofType:@"sh"];
                    [self posix_spawn:@"/bin/sh" args:@[reboot_into_recovery] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    [self posix_spawn:@"/usr/bin/open" args:@[@"-W", @"-a", @"Terminal", dfuhelper] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    dispatch_async(dispatch_get_main_queue(), ^(void) {
                        [[self startButton] setEnabled:true];
                        [[self optionsButton] setEnabled:true];
                    });
                    if ([mode isEqualToString:@"dfu"]) {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Device entered DFU!"];
                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                if (returnCode == NSAlertDefaultReturn) {
                                    [self jelbrak:version restorerootfs:false];
                                }
                            }];
                        });
                    } else {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"Device did not enter DFU mode"];
                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                            }];
                        });
                        return;
                    }
                } else if ([mode isEqualToString:@"recovery"]) {
                    [self posix_spawn:@"/usr/bin/open" args:@[@"-W", @"-a", @"Terminal", dfuhelper] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    NSString* mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                    if ([mode isEqualToString:@"dfu"]) {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Device entered DFU!"];
                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                if (returnCode == NSAlertDefaultReturn) {
                                    NSAlert* alert2 = [NSAlert alertWithMessageText:@"palera1n.sh" defaultButton:@"OK" alternateButton:@"Proceed in dfu" otherButton:nil informativeTextWithFormat:@"Device must be in Normal mode to continue"];
                                    [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                        if (returnCode == NSAlertDefaultReturn) {
                                            dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                [[self startButton] setEnabled:false];
                                                [[self optionsButton] setEnabled:false];
                                            });
                                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                NSString* reboot_into_normal_mode = [[NSBundle mainBundle] pathForResource:@"reboot_into_normal_mode" ofType:@"sh"];
                                                [self posix_spawn:@"/bin/sh" args:@[reboot_into_normal_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                                NSString* version = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ProductVersion"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                                NSString* reboot_into_recovery = [[NSBundle mainBundle] pathForResource:@"reboot_into_recovery" ofType:@"sh"];
                                                [self posix_spawn:@"/bin/sh" args:@[reboot_into_recovery] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                                dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                    [[self startButton] setEnabled:true];
                                                    [[self optionsButton] setEnabled:true];
                                                });
                                                [self posix_spawn:@"/usr/bin/open" args:@[@"-W", @"-a", @"Terminal", dfuhelper] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                                NSString* mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                                dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                    if ([mode isEqualToString:@"dfu"]) {
                                                        NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Device entered DFU!"];
                                                        [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                                            if (returnCode == NSAlertDefaultReturn) {
                                                                [self jelbrak:version restorerootfs:false];
                                                            }
                                                        }];
                                                    } else {
                                                        NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"Device did not enter DFU mode"];
                                                        [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                                        }];
                                                    }
                                                });
                                            });
                                        } else {
                                            NSString* ecid = ecid = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ECID"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                            NSString* version = [self prompt_user_for_version:ecid];
                                            [self jelbrak:version restorerootfs:false];
                                        }
                                    }];
                                    return;
                                }
                            }];
                        });
                    } else {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"Device did not enter DFU mode"];
                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                            }];
                        });
                    }
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^(void) {
                        NSAlert* alert2 = [NSAlert alertWithMessageText:@"palera1n.sh" defaultButton:@"OK" alternateButton:[@"Proceed in " stringByAppendingString:mode] otherButton:nil informativeTextWithFormat:@"Device must be in Normal mode to continue"];
                        [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                            if (returnCode == NSAlertDefaultReturn) {
                                dispatch_async(dispatch_get_main_queue(), ^(void) {
                                    [[self startButton] setEnabled:false];
                                    [[self optionsButton] setEnabled:false];
                                });
                                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                    NSString* reboot_into_normal_mode = [[NSBundle mainBundle] pathForResource:@"reboot_into_normal_mode" ofType:@"sh"];
                                    [self posix_spawn:@"/bin/sh" args:@[reboot_into_normal_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                    NSString* version = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ProductVersion"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                    NSString* reboot_into_recovery = [[NSBundle mainBundle] pathForResource:@"reboot_into_recovery" ofType:@"sh"];
                                    [self posix_spawn:@"/bin/sh" args:@[reboot_into_recovery] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                    dispatch_async(dispatch_get_main_queue(), ^(void) {
                                        [[self startButton] setEnabled:true];
                                        [[self optionsButton] setEnabled:true];
                                    });
                                    [self posix_spawn:@"/usr/bin/open" args:@[@"-W", @"-a", @"Terminal", dfuhelper] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                    NSString* mode = [self posix_spawn:@"/bin/sh" args:@[get_device_mode] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                    dispatch_async(dispatch_get_main_queue(), ^(void) {
                                        if ([mode isEqualToString:@"dfu"]) {
                                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Device entered DFU!"];
                                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                                if (returnCode == NSAlertDefaultReturn) {
                                                    [self jelbrak:version restorerootfs:false];
                                                }
                                            }];
                                        } else {
                                            NSAlert* alert2 = [NSAlert alertWithMessageText:@"dfuhelper.sh" defaultButton:@"OK" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"Device did not enter DFU mode"];
                                            [alert2 beginSheetModalForWindow:[[[NSApplication sharedApplication] windows] objectAtIndex:0] completionHandler:^(NSModalResponse returnCode) {
                                            }];
                                        }
                                    });
                                });
                            } else {
                                NSString* ecid = ecid = [self posix_spawn:@"/bin/sh" args:@[get_device_info, @"ECID"] cdp:@"/tmp/palera1n/palera1n-High-Sierra"];
                                NSString* version = [self prompt_user_for_version:ecid];
                                [self jelbrak:version restorerootfs:false];
                            }
                        }];
                    });
                    return;
                }
                return;
            });
        }
    }];
}

@end
