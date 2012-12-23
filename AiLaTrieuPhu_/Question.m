//
//  Question.m
//  AiLaTrieuPhu_
//
//  Created by Phan Thanh Cong on 12/8/12.
//  Copyright (c) 2012 Phan Thanh Cong. All rights reserved.
//

#import "Question.h"

@implementation Question
@synthesize questionText;
- (id) initWithQuestionText:(NSString *) _questionText
{
    if(self = [super init]) {
        self.questionText = _questionText;
    }
    return self;
}
@end
