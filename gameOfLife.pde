public int scl=10;
cell c[][];
int glider[][]={{0,0,1},
                {1,1,0},
                {0,1,1}};
int wall[][]={{0,1,0},
              {1,1,0},
              {0,1,0}};
int spaceship[][]={{0,0,1,1,0},
                   {1,1,0,1,1},
                   {1,1,1,1,0},
                   {0,1,1,0,0}};
  
void setup()
{
  size(1000,800);
  c=new cell[width/scl][height/scl];
  for(int i=0;i<width/scl;i++)
  {
    for(int j=0;j<height/scl;j++)
    {
       c[i][j]=new cell(i*scl,j*scl,scl);
    }
  }
          
  
  
}
boolean paused=true;
void draw()
{  
   Life(); 
}
void Life()
{
   for(int i=0;i<width/scl;i++)
    {
      for(int j=0;j<height/scl;j++)
      {
         c[i][j].show();
         c[i][j].update(c);
      }
    }
    
    for(int i=0;i<width/scl;i++)
    {
      for(int j=0;j<height/scl;j++)
      {
         if(!paused){
         frameRate(5);
         c[i][j].behave();}
         else
         {
           fill(0);
           stroke(0);
           textSize(10);
           text("PAUSED",10,10);
           frameRate(30);
         }      
       }
    }
}
void mousePressed()
{
  int a=floor(map(mouseX,0,width,0,width/scl));
  int b=floor(map(mouseY,0,height,0,height/scl));
  c[a][b].setState(!c[a][b].alive());
}
void keyPressed()
{
  if(keyCode==ENTER||key==' ')
  {
    frameRate(30);
    paused=!paused;
  }
  if(key=='r'||key=='R')
  {
    for(int i=0;i<width/scl;i++)
    {
      for(int j=0;j<height/scl;j++)
      {
          c[i][j].setState(false);
         if(random(1)<.09)
         {
           c[i][j].setState(true);
         }
      }
    }
  }
  if(key=='c'||key=='C')
  {
    for(int i=0;i<width/scl;i++)
    {
      for(int j=0;j<height/scl;j++)
      {
          c[i][j].setState(false);
      }
    }
  }
  if(key=='g'||key=='G')
  {
    make(glider,true,true);
  }
  if(key=='w'||key=='W')
  {
    make(wall,true,false);
  }
  if(key=='s'||key=='S')
  {
    make(spaceship,false,true);
  }
  
}
void make(int shape[][],boolean flip,boolean clockTurn)
{
  int a=floor(map(mouseX,0,width,0,width/scl));
  int b=floor(map(mouseY,0,height,0,height/scl));
  if(flip){
    if(a+shape.length<c.length&&b+shape[0].length<c[0].length)
    {
      for(int i=0;i<shape.length;i++)
      {
        for(int j=0;j<shape[0].length;j++)
        {
          if(clockTurn)
          c[a+i][b+j].setState(shape[i][j]==1);
          else
          c[a+j][b+i].setState(shape[i][j]==1);

        }
      }
    }
  }
  else{
    if(a-shape.length>=0&&b-shape[0].length>=0)
    {
      for(int i=0;i<shape.length;i++)
      {
        for(int j=0;j<shape[0].length;j++)
        {
          if(clockTurn)
          c[a-i][b-j].setState(shape[i][j]==1);
          else
          c[a-j][b-i].setState(shape[i][j]==1);

        }
      }
    }
  }
      
}
