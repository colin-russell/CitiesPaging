//
//  ViewController.m
//  CitiesPaging
//
//  Created by Colin on 2018-04-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak)UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScrollView];
    [self setupScrollViewContent];
    [self setupPageControl];
}

- (void)setupScrollView {
    UIScrollView *scrollView = [UIScrollView new];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:
     @[
       [scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
       [scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
       [scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
       [scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
       ]
     ];
}

- (void)setupScrollViewContent {
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"toronto.jpg"]];
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    imageView1.clipsToBounds = YES;
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"montreal.jpg"]];
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    imageView2.clipsToBounds = YES;
    [self.scrollView addSubview:imageView1];
    [self.scrollView addSubview:imageView2];
    imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    imageView2.translatesAutoresizingMaskIntoConstraints = NO;
    
    // size anchors
    [NSLayoutConstraint activateConstraints:
     @[
       [imageView1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
       [imageView2.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
       [imageView1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
       [imageView2.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
       ]
     ];
    
    // pin the edges
    [NSLayoutConstraint activateConstraints:
     @[
       [imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
       [imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
       [imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor],
       [imageView2.leadingAnchor constraintEqualToAnchor:imageView1.trailingAnchor],
       [imageView2.topAnchor constraintEqualToAnchor:imageView1.topAnchor],
       [imageView2.bottomAnchor constraintEqualToAnchor:imageView1.bottomAnchor],
       [imageView2.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor]
       ]
     ];
}

- (void)setupPageControl {
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
    self.pageControl.layer.zPosition = 10;
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:
     @[
       [self.pageControl.heightAnchor constraintEqualToConstant:30],
       [self.pageControl.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
       [self.pageControl.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
       [self.pageControl.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
       ]
     ];
    self.pageControl.alpha = .5;
    self.pageControl.backgroundColor = [UIColor blackColor];
    self.pageControl.numberOfPages = 2;
    // you need to setup the pageControl to show which page you are on (targetAction)
}


@end
