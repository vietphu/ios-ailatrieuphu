//
//  GameUtil.h
//  AiLaTrieuPhu_
//
//  Created by Phan Thanh Cong on 12/9/12.
//  Copyright (c) 2012 Phan Thanh Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameUtil : NSObject
+ (NSMutableArray *) getQuestionFromPlist;
+ (NSArray *) getRandomFromData:(NSMutableArray *)data withQuanlity:(NSInteger) number;
@end
