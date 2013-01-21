//
//  STViewController.m
//  STUIImageScalingTestcase
//
//  Copyright (c) 2013 Scott Talbot. All rights reserved.
//

#import "STViewController.h"


static CGSize CGSizeScale(CGSize size, CGFloat scale) {
	size.width *= scale;
	size.height *= scale;
	return size;
}


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
		NSDate *start = [NSDate date];
		UIImage *nonretinaImage = nil;
		NSUInteger const nIterations = 10000;
		for (NSUInteger i = 0; i < nIterations; ++i) {
			nonretinaImage = ({
				UIImage *image = nil;
				CGFloat scale = [[UIScreen mainScreen] scale];
				if (scale > 1) {;
					CGDataProviderRef cgimageDataProvider = CGDataProviderCreateWithFilename([imagePath fileSystemRepresentation]);
					CGImageRef cgimage = CGImageCreateWithPNGDataProvider(cgimageDataProvider, NULL, NO, kCGRenderingIntentDefault);
					CFRelease(cgimageDataProvider);
					image = [[UIImage alloc] initWithCGImage:cgimage scale:2 orientation:UIImageOrientationUp];
					CFRelease(cgimage);
				} else if (1) {
					CGDataProviderRef cgimageDataProvider = CGDataProviderCreateWithCFData((__bridge CFDataRef)[NSData dataWithContentsOfFile:imagePath options:NSDataReadingMappedIfSafe error:NULL]);
					CGImageRef cgimage = CGImageCreateWithPNGDataProvider(cgimageDataProvider, NULL, NO, kCGRenderingIntentDefault);
					CFRelease(cgimageDataProvider);
					CGSize const cgimageSize = (CGSize){ .width = CGImageGetWidth(cgimage), .height = CGImageGetHeight(cgimage) };
					CGSize const contextSize = CGSizeScale(cgimageSize, .5);
					UIGraphicsBeginImageContextWithOptions(contextSize, NO, 0);
					CGContextRef ctx = UIGraphicsGetCurrentContext();
					CGContextConcatCTM(ctx, (CGAffineTransform){ .a = 1, .d = -1, .ty = contextSize.height });
					CGContextSetInterpolationQuality(ctx, kCGInterpolationLow);
					CGContextDrawImage(ctx, (CGRect){ .size = contextSize }, cgimage);
					image = UIGraphicsGetImageFromCurrentImageContext();
					UIGraphicsEndImageContext();
					CFRelease(cgimage);
				} else if (1) {
					CGDataProviderRef cgimageDataProvider = CGDataProviderCreateWithCFData((__bridge CFDataRef)[NSData dataWithContentsOfFile:imagePath options:NSDataReadingMappedIfSafe error:NULL]);
					CGImageRef cgimage = CGImageCreateWithPNGDataProvider(cgimageDataProvider, NULL, NO, kCGRenderingIntentDefault);
					CFRelease(cgimageDataProvider);
					CGSize const cgimageSize = (CGSize){ .width = CGImageGetWidth(cgimage), .height = CGImageGetHeight(cgimage) };
					CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
					CGSize const contextSize = CGSizeScale(cgimageSize, .5);
					CGContextRef ctx = CGBitmapContextCreate(NULL, contextSize.width, contextSize.height, 8, contextSize.width*4, colorspace, kCGImageAlphaPremultipliedLast);
					CFRelease(colorspace);
					CGContextSetInterpolationQuality(ctx, kCGInterpolationLow);
					CGContextDrawImage(ctx, (CGRect){ .size = contextSize }, cgimage);
					CFRelease(cgimage);
					cgimage = CGBitmapContextCreateImage(ctx);
					CGContextRelease(ctx);
					image = [UIImage imageWithCGImage:cgimage scale:1 orientation:UIImageOrientationUp];
					CFRelease(cgimage);
				} else {
					UIImage *tmp = [UIImage imageWithContentsOfFile:imagePath];
					CGSize const contextSize = CGSizeScale(tmp.size, .5);
					UIGraphicsBeginImageContextWithOptions(contextSize, NO, 0);
					[tmp drawInRect:(CGRect){ .size = contextSize }];
					image = UIGraphicsGetImageFromCurrentImageContext();
					UIGraphicsEndImageContext();
				}
				image;
			});
		}
		NSDate *end = [NSDate date];
		NSTimeInterval duration = [end timeIntervalSinceDate:start];
		NSLog(@"duration: %f (%g)", duration, duration / nIterations);

		_imageViewNonretinaRaw.image = nonretinaImage;
		_imageViewNonretinaScaleAspectFit.image = nonretinaImage;
		_imageViewNonretinaTop.image = nonretinaImage;
		_imageViewNonretinaCenter.image = nonretinaImage;
	}

	{
		UIImage * const retinaImage = ({
			CGDataProviderRef cgimageDataProvider = CGDataProviderCreateWithFilename([imagePath fileSystemRepresentation]);
			CGImageRef cgimage = CGImageCreateWithPNGDataProvider(cgimageDataProvider, NULL, NO, kCGRenderingIntentDefault);
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
