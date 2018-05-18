#import <UIKit/UIKit.h>
#import "Item.h"
#import "ProcessObjectProtocol.h"

@interface UpdateItemViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic) Item *item;
@property(nonatomic) IBOutlet UITextField *itemNameField;
@property(nonatomic) id<ProcessObjectProtocol> delegate;

@end
