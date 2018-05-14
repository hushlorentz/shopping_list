#import <UIKit/UIKit.h>

#import "ProcessObjectProtocol.h"

@interface ItemsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ProcessObjectProtocol>

@property(nonatomic) NSMutableArray *itemList;
@property(nonatomic) IBOutlet UITableView *tableView;

@end

