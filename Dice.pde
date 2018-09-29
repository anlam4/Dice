void setup()
{
	size(600,655);
	noLoop();
}
void draw()
{
	background(64,217,36);  //Covers previous drawing
	int counter = 0;  //Resets counter for each click
	
	//Gives 100 dice
	for(y = 0; y < 600; y +=60)  //rows
  	{
    	   for(x = 0; x < 600; x +=60)  //columns
    	   {
	   	Die name = new Die(x,y);
		name.show();
		counter = counter + name.roll;  //Keeps running total of the dice
    	   }
  	}
	
	textSize(30);
	fill(255,0,0);
	text("Total of all the dice: " + counter,250,635);
}
void mousePressed()
{
	redraw();
}
class Die  //Models one single die
{
	int myX, myY, roll;
	
	Die(int x, int y)  //constructor
	{
		myX = x;
		myY = y;
		roll = (int)(Math.random()*6) + 1;  //Random value for die
	}
	void show()
	{
		fill(239,228,176);  //Changes color of squares to cream
		rect(myX,myY,60,60);  //Draws squares
		
		fill(0);  //Changes color of dots to black
		
		//Worth sacrificing simplicity to avoid rewriting ellipse()?
		//Draws dots
		if (roll % 2 != 0)
		{
		   ellipse(myX+30,myY+30,8,8);  //Completes roll 1
		   				//Adds to roll 3,5
		}
		if (roll > 1)
		{
		   ellipse(myX+15,myY+15,8,8);
		   ellipse(myX+45,myY+45,8,8);  //Completes roll 2,3
		   				//Adds to roll 4,5,6
		   if (roll > 3)
		   {
			ellipse(myX+15,myY+45,8,8);
			ellipse(myX+45,myY+15,8,8);  //Completes roll 4,5
						     //Adds to roll 6
			if (roll == 6)
			{
			   ellipse(myX+15,myY+30,8,8);
			   ellipse(myX+45,myY+30,8,8);  //Completes roll 6
			}
		   }
		}
		
	}
}
