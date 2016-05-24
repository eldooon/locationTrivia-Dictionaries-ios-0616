//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length;{
    
    NSString *lengthLocation = location[@"name"];;
    
    lengthLocation = [lengthLocation substringToIndex:MIN(length,[lengthLocation length])];
    
    return lengthLocation;
}
-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    
    NSMutableDictionary *mDictionary = [[NSMutableDictionary alloc]init];
    
    mDictionary[@"name"] = name;
    mDictionary[@"latitude"] = @(latitude);
    mDictionary[@"longitude"] = @(longitude);
    
    
    //    [mDictionary setObject:name forKey:@"name"];
    //    [mDictionary setObject:[NSNumber numberWithFloat:latitude] forKey:@"latitude"];
    //    [mDictionary setObject:[NSNumber numberWithFloat:longitude] forKey:@"longitude"];
    
    return mDictionary;
}
-(NSArray *)namesOfLocations:(NSArray *)locations{
    
    NSMutableArray *mLocation = [locations valueForKey:@"name"];
    
    return mLocation;
}
-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
    
    BOOL valid = NO;
    
    if ([dictionary objectForKey:@"name"] && [dictionary objectForKey:@"latitude"] && [dictionary objectForKey:@"longitude"] && [[dictionary allKeys]count] == 3){
        
        valid = YES;
    }
    
    return valid;
}
-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations{
    
    for (NSDictionary *key in locations){
        if ([key[@"name"] isEqual: name]){
            
            return key;
        }
    }
    
    return nil;
}

@end
