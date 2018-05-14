#import <UIKit/UIKit.h>
#import "ProcessObjectProtocol.h"

@interface UpdateListItemViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic) NSArray *itemsList;
@property(nonatomic) IBOutlet UIPickerView *itemPicker;
@property(nonatomic) id<ProcessObjectProtocol> delegate;

@end
