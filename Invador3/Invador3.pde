class Bullet {
  float posx, posy;
  boolean active;
  Bullet(){
    posx = px;
    posy = 360.0;
    active = false;
  }
  
  void Update(){
    if(active == false){
      posx = px + 15.0;
      posy = 360.0;
      if((keyPressed == true) && ((key == 'a') || (key == 'A'))){
        active = true;
      }
    }
    if(active == true){
      posy -= 5;
    }
    if(posy <= 0.0){
      active = false;
      posy = 360.0;
    }
  }
  void Draw(){
    if(active == true){
      ellipse(posx, posy, 5, 5);
    }
  }
  void Collision(){
    for(int i = 0; i < number; i++){
      if(life[i] == true){
        if((posx > x[i]) && (posx < x[i] + 30)){
          if((posy > y) && (posy < y + 20)){
            life[i] = false;
            active = false;
          }
        }
      }
    }
  }
}

int[] x = new int[8];
boolean[] life = new boolean[8];
int y;
int px, py;
int speed;
int number;
Bullet bullet;

void setup(){
  background(0);
  number = 8;
  size(400, 400);
  for(int i = 0; i < number; i++){
    x[i] = i * 40;
    life[i] = true;
  }
  y = 0;
  speed = 1;
  px = 200;
  py =  370;
  bullet = new Bullet();
}

void draw(){
  background(0);
  //enemy
  fill(255, 0, 0);
  for(int i = 0; i < number; i++){
    x[i] += speed;
    if(life[i] == true){
      rect(x[i], y, 30, 20);
      rect(x[i] + 10, y + 20, 10, 10);
    }
  }
  if(x[number - 1] > width - 30 || x[0] < 0){
     y += 30;
     speed *= -1;
  }
  if(y > 310){
    for(int i = 0; i < number; i++){
      life[i] = true;
    }
    y =0;
  }
  //player
  fill(255, 255, 255);
  rect(px, py, 30, 20);
  rect(px + 10, py - 10, 10, 10);
  if(keyPressed == true){
   if(keyCode == LEFT){
     px -= 2;
    }
   else if(keyCode == RIGHT){
     px += 2;  
    }
  }
  bullet.Update();
  bullet.Draw();
  bullet.Collision();
}



//void keyPressed(){
//  if(key == CODED){
//    if(keyCode == LEFT){ 
//      px -= 2;
//    }else if(keyCode == RIGHT){
//      px += 2;
//    }
//  }
//}
//    
