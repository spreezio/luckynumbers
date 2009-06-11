//
//  LuckyNumbersViewController.m
//  LuckyNumbers
//
//  Created by Dan Grigsby on 3/18/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "LuckyNumbersViewController.h"
#import "JSON/JSON.h"

@implementation LuckyNumbersViewController

- (void)viewDidLoad {	
	[super viewDidLoad];

	responseData = [[NSMutableData data] retain];		
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.unpossible.com/misc/lucky_numbers.json"]];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];			
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	label.text = [NSString stringWithFormat:@"Connection failed: %@", [error description]];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {		
	[connection release];
	
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	[responseData release];
	
	NSError *error;
	SBJSON *json = [[SBJSON new] autorelease];
	NSArray *luckyNumbers = [json objectWithString:responseString error:&error];
	[responseString release];	
	
	if (luckyNumbers == nil)
		label.text = [NSString stringWithFormat:@"JSON parsing failed: %@", [error localizedDescription]];
	else {		
		NSMutableString *text = [NSMutableString stringWithString:@"Lucky numbers:\n"];
		
		for (int i = 0; i < [luckyNumbers count]; i++) 
			[text appendFormat:@"%@\n", [luckyNumbers objectAtIndex:i]];

		label.text =  text;
	}
}

- (void)dealloc {
    [super dealloc];
}

@end
