//
//  ViewController.m
//  UiPageControllerApp
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "PageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pageImage = @[@"one",@"two",@"three",@"four"];
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageviewcontroller"];
    self.pageViewController.dataSource = self;
    
    PageViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageViewController*) viewController).pageIndex;
    index++;
    if (index == [self.pageImage count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

-(PageViewController*)viewControllerAtIndex:(NSUInteger)index
{
   
    
    PageViewController* pageContentviewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pagecontentcontroller"];
    
    pageContentviewController.imageFile = self.pageImage[index];
    
    pageContentviewController.pageIndex = index;
    
    return pageContentviewController;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageImage count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


- (IBAction)login:(id)sender {
}

- (IBAction)register:(id)sender {
}
@end
