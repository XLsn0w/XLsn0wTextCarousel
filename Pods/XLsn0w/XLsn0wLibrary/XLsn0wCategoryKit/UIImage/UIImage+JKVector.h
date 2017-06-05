


/**
 *  @Author(作者)         David Keegan
 *
 *  @URL(地址)            https://github.com/kgn/UIImage-Vector
 *
 *  @Version(版本)        20150620
 *
 *  @Requirements(运行要求)
 *
 *  @Description(描述)    UIImage category for dealing with vector formats like PDF and icon fonts.
 *  @Usage(使用) .. 
 */

#import <UIKit/UIKit.h>

@interface UIImage(JKVector)

/**
 Create a UIImage from an icon font.
 @param font The icon font.
 @param iconNamed The name of the icon in the font.
 @param tintColor The tint color to use for the icon. Defaults to black.
 @param clipToBounds If YES the image will be clipped to the pixel bounds of the icon.
 @param fontSize The font size to draw the icon at.
 @return The resulting image.
 */
+ (UIImage *)jk_iconWithFont:(UIFont *)font named:(NSString *)iconNamed
            withTintColor:(UIColor *)tintColor clipToBounds:(BOOL)clipToBounds forSize:(CGFloat)fontSize;

/**
 Create a UIImage from a PDF icon.
 @param pdfNamed The name of the PDF file in the application's resources directory.
 @param height The height of the resulting image, the width will be based on the aspect ratio of the PDF.
 @return The resulting image.
 */
+ (UIImage *)jk_imageWithPDFNamed:(NSString *)pdfNamed forHeight:(CGFloat)height;

/**
 Create a UIImage from a PDF icon.
 @param pdfNamed The name of the PDF file in the application's resources directory.
 @param tintColor The tint color to use for the icon. If nil no tint color will be used.
 @param height The height of the resulting image, the width will be based on the aspect ratio of the PDF.
 @return The resulting image.
 */
+ (UIImage *)jk_imageWithPDFNamed:(NSString *)pdfNamed withTintColor:(UIColor *)tintColor forHeight:(CGFloat)height;

/**
 Create a UIImage from a PDF icon.
 @param pdfFile The path of the PDF file.
 @param tintColor The tint color to use for the icon. If nil no tint color will be used.
 @param size The maximum size the resulting image can be. The image will maintain it's aspect ratio and may not encumpas the full size.
 @return The resulting image.
 */
+ (UIImage *)jk_imageWithPDFFile:(NSString *)pdfFile withTintColor:(UIColor *)tintColor forSize:(CGSize)size;

@end
