//
//  GameUtil.m
//  AiLaTrieuPhu_
//
//  Created by Phan Thanh Cong on 12/9/12.
//  Copyright (c) 2012 Phan Thanh Cong. All rights reserved.
//

#import "GameUtil.h"
#import "Question.h"
#import "Answer.h"

@implementation GameUtil

+ (NSMutableArray *) getQuestionFromPlist
{
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    NSArray *data = [[NSArray alloc] initWithContentsOfFile:dataPath];
    
    NSMutableArray *questionArray = [[NSMutableArray alloc] init];
    
    for(id object in data) {
        
        Question *question = [[Question alloc] initWithQuestionText:[object objectForKey:@"text"]];
        
        NSMutableDictionary *temp = [object objectForKey:@"answers"];
        NSMutableArray *answers = [[NSMutableArray alloc] init];
        for(id aObject in temp) {
            
            NSNumber *isCorrect = [aObject objectForKey:@"isCorrect"];
            Answer *answer = [[Answer alloc] initWithAnswerText:[aObject objectForKey:@"text"]
                                                   andIsCorrect:[isCorrect boolValue]];
            
            [answers addObject:answer];
        }
        temp = nil;
        
        temp = [[NSMutableDictionary alloc] init];
        [temp setValue:question forKey:@"question"];
        [temp setValue:answers forKey:@"answers"];
        
        [questionArray addObject:temp];
    }
    return questionArray;
}
+ (NSArray *) getRandomFromData:(NSMutableArray *)data withQuanlity:(NSInteger)number
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    int count = [data count];
    if(number > count) {
        number = count;
    }
    for(int i = 0; i < number; i ++) {
        int rand = arc4random() % number ;
        [array addObject: [data objectAtIndex:rand]];
        
        [data exchangeObjectAtIndex:rand withObjectAtIndex:count-1];
        count--;
        
    }
    return array;
}
@end




