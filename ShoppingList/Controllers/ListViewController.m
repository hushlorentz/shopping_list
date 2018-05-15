#import "ItemListPersistence.h"
#import "ListViewController.h"
#import "UpdateListItemViewController.h"

@implementation ListViewController

NSString *listFileName = @"list.dat";

- (void)viewDidLoad
{
    self.listItemList = [NSMutableArray arrayWithArray:[ItemListPersistence loadItemListFromFile:listFileName]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"UpdateListItemSegue"])
    {
        ListItem *listItem = [[ListItem alloc] init];
        UpdateListItemViewController *destinationViewController = [segue destinationViewController];
        
        destinationViewController.listItem = listItem;
        destinationViewController.delegate = self;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listItemList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    ListItem *cellItem = (ListItem *)self.listItemList[[indexPath row]];
    NSString *cellText = [NSString stringWithFormat:@"%@ - %@", cellItem.amount, cellItem.name];
    
    [cell.textLabel setText:cellText];
    
    return cell;
}

- (void)processObject:(id)object
{
    [self addNewItem:(ListItem *)object];
    [self sortItemList];
    [self.tableView reloadData];
}

- (void)addNewItem:(ListItem *)listItem
{
    [self.listItemList addObject:listItem];
    [self saveListItems];
}

- (void)saveListItems
{
    [ItemListPersistence saveItemList:self.listItemList toFile:listFileName];
}

- (void)sortItemList
{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    self.listItemList = [NSMutableArray arrayWithArray:[self.listItemList sortedArrayUsingDescriptors:@[sort]]];
}

- (IBAction)clearList
{
    [self.listItemList removeAllObjects];
    [self.tableView reloadData];
    [self saveListItems];
}

@end
