#import <Google/Analytics.h>
#import "GAIDictionaryBuilder+GAIDictionaryBuilder_Dictionary.h"

@implementation GAIDictionaryBuilder (GAIDictionaryBuilder_Dictionary)

- (NSDictionary*)buildDict {
    return self.build;
}

@end
