#import "UpdateItemViewController.h"

@implementation UpdateItemViewController

- (void)viewDidLoad
{
    [self updateFields];
}

- (void)updateFields
{
    [self.itemNameField setText:self.item.name];
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
    [self.item setName:self.itemNameField.text];
    [self.delegate processObject:self.item];
    [self closeViewController];
}

@end
