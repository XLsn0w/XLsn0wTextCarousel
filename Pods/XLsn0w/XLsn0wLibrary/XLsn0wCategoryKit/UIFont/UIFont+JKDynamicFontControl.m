//
//  UIFont+DynamicFontControl.m
//
//  Created by Michael Kral on 10/28/13.
//  Copyright (c) 2013 Michael Kral. All rights reserved.
//

#import "UIFont+JKDynamicFontControl.h"

@implementation UIFont (JKDynamicFontControl)

+(UIFont *)jk_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName{
    return [UIFont jk_preferredFontForTextStyle:style withFontName:fontName scale:1.0f];
}

+(UIFont *)jk_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName scale:(CGFloat)scale{
    
    
    UIFont * font = nil;
    if([[UIFont class] resolveClassMethod:@selector(preferredFontForTextStyle:)]){
        font = [UIFont preferredFontForTextStyle:fontName];
    }else{
        font = [UIFont fontWithName:fontName size:14 * scale];
    }
    
    
    return [font jk_adjustFontForTextStyle:style];

}

-(UIFont *)jk_adjustFontForTextStyle:(NSString *)style{
    return [self jk_adjustFontForTextStyle:style scale:1.0f];
}

-(UIFont *)jk_adjustFontForTextStyle:(NSString *)style scale:(CGFloat)scale{
    
    UIFontDescriptor * fontDescriptor = nil;
    
    if([[UIFont class] resolveClassMethod:@selector(preferredFontForTextStyle:)]){
        
        fontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:style];
        
    }else{
        
        fontDescriptor = self.fontDescriptor;
        
    }
    
    float dynamicSize = [fontDescriptor pointSize] * scale + 3;
    
    return [UIFont fontWithName:self.fontName size:dynamicSize];
    
}

@end
