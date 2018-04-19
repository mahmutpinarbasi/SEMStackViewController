//
//  SEMStackContentView.h
//  SEMStackViewController
//
//  Created by Sem0043 on 19/04/2018.
//  Copyright © 2018 mahmutpinarbasi. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  SEMStackContentView
 *  The view that's subview of `SEMStackViewController` where each view controller's view is shown horizontally.
 *  If any other views added to this view, unexpected behaviours might happen. Thus, developer responsible to make sure the UIViewController's view, which is SEMStackViewController's child view controller, is added
 *  `SEMStackContentView` as a subview.
 *
 *  It's not scrollable. It may have unlimited number of UIView's. However only the last added subview's user interaction enabled.
 */
@interface SEMStackContentView : UIView


@end
