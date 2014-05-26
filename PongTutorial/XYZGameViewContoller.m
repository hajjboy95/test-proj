//
//  XYZGameViewContoller.m
//  PongTutorial
//
//  Created by Ismail El-Habbash on 07/12/2013.
//  Copyright (c) 2013 Ismail El-Habbash. All rights reserved.
//

#import "XYZGameViewContoller.h"

@interface XYZGameViewContoller ()

@end

@implementation XYZGameViewContoller

-(void)Collision
{
    if (CGRectIntersectsRect(Ball.frame, Player.frame))
        {
            y = arc4random() %5;
            y=-y;
        }
    
    if (CGRectIntersectsRect(Ball.frame, Computer.frame))
    {
        y = arc4random() %5;
    }
}







-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch  *Drag = [[event allTouches] anyObject];
    Player.center =[ Drag locationInView:self.view];
    
    if (Player.center.y >520)
    {
        Player.center = CGPointMake(Player.center.x, 520);
    }
    if (Player.center.y<520)
    {
        Player.center = CGPointMake(Player.center.x, 520);
    }
    if (Player.center.x <36)
    {
        Player.center = CGPointMake(36, Player.center.y);
    }
    if (Player.center.x>284)
    {
        Player.center = CGPointMake(284, Player.center.y);
    }
    
}

/*
 When we press the start button What we want ot happen is that we want the button to move either in 
 my direction or my opponents direction . i.e we want it to be in a random direction!
 Now we will make the code for that.
 */


-(IBAction)StartButton:(id)sender
{
    StartButton.hidden  = YES;
    Exit.hidden = YES;
    //deterine the random number to make the ball omve in a random direction
    
   y = arc4random() % 11;
    y = y - 5;
    
    x = arc4random() %11;
    x = x-5;
    
    if (y==0)
        y=1;
    if (x==0)
        x=1;
 
    //We have set a timer to tick every 0.01 seconds and everytick that occurs it runs the code in
   //The selector which is the BallMovement.
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BallMovement) userInfo:Nil repeats:YES];
 
}


-(void)BallMovement
{
    [self Collision];
    [self ComputerMovement];
    //This gets the cordinats of the ball.As the ball movements the .x and .y have to change.
    
    Ball.center = CGPointMake(Ball.center.x + x, Ball.center.y + y);
    if (Ball.center.x <15 )
    {
        x= -x;
        
    }
    if (Ball.center.x >305)
    {
        x=-x;
    }
    if (Ball.center.y <15)
        y=-y;
    
    if (Ball.center.y >553)
    {
        y=-y;
    }
    
    
    
    /* 
     code thats exceucuted when the user scores,
     Also keeps track of the score so if the user reaches 10 then he wins!.
     */
    
    if (Ball.center.y<=0 && Ball.center.x>63 && Ball.center.x < 258)
    {
        playerScoreNumber++;
        PlayerScore.text = [NSString stringWithFormat:@"%i",playerScoreNumber];
        
        [timer invalidate ] ;
        StartButton.hidden = NO;
        
        Ball.center = CGPointMake(160, 249);
        Computer.center =CGPointMake(160, 32);
        
        if (playerScoreNumber == 10)
        {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text  = [NSString stringWithFormat:@"You Win!"];
            
        }
        
    }
    /*
     Code that exceutes of the computer scores,
     Also keeps track if the computers score
     */
    
    if (Ball.center.y >=553 && Ball.center.x>=63 && Ball.center.x <= 258)
    {
        computerscoreNumber++;
        ComputerScore.text = [NSString stringWithFormat:@"%d",computerscoreNumber];
        
        [timer invalidate];
        StartButton.hidden = NO;
        Ball.center = CGPointMake(160, 239);
        Computer.center =CGPointMake(160, 32);

        
        if (computerscoreNumber ==10)
        {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"You Lose!"];
            
            
        }
        
        
        
    }
    
    
    
}


-(void)ComputerMovement
{
    if (Computer.center.x > Ball.center.x)
    {
        Computer.center = CGPointMake(Computer.center.x -2, Computer.center.y);
    }
    
    if (Computer.center.x <Ball.center.x)
    {
        Computer.center = CGPointMake(Computer.center.x+2, Computer.center.y);
        
    }
    
    if (Computer.center.x <36)
    {
        Computer.center = CGPointMake(36, Computer.center.y);
    }
    if (Computer.center.x >284)
    {
        Computer.center = CGPointMake(284,Computer.center.y);
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    playerScoreNumber =0;
    computerscoreNumber = 0;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
