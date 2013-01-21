//
//  STViewController.m
//  STUIImageScalingTestcase
//
//  Copyright (c) 2013 Scott Talbot. All rights reserved.
//

#import "STViewController.h"


@interface STViewController ()
@property (nonatomic,strong,readonly) UIImageView *imageViewNonretinaRaw;
@property (nonatomic,strong,readonly) UIImageView *imageViewRetinaRaw;

@property (nonatomic,strong,readonly) UIImageView *imageViewNonretinaScaleAspectFit;
@property (nonatomic,strong,readonly) UIImageView *imageViewRetinaScaleAspectFit;
@property (nonatomic,strong,readonly) UIImageView *imageViewNonretinaTop;
@property (nonatomic,strong,readonly) UIImageView *imageViewRetinaTop;
@property (nonatomic,strong,readonly) UIImageView *imageViewNonretinaCenter;
@property (nonatomic,strong,readonly) UIImageView *imageViewRetinaCenter;
@end


@implementation STViewController

- (void)loadView {
	self.view = [[UIView alloc] initWithFrame:(CGRect){ .size = { .width = 768, .height = 1024 } }];
	UIView * const view = self.view;
	view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;

	view.backgroundColor = [UIColor whiteColor];

	CGSize const imageViewSize = (CGSize){ .width = 173, .height = 49 };

	{
		CGPoint const origin = (CGPoint){ .x = 10, .y = 10 };
		UIImageView * const imageView = [[UIImageView alloc] initWithFrame:(CGRect){ .origin = origin, .size = { .width =imageViewSize.width * 2, .height = imageViewSize.height * 2 } }];
		imageView.autoresizingMask = UIViewAutoresizingNone;
		imageView.contentMode = UIViewContentModeTopLeft;
		imageView.clipsToBounds = YES;
		imageView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:.2f];
		_imageViewNonretinaRaw = imageView;
	}
	[view addSubview:_imageViewNonretinaRaw];

	{
		CGPoint const origin = (CGPoint){ .x = 10 + 173*2 + 10, .y = 10 };
		UIImageView * const imageView = [[UIImageView alloc] initWithFrame:(CGRect){ .origin = origin, .size = { .width =imageViewSize.width * 2, .height = imageViewSize.height * 2 } }];
		imageView.autoresizingMask = UIViewAutoresizingNone;
		imageView.contentMode = UIViewContentModeTopLeft;
		imageView.clipsToBounds = YES;
		imageView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:.2f];
		_imageViewRetinaRaw = imageView;
	}
	[view addSubview:_imageViewRetinaRaw];

	{
		CGPoint const origin = (CGPoint){ .x = 10, .y = 10 + 49*2 + 10 };
		UIImageView * const imageView = [[UIImageView alloc] initWithFrame:(CGRect){ .origin = origin, .size = imageViewSize }];
		imageView.autoresizingMask = UIViewAutoresizingNone;
		imageView.contentMode = UIViewContentModeScaleAspectFit;
		imageView.clipsToBounds = YES;
		imageView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:.2f];
		_imageViewNonretinaScaleAspectFit = imageView;
	}
	[view addSubview:_imageViewNonretinaScaleAspectFit];

	{
		CGPoint const origin = (CGPoint){ .x = 10 + 173*2 + 10, .y = 10 + 49*2 + 10 };
		UIImageView * const imageView = [[UIImageView alloc] initWithFrame:(CGRect){ .origin = origin, .size = imageViewSize }];
		imageView.autoresizingMask = UIViewAutoresizingNone;
		imageView.contentMode = UIViewContentModeScaleAspectFit;
		imageView.clipsToBounds = YES;
		imageView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:.2f];
		_imageViewRetinaScaleAspectFit = imageView;
	}
	[view addSubview:_imageViewRetinaScaleAspectFit];

	{
		CGPoint const origin = (CGPoint){ .x = 10, .y = 10 + 49*2 + (10 + 49) * 1 + 10 };
		UIImageView * const imageView = [[UIImageView alloc] initWithFrame:(CGRect){ .origin = origin, .size = imageViewSize }];
		imageView.autoresizingMask = UIViewAutoresizingNone;
		imageView.contentMode = UIViewContentModeTop;
		imageView.clipsToBounds = YES;
		imageView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:.2f];
		_imageViewNonretinaTop = imageView;
	}
	[view addSubview:_imageViewNonretinaTop];

	{
		CGPoint const origin = (CGPoint){ .x = 10 + 173*2 + 10, .y = 10 + 49*2 + (10 + 49) * 1 + 10 };
		UIImageView * const imageView = [[UIImageView alloc] initWithFrame:(CGRect){ .origin = origin, .size = imageViewSize }];
		imageView.autoresizingMask = UIViewAutoresizingNone;
		imageView.contentMode = UIViewContentModeTop;
		imageView.clipsToBounds = YES;
		imageView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:.2f];
		_imageViewRetinaTop = imageView;
	}
	[view addSubview:_imageViewRetinaTop];

	{
		CGPoint const origin = (CGPoint){ .x = 10, .y = 10 + 49*2 + (10 + 49) * 2 + 10 };
		UIImageView * const imageView = [[UIImageView alloc] initWithFrame:(CGRect){ .origin = origin, .size = imageViewSize }];
		imageView.autoresizingMask = UIViewAutoresizingNone;
		imageView.contentMode = UIViewContentModeCenter;
		imageView.clipsToBounds = YES;
		imageView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.2f];
		_imageViewNonretinaCenter = imageView;
	}
	[view addSubview:_imageViewNonretinaCenter];

	{
		CGPoint const origin = (CGPoint){ .x = 10 + 173*2 + 10, .y = 10 + 49*2 + (10 + 49) * 2 + 10 };
		UIImageView * const imageView = [[UIImageView alloc] initWithFrame:(CGRect){ .origin = origin, .size = imageViewSize }];
		imageView.autoresizingMask = UIViewAutoresizingNone;
		imageView.contentMode = UIViewContentModeCenter;
		imageView.clipsToBounds = YES;
		imageView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.2f];
		_imageViewRetinaCenter = imageView;
	}
	[view addSubview:_imageViewRetinaCenter];
}

- (void)viewDidLoad {
	[super viewDidLoad];

	NSString * const imagePath = [[NSBundle mainBundle] pathForResource:@"testcase" ofType:@"png"];

	{
		UIImage * const nonretinaImage = [UIImage imageWithContentsOfFile:imagePath];

		_imageViewNonretinaRaw.image = nonretinaImage;
		_imageViewNonretinaScaleAspectFit.image = nonretinaImage;
		_imageViewNonretinaTop.image = nonretinaImage;
		_imageViewNonretinaCenter.image = nonretinaImage;
	}

	{
		UIImage * const retinaImage = ({
			CGDataProviderRef cgimageDataProvider = CGDataProviderCreateWithFilename([imagePath fileSystemRepresentation]);
			CGImageRef cgimage = CGImageCreateWithPNGDataProvider(cgimageDataProvider, NULL, YES, kCGRenderingIntentDefault);
			CFRelease(cgimageDataProvider);
			UIImage * const image = [[UIImage alloc] initWithCGImage:cgimage scale:2 orientation:UIImageOrientationUp];
			CFRelease(cgimage);
			image;
		});

		_imageViewRetinaRaw.image = retinaImage;
		_imageViewRetinaScaleAspectFit.image = retinaImage;
		_imageViewRetinaTop.image = retinaImage;
		_imageViewRetinaCenter.image = retinaImage;
	}
}

@end
