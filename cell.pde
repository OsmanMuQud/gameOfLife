class cell
{
  boolean state=false;
  int x;
  int y;
  int scle;
  int neighCount;
  cell(int x_,int y_,int scle_)
  {
      x=x_;
      y=y_;
      scle=scle_;
      neighCount=scle;
  }
  void show()
  {
    stroke(state?51:0);
    if(!paused){noStroke();}
    fill(state?0:255);
    rect(x,y,scle,scle); 
    
  }
  void setState(boolean newState)
  {
    state=newState;
  }
  boolean alive()
  {
    return state;
  }
  int noOfAlive(cell list[][])
  {
    int a=x/scle;
    int b=y/scle;
    int net=0;
    for(int i=a-1;i<=a+1;i++)
    {
      for(int j=b-1;j<=b+1;j++)
      {
          if((i!=a||j!=b)
          &&list
          [i==-1?list.length-1:(i>=list.length?0:i)]
          [j==-1?list[0].length-1:(j>=list[0].length?0:j)].alive())
          {
            net++;
          }
          //println(i,j);
      }
    }//println("dooooo");
    return net;
  }
  void behave()
  {
      if(neighCount<2&&alive())
      {
        setState(false);
      }
      else if((neighCount==2||neighCount==3)&&alive())
      {
        
      }
      else if((neighCount>3)&&alive())
      {
        setState(false);
      }
      else if(alive()==false&&neighCount==3)
      {
        setState(true);
      }
  }
  void update(cell list[][])
  {
    neighCount=noOfAlive(list);
  }
  
}
