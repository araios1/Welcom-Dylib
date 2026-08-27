#import <UIKit/UIKit.h>

%hook UIApplication

- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig;

    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"بەخێربێیت!"
                                                                      message:@"ئەم ئەپە گەشەپێدراوە لەلایەن as dev"
                                                               preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"باشە" 
                                                           style:UIAlertActionStyleDefault 
                                                         handler:nil];
        [alert addAction:okAction];

        UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        while (rootViewController.presentedViewController) {
            rootViewController = rootViewController.presentedViewController;
        }

        [rootViewController presentViewController:alert animated:YES completion:nil];
    });
}

%end
