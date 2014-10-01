//
//  GPlus.h

#import <Cordova/CDV.h>
#import <GooglePlus/GPPShare.h>
#import <GooglePlus/GPPSignIn.h>

@interface GPlus : CDVPlugin
{
    NSString*     clientId;
}

@property (nonatomic, retain) NSString*     clientId;

- (void)initGPlus:(CDVInvokedUrlCommand*)command;;
- (void)share:(CDVInvokedUrlCommand*)command;


@end
