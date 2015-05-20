//
//  DecisionTree.m
//  ios-galaxyzoo
//
//  Created by Murray Cumming on 04/05/2015.
//  Copyright (c) 2015 Murray Cumming. All rights reserved.
//

#import "DecisionTree.h"
#import "DecisionTreeParser.h"
#import <Foundation/Foundation.h>

@interface DecisionTree () {
    NSMutableDictionary *_questions;

    //Make this writable, so we can change it in our implementation:
}

//We redeclare these properties here, without readonly,
//so we can set them at least once;
@property (nonatomic, copy) NSString *firstQuestionId;
@property (nonatomic, copy) DecisionTreeDiscussQuestion *discussQuestion;

@end

@implementation DecisionTree

- (DecisionTree *)init:(NSURL *)url
   withDiscussQuestion:(DecisionTreeDiscussQuestion *)discussQuestion;
{

    self = [super init];

    _questions = [[NSMutableDictionary alloc] init];

    //TODO: Use filename.
    //NSString *fullPath = @"Assets/DecisionTrees";
    //fullPath = [fullPath stringByAppendingString:filename];

    DecisionTreeParser *parser = [[DecisionTreeParser alloc]init:url
                                                        intoTree:self];
    if(![parser parse]) {
        return nil;
    }

    self.discussQuestion = discussQuestion;

    return self;
}

- (NSArray *)getAllQuestions {

    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:_questions.count];

    for (NSString *questionId in _questions) {
        //Apparently it's (now) OK to do this extra lookup due to some optimization:
        //See http://stackoverflow.com/a/12454766/1123654
        DecisionTreeQuestion *question = [_questions objectForKey:questionId];
        [result addObject:question];
    }

    return result;
}

- (DecisionTreeQuestion *) getQuestion:(NSString *)questionId {
    return [_questions objectForKey:questionId];
}

- (DecisionTreeQuestion *) getNextQuestion:(NSString *)questionId forAnswer:(NSString *)answerId {
    DecisionTreeQuestion *current = [self getQuestion:questionId];
    for (DecisionTreeQuestionAnswer *answer in current.answers) {
        if ([answer.answerId isEqualToString:answerId]) {
            NSString *leadsToQuestionId = answer.leadsToQuestionId;
            return [self getQuestion:leadsToQuestionId];
        }
    }

    return nil;
}

- (void)addQuestion:(DecisionTreeQuestion *)question {
    [_questions setObject:question
                   forKey:[question questionId]];

    if (!self.firstQuestionId) {
        self.firstQuestionId = question.questionId;
    }
}


- (BOOL)isDiscussQuestion:(NSString *)questionId {
    return [self.discussQuestion.questionId isEqualToString:questionId];
}

- (BOOL)isDiscussQuestionYesAnswer:(NSString *)answerId {
    return [self.discussQuestion.yesAnswerId isEqualToString:answerId];
}



@end
