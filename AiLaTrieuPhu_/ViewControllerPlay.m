//
//  ViewControllerPlay.m
//  AiLaTrieuPhu_
//
//  Created by Phan Thanh Cong on 12/9/12.
//  Copyright (c) 2012 Phan Thanh Cong. All rights reserved.
//

#import "ViewControllerPlay.h"
#import "GameUtil.h"
#import "Question.h"
#import "Answer.h"

#define NUMBER_OF_QUESTION_PER_GAME 5

@interface ViewControllerPlay ()
{
    int _correctCounter;
    int _questionStNumber;
    NSMutableArray *_questionArray;     // original
    NSArray *_questionRandom;           // questions random from original data
    NSDictionary *_currentQuestion;     // question with answers
    NSMutableArray *_answers;           // answers
    
    UIView *_optionsView;               //
    UIButton *_curentOptionClicked;      //
      
}
@end

@implementation ViewControllerPlay

@synthesize lbQuestion;
@synthesize lbQuestionStNumber;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        _questionStNumber = 0;
        _correctCounter = 0;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _questionArray = [GameUtil getQuestionFromPlist];
    [self loadRandomQuestionsForGame];
    [self loadQuestionForSt:_questionStNumber];
}

- (void) loadRandomQuestionsForGame
{
    _questionRandom = [GameUtil getRandomFromData:_questionArray withQuanlity:NUMBER_OF_QUESTION_PER_GAME];
}
- (void) finishGame
{
    NSString *mesage = [NSString stringWithFormat:@"Bạn trả lời đúng %d/%d câu hỏi", _correctCounter, [_questionRandom count]];
                        
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Finish"
                                                        message:mesage
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
    
}
- (void) nextQuestion
{
    _questionStNumber++;
    [self loadQuestionForSt:_questionStNumber];
}
- (void) loadQuestionForSt: (NSInteger) number
{
    // check hết câu hỏi thì finish
    if(number > [_questionRandom count] - 1)
    {
        [self finishGame];
        return;
    }
    // NSDictionary
    _currentQuestion = [_questionRandom objectAtIndex:_questionStNumber];
    
    Question *question = [_currentQuestion objectForKey:@"question"];
    lbQuestion.text = [question questionText];
    lbQuestionStNumber.text = [NSString stringWithFormat:@"%d/%d", _questionStNumber + 1, NUMBER_OF_QUESTION_PER_GAME];
    
    _answers = [_currentQuestion objectForKey:@"answers"];    
    [self drawOptions];
}
// Hiển thị các lựa chọn
- (void) drawOptions
{
    _optionsView = [[UIView alloc] initWithFrame:CGRectMake(0, 120, self.view.bounds.size.width, 250)];
    [_optionsView setBackgroundColor:[UIColor grayColor]];
    for( int i = 0; i < [_answers count]; i ++)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, (i+1)*40, self.view.bounds.size.width-100, 30)];
        [button setBackgroundColor:[UIColor greenColor]];
        [button setTag:i+1];
        [button addTarget:self action:@selector(optionPressed:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blackColor] forState:(UIControlState) UIControlStateNormal];
        
        Answer *answer = [_answers objectAtIndex:i];
        [button setTitle:[answer answerText] forState:(UIControlState)UIControlStateNormal];
        
        [_optionsView addSubview:button];
    }
    [self.view addSubview:_optionsView];

}
- (IBAction)optionPressed:(id)sender
{
    _curentOptionClicked = (UIButton *)sender;
    
    for( int i = 0; i < [_answers count]; i ++)
    {
        UIView *button = [_optionsView viewWithTag:i+1];
        [button setBackgroundColor:[UIColor greenColor]];
    }
    [_curentOptionClicked setBackgroundColor:[UIColor redColor]];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Confirm"
                                                        message:@"Are you sure? "
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Ok", nil];
    [alertView show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // click Ok
    if(buttonIndex == 1)
    {
        Answer *answer = [_answers objectAtIndex:[_curentOptionClicked tag]-1];
        if([answer isCorrect] == TRUE) {
            _correctCounter++;
            NSLog(@"Ok");
        }
        [self nextQuestion];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finishPressed:(id)sender
{
    [self finishGame];
}
- (IBAction)replayPressed:(id)sender
{
    [self loadRandomQuestionsForGame]; // load random question
    _questionStNumber = 0;
    _correctCounter = 0;
    [self loadQuestionForSt:_questionStNumber];
}

- (IBAction)nextPressed:(id)sender
{
    [self nextQuestion];
}

@end
