#import <UIKit/UIKit.h>
#import "ProcessObjectProtocol.h"

@interface ListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ProcessObjectProtocol>

@property(nonatomic) NSMutableArray *listItemList;
@property(nonatomic) IBOutlet UITableView *tableView;

@end
