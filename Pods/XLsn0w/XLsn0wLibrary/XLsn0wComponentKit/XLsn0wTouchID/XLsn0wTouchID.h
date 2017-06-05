

@import Foundation;
@import LocalAuthentication;

/**
 *  Touch result enum
 */
typedef NS_ENUM(NSInteger, TouchIDResult) {
    /**
     *  Success
     */
    TouchIDResultSuccess = 0,
    /**
     *  Generic error
     */
    TouchIDResultError,
    /**
     *  Authentication failed
     */
    TouchIDResultAuthenticationFailed,
    /**
     *  User cancel
     */
    TouchIDResultUserCancel,
    /**
     *  User fallback
     */
    TouchIDResultUserFallback,
    /**
     *  System cancel
     */
    TouchIDResultSystemCancel,
    /**
     *  Passcode not set
     */
    TouchIDResultPasscodeNotSet,
    /**
     *  Not available
     */
    TouchIDResultNotAvailable,
    /**
     *  Not enrolled
     */
    TouchIDResultNotEnrolled
} NS_ENUM_AVAILABLE_IOS(8_0);

/**
 *  This class adds some useful methods to use TouchID
 */
NS_CLASS_AVAILABLE_IOS(8_0) @interface XLsn0wTouchID : NSObject

/**
 *  Shows the TouchID alert
 *
 *  @param reason     Text to show in the alert
 *  @param completion Completion handler. It returns the TouchID result, from the TouchIDResult enum
 */
+ (void)showTouchIDAuthenticationWithReason:(NSString * _Nonnull)reason
                                 completion:(void (^ _Nullable)(TouchIDResult result))completion;

/**
 *  Shows the TouchID alert
 *
 *  @param reason        Text to show in the alert
 *  @param fallbackTitle Default title "Enter Password" is used when this property is left nil. If set to empty string, the button will be hidden
 *  @param completion    Completion handler. It returns the TouchID result, from the TouchIDResult enum
 */
+ (void)showTouchIDAuthenticationWithReason:(NSString * _Nonnull)reason
                              fallbackTitle:(NSString * _Nullable)fallbackTitle
                                 completion:(void (^ _Nullable)(TouchIDResult result))completion;

@end
