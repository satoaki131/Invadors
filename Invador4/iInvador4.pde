class Player{
  int posx, posy;
  boolean active;
  Player(){
    posx = 200;
    posy = 370;
    active = true;
  }
  
  void Update(){
    if(active == true){
      if(keyPressed == true){
        if(keyCode == LEFT){
          posx -= 2;
        }
        else if(keyCode == RIGHT){
          posx += 2;  
        }
      }
    }
  }
  
  void Draw(){
    if(active == true){
      fill(255, 255, 255);
      rect(posx, posy, 30, 20);
      rect(posx + 10, posy - 10, 10, 10);
    }
  }
}


class Bullet {
  float posx, posy;
  boolean active;
  Bullet(){
    posx = 200.0;
    posy = 360.0;
    active = false;
  }
  
  void Update(){
    if(active == false){
      posx = player.posx + 15.0;
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
int speed;
int number;
Player player;
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
  player = new Player();
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
  player.Update();
  player.Draw();
  bullet.Update();
  bullet.Draw();
  bullet.Collision();
}
