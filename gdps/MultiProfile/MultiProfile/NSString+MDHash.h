//
//  NSString+MDHash.h
//  MultiProfile
//
//  Created by Full Name on 9/19/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MyAdditions)
- (float)md5;
-(NSString*)stringByEncodingHex;
-(NSString*)stringByDecodingHex;
@end
