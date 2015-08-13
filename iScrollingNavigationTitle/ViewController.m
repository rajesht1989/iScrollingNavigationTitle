//
//  ViewController.m
//  iScrollingNavigationTitle
//
//  Created by Rajesh on 8/13/15.
//  Copyright (c) 2015 Org. All rights reserved.
//

#import "ViewController.h"
#import "ScrollableTitleView.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_isSingleBarButton)
    {
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:nil action:nil]];
        [self setTitle:@"Single Barbutton more long title case"];
    }
    else if([[self.navigationController viewControllers] count] >1)
    {
        [self.navigationItem setRightBarButtonItems:@[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil],[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:nil action:nil]]];
        [self setTitle:@"Multiple Barbuttons long title case"];
    }
    else
    {
        [self setTitle:@"Barbutton less"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController *controller = segue.destinationViewController ;
    [controller setIsSingleBarButton:[sender tag]];
}

@end

@interface UIViewController (ScrollableNavigation)

@end

@implementation UIViewController (ScrollableNavigation)

- (void)setTitle:(NSString *)title
{
    ScrollableTitleView *scrollView = [ScrollableTitleView titleViewWithFrame:self.navigationController.navigationBar.bounds andTitle:title];
    [self.navigationItem setTitleView:scrollView];
}
@end

