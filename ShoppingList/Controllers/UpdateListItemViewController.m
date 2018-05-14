#import "Item.h"
#import "ItemListPersistence.h"
#import "UpdateListItemViewController.h"

@implementation UpdateListItemViewController

- (void)viewDidLoad
{
    [self loadItemsList];
    [self updateFields];
}

- (void)loadItemsList
{
    self.itemsList = [ItemListPersistence loadItemListFromFile:@"items_list.dat"];
}

- (void)updateFields
{
    //[self.itemNameField setText:self.item.name];
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
    //[self.item setName:self.itemNameField.text];
    //[self.delegate processObject:self.item];
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

@end
