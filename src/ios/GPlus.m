//
//  GPlus.m

#import "GPlus.h"

@implementation GPlus

@synthesize clientId;

- (void) initGPlus:(CDVInvokedUrlCommand*)command
{
  CDVPluginResult* pluginResult = nil;

  self.clientId = [[NSString alloc] initWithString:[command.arguments objectAtIndex:0]];
  [GPPSignIn sharedInstance].clientID = self.clientId;

  NSLog(@"GPlus Plugin initalized");
  pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) share:(CDVInvokedUrlCommand*)command {
  NSURL *sourceURL = [NSURL URLWithString:[command.arguments objectAtIndex:0]];
  NSURL *imageURL = [NSURL URLWithString:[command.arguments objectAtIndex:1]];
  NSString* title =[NSString stringWithString:[command.arguments objectAtIndex:2]];
  NSString* description =[NSString stringWithString:[command.arguments objectAtIndex:3]];
  CDVPluginResult* pluginResult = nil;

  id<GPPShareBuilder> shareBuilder = [[GPPShare sharedInstance] shareDialog];

  // Подставляются заголовок, описание, эскиз и ссылка,
  // связанные с передаваемым URL.
  if(sourceURL) [shareBuilder setURLToShare:sourceURL];
  // Вручную подставим заголовок, описание и эскиз
  // для передаваемого контента.
  [shareBuilder setTitle:title
             description:description
            thumbnailURL:imageURL];

  [shareBuilder open];

  //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"GPlus not available"];

  pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

@end
