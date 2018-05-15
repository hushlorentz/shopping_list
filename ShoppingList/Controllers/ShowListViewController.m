#import "ItemListPersistence.h"
#import "ListItem.h"
#import "ShowListViewController.h"

@implementation ShowListViewController

- (void)viewDidLoad
{
  self.list = [[NSMutableArray alloc] initWithArray:[ItemListPersistence loadItemListFromFile:@"list.dat"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    ListItem *cellItem = (ListItem *)self.list[[indexPath row]];
    NSString *cellText = [NSString stringWithFormat:@"%@ - %@", cellItem.amount, cellItem.name];
    
    [cell.textLabel setText:cellText];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.list removeObjectAtIndex:[indexPath row]];
    [self.tableView reloadData];
}

- (IBAction)closeViewController
{
     [self dismissViewControllerAnimated:YES completion:nil];
}

@end
