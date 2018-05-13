#import "Item.h"
#import "ItemsViewController.h"
#import "UpdateItemViewController.h"

@implementation ItemsViewController

- (void)viewDidLoad
{
    self.itemList = [[NSMutableArray alloc] init];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Item *item = [[Item alloc] init];
    UpdateItemViewController *destinationViewController = [segue destinationViewController];
    
    destinationViewController.item = item;
    destinationViewController.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.itemList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    Item *cellItem = (Item *)self.itemList[[indexPath row]];
    NSString *cellText = cellItem.name;
    
    [cell.textLabel setText:cellText];
    
    return cell;
}

- (void)processObject:(id)object
{
    [self addNewItem:(Item *)object];
    [self sortItemList];
    [self.tableView reloadData];
}

- (void)addNewItem:(Item *)item
{
    if ([self.itemList indexOfObject:item] == NSNotFound)
    {
        [self.itemList addObject:item];
    }
}

- (void)sortItemList
{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    self.itemList = [NSMutableArray arrayWithArray:[self.itemList sortedArrayUsingDescriptors:@[sort]]];
}

@end