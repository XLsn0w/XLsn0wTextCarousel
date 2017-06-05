//
//  MKMapView+MoveLogo.m
//  Shield
//
//  Created by Maciej Swic on 2013-07-08.
//  Released under the MIT license.
//

#import "MKMapView+JKMoveLogo.h"

@implementation MKMapView (JKMoveLogo)

- (void)jk_moveLogoByOffset:(CGPoint)offset {
    UIView* logo = [self jk_logo];
    
    logo.frame = CGRectOffset(logo.frame, offset.x, offset.y);
}

- (void)jk_moveLogoToPoint:(CGPoint)point {
    UIView* logo = [self jk_logo];
    
    logo.frame = CGRectMake(point.x, point.y, logo.frame.size.width, logo.frame.size.height);
}

- (UIView*)jk_logo {
    UIView* logo;
    
    //Google Maps
    for (UIView *subview in self.subviews) {
        if ([subview isMemberOfClass:[UIImageView class]]) {
            logo = (UIView*)subview;
            break;
        }
    }
    
    //If we're on Apple Maps, there is no UIImageView.
    if (!logo) {
        for (UIView *subview in self.subviews)
            if ([subview isKindOfClass:[UILabel class]]) {
                logo = (UIView*)subview;
                break;
            }
    }
    
    return logo;
}

@end
