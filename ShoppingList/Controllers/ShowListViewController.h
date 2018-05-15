#import <UIKit/UIKit.h>

@interface ShowListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic) NSMutableArray *list;
@property(nonatomic) IBOutlet UITableView *tableView;

@end
