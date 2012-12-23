//
//  Question.h
//  AiLaTrieuPhu_
//
//  Created by Phan Thanh Cong on 12/8/12.
//  Copyright (c) 2012 Phan Thanh Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
@property (nonatomic, retain) NSString *questionText;
- (id) initWithQuestionText:(NSString *) _questionText;
@end
