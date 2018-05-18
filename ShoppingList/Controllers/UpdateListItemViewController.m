#import "Item.h"
#import "ItemListPersistence.h"
#import "UpdateListItemViewController.h"

@implementation UpdateListItemViewController

- (void)viewDidLoad
{
    [self loadItemsList];
}

- (void)loadItemsList
{
    self.itemsList = [ItemListPersistence loadItemListFromFile:@"items_list.dat"];
}

- (IBAction)cancelItemUpdateAndClose
{
    [self closeViewController];
}

- (void)closeViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveItemAndClose
{
    NSInteger row = [self.itemPicker selectedRowInComponent:0];
    ListItem *selectedItem = (ListItem *)[self.itemsList objectAtIndex:row];

    [self.listItem setName:selectedItem.name];
    [self.listItem setAmount:self.amountField.text];
    [self.delegate processObject:self.listItem];
    [self closeViewController];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)view
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.itemsList count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    Item *item = (Item *)self.itemsList[row];
    return item.name;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
