//
//  Answer.m
//  AiLaTrieuPhu_
//
//  Created by Phan Thanh Cong on 12/8/12.
//  Copyright (c) 2012 Phan Thanh Cong. All rights reserved.
//

#import "Answer.h"

@implementation Answer
@synthesize answerText;
@synthesize isCorrect;
- (id) initWithAnswerText:(NSString *)_answerText andIsCorrect:(Boolean) _isCorrect
{
    if(self = [super init]) {
        self.answerText = _answerText;
        self.isCorrect = _isCorrect;
    }
    return self;
}
@end
