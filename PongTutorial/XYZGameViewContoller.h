//
//  XYZGameViewContoller.h
//  PongTutorial
//
//  Created by Ismail El-Habbash on 07/12/2013.
//  Copyright (c) 2013 Ismail El-Habbash. All rights reserved.
//

#import <UIKit/UIKit.h>

int y;
int x;
int computerscoreNumber;
int playerScoreNumber;
@interface XYZGameViewContoller : UIViewController
{
    IBOutlet UIImageView *Ball;
    IBOutlet UIButton *StartButton;
    IBOutlet UIImageView * Player;
    IBOutlet UIImageView * Computer;
    IBOutlet UILabel *PlayerScore , *ComputerScore;
    IBOutlet UILabel *WinOrLose;
    IBOutlet UIButton *Exit;
    
    NSTimer *timer;
    
    
}
-(IBAction)StartButton:(id)sender;
-(void)BallMovement;
-(void)ComputerMovement;
-(void)Collision;


@end
