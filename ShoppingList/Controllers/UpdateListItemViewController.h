#import <UIKit/UIKit.h>
#import "ListItem.h"
#import "ProcessObjectProtocol.h"

@interface UpdateListItemViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic) ListItem *listItem;
@property(nonatomic) NSArray *itemsList;
@property(nonatomic) IBOutlet UIPickerView *itemPicker;
@property(nonatomic) IBOutlet UITextField *amountField;
@property(nonatomic) id<ProcessObjectProtocol> delegate;

@end
