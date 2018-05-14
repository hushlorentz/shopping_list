#import "ListViewController.h"
#import "UpdateListItemViewController.h"

@implementation ListViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Item *item = [[Item alloc] init];
    UpdateListItemViewController *destinationViewController = [segue destinationViewController];
    
    //destinationViewController.item = item;
    destinationViewController.delegate = self;
}

- (void)processObject:(id)object
{
}

@end
