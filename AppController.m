//
//  AppController.m
//  SpeakLine
//
//  Created by Eric on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (id)init
{
	[super init];
	
	NSLog(@"init");
	
	speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
	[speechSynth setDelegate:self];
	voiceList = [[NSSpeechSynthesizer availableVoices] retain];
	return self;
}

- (IBAction)sayIt:(id)sender
{
	NSString *string = [textField stringValue];
	
	if ([string length] == 0) {
		NSLog(@"string from %@ is of zero-length", textField);
		return;
	}
	[speechSynth startSpeakingString:string];
	NSLog(@"Have started to say: %@", string);
	[stopButton setEnabled:YES];
	[startButton setEnabled:NO];
}

- (IBAction)stopIt:(id)sender
{
	NSLog(@"stopping");
	[speechSynth stopSpeaking];
	[stopButton setEnabled:NO];
	[startButton setEnabled:YES];
}

- (int)numberOfRowsInTableView:(NSTableView *)tv
{
	return [voiceList count];
}

- (id)tableView:(NSTableView *)tv 
objectValueForTableColumn:(NSTableColumn *)tableColumn
row:(int)row
{
	NSString *V = [voiceList objectAtIndex:row];
	return v;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
	int row = [tableView selectedRow];
	if (row == -1) {
		return;
	}
	NSString *selectedVoice = [voiceList objectAtIndex:row];
	[speechSynth setVoice:selectedVoice];
	NSLog(@"new voice = %@", selectedVoice);
}


@end
