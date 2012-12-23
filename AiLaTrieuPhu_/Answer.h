//
//  Answer.h
//  AiLaTrieuPhu_
//
//  Created by Phan Thanh Cong on 12/8/12.
//  Copyright (c) 2012 Phan Thanh Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answer : NSObject
@property (nonatomic, retain) NSString *answerText;
@property (nonatomic, assign) Boolean isCorrect;
- (id) initWithAnswerText:(NSString *)_answerText andIsCorrect:(Boolean) _isCorrect;
@end
