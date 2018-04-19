//
//  SEMStackContentView.m
//  SEMStackViewController
//
//  Created by Sem0043 on 19/04/2018.
//  Copyright © 2018 mahmutpinarbasi. All rights reserved.
//

#import "SEMStackContentView.h"
@interface SEMStackContentView()
@end

@implementation SEMStackContentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = NO;
        self.opaque = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self layoutChildViewController];
}

- (void)addSubview:(UIView *)view{
    
    if (self.subviews.count>0) {
        // disable previous last view user interaction
        UIView * nextPassiveView = self.subviews[self.subviews.count-1];
        nextPassiveView.userInteractionEnabled = NO;
    }
    
    // enable next view user interaction.
    [super addSubview:view];
    
    
    /// set the new subview frame & view properties
    view.autoresizingMask = UIViewAutoresizingNone;
    NSArray * subviews = self.subviews;
    view.frame = [self frameForSubviewAtIndex:subviews.count-1];
}

- (void)willRemoveSubview:(UIView *)subview{
    [super willRemoveSubview:subview];
    if (self.subviews.count==1) {
        return;
    }
    
    // enable next view user interaction.
    UIView * nextActiveView = self.subviews[self.subviews.count-2];
    nextActiveView.userInteractionEnabled = YES;
}

#pragma mark - Private

/// layout subviews
- (void)layoutChildViewController{
    NSArray * subviews = self.subviews;
    for (NSInteger i=0; i<subviews.count; i++) {
        UIView * sub = subviews[i];
        sub.frame = [self frameForSubviewAtIndex:i];
    }
    
}

/// returns the frame for corresponding subview at index.
- (CGRect)frameForSubviewAtIndex:(NSInteger)index{
    if (index < 0) {
        NSAssert(NO, @"index cannot be smaller than 0");
    }
    
    CGFloat itemWidth = CGRectGetWidth(self.bounds)/self.subviews.count;
    return CGRectMake(index*itemWidth, 0, itemWidth, CGRectGetHeight(self.bounds));
}


@end
