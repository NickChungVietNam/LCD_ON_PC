

// Size of cells
int cellSize = 8;

/*
void delay(int delay_ms){

  int start=millis()-10;
 while(millis()-start< delay_ms){
   ;
 }
}
*/
int COLOR_CLEAR=220;
int COLOR_DRAW=0;
 
char PRESS_KEY=0;
//lựa chọn font chữ số
int ASCII_NUMBER =0;
int CASIO_NUMBER =1;
int STYLE_NUMBER =2;
boolean BLACK=true;
boolean WHITE=false;
boolean NO_MIRROR=false;
boolean MIRROR=true;
boolean DELETE=false;
// Array of cells
boolean[][] cells; 

int START_MILLIS=0;
void SET_TIME(){
 START_MILLIS=millis();
  delay(50);
  
}

// Buffer to record the state of the cells and use this while changing the others in the interations

// Pause
boolean PAUSE = false;
int HEIGHT_LCD=64;
int WIDTH_LCD=128;

int HEIGHT_LCD_MAX=64;
int WIDTH_LCD_MAX=128;



void set_lcd( int width_,int height_){
ASCII_NUMBER =0;
 CASIO_NUMBER =1;
 STYLE_NUMBER =2;
  if(width_ <= WIDTH_LCD_MAX){
    
  WIDTH_LCD=width_;
  }else{
    
  println("ERROR: LCD'S WIDTH > 128");
  }
  if(height_<= HEIGHT_LCD_MAX){
   HEIGHT_LCD=height_;
  }else{
    
  println("ERROR: LCD'S HIGHT > 128");
  }
  cells = new boolean[width_][height_];
  
}


void UPDATE_STATE_BAR(){
  
  textSize(25); 
fill(0, 200, 0);
text("Height:", 0, height-10);text(HEIGHT_LCD, 100, height-10);
text("Width:", 0, height-40);text(WIDTH_LCD, 100, height-40);
  
stroke(0); 
fill(0);
rect(230, height-70, 195,35);
stroke(150); 
fill(0, 200, 0);
text("Time:", 170, height-40);
int ms=(millis()- START_MILLIS);
int ms_2=(ms/100)%10;
int s=ms/1000;
int S=s%60;
int M=(s/60)%60;
int H=(s/3600)%24;

text(H, 250, height-40);
text(":", 280, height-40);
text(M, 295, height-40);
text(":", 325, height-40);
text(S, 345, height-40);
text(":", 378, height-40);
text(ms_2, 398, height-40);

}


void UPDATE_LCD(){
  
  
     UPDATE_STATE_BAR();
  
color DRAW_COLOR = color(COLOR_DRAW);
color CLEAR_COLOR = color(COLOR_CLEAR);
  for (int x=0; x<WIDTH_LCD; x++) {
    for (int y=0; y<HEIGHT_LCD; y++) {
      if(cells[x][y]==true){
        
    fill(DRAW_COLOR); // 
      }else{
        
    fill(CLEAR_COLOR); // 
      }
     
      rect (x*cellSize, y*cellSize, cellSize, cellSize);
        
    }
  }
}
/////////////////////////////////////////////////

String Uni( String s){
 return s; 
}
String Asc( String s){
 return s; 
}


//////////////////////////////////////////


static char  icon[]= {

 // 32, // width
 // 32, // height

  /* page 0 (lines 0-7) */
  0x0,0x0,0x0,0x80,0xe0,0xe0,0x70,0x38,0x38,0x1c,0x1c,0xe,0xe,0xe,0xe,0xe,
  0xe,0xe,0xe,0x8e,0x9c,0x9c,0x38,0x78,0x70,0xe0,0xc0,0x80,0x0,0x0,0x0,0x0,
  
  /* page 1 (lines 8-15) */
  0xe0,0xfc,0x3f,0xf,0x1,0xc0,0xc0,0xc0,0xc0,0xc0,0x0,0x0,0x0,0x0,0x0,0x0,
  0x0,0xe,0x1f,0x3b,0x31,0x3b,0x9f,0x8e,0x80,0x81,0x83,0xc7,0xce,0xfc,0x0,0x0,
  
  /* page 2 (lines 16-23) */
  0x7,0x3f,0xfc,0xf0,0x80,0x8,0xc,0x6,0x3,0x1,0x0,0x0,0x0,0x0,0x1c,0x3c,
  0x3e,0x7e,0xe7,0xe7,0xc7,0x83,0x3,0x1,0x1,0x1,0x1,0x1,0x0,0x0,0x0,0x0,
  
  /* page 3 (lines 24-31) */
  0x0,0x0,0x0,0x1,0x7,0xf,0xe,0x1c,0x3c,0x38,0x38,0x70,0x70,0x60,0x60,0x60,
  0x60,0x60,0x60,0x71,0x39,0x3b,0x3f,0x1e,0x1c,0x8,0x0,0x0,0x0,0x0,0x0,0x0,
 };


static  char font[]  = {

  0x00, 0x00, 0x00, 0x00, 0x00,   //0
  0x3E, 0x5B, 0x4F, 0x5B, 0x3E,   //
  0x3E, 0x6B, 0x4F, 0x6B, 0x3E,   
  0x1C, 0x3E, 0x7C, 0x3E, 0x1C, 
  0x18, 0x3C, 0x7E, 0x3C, 0x18, 
  0x1C, 0x57, 0x7D, 0x57, 0x1C, 
  0x1C, 0x5E, 0x7F, 0x5E, 0x1C, 
  0x00, 0x18, 0x3C, 0x18, 0x00, 

  0x0C, 0x0C, 0x0C, 0x0C, 0x0C,
  0x00, 0x18, 0x24, 0x18, 0x00, 
  0xFF, 0xE7, 0xDB, 0xE7, 0xFF, 
  0x30, 0x48, 0x3A, 0x06, 0x0E, 
  0x26, 0x29, 0x79, 0x29, 0x26, 
  0x40, 0x7F, 0x05, 0x05, 0x07, 
  0x40, 0x7F, 0x05, 0x25, 0x3F, 
  0x5A, 0x3C, 0xE7, 0x3C, 0x5A, 
  0x7F, 0x3E, 0x1C, 0x1C, 0x08, 
  0x08, 0x1C, 0x1C, 0x3E, 0x7F, 
  0x14, 0x22, 0x7F, 0x22, 0x14, 
  0x5F, 0x5F, 0x00, 0x5F, 0x5F, 
  0x06, 0x09, 0x7F, 0x01, 0x7F, 
  0x00, 0x66, 0x89, 0x95, 0x6A, 
  0x60, 0x60, 0x60, 0x60, 0x60, 
  0x94, 0xA2, 0xFF, 0xA2, 0x94, 
  0x08, 0x04, 0x7E, 0x04, 0x08, 
  0x10, 0x20, 0x7E, 0x20, 0x10, 
  0x08, 0x08, 0x2A, 0x1C, 0x08, 
  0x08, 0x1C, 0x2A, 0x08, 0x08, 
  0x1E, 0x10, 0x10, 0x10, 0x10, 
  0x0C, 0x1E, 0x0C, 0x1E, 0x0C, 
  0x30, 0x38, 0x3E, 0x38, 0x30, 
  0x06, 0x0E, 0x3E, 0x0E, 0x06, 
  0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x5F, 0x00, 0x00, 
  0x00, 0x07, 0x00, 0x07, 0x00, 
  0x14, 0x7F, 0x14, 0x7F, 0x14, 
  0x24, 0x2A, 0x7F, 0x2A, 0x12, 
  0x23, 0x13, 0x08, 0x64, 0x62, 
  0x36, 0x49, 0x56, 0x20, 0x50, 
  0x00, 0x08, 0x07, 0x03, 0x00, 
  0x00, 0x1C, 0x22, 0x41, 0x00, 
  0x00, 0x41, 0x22, 0x1C, 0x00, 
  0x2A, 0x1C, 0x7F, 0x1C, 0x2A, 
  0x08, 0x08, 0x3E, 0x08, 0x08, 
  0x00, 0x80, 0x70, 0x30, 0x00, 
  0x08, 0x08, 0x08, 0x08, 0x08, 
  0x00, 0x00, 0x60, 0x60, 0x00, 
  0x20, 0x10, 0x08, 0x04, 0x02, 
  0x3E, 0x51, 0x49, 0x45, 0x3E, 
  0x00, 0x42, 0x7F, 0x40, 0x00, 
  0x72, 0x49, 0x49, 0x49, 0x46, 
  0x21, 0x41, 0x49, 0x4D, 0x33, 
  0x18, 0x14, 0x12, 0x7F, 0x10, 
  0x27, 0x45, 0x45, 0x45, 0x39, 
  0x3C, 0x4A, 0x49, 0x49, 0x31, 
  0x41, 0x21, 0x11, 0x09, 0x07, 
  0x36, 0x49, 0x49, 0x49, 0x36, 
  0x46, 0x49, 0x49, 0x29, 0x1E, 
  0x00, 0x00, 0x14, 0x00, 0x00, 
  0x00, 0x40, 0x34, 0x00, 0x00, 
  0x00, 0x08, 0x14, 0x22, 0x41, 
  0x14, 0x14, 0x14, 0x14, 0x14, 
  0x00, 0x41, 0x22, 0x14, 0x08, 
  0x02, 0x01, 0x59, 0x09, 0x06, 
  0x3E, 0x41, 0x5D, 0x59, 0x4E, 
  0x7C, 0x12, 0x11, 0x12, 0x7C, 
  0x7F, 0x49, 0x49, 0x49, 0x36, 
  0x3E, 0x41, 0x41, 0x41, 0x22, 
  0x7F, 0x41, 0x41, 0x41, 0x3E, 
  0x7F, 0x49, 0x49, 0x49, 0x41, 
  0x7F, 0x09, 0x09, 0x09, 0x01, 
  0x3E, 0x41, 0x41, 0x51, 0x73, 
  0x7F, 0x08, 0x08, 0x08, 0x7F, 
  0x00, 0x41, 0x7F, 0x41, 0x00, 
  0x20, 0x40, 0x41, 0x3F, 0x01, 
  0x7F, 0x08, 0x14, 0x22, 0x41, 
  0x7F, 0x40, 0x40, 0x40, 0x40, 
  0x7F, 0x02, 0x1C, 0x02, 0x7F, 
  0x7F, 0x04, 0x08, 0x10, 0x7F, 
  0x3E, 0x41, 0x41, 0x41, 0x3E, 
  0x7F, 0x09, 0x09, 0x09, 0x06, 
  0x3E, 0x41, 0x51, 0x21, 0x5E, 
  0x7F, 0x09, 0x19, 0x29, 0x46, 
  0x26, 0x49, 0x49, 0x49, 0x32, 
  0x03, 0x01, 0x7F, 0x01, 0x03, 
  0x3F, 0x40, 0x40, 0x40, 0x3F, 
  0x1F, 0x20, 0x40, 0x20, 0x1F, 
  0x3F, 0x40, 0x38, 0x40, 0x3F, 
  0x63, 0x14, 0x08, 0x14, 0x63, 
  0x03, 0x04, 0x78, 0x04, 0x03, 
  0x61, 0x59, 0x49, 0x4D, 0x43, 
  0x00, 0x7F, 0x41, 0x41, 0x41, 
  0x02, 0x04, 0x08, 0x10, 0x20, 
  0x00, 0x41, 0x41, 0x41, 0x7F, 
  0x04, 0x02, 0x01, 0x02, 0x04, 
  0x40, 0x40, 0x40, 0x40, 0x40, 
  0x00, 0x03, 0x07, 0x08, 0x00, 
  0x20, 0x54, 0x54, 0x78, 0x40, 
  0x7F, 0x28, 0x44, 0x44, 0x38, 
  0x38, 0x44, 0x44, 0x44, 0x28, 
  0x38, 0x44, 0x44, 0x28, 0x7F, 
  0x38, 0x54, 0x54, 0x54, 0x18, 
  0x00, 0x08, 0x7E, 0x09, 0x02, 
  0x18, 0xA4, 0xA4, 0x9C, 0x78, 
  0x7F, 0x08, 0x04, 0x04, 0x78, 
  0x00, 0x44, 0x7D, 0x40, 0x00, 
  0x20, 0x40, 0x40, 0x3D, 0x00, 
  0x7F, 0x10, 0x28, 0x44, 0x00, 
  0x00, 0x41, 0x7F, 0x40, 0x00, 
  0x7C, 0x04, 0x78, 0x04, 0x78, 
  0x7C, 0x08, 0x04, 0x04, 0x78, 
  0x38, 0x44, 0x44, 0x44, 0x38, 
  0xFC, 0x18, 0x24, 0x24, 0x18, 
  0x18, 0x24, 0x24, 0x18, 0xFC, 
  0x7C, 0x08, 0x04, 0x04, 0x08, 
  0x48, 0x54, 0x54, 0x54, 0x24, 
  0x04, 0x04, 0x3F, 0x44, 0x24, 
  0x3C, 0x40, 0x40, 0x20, 0x7C, 
  0x1C, 0x20, 0x40, 0x20, 0x1C, 
  0x3C, 0x40, 0x30, 0x40, 0x3C, 
  0x44, 0x28, 0x10, 0x28, 0x44, 
  0x4C, 0x90, 0x90, 0x90, 0x7C, 
  0x44, 0x64, 0x54, 0x4C, 0x44, 
  0x00, 0x08, 0x36, 0x41, 0x00, 
  0x00, 0x00, 0x77, 0x00, 0x00, 
  0x00, 0x41, 0x36, 0x08, 0x00, 
  0x02, 0x01, 0x02, 0x04, 0x02, 
  0x3C, 0x26, 0x23, 0x26, 0x3C, 
  0x1E, 0xA1, 0xA1, 0x61, 0x12, 
  0x3A, 0x40, 0x40, 0x20, 0x7A, 
  0x38, 0x54, 0x54, 0x55, 0x59, 
  0x21, 0x55, 0x55, 0x79, 0x41, 
  0x22, 0x54, 0x54, 0x78, 0x42, // a-umlaut
  0x21, 0x55, 0x54, 0x78, 0x40, 
  0x20, 0x54, 0x55, 0x79, 0x40, 
  0x0C, 0x1E, 0x52, 0x72, 0x12, 
  0x39, 0x55, 0x55, 0x55, 0x59, 
  0x39, 0x54, 0x54, 0x54, 0x59, 
  0x39, 0x55, 0x54, 0x54, 0x58, 
  0x00, 0x00, 0x45, 0x7C, 0x41, 
  0x00, 0x02, 0x45, 0x7D, 0x42, 
  0x00, 0x01, 0x45, 0x7C, 0x40, 
  0x7D, 0x12, 0x11, 0x12, 0x7D, // A-umlaut
  0xF0, 0x28, 0x25, 0x28, 0xF0, 
  0x7C, 0x54, 0x55, 0x45, 0x00, 
  0x20, 0x54, 0x54, 0x7C, 0x54, 
  0x7C, 0x0A, 0x09, 0x7F, 0x49, 
  0x32, 0x49, 0x49, 0x49, 0x32, 
  0x3A, 0x44, 0x44, 0x44, 0x3A, // o-umlaut
  0x32, 0x4A, 0x48, 0x48, 0x30, 
  0x3A, 0x41, 0x41, 0x21, 0x7A, 
  0x3A, 0x42, 0x40, 0x20, 0x78, 
  0x00, 0x9D, 0xA0, 0xA0, 0x7D, 
  0x3D, 0x42, 0x42, 0x42, 0x3D, // O-umlaut
  0x3D, 0x40, 0x40, 0x40, 0x3D, 
  0x3C, 0x24, 0xFF, 0x24, 0x24, 
  0x48, 0x7E, 0x49, 0x43, 0x66, 
  0x2B, 0x2F, 0xFC, 0x2F, 0x2B, 
  0xFF, 0x09, 0x29, 0xF6, 0x20, 
  0xC0, 0x88, 0x7E, 0x09, 0x03, 
  0x20, 0x54, 0x54, 0x79, 0x41, 
  0x00, 0x00, 0x44, 0x7D, 0x41, 
  0x30, 0x48, 0x48, 0x4A, 0x32, 
  0x38, 0x40, 0x40, 0x22, 0x7A, 
  0x00, 0x7A, 0x0A, 0x0A, 0x72, 
  0x7D, 0x0D, 0x19, 0x31, 0x7D, 
  0x26, 0x29, 0x29, 0x2F, 0x28, 
  0x26, 0x29, 0x29, 0x29, 0x26, 
  0x30, 0x48, 0x4D, 0x40, 0x20, 
  0x38, 0x08, 0x08, 0x08, 0x08, 
  0x08, 0x08, 0x08, 0x08, 0x38, 
  0x2F, 0x10, 0xC8, 0xAC, 0xBA, 
  0x2F, 0x10, 0x28, 0x34, 0xFA, 
  0x00, 0x00, 0x7B, 0x00, 0x00, 
  0x08, 0x14, 0x2A, 0x14, 0x22, 
  0x22, 0x14, 0x2A, 0x14, 0x08, 
  0xAA, 0x00, 0x55, 0x00, 0xAA, 
  0xAA, 0x55, 0xAA, 0x55, 0xAA, 
  0x00, 0x00, 0x00, 0xFF, 0x00, 
  0x10, 0x10, 0x10, 0xFF, 0x00, 
  0x14, 0x14, 0x14, 0xFF, 0x00, 
  0x10, 0x10, 0xFF, 0x00, 0xFF, 
  0x10, 0x10, 0xF0, 0x10, 0xF0, 
  0x14, 0x14, 0x14, 0xFC, 0x00, 
  0x14, 0x14, 0xF7, 0x00, 0xFF, 
  0x00, 0x00, 0xFF, 0x00, 0xFF, 
  0x14, 0x14, 0xF4, 0x04, 0xFC, 
  0x14, 0x14, 0x17, 0x10, 0x1F, 
  0x10, 0x10, 0x1F, 0x10, 0x1F, 
  0x14, 0x14, 0x14, 0x1F, 0x00, 
  0x10, 0x10, 0x10, 0xF0, 0x00, 
  0x00, 0x00, 0x00, 0x1F, 0x10, 
  0x10, 0x10, 0x10, 0x1F, 0x10, 
  0x10, 0x10, 0x10, 0xF0, 0x10, 
  0x00, 0x00, 0x00, 0xFF, 0x10, 
  0x10, 0x10, 0x10, 0x10, 0x10, 
  0x10, 0x10, 0x10, 0xFF, 0x10, 
  0x00, 0x00, 0x00, 0xFF, 0x14, 
  0x00, 0x00, 0xFF, 0x00, 0xFF, 
  0x00, 0x00, 0x1F, 0x10, 0x17, 
  0x00, 0x00, 0xFC, 0x04, 0xF4, 
  0x14, 0x14, 0x17, 0x10, 0x17, 
  0x14, 0x14, 0xF4, 0x04, 0xF4, 
  0x00, 0x00, 0xFF, 0x00, 0xF7, 
  0x14, 0x14, 0x14, 0x14, 0x14, 
  0x14, 0x14, 0xF7, 0x00, 0xF7, 
  0x14, 0x14, 0x14, 0x17, 0x14, 
  0x10, 0x10, 0x1F, 0x10, 0x1F, 
  0x14, 0x14, 0x14, 0xF4, 0x14, 
  0x10, 0x10, 0xF0, 0x10, 0xF0, 
  0x00, 0x00, 0x1F, 0x10, 0x1F, 
  0x00, 0x00, 0x00, 0x1F, 0x14, 
  0x00, 0x00, 0x00, 0xFC, 0x14, 
  0x00, 0x00, 0xF0, 0x10, 0xF0, 
  0x10, 0x10, 0xFF, 0x10, 0xFF, 
  0x14, 0x14, 0x14, 0xFF, 0x14, 
  0x10, 0x10, 0x10, 0x1F, 0x00, 
  0x00, 0x00, 0x00, 0xF0, 0x10, 
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
  0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 
  0xFF, 0xFF, 0xFF, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0xFF, 0xFF, 
  0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 
  0x38, 0x44, 0x44, 0x38, 0x44, 
  0xFC, 0x4A, 0x4A, 0x4A, 0x34, // sharp-s or beta
  0x7E, 0x02, 0x02, 0x06, 0x06, 
  0x02, 0x7E, 0x02, 0x7E, 0x02, 
  0x63, 0x55, 0x49, 0x41, 0x63, 
  0x38, 0x44, 0x44, 0x3C, 0x04, 
  0x40, 0x7E, 0x20, 0x1E, 0x20, 
  0x06, 0x02, 0x7E, 0x02, 0x02, 
  0x99, 0xA5, 0xE7, 0xA5, 0x99, 
  0x1C, 0x2A, 0x49, 0x2A, 0x1C, 
  0x4C, 0x72, 0x01, 0x72, 0x4C, 
  0x30, 0x4A, 0x4D, 0x4D, 0x30, 
  0x30, 0x48, 0x78, 0x48, 0x30, 
  0xBC, 0x62, 0x5A, 0x46, 0x3D, 
  0x3E, 0x49, 0x49, 0x49, 0x00, 
  0x7E, 0x01, 0x01, 0x01, 0x7E, 
  0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 
  0x44, 0x44, 0x5F, 0x44, 0x44, 
  0x40, 0x51, 0x4A, 0x44, 0x40, 
  0x40, 0x44, 0x4A, 0x51, 0x40, 
  0x00, 0x00, 0xFF, 0x01, 0x03, 
  0xE0, 0x80, 0xFF, 0x00, 0x00, 
  0x08, 0x08, 0x6B, 0x6B, 0x08,
  0x36, 0x12, 0x36, 0x24, 0x36,
  0x06, 0x0F, 0x09, 0x0F, 0x06,
  0x00, 0x00, 0x18, 0x18, 0x00,
  0x00, 0x00, 0x10, 0x10, 0x00,
  0x30, 0x40, 0xFF, 0x01, 0x01,
  0x00, 0x1F, 0x01, 0x01, 0x1E,
  0x00, 0x19, 0x1D, 0x17, 0x12,
  0x00, 0x3C, 0x3C, 0x3C, 0x3C,
  0x00, 0x00, 0x00, 0x00, 0x00

};


 static char casio_number[]= {
 // 120, // width
 // 16, // height

  // gồm 10 số (0->9) có kích thước 12x16 xếp từ trái sang phải
  /* page 0 (lines 0-7) */
  0x7e,0x3d,0x3,0x3,0x3,0x3,0x3,0x3,0x3,0x3,0x3d,0x7e,0x0,0x0,0x0,0x0,
  0x0,0x0,0x0,0x0,0x0,0x0,0x3c,0x7e,0x0,0x81,0x83,0x83,0x83,0x83,0x83,0x83,
  0x83,0x83,0xbd,0x7e,0x0,0x81,0x83,0x83,0x83,0x83,0x83,0x83,0x83,0x83,0xbd,0x7e,
  0x7e,0xbc,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0xbc,0x7e,0x7e,0xbd,0x83,0x83,
  0x83,0x83,0x83,0x83,0x83,0x83,0x81,0x0,0x7e,0xbd,0x83,0x83,0x83,0x83,0x83,0x83,
  0x83,0x83,0x81,0x0,0x0,0x1,0x3,0x3,0x3,0x3,0x3,0x3,0x3,0x3,0x3d,0x7e,
  0x7e,0xbd,0x83,0x83,0x83,0x83,0x83,0x83,0x83,0x83,0xbd,0x7e,0x7e,0xbd,0x83,0x83,
  0x83,0x83,0x83,0x83,0x83,0x83,0xbd,0x7e,
  /* page 1 (lines 8-15) */
  0x7f,0xbc,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xbc,0x7f,0x0,0x0,0x0,0x0,
  0x0,0x0,0x0,0x0,0x0,0x0,0x3c,0x7f,0x7f,0xbd,0xc1,0xc1,0xc1,0xc1,0xc1,0xc1,
  0xc1,0xc1,0x81,0x0,0x0,0x81,0xc1,0xc1,0xc1,0xc1,0xc1,0xc1,0xc1,0xc1,0xbd,0x7f,
  0x0,0x1,0x1,0x1,0x1,0x1,0x1,0x1,0x1,0x1,0x3d,0x7f,0x0,0x81,0xc1,0xc1,
  0xc1,0xc1,0xc1,0xc1,0xc1,0xc1,0xbd,0x7f,0x7f,0xbd,0xc1,0xc1,0xc1,0xc1,0xc1,0xc1,
  0xc1,0xc1,0xbd,0x7f,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x3c,0x7f,
  0x7f,0xbd,0xc1,0xc1,0xc1,0xc1,0xc1,0xc1,0xc1,0xc1,0xbd,0x7f,0x0,0x81,0xc1,0xc1,
  0xc1,0xc1,0xc1,0xc1,0xc1,0xc1,0xbd,0x7f,
};


 static char style_number[]= {
  // đây là mã hex của ảnh bit map 160x16
// biên soạn bởi Phùng Thái Sơn.
//XEM ảnh trong file zip để hiểu
  // gồm 10 số (0->9) có kích thước 16x16 xếp từ trái sang phải
  /* page 0 (lines 0-7) */
  0xfe,0xff,0x3,0x3,0xe3,0xf3,0x33,0x33,0x33,0x33,0xf3,0xe3,0x3,0x3,0xff,0xfe,
  0x1e,0x3f,0x33,0x33,0x33,0xf3,0xf3,0x7,0xe,0xfc,0xf8,0x0,0x0,0x0,0x0,0x0,
  0x9e,0xdf,0x53,0x53,0x53,0x53,0x53,0x53,0x53,0x53,0x73,0x73,0x7,0xe,0xfc,0xf8,
  0x8e,0xdf,0x53,0x53,0x53,0x53,0x53,0x53,0x53,0x53,0x53,0x73,0x7,0xe,0xfc,0xf8,
  0xfe,0xff,0x83,0x3,0x7f,0x7e,0x60,0x60,0x60,0x60,0x7e,0x7f,0x3,0x3,0xff,0xfe,
  0xf8,0xf8,0xc,0x6,0x73,0x53,0x53,0x53,0x53,0x53,0x53,0x53,0x53,0xd3,0xdf,0x8e,
  0xf0,0xf8,0xc,0x6,0x73,0x53,0x53,0x53,0x53,0x53,0x53,0x53,0x53,0x53,0xdf,0x8e,
  0x1e,0x3f,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0xf3,0xf3,0x3,0x6,0xfc,0xf8,
  0xfe,0xff,0x3,0x3,0x73,0x53,0x53,0x53,0x53,0x53,0x53,0x73,0x3,0x3,0xff,0xfe,
  0xfe,0xff,0x3,0x3,0x73,0x53,0x53,0x53,0x53,0x53,0x53,0x73,0x3,0x3,0xff,0xfe,
  
  /* page 1 (lines 8-15) */
  0x7f,0xff,0xc0,0xc0,0xc7,0xcf,0xcc,0xcc,0xcc,0xcc,0xcf,0xc7,0xc0,0x60,0x3f,0x1f,
  0x78,0xfc,0xcc,0xcc,0xcc,0xcf,0xcf,0xc0,0xc0,0xcf,0xcf,0xcc,0xcc,0xcc,0xfc,0x78,
  0x7f,0xff,0xc0,0xc0,0xce,0xce,0xca,0xca,0xca,0xca,0xca,0xca,0xca,0xca,0xfb,0x71,
  0x71,0xfb,0xca,0xca,0xca,0xca,0xca,0xca,0xca,0xca,0xca,0xce,0xc0,0xc0,0xff,0x7f,
  0x0,0x1,0x3,0x7,0x6,0x6,0x6,0x6,0x6,0x6,0x7e,0xfe,0xc0,0xc0,0xff,0x7f,
  0x71,0xfb,0xca,0xca,0xca,0xca,0xca,0xca,0xca,0xca,0xce,0xce,0xc0,0xe0,0xff,0x7f,
  0x7f,0xff,0xc0,0xc0,0xce,0xca,0xca,0xca,0xca,0xca,0xca,0xce,0xc0,0xc0,0xff,0x7f,
  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x7f,0xff,0xc0,0xc0,0xff,0x7f,
  0x1f,0x3f,0x70,0xe0,0xce,0xca,0xca,0xca,0xca,0xca,0xca,0xce,0xc0,0xc0,0xff,0x7f,
  0x79,0xcb,0xca,0xca,0xca,0xca,0xca,0xca,0xca,0xca,0xca,0xce,0xc0,0x60,0x7f,0x1f,
  
  };

static char vietnamese_vowel_table[]= {
// bảng FONT kí tự  tiếng việt
// MÕI KÍ TỰ CÓ KÍCH THƯỚC 6x15 pixel
//file này có kích thước 768 bytes

// biên soạn bởi Phùng Thái Sơn.
//XEM ảnh trong file zip để hiểu

 // 384, // width
  //16, // height


  /* page 0 (lines 0-7) */
  0x80,0xc0,0x40,0x40,0xc0,0x80,0x0,0x80,0x40,0x40,0x40,0x80,0x0,0x0,0xd0,0xd0,
  0x0,0x0,0x80,0xc0,0x40,0x40,0xc0,0x80,0x0,0xc0,0xc0,0x0,0xc0,0xc0,0xc0,0xc0,
  0x0,0xc0,0x80,0xe0,0xc0,0xc0,0x0,0x0,0xc0,0xc0,0x80,0xd0,0x60,0x60,0xd0,0x80,
  0x80,0xc0,0x60,0x50,0xe0,0x80,0x0,0x80,0x60,0x50,0x60,0x80,0x80,0xc0,0x60,0x50,
  0xe0,0x80,0x80,0xc0,0x40,0x50,0xd0,0xa0,0xe0,0xf0,0x90,0x90,0xf0,0xe0,0xe0,0xf4,
  0x98,0x98,0xf4,0xe0,0xe0,0xf0,0x98,0x94,0xf8,0xe0,0xf0,0xf0,0x90,0x90,0x90,0x10,
  0xf0,0xf0,0x98,0x94,0x98,0x10,0x10,0x10,0xf0,0xf0,0x10,0x10,0xe0,0xf0,0x10,0x10,
  0x10,0xe0,0xe0,0xf0,0x18,0x14,0x18,0xe0,0xe0,0xf0,0x10,0x14,0x34,0xe8,0xf0,0xf0,
  0x0,0x0,0xf0,0xf0,0xf0,0xf0,0x0,0x0,0xe4,0xfc,0xf0,0xf0,0x0,0x0,0xf0,0xf0,
  0x80,0xc0,0x40,0x40,0xc0,0xc0,0x0,0xc0,0xc0,0x40,0x40,0xc0,0x0,0x20,0xf8,0xf8,
  0x20,0x0,0xc0,0xc0,0x40,0x40,0xc0,0x80,0xc0,0xe0,0x20,0x20,0x20,0x60,0x80,0xc0,
  0x40,0x40,0xf8,0xf8,0x80,0xc0,0x50,0x50,0xf8,0xf8,0x80,0xc0,0x40,0x40,0xc0,0xc0,
  0xf8,0xf8,0x40,0x40,0xc0,0x80,0xf8,0xf8,0x80,0xc0,0x60,0x20,0x0,0x0,0xf8,0xf8,
  0x0,0x0,0x40,0xc0,0x0,0x0,0xc0,0x40,0x80,0xc0,0x40,0x40,0xc0,0x80,0xc0,0xc0,
  0x0,0x0,0xc0,0xc0,0xf8,0xf8,0x40,0x40,0xc0,0x80,0xc0,0xc0,0x40,0x40,0xc0,0x80,
  0xc0,0xc0,0xc0,0xc0,0xc0,0x80,0xf0,0xf8,0x8,0x8,0x10,0xe0,0xf8,0x88,0x88,0x88,
  0x88,0x70,0x8,0x8,0xf8,0xf8,0x8,0x8,0xf8,0xf8,0x8,0x8,0x98,0xf0,0x70,0xf8,
  0x88,0x88,0x18,0x10,0xf8,0xf8,0x8,0x8,0x18,0xf0,0x80,0xf8,0xf8,0x88,0x18,0xf0,
  0xe0,0xf0,0x18,0x88,0x88,0x98,0xf8,0xf8,0x80,0x80,0xf8,0xf8,0xf8,0xf8,0x80,0xe0,
  0xb0,0x18,0xf8,0xf8,0x0,0x0,0x0,0x0,0x38,0x78,0xc0,0xc0,0x78,0x38,0xf0,0xf8,
  0x8,0x8,0x18,0x10,0x78,0x80,0x0,0x0,0x80,0x78,0xf8,0xf8,0x88,0x88,0xd8,0x70,
  0xf8,0xf8,0xc0,0x80,0xf8,0xf8,0xf8,0xf8,0x10,0xf0,0x8,0xf8,0x0,0x0,0x0,0x0,
  0x0,0x0,0x0,0x0,0x1,0x1,0x2,0x0,0x0,0x0,0x2,0x1,0x1,0x0,0x0,0x0,
  0x0,0x1,0x5,0x3,0x0,0x3,0x1,0x2,0x3,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
  
  /* page 1 (lines 8-15) */
  0x6,0xe,0x9,0x9,0xf,0xf,0x3,0x7,0x9,0x9,0xd,0x5,0x0,0x0,0xf,0xf,
  0x0,0x0,0x7,0xf,0xc,0xc,0xf,0x7,0x0,0x7,0xf,0x8,0xf,0xf,0x7,0xf,
  0xc,0xf,0xf,0x0,0x0,0x21,0x3f,0xf,0x1,0x0,0x6,0xe,0x9,0x9,0xf,0xf,
  0x6,0xe,0x9,0x9,0xf,0xf,0x3,0x7,0x9,0x9,0xd,0x5,0x7,0xf,0xc,0xc,
  0xf,0x7,0x7,0xf,0xc,0xc,0xf,0x7,0xf,0xf,0x0,0x0,0xf,0xf,0xf,0xf,
  0x0,0x0,0xf,0xf,0xf,0xf,0x0,0x0,0xf,0xf,0xf,0xf,0xc,0xc,0xc,0xc,
  0xf,0xf,0xc,0xc,0xc,0xc,0xc,0xc,0xf,0xf,0xc,0xc,0x7,0xf,0xc,0xc,
  0xc,0x7,0x7,0xf,0xc,0xc,0xc,0x7,0x7,0xf,0xc,0xc,0xc,0x7,0xf,0xf,
  0x8,0x8,0xf,0xf,0xf,0xf,0x8,0x8,0xf,0xf,0x0,0x9,0xf,0x7,0x1,0x0,
  0x3,0x7,0x4,0x4,0x3f,0x3f,0x0,0xf,0xf,0x0,0x0,0x0,0x0,0x0,0xf,0xf,
  0x8,0x0,0x3f,0x3f,0x4,0x4,0x7,0x3,0xc,0x9,0x9,0xb,0xa,0xe,0x7,0xf,
  0x8,0x8,0xf,0xf,0x7,0xf,0x8,0x8,0xf,0xf,0x7,0x2f,0x28,0x28,0x3f,0x3f,
  0xf,0xf,0x0,0x0,0xf,0xf,0xf,0xf,0x1,0x7,0xe,0x8,0x0,0x0,0xf,0xf,
  0x8,0x0,0x8,0xe,0x3,0x3,0xe,0x8,0x7,0xf,0x8,0x8,0xc,0x4,0x1,0x7,
  0xc,0xc,0x7,0x1,0xf,0xf,0x8,0x8,0xf,0x7,0xf,0xf,0x0,0x0,0xf,0xf,
  0xf,0xf,0x0,0xf,0x0,0xf,0x3,0x7,0x9,0xa,0x4,0xb,0xf,0x1,0x1,0x3,
  0xe,0xc,0x0,0x0,0xf,0xf,0x0,0x0,0xf,0xf,0x1,0x1,0x1,0x0,0x4,0xc,
  0x8,0x8,0xf,0x7,0xf,0xf,0x8,0x8,0xc,0x7,0x0,0xf,0xf,0x8,0xc,0x7,
  0x3,0x7,0xc,0x9,0xc,0x7,0xf,0xf,0x0,0x0,0xf,0xf,0xf,0xf,0x0,0x0,
  0x3,0xe,0xf,0xf,0x8,0x8,0x8,0xc,0xe,0xf,0x1,0x1,0xf,0xe,0x7,0xf,
  0x8,0x8,0xc,0x4,0x0,0x7,0xc,0xc,0x7,0x0,0xf,0xf,0x8,0x8,0xd,0x7,
  0xf,0xf,0x1,0x3,0xf,0xf,0xf,0xf,0x0,0xf,0x0,0xf,0x0,0x0,0x0,0x0,
  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x24,0x24,0x0,0x0,
  


  
};



int  tim_thu_tu( char c){
  // chú ý : kiểu char trong processing có cỡ 2 byte ! dùng để chứa cả Unicode
  int x=0;
switch(c){
// nguyên âm thấp   và không mũ(thường)
  case  'a':x= 0;break;// a .0/6 thương =0 DƯ 0
  case  'à':x= 1;break;// à .1/6 thương 0 dư 1
  
  case  'á':x= 2;break;// á
  case  'ả':x= 3;break;//ả
  case  'ã':x= 4;break;//ã
  case  'ạ':x= 5;break;//ạ 5/6 thuong =0 dư 5

  case  'e':x= 6;break;//e
  case  'è':x= 7;break;//è
  case  'é':x= 8;break;//é
  case  'ẻ':x= 9;break;//ẻ
  case  'ẽ':x= 10;break;//ẽ
  case  'ẹ':x= 11;break;//ẹ

  case  'i':x= 12;break;//i
  case  'ì':x= 13;break;//ì
  case  'í':x= 14;break;//í
  case  'ỉ':x= 15;break;//ỉ
  case  'ĩ':x= 16;break;//ĩ
  case  'ị':x= 17;break;//ị
 
  case  'o':x= 18;break;//o
  case  'ò':x= 19;break;//ò
  case  'ó':x= 20;break;//ó
  case  'ỏ':x= 21;break;//ỏ
  
  case  'õ':x= 22;break;//õ
  case  'ọ':x= 23;break;//ọ

  case  'u':x= 24;break;//u
  case  'ù':x= 25;break;//ù
  case  'ú':x= 26;break;//ú
  case  'ủ':x= 27;break;//ủ
  case  'ũ':x= 28;break;//ũ
  case  'ụ':x= 29;break;//ụ

  case  'ư':x= 30;break;//ư
  case  'ừ':x= 31;break;//ừ
  case  'ứ':x= 32;break;//ứ 
  case  'ử':x= 33;break;//ử
  case  'ữ':x= 34;break;//ữ
  case  'ự':x= 35;break;//ự

  case  'y':x= 36;break;//y
  case  'ỳ':x= 37;break;//ỳ
  case  'ý':x= 38;break;//ý
  case  'ỷ':x= 39;break;//ỷ
  case  'ỹ':x= 40;break;//ỹ
  case  'ỵ':x= 41;break;//ỵ
// nguyên âm thấp và có mũ

  case  'ă':x= 42;break;//ă 6/6=1 dư 0
  case  'ằ':x= 43;break;//ằ 7/6=1 dư 1
  case  'ắ':x= 44;break;//ắ
  case  'ẳ':x= 45;break;//ẳ
  case  'ẵ':x= 46;break;//ẵ
  case  'ặ':x= 47;break;//ặ

  case  'â':x= 48;break;//â
  case  'ầ':x= 49;break;//ầ
  case  'ấ':x= 50;break;//ấ
  case  'ẩ':x= 51;break;//ẩ
  case  'ẫ':x= 52;break;//ẫ
  case  'ậ':x= 53;break;//ậ
 
  case  'ê':x= 54;break;//ê
  case  'ề':x= 55;break;//ề
  case  'ế':x= 56;break;//ế
  case  'ể':x= 57;break;//ể
  case  'ễ':x= 58;break;//ễ
  case  'ệ':x= 59;break;//ệ
 
  case  'ô':x= 60;break;//ô
  case  'ồ':x= 61;break;//ồ
  case  'ố':x= 62;break;//ố
  case  'ổ':x= 63;break;//ổ
  case  'ỗ':x= 64;break;//ỗ
  case  'ộ':x= 65;break;//ộ
 
  case  'ơ':x= 66;break;//ơ
  case  'ờ':x= 67;break;//ờ
  case  'ớ':x= 68;break;//ớ
  case  'ở':x= 69;break;//ở
  case  'ỡ':x= 70;break;//ỡ
  case  'ợ':x= 71;break;//ợ
 // nguyên âm cao (in hoa)
  case  'A':x= 72;break;//A
  case  'À':x= 73;break;//À
  case  'Á':x= 74;break;//Á
  case  'Ả':x= 75;break;//Ả
  case  'Ã' :x= 76;break;//Ã
  case  'Ạ':x= 77;break;//Ạ
  
  case  'Ă':x= 78;break;//Ă
  case  'Ằ':x= 79;break;//Ằ
  case  'Ắ':x= 80;break;//Ắ
  case  'Ẳ':x= 81;break;//Ẳ
  case  'Ẵ':x= 82;break;//Ẵ
  case  'Ặ':x= 83;break;//Ặ
 
  case  'Â':x= 84;break;//Â
  case  'Ầ':x= 85;break;//Ầ
  case  'Ấ':x= 86;break;//Ấ
  case  'Ẩ':x= 87;break;//Ẩ
  case  'Ẫ':x= 88;break;//Ẫ
  case  'Ậ':x= 89;break;//Ậ
 
  case  'E':x= 90;break;//E
  case  'È':x= 91;break;//È
  case  'É':x= 92;break;//É
  case  'Ẻ':x= 93;break;//Ẻ
  case  'Ẽ':x= 94;break;//Ẽ
  case  'Ẹ':x= 95;break;// Ẹ11/6=1 dư 5

  case  'Ê':x= 96;break;//Ê
  case  'Ề':x= 97;break;//Ề
  case  'Ế':x= 98;break;//Ế
  case  'Ể':x= 99;break;//Ể
  case  'Ễ':x= 100;break;//Ễ
  case  'Ệ':x= 101;break;//Ệ
 
  case  'I':x= 102;break;//I
  case  'Ì':x= 103;break;//Ì
  case  'Í':x= 104;break;//Í
  case  'Ỉ':x= 105;break;//Ỉ
  case  'Ĩ':x= 106;break;//Ĩ
  case  'Ị':x= 107;break;//Ị
 
  case  'O':x= 108;break;//O
  case  'Ò':x= 109;break;//Ò
  case  'Ó':x= 110;break;//Ó
  case  'Ỏ':x= 111;break;//Ỏ
  case  'Õ':x= 112;break;//Õ
  case  'Ọ':x= 113;break;//Ọ

  case  'Ô':x= 114;break;//Ô
  case  'Ồ':x= 115;break;//Ồ
  case  'Ố':x= 116;break;//Ố
  case  'Ổ':x= 117;break;//Ổ
  case  'Ỗ':x= 118;break;//Ỗ
  case  'Ộ':x= 119;break;//Ộ
 
  case  'Ơ':x= 120;break;//Ơ
  case  'Ờ':x= 121;break;//Ờ
  case  'Ớ':x= 122;break;//Ớ
  case  'Ở':x= 123;break;//Ở
  case  'Ỡ':x= 124;break;//Ỡ
  case  'Ợ':x= 125;break;//Ợ
 
  case  'U':x= 126;break;//U
  case  'Ù':x= 127;break;//Ù
  case  'Ú':x= 128;break;//Ú
  case  'Ủ':x= 129;break;//Ủ
  case  'Ũ':x= 130;break;//Ũ
  case  'Ụ':x= 131;break;//Ụ
 
  case  'Ư':x= 132;break;//Ư
  case  'Ừ':x= 133;break;//Ừ
  case  'Ứ':x= 134;break;//Ứ
  case  'Ử':x= 135;break;//Ử
  case  'Ữ':x= 136;break;//Ữ
  case  'Ự':x= 137;break;//Ự
 
  case  'Y':x= 138;break;//Y
  case  'Ỳ':x= 139;break;//Ỳ
  case  'Ý':x= 140;break;//Ý
  case  'Ỷ':x= 141;break;//Ỷ
  case  'Ỹ':x= 142;break;//Ỹ
  case  'Ỵ':x= 143;break;//Ỵ
 //phụ âm
  case  'q':x= 144; break; //q
  case  'r':x= 145; break;//r
  case  't':x= 146; break;//t
  case  'p':x= 147; break;//p
  case  's':x= 148; break;//s
  case  'd':x= 149; break;//d
  case  'đ':x= 150; break;//đ
  case  'g':x= 151; break;//g
  case  'h':x= 152; break;//h
  case  'k':x= 153; break;//k
  case  'l':x= 154; break;//l
  case  'x':x= 155; break;//x
  case  'c':x= 156; break;//c
  case  'v':x= 157; break;//v
  case  'b':x= 158; break;//b
  case  'n':x= 159; break;//n
  case  'm':x= 160; break;//m
  case  'Q':x= 161; break;//Q
  case  'R':x= 162; break;//R
  case  'T':x= 163; break;//T
  case  'P':x= 164; break;//P
  case  'S':x= 165; break;//S
  case  'D':x= 166; break;//D
  case  'Đ':x= 167; break;//Đ
  case  'G':x= 168; break;//G
  case  'H':x= 169; break;//H
  case  'K':x= 170; break;//K
  case  'L':x= 171; break;//L
  case  'X':x= 172; break;//X
  case  'C':x= 173; break;//C
  case  'V':x= 174; break;//V
  case  'B':x= 175; break;//B
  case  'N':x= 176; break;//N
  case  'M':x= 177; break;//M
  
  default : x= 178; break;
  
}
return x;
}

////////////////////////////////////////////////







class LCD_SCREEN {
private boolean NEGATIVE=true;
 void SET(int contrast, boolean negative, boolean rotation, boolean mirror, int tyledientro){
  NEGATIVE=true;
   
  
}

 void SET(int contrast, int negative, int rotation, int mirror, int tyledientro){
  if(negative!=0){
   NEGATIVE=true;
  }else{
   NEGATIVE=false;
  }
  
}

/** 
* biến contrast- độ tương phản- giá trị 0->63(hex từ 0x3f trở xuống 0x00)
* biến negative- hiển thị âm bản- giá trị 0 hoặc 1
* biến rotation- đảo ngược màn hình- giá trị 0 hoặc 1
* biến mirror- hiển thi gương- giá trị 0 hoặc 1
* biến tyledientro- bằng R1/R2- thiết lập giá trị nội trở hoạt động- 0->6(hex từ 0x6 đến 0x0)
*/
  void ON(){
    
  }
  void  Display(){
  redraw();
  }
  
  void  display(){
  Display();
  }
void Clear(){
 
  for (int x=0; x<WIDTH_LCD; x++) {
    for (int y=0; y<HEIGHT_LCD; y++) {
      
      cells[x][y]=NEGATIVE;
     
        
    }
  }
  Display();
}

void AllPixel(){
  
        
  for (int x=0; x<WIDTH_LCD; x++) {
    for (int y=0; y<HEIGHT_LCD; y++) {
      
      cells[x][y]=!NEGATIVE;
     
      
        
    }
  }
  Display();
}



  void  my_drawpixel(int x,int y, boolean Color){
     if(NEGATIVE==true){
    Color=!Color;
    }
if(y>=HEIGHT_LCD || x>= WIDTH_LCD || x<0 || y<0){
 return; 
}
cells[x][y]=Color;
  
  
}
  
  void DrawPixel(int x,int y, boolean Color){
    if(NEGATIVE==true){
    Color=!Color;
    }
if(y>=HEIGHT_LCD || x>= WIDTH_LCD || x<0 || y<0){
 return; 
}
cells[x][y]=Color;
  
  
};

 boolean GetPixel(int x,int y){
   
if(y>=HEIGHT_LCD || x>= WIDTH_LCD || x<0 || y<0){
 return false; 
}
   return cells[x][y];
 }
 
 
  void Circle(int x0,int y0, int r, boolean Color){
    
 if(r<1){return;}//thoát

 int f = 1 - r;
 int ddF_x = 1;
 int ddF_y = -2 * r;
 int x = 0;
 int y = r;

  my_drawpixel(x0, y0+r, Color);
  my_drawpixel(x0, y0-r, Color);
  my_drawpixel(x0+r, y0, Color);
  my_drawpixel(x0-r, y0, Color);

  while (x<y) {
    if (f >= 0) {
      y--;
      ddF_y += 2;
      f += ddF_y;
    }
    x++;
    ddF_x += 2;
    f += ddF_x;
  int x0x=x0+x,x0y=x0+y, x0_x=x0-x, x0_y=x0-y;
  int y0x=y0+x, y0y=y0+y, y0_x=y0-x, y0_y=y0-y;
// 1/2 góc phần tư thứ 1-trên
    my_drawpixel(x0x, y0_y, Color);
//1/2 góc phần tư thứ 1-dưới
    my_drawpixel(x0y, y0_x, Color);
// 1/2 góc phần tư thứ 2-trên
    my_drawpixel(x0_x, y0_y, Color);
// 1/2 góc phần tư thứ 2-dưới
    my_drawpixel(x0_y, y0_x, Color);
// 1/2 góc phần tư thứ 3-trên
    my_drawpixel(x0_y, y0x, Color);
// 1/2 góc phần tư thứ 3-dưới 
    my_drawpixel(x0_x, y0y, Color);
// 1/2 góc phần tư thứ 4-trên 
    my_drawpixel(x0y, y0x, Color); 
/// 1/2 góc phần tư thứ 4-dưới 
    my_drawpixel(x0x, y0y, Color);

    
  }



}

///////


void FillCircle(int x0,int y0,int r, boolean Color) {
 if(r<1){return;}//thoát
 int f = 1 - r;
 int ddF_x = 1;
 int ddF_y = -2 * r;
 int x = 0;
 int y = r;

  for (int i=y0-r; i<=y0+r; i++) {
    my_drawpixel(x0, i, Color);
  }

  while (x<y) {
    if (f >= 0) {
      y--;
      ddF_y += 2;
      f += ddF_y;
    }
    x++;
    ddF_x += 2;
    f += ddF_x;
  int y0y=y0+y;
  int y0x=y0+x;
    for (int i=y0-y; i<=y0y; i++) {
      my_drawpixel(x0+x, i, Color);
      my_drawpixel(x0-x, i, Color);
    } 
    for (int i=y0-x; i<=y0x; i++) {
      my_drawpixel(x0+y, i, Color);
      my_drawpixel(x0-y, i, Color);
    }    
  }

}

////

void duong_nam_ngang( int  x1, int  x2, int  y0,boolean Color){
  if(x1>x2){
  //  swap(x1,x2);
 int t=x1;
  x1=x2;
  x2=t;
  }

  for( int  x=x1; x<=x2; x++){
    my_drawpixel(x,y0, Color);
  }
}

void duong_thang_dung(int  x0, int  y1, int  y2, boolean Color){
  if(y1>y2){
   // swap(y1,y2);
    int t=y1;
  y1=y2;
  y2=t;
  }
  
  for( int  y=y1; y<=y2; y++){
my_drawpixel( x0,y,Color);

  }
}

//
int Abs(int x){
 if(x<0){
  x=x*(-1); 
 }
 return x;
}
void DrawLine(int  x0,int  y0,int  x1,int  y1,boolean Color) {
  if(x0==x1){
    duong_thang_dung(x0,y0,y1,Color);
    return;
  }
  if(y0==y1){
    duong_nam_ngang(x0,x1,y0,Color);
    return;
  }

 boolean  steep = Abs(y1 - y0) > Abs(x1 - x0);

  

  if (steep) {
    //swap(x0, y0);
   // swap(x1, y1);
   int t=x0; x0=y0; y0=t;
   t=x1; x1=y1; y1=t;
  }

  if (x0 > x1) {
 //   swap(x0, x1);
//    swap(y0, y1);
int t=x0; x0=x1; x1=t;
   t=y0; y0=y1; y1=t;
  }


int  dx=0, dy=0;
  dx = x1 - x0;
  dy = Abs(y1 - y0);
 int  err = dx / 2;
 int  ystep;

  if (y0 < y1) {
    ystep = 1;
  } else {
    ystep = -1;}

  for (; x0<=x1; x0++) {
    if (steep) {
      DrawPixel(y0, x0, Color);

    } else {
      DrawPixel(x0, y0, Color);
    }
    err -= dy;
    if (err < 0) {
      y0 += ystep;
      err += dx;
    }
  }


}

////////

void FillRect(int  x,int  y,int  w,int  h, boolean Color) {

  // stupidest version - just pixels - but fast with int ernal buffer!
  w+=x;
  h+=y;

  for (int  i=x; i<w; i++) {
    for (int  j=y; j<h; j++) {
      my_drawpixel(i, j, Color);
    }
  }



}

// draw a rectangle
void Rect(int  x,int  y,int  w,int  h, boolean Color) {
  // stupidest version - just pixels - but fast with int ernal buffer!
  w+=x;
  h+=y;
  for (int  i=x; i<w; i++) {
    my_drawpixel(i, y, Color);
    my_drawpixel(i, h-1, Color);
  }
  for (int  i=y; i<h; i++) {
    my_drawpixel(x, i, Color);
    my_drawpixel(w-1, i, Color);
  } 

 
}

// draw a rect have circle corner



void Corner(int  x,int  y,int  w,int  h,int  r, boolean Color){ 
// Thủ thuật 
//vẽ 4 cạnh hcn + 4 góc phần tư của hình tròn
//

if( (r>h/2)||(r>w/2)){
  return;// thoát
}
int  xr=x+r, xw=x+w, xw_r=x+w-r;
int  yr=y+r, yh=y+h, yh_r=y+h-r;
//cạnh trên
  duong_nam_ngang(xr, xw_r,y, Color);
// cạnh trái
  duong_thang_dung(x, yr, yh_r,Color);
//cạnh dưới
  duong_nam_ngang( xr, xw_r, yh,Color);
// cạnh phải
  duong_thang_dung(xw, yr, yh_r,Color);
  if(r<1){
    
  return;//thoát
  }
// Bắt đầu vẽ góc
 int  f = 1 - r;
 int  ddF_a = 1;
 int  ddF_b = -2 * r;
 int  a = 0;
 int  b = r;
  while (a<b) { 
if (f >= 0) {
      b--;
      ddF_b += 2;
      f += ddF_b;
    }
    a++;
    ddF_a += 2;
    f += ddF_a;
  
int  xw_ra=xw_r +a, xw_rb=xw_r+b;
 int  xr_a=xr-a, xr_b=xr-b;
 int  yr_a=yr-a, yr_b=yr-b;
 int  yh_ra=yh_r+a, yh_rb=yh_r+b;
// bo góc phải- trên
    my_drawpixel( xw_ra, yr_b, Color);
    my_drawpixel(xw_rb, yr_a, Color);
// bo góc trái-trên
    my_drawpixel(xr_a, yr_b, Color);
    my_drawpixel(xr_b, yr_a, Color);
// bo góc trái dưới
    my_drawpixel(xr_b, yh_ra, Color);
    my_drawpixel(xr_a, yh_rb, Color);
// bo góc phải- dưới 
    my_drawpixel(xw_rb, yh_ra, Color); 
    my_drawpixel(xw_ra, yh_rb, Color);

    
  }

}

void FillCorner(int  x,int  y,int  w,int  h,int  r, boolean Color){ 
// đành lười biếng kiểu này
// vẽ 4 hình tròn
  int  xw_r=x+w-r, yr=y+r, xr=x+r, yh_r=y+h-r;
  int  w_2r=w-2*r, h_2r=h-2*r;
FillCircle(xw_r, yr, r, Color);
FillCircle(xr, yr, r, Color);
FillCircle(xr, yh_r, r,Color);
FillCircle(xw_r, yh_r, r,Color);
// vẽ hình chữ nhật chèn vào
FillRect(xr, y, w_2r, h+1, Color);
FillRect(x, yr, r, h_2r, Color);
FillRect(xw_r, yr, r+1,h_2r,Color);




}

///////

void Tri(int x1,int y1,int x2,int y2,int x3,int y3, boolean Color){
  DrawLine(x3,y3,x1,y1,Color);
  DrawLine(x1,y1,x2,y2,Color);
  DrawLine(x2,y2,x3,y3,Color);


}


















void FillTri(int x1,int y1,int x2,int y2,int x3,int  y3, boolean Color)
{
int  sl,sx1,sx2;
double m1,m2,m3;
  if(y2>y3)
  {
   // swap(x2,x3);
    //swap(y2,y3);
    int t=x2; x2=x3; x3=t;
    t=y2; y2=y3; y3=t;
  }
  if(y1>y2)
  {
    //swap(x1,x2);
    //swap(y1,y2);
    int t=x1; x1=x2; x2=t;
    t=y1; y1=y2; y2=t;
  }
  m1=(double)(x1-x2)/(y1-y2);
  m2=(double)(x2-x3)/(y2-y3);
  m3=(double)(x3-x1)/(y3-y1);
  for(sl=y1;sl<=y2;sl++)
  {
    sx1= (int)(m1)*(sl-y1)+x1;
    sx2= (int)(m3)*(sl-y1)+x1;
    if(sx1>sx2){
  //    swap(sx1,sx2);
  int t=sx1; sx1=sx2; sx2=t;
    }
    duong_nam_ngang(sx1,sx2,sl,Color);
  }
  for(sl=y2;sl<=y3;sl++)
  {
    sx1= (int)(m2)*(sl-y3)+x3;
    sx2= (int)(m3)*(sl-y1)+x1;
    if(sx1>sx2)
    //  swap(sx1,sx2);
    {
  int t=sx1; sx1=sx2; sx2=t;
    }
    duong_nam_ngang(sx1, sx2,sl,Color);
  }
}

////////

void Plot4EllipsePoint16_ts(int  CX,int   CY,int  X, int  Y, boolean Color, boolean fill)
{
int  X1,X2,Y0A,Y0B;
X1=CX-X;
X2=CX+X;
Y0A=CY+Y;
Y0B=CY-Y;
  if(fill)
  { // to fill rather than draw a line, plot between the point16_ts
    duong_nam_ngang(X1, X2,Y0A,Color);
    //drawline(CX+X, CY+Y, CX-X, CY+Y, Color);
    duong_nam_ngang(X1,X2, Y0B, Color); 
    //drawline(CX-X, CY-Y, CX+X, CY-Y,Color);
  }
  else
  {
    DrawPixel(X2, Y0A, Color); //{point16_t in quadrant 1}

    DrawPixel(X1, Y0A, Color); //{point16_t in quadrant 2}

    DrawPixel(X1, Y0B,Color); //{point16_t in quadrant 3}

    DrawPixel(X2, Y0B, Color); //{point16_t in quadrant 4}

  }
}

void DrawEllipse_private(int CX, int  CY, int XRadius,int YRadius, boolean Color,boolean fill)
{
// ported the algorithm by John Kennedy found at
// http://homepage.smc.edu/kennedy_john/belipse.pdf
//
if((XRadius<1)||(YRadius<1)){
  return;//thoát
} 
  int X, Y;
  int XChange, YChange;
  int EllipseError;
  int TwoASquare,TwoBSquare;
  int StoppingX, StoppingY;
  TwoASquare = 2*XRadius*XRadius;
  TwoBSquare = 2*YRadius*YRadius;
  X = XRadius;
  Y = 0;
  XChange = YRadius*YRadius*(1-2*XRadius);
  YChange = XRadius*XRadius;
  EllipseError = 0;
  StoppingX = TwoBSquare*XRadius;
  StoppingY = 0;

  while ( StoppingX >=StoppingY ) 
  { 
    Plot4EllipsePoint16_ts(CX,CY,X,Y,Color, fill);

    Y++;
    StoppingY=StoppingY+ TwoASquare;
    EllipseError = EllipseError+ YChange;
    YChange=YChange+TwoASquare;
    if ((2*EllipseError + XChange) > 0 ) {
      X--;
      StoppingX=StoppingX- TwoBSquare;
      EllipseError=EllipseError+ XChange;
      XChange=XChange+TwoBSquare;
    }
  }

  Y = YRadius;
  X = 0;
  YChange = XRadius*XRadius*(1-2*YRadius);
  XChange = YRadius*YRadius;
  EllipseError = 0;
  StoppingY = TwoASquare*YRadius;
  StoppingX = 0;
  while ( StoppingY >=StoppingX )
  {
    Plot4EllipsePoint16_ts(CX,CY,X,Y,Color, fill);



    X++;
    StoppingX=StoppingX + TwoBSquare;
    EllipseError=EllipseError+ XChange;
    XChange=XChange+TwoBSquare;
    if ((2*EllipseError + YChange) > 0 ) {
      Y--;
      StoppingY=StoppingY- TwoASquare;
      EllipseError=EllipseError+ YChange;
      YChange=YChange+TwoASquare;
    }
  }
}


void Elip(int xCenter, int  yCenter, int xRadius,int yRadius,boolean Color)
{
  DrawEllipse_private(xCenter, yCenter, xRadius,yRadius, Color, false);
}

void FillElip(int xCenter, int  yCenter, int xRadius, int yRadius,boolean Color)
{
  DrawEllipse_private(xCenter, yCenter, xRadius, yRadius, Color, true);
}


 private int X_ELLIPSE,Y_ELLIPSE;
 
int Keep_Angle(int goc){
  // giữ cho góc trong khoảng 0->360
if(goc<0){
  goc=(-1)*goc;// đổi dấu
 goc=(goc%360);// giữ
  return 360-goc;
  } else{
    return goc%360;
  } 

}
void Find_XY_Elip( int x0, int y0,  int a, int b, int  goc_alpha){


goc_alpha=Keep_Angle(goc_alpha);
int L_rad;
float  F_rad, Fx_tich, Fy_tich;


 L_rad= (int)map( goc_alpha, 0, 360, 0,62838);
 F_rad=((float(L_rad))/10000.0);
 // đổi góc sang radian
 Fx_tich=(a*(cos(F_rad)));//
 Fy_tich=(b*(sin(F_rad))); // quỹ đạo của y thuộc sin*b (-b->+b)
 
X_ELLIPSE=x0+int(Fx_tich);
Y_ELLIPSE=y0-int(Fy_tich);
}
int X_Elip() {
return X_ELLIPSE;


}

int Y_Elip() {

  return Y_ELLIPSE;
}


////////////
boolean READ_BIT(char s, int n){
 //  đọc bit thứ n của byte x
 // nếu là 1 thì trả về true;
 
 if(s==(char)(s|(1<<n))){
  return true;
}else{
 return false; 
}
}
void Bitmap(int x, int y, int w, int h, char bitmap[], boolean Color) {
  boolean non=!Color;
 
    for (int i=0; i<w; i++ ) {

      for (int j=0; j<h; j++) {


    if(READ_BIT( bitmap[i+(j/8)*w],j%8)){// font: địa chỉ của mảng font[] là tên mảng đó

  my_drawpixel(x+i, y+j, Color);
      }else{

  my_drawpixel(x+i, y+j, non);
      }
    }
  }

}

////////

   //|||||||||||||||||||||||
void Plus_Bitmap(int x0, int y0, int w, int h,char bitmap[] , int goc, boolean mirror, boolean Color) {
 // xoay ảnh bitmap trong4 góc 0-90-180-270
int x=0,y=0;
boolean notcolor=!Color;
int w_1,h_1;
w_1=w-1;
h_1=h-1;
 for (int i=0; i<w; i++ ) {//con trỏ dich byte
  for (int j=0; j<h; j++) {// con trỏ dịch bit

 switch(goc){
  case 0:

         
  y=y0+j;//0
     if(mirror){
          
                  x=(x0+w_1)-i; // xoay 0 độ  gương
     }else{

                  x=x0+i;   // xoay 0 độ  thường 
     }
  break;
  case 90:

         
     y=(y0+w_1)-i;//90
     if(mirror){
x=(x0+h_1)-j;// xoay 90 độ  gương
     }else{
x=x0+j;// xoay 90 độ  thường
     }
  break;
  case 180:

          y=(y0+h_1)-j;//180
     if(mirror){
                    x=x0+i; // xoay 180 độ gương

     }else{

                    x=(x0+w_1)-i;// xoay 180 độ thường
     }
  break;
  case 270:

        
  y=y0+i;//270
     if(mirror){
               
       x=x0+j;// xoay 270 độ gương

     }else{
x=(x0+h_1)-j;// xoay 270 độ thường

     }
  break;
  

     }// switch

      if (READ_BIT( bitmap[i+(j/8)*w],j%8)) {
       my_drawpixel(x,y,Color);
       }else{
       my_drawpixel(x,y,notcolor);
       }
 }
}

}
//////////

void  Asc_Char(int x1, int y1, char c , boolean Color) {
boolean non=!Color;

  for (int i =0; i<5; i++ ) {
  for (int j =0; j<8; j++ ) {

    if(READ_BIT( font[c*5+i],j)){// font: địa chỉ của mảng font[] là tên mảng đó
   my_drawpixel(x1+i, y1+j,Color);
  }else{
 my_drawpixel(x1+i, y1+j,non);
  }
}
}

}


void  Asc_Char(int x1, int y1, int c , boolean Color) {
   Asc_Char(x1,y1, (char)c, Color);
}


void Asc_Char(int x1, int y1, char c,int he_so_phong_to,  boolean Color) {
Asc_Char( x1,  y1, c , Color);// vẽ

//rồi phóng to
if(he_so_phong_to>1){
phong_to(x1,y1, 5,7, he_so_phong_to, Color );// kích thước của font ascii trong thư viejn này là 5x7 cho mỗi kí tự
}
}
/////////
void Asc_String(int x1, int y1, String s , boolean Color) {


int x=x1;
char c;
// s.charAt( i) trả về kí tự i trong chuỗi
  int L=s.length();

  for(int  i=0; i<L;i++){
    // Mời bạn tìm hiểu thêm cách lưu biến tĩnh vào bộ nhớ flash trên trang arduino.vn
  c=s.charAt(i);
    Asc_Char(x, y1, c, Color);
    //Serial.print16_tln(c[i]);
   
    x += 6; // 6 pixels wide
    if (x + 6 >=  WIDTH_LCD  ){
      x = x1;    // ran out of this line
      y1+=8;
    }
    if ( y1 > HEIGHT_LCD)
      return;        // dừng vòng lặp
  }

}

void Asc_String(int  x1, int y1, String s ,int he_so_phong_to, boolean Color) {


if(he_so_phong_to==1){
Asc_String( x1,  y1, s ,Color) ;
return;///thoát

}

int x=x1;
 char c;

  int L=s.length();

  for(int  i=0; i<L;i++){
    c=s.charAt(i);
    // Mời bạn tìm hiểu thêm cách lưu biến tĩnh vào bộ nhớ flash trên trang arduino.vn
    Asc_Char(x, y1, c,he_so_phong_to, Color);
    //Serial.print16_tln(c[i]);
   
    x += 6*he_so_phong_to; // 6 pixels wide
    if (x + 6*he_so_phong_to >=  WIDTH_LCD  ){
      x = x1;    // ran out of this line
      y1+=8*he_so_phong_to;
    }
    if ( y1 >HEIGHT_LCD)
      return;        // dừng vòng lặp
  }

}

////////
public int Font_width, Font_high,Font_column_bitmap;// cài kích thước cho font được chọn
 

void SET_SIZE ( int select_font){
switch(select_font){
case 1:
Font_width=12;
Font_high=16;
Font_column_bitmap=120;//12*10
break;

case 2:
Font_width=16;
Font_high=16;
Font_column_bitmap=160;//16*10
break;
default:
//ascii
Font_width=5;
Font_high=7;
break;

}
  }

void  draw_single_number(int x1, int y1, int single_number, int select_font,boolean Color) {
//SET_SIZE(select_font);// chọn cỡ chữ theo font
boolean non=!Color;
int START=0;;
START=single_number*Font_width;

int  enter=0;

switch (select_font){
case 1:
//ADRESS=casio_number;

    for (byte i=0; i<Font_width; i++ ) {
       for (byte j=0; j<Font_high; j++) {
      if( j<8){
        enter=0;
      }else if(j<15){
        enter=Font_column_bitmap;


      }
      if (READ_BIT(casio_number[START+ i + enter],j%8)) {
  my_drawpixel(x1+i, y1+j, Color);
      }else{
        my_drawpixel(x1+i, y1+j, non);
      }
    }
  }


break;
case 2:
//ADRESS=style_number;
 for (byte i=0; i<Font_width; i++ ) {
       for (byte j=0; j<Font_high; j++) {
      if( j<8){
        enter=0;
      }else if(j<15){
        enter=Font_column_bitmap;


      }
      if (READ_BIT(style_number[START+ i + enter],j%8)) {
  my_drawpixel(x1+i, y1+j, Color);
      }else{
        my_drawpixel(x1+i, y1+j, non);
      }
    }
  }
break;
default:
//ADRESS=font[240];//48*5 byte đầu tiên của kí tự 0 (số 0 ) trang bảng ascii
START+=240;
 for (byte i=0; i<Font_width; i++ ) {
       for (byte j=0; j<Font_high; j++) {
      if( j<8){
        enter=0;
      }else if(j<15){
        enter=Font_column_bitmap;


      }
      if (READ_BIT(font[START+ i + enter],j%8)) {
  my_drawpixel(x1+i, y1+j, Color);
      }else{
        my_drawpixel(x1+i, y1+j, non);
      }
    }
  }
break;
}



}
////////////////

  void Number_Long(int x,int y, long a, int select_font, boolean Color){

 SET_SIZE(select_font);// chọn font
if(a==0){

draw_single_number(x,y,0,select_font, Color);

return;
}

int denta_x=0;
long font_w=Font_width+1;
long du;
long b;
if (a<0){
 // nếu a<0 thì đổi dấu
  a=(-1)*a;

Asc_Char((int)x,(int)(y+Font_width/2),(char)8, Color); //  VẼ dấu trừ (-) ở đằng trước

x+=6;//dịch con trỏ sang phải  , bắt đàu ghi số
} 
b=a;
while(b>9){
b/=10;
denta_x+=font_w;
}
x+=denta_x;
while (a>0){
du=(a%10);// lấy phần dư hàng đơn vị

draw_single_number(x,y,(int)(du),select_font,Color);
a=((a-du)/10);// lấy chẵn rồi giảm xuống 10 lần
x-=font_w;// dịch con trỏ sang trái  sau mỗi lần ghi
}// kết thúc a=0

  }
//////////////////

void Number_Float(int x, int y, float a,int n, int select_font,boolean Color){

// cập nhật ngày 5/4/2018 (Thái Sơn)
// fix lỗi thiếu kí tự 0 

 SET_SIZE(select_font);// chọn font
 if(a==0){

draw_single_number(x,y,0,select_font,Color);
return;
}
// vẽ phần trước dấu phảy

float sau;// 
 int b1,b2; // để lưu trong tính toán
int du ;// 1 số dư du
if (a<0){
 // nếu a<0 thì đổi dấu
a=(-1)*a;
Asc_Char(x,y+Font_width/2,(char)(8), Color); //  VẼ dấu trừ (-) ở đằng trước
x+=6;//dịch con trỏ sang phải  , bắt đàu ghi số
} 

b1=b2=(int)a;// ép về kiểu số nguyên, ta được số trước dấu phẩy
sau=a-float(b1);//tách lấy số sau dấu phẩy

int denta_x=0;
int font_w=Font_width+1;
while(b1>9){
  b1/=10;
  denta_x+=font_w;
}
x+=denta_x;// VẼ TỪ PHẢI SANG TRÁI


do{
if( b2>0){
  
du=b2%10; // lấy phần dư hàng đơn vị
draw_single_number(x,y,du,select_font,Color);

b2=((b2-du)/10); // kết thúc b2=0
}else{
  
draw_single_number(x,y,0,select_font,Color);
}
x-=font_w;//dịch con trỏ sang trái sau mỗi lần ghi
}while( b2>0);
// //////////////////kết thúc phần trước dấu phảy
x+=denta_x+2+font_w*2;
//vẽ dấu phẩy cách đằng trước và sau 2 pixel
FillRect(x,y+Font_high-2,2,2,Color);
x+=4;
// vẽ phần sau dấu phẩy
float d_sau;
d_sau=sau*(float)(pow(10,n));// nhân =(10 mũ n) n_max=8
b2=(int)d_sau;

x+=((n-1)*font_w);//dịch con trỏ sang phải 

byte count_stop=(byte)n;
do{
 
 if(b2>0){
du=b2%10; // lấy phần dư hàng đơn vị
draw_single_number(x,y,du,select_font,Color);

b2=((b2-du)/10); // kết thúc b2=0
 }else{
   
draw_single_number(x,y,0,select_font,Color);
 }
x-=font_w;//dịch con trỏ sang trái sau mỗi lần ghi
count_stop--;
}while( b2>0 || count_stop >0);


}

//////////


void Number_Float(int x, int y, float a,int n, int select_font,int
 he_so_phong_to, boolean Color){
   
   
// cập nhật ngày 5/4/2018 (Thái Sơn)
// fix lỗi thiếu kí tự 0 

if(  he_so_phong_to<=1){
Number_Float(x,y, a,n, select_font,Color);
  return;// thoát
}

 SET_SIZE(select_font);// chọn font
 if(a==0){

draw_single_number(x,y,0,select_font,Color);

phong_to( x,y, Font_width, Font_high, he_so_phong_to,Color);
return;
}
// vẽ phần trước dấu phảy

float sau;// 
 long b1,b2; // để lưu trong tính toán
int du ;// 1 số dư du
if (a<0){
 // nếu a<0 thì đổi dấu
a=(-1)*a;
Asc_Char(x,y+Font_width/2,(char)8, Color); //  VẼ dấu trừ (-) ở đằng trước

phong_to( x,y+Font_width/2, Font_width, Font_high, he_so_phong_to,Color);
x+=6*he_so_phong_to;//dịch con trỏ sang phải  , bắt đàu ghi số
} 

b1=b2=( long)a;// ép về kiểu số nguyên, ta được số trước dấu phẩy
sau=a-(float)(b1);//tách lấy số sau dấu phẩy

int denta_x=0;
int font_w=Font_width+1;
while(b1>9){
  b1/=10;
  denta_x+=font_w*he_so_phong_to;
}
x+=denta_x;// VẼ TỪ PHẢI SANG TRÁI



do{
du=(int)(b2%10); // lấy phần dư hàng đơn vị
if( b2>0){
  
draw_single_number(x,y,du,select_font,Color);
}else{
  
draw_single_number(x,y,0,select_font,Color);
}

phong_to( x,y, Font_width, Font_high, he_so_phong_to,Color);
b2=((b2-du)/10); // kết thúc b2=0
x-=font_w*he_so_phong_to;//dịch con trỏ sang trái sau mỗi lần ghi
}while( b2>0);



// //////////////////kết thúc phần trước dấu phảy
x+=denta_x+(2+font_w*2)*he_so_phong_to;
//vẽ dấu phẩy cách đằng trước và sau 2 pixel
FillRect(x,y+(Font_high-2)*he_so_phong_to,2,2,Color);

phong_to( x,y+(Font_high-2)*he_so_phong_to, 2, 2, he_so_phong_to,Color);
x+=4*he_so_phong_to;
// vẽ phần sau dấu phẩy
float d_sau;
d_sau=sau*(float)(pow(10,n));// nhân =(10 mũ n) n_max=8
b2=(long)d_sau;

x+=((n-1)*font_w)*he_so_phong_to;//dịch con trỏ sang phải 



byte count_stop=(byte)n;
do{
 
du=(int)b2%10; // lấy phần dư hàng đơn vị
 if(b2>0){
draw_single_number(x,y,du,select_font,Color);
 }else{
   
draw_single_number(x,y,0,select_font,Color);
 }
 
phong_to( x,y, Font_width, Font_high, he_so_phong_to,Color);
b2=((b2-du)/10); // kết thúc b2=0
x-=font_w*he_so_phong_to;//dịch con trỏ sang trái sau mỗi lần ghi
count_stop--;

}while( b2>0 || count_stop >0);


while( b2>0){
du=(int)b2%10; // lấy phần dư hàng đơn vị

draw_single_number(x,y,du,select_font,Color);
phong_to( x,y, Font_width, Font_high, he_so_phong_to,Color);
b2=((b2-du)/10); // kết thúc b2=0
x-=font_w*he_so_phong_to;//dịch con trỏ sang trái sau mỗi lần ghi

}


}



void  Uni_Char(int x1, int y1, char c, boolean Color){
boolean non=!Color;
int thu_tu;
thu_tu=tim_thu_tu(c);

int thuong;

thuong=thu_tu/6;// thương để xác định vị trí kí tự
thuong*=6;// nhân 6 để cho ra byte đầu tiên của kí tự đó
int so_du;
so_du=thu_tu%6;// số dư  để xác định vị trí dấu
so_du=so_du*6+348;// tìm byte
int dich_bit=0;
if(thu_tu<42){
  // nguyên âm thấp và không mũ
  dich_bit=3;
}
else if(thu_tu<72){
  // nguyên âm thấp và có mũ
  dich_bit=1;
} 
// ngược lại là nguyên âm cao, dich_bit=0;
//348 là byte thứ 348 , nơi bắt dầu bộ dấu
boolean read_bit_ki_tu=false; // trả về bit 0 hoặc 1
boolean read_bit_dau=false; // trả về bit 0 hoặc 1


int enter=0;
int tim_byte_phu_am=0;
tim_byte_phu_am=(thu_tu-144)*6+144;
// 144 là thứ tự bắt đầu phụ âm
    for (int i=0; i<6; i++ ) {
       for (int j=0; j<15; j++) {
      if( j<8){
      enter=i;
      }else if(j<14){
      enter=384+i;
      }// mỗi hàng có 384 byte, chúng ta có 2 hàng

if(thu_tu<144){// vẽ nguyên âm

read_bit_ki_tu=READ_BIT(vietnamese_vowel_table[enter+thuong],j%8);//đọc bitmap kí tự
read_bit_dau=READ_BIT( (char)(vietnamese_vowel_table[so_du+ enter]<<dich_bit),j%8);//đọc bit map dấu

}else{// vẽ phụ âm

read_bit_ki_tu=READ_BIT(  vietnamese_vowel_table[tim_byte_phu_am+ enter],j%8);//đọc bitmap kí tự phụ âm
}
//vẽ 

 if(read_bit_ki_tu||read_bit_dau){// j%8 đọc 2 byte 
  my_drawpixel(x1+i, y1+j, Color);
      }else{
        my_drawpixel(x1+i, y1+j, non);
      }
    }//for
}//for

}
//////////////



void Uni_Char(int x1, int y1, int c, boolean Color){ 
Uni_Char( x1, y1, (char)c, Color);

  
  
}
void Uni_Char(int x1, int y1, char c, int he_so_phong_to, boolean Color){ 

Uni_Char( x1,  y1,  c,  Color);// vẽ trước
if(he_so_phong_to>1){
phong_to( x1,y1,6,15,he_so_phong_to, Color );// 
// MÕI KÍ TỰ CÓ KÍCH THƯỚC 6x15 pixel
}
}


void Uni_Char(int x1, int y1, int c, int he_so_phong_to, boolean Color){ 

Uni_Char( x1,  y1,  (char)c,  Color);// vẽ trước
if(he_so_phong_to>1){
phong_to( x1,y1,6,15,he_so_phong_to, Color );// 
// MÕI KÍ TỰ CÓ KÍCH THƯỚC 6x15 pixel
}
}

///////////


void Uni_String(int x1, int y1, String s , boolean Color) {
int x=x1;
char c;// kiểu char 16 bít(  2 bytes)
int L=s.length();
for(int i=0; i<L ;i++){
  
 c=s.charAt(i);
    Uni_Char(x, y1, c, Color);
    //Serial.print16_tln(c[i]);
   
    x += 7; // 7 pixels wide
    if (x + 7 >=  WIDTH_LCD  ){
      x = x1;    // ran out of this line
      y1+=15;
    }
    if ( y1 > HEIGHT_LCD)
      return;        // dừng vòng lặp
  }

}

///////////



  void phong_to(int x0, int y0, int w0, int h0, int he_so_phong_to, boolean Color){
    // hàm này có nhiệm vụ phóng to một vùng ảnh lên gấp 2, gấp 4, gấp 8 ..
// đầu 


// b0:cấp phát một mảng để copy vùng ảnh 
 boolean copy_buffer[][]=new  boolean[w0][h0];
//bool *hh=new bool[h0];


    //b1: copy vùng ảnh tọa độ x0+w,y0+w kích thước 1xh0
    for( int w=0; w<w0; w++){
 for( int h=0; h< h0; h++){
  copy_buffer[w][h]=GetPixel( x0+w, y0+h);// kiểm tra xem điểm có được vẽ hay không

    }
  }

//b1.1: xóa vùng ảnh cũ

  for(int x=x0;x<w0+x0; x++){
    for(int y=y0; y<h0+y0; y++){
      my_drawpixel(x,y,WHITE);
    }
  }


    //b2: vẽ lại vùng ảnh với tỷ lệ 

    for( int w=0; w<w0; w++){
 for( int h=0; h< h0; h++){



if(copy_buffer[w][h]==true){


// phóng to điểm ảnh thành hình vuông kích thước he_so_phong_to*he_so_phong_to
for(int i=0; i< he_so_phong_to; i++){

for(int j=0; j< he_so_phong_to; j++){
my_drawpixel( x0+w*he_so_phong_to+i,y0+h*he_so_phong_to+j, Color);

  
}

}





}
}}

  }
  ////////////////
  
  
void Uni_String(int x1, int y1, String s , int he_so_phong_to ,boolean Color) {
if(he_so_phong_to==1){
Uni_String( x1,  y1, s ,Color) ;
return;///thoát

}

int x=x1;
char c;// kiểu char 16 bít(  2 bytes)
int L=s.length();
for(int i=0; i<L ;i++){
  
 c=s.charAt(i);
    Uni_Char(x, y1, c, he_so_phong_to,  Color);
    //Serial.print16_tln(c[i]);
    
    x += 7*he_so_phong_to; // 7 pixels wide
    if (x + 7*he_so_phong_to >=  WIDTH_LCD  ){
      x = x1;    // ran out of this line
      y1+=15*he_so_phong_to;
    }
    if ( y1 > HEIGHT_LCD)
      return;        // dừng vòng lặp
  }

}


  
  
  void Number_Long(int x,int y, long a,int select_font, int he_so_phong_to, boolean Color){
if(  he_so_phong_to==1){
Number_Long(x, y, a,select_font,Color);
  return;// thoát
}
 SET_SIZE(select_font);// chọn font
if(a==0){

draw_single_number(x,y,0,select_font,Color);
phong_to( x,y, Font_width, Font_high, he_so_phong_to,Color);
return;
}

int denta_x=0;
int font_w=Font_width+1;
int du;
long b;
if (a<0){
 // nếu a<0 thì đổi dấu
  a=(-1)*a;

Asc_Char(x,y+Font_width/2,(char)8, Color); //  VẼ dấu trừ (-) ở đằng trước

phong_to( x,y, Font_width, Font_high, he_so_phong_to,Color);
x+=6*he_so_phong_to;//dịch con trỏ sang phải  , bắt đàu ghi số
} 
b=a;
while(b>9){
b/=10;
denta_x+=(font_w*he_so_phong_to);
}
x+=denta_x;
while (a>0){
du=(int)a%10;// lấy phần dư hàng đơn vị

draw_single_number(x,y,du,select_font,Color);

phong_to( x,y, Font_width, Font_high, he_so_phong_to,Color);
a=((a-du)/10);// lấy chẵn rồi giảm xuống 10 lần
x-=(font_w*he_so_phong_to);// dịch con trỏ sang trái  sau mỗi lần ghi
}// kết thúc a=0

  }
//////////////
/////////////
private int X_SPHERE, Y_SPHERE;
void Find_XY_Sphere( int  x0, int  y0, int  a0, int  b0, int  goc_alpha, int  goc_beta){
  
//b1: tìm góc beta dạng số thực
goc_beta=Keep_Angle(goc_beta);
if((goc_beta>90)&&(goc_beta<270)){goc_alpha+=180;}
long L_rad; // long để lưu số  nguyên lớn hơn 32768
float  beta_rad;
 L_rad= (long)map( goc_beta, 0, 360, 0,62838); // map chỉ trả về số nguyên, đổi 360 độ =2*pi=6,2838 rad
 beta_rad=(((float)(L_rad))/10000.0); // chia cho 10000.0 dạng số thực
// b2: 
float a,b,y;
a=float(a0);
b=float(b0);
y=float(y0);
// hmax=a-b;
float hmax=(float)(a0-b0);
double ti_so_h=sin(beta_rad);
double ti_so_ab=abs(cos(beta_rad));

int   y_ellipse, a_ellipse, b_ellipse;
y_ellipse=(int)(y-hmax*ti_so_h);
a_ellipse=(int)(ti_so_ab*a);
b_ellipse=(int)(ti_so_ab*b);

Find_XY_Elip(x0, y_ellipse, a_ellipse, b_ellipse, goc_alpha);
X_SPHERE= X_Elip();
Y_SPHERE=Y_Elip();
}
 
 int  X_Sphere( ){
return X_SPHERE;
 }

int  Y_Sphere(){
  return Y_SPHERE;
}
///////////////////


char SWAP_CHAR( char m){
  char out=m;
  int vi_tri=(int)m ;
  // vị trí của m trong bảng ASCII
  if(vi_tri >= 65 && vi_tri <= 90){
    out= (char)(vi_tri+32);// 
  //  đổi thành chữ thường nếu m là chữ hoa
  } else
   if(vi_tri >= 97 && vi_tri <= 122){
    out= (char)(vi_tri-32);// 
  // đổi thành chữ hoa nếu m là chữ thường
  }
  
  // nếu m là chữ số thì giữ nguyên(trunwowngf hợp còn lại);
  return out;
}


boolean digitalRead(char KEY_PIN){
  boolean CHECK=false;
if (keyPressed) {
  
    char P=(char)key;
    if (P== KEY_PIN) {
      
       CHECK=true;
return CHECK;
    }else {
     
      KEY_PIN=SWAP_CHAR(KEY_PIN);
      if ( P==KEY_PIN) {
       CHECK=true;
    }
    }
  }
return CHECK;
}

int Pullup_4(char right_pin, char up_pin, char left_pin, char down_pin){
// nếu nút dược nhấn thì đọc bằng 0, mặc định =1

if ((digitalRead(right_pin)==false)&&(digitalRead(up_pin)==false)&&(digitalRead(left_pin)==false)&&(digitalRead(down_pin)==false)){
  return 0; // 0 nút nào được nhấn
} 
else{//có 1 hoặc 2 nút được nhấn 
    if(digitalRead(right_pin)==true){//  right được nhấn
            if(digitalRead(up_pin)==true){ return 20; }// (1*2)*10---nhấn cả up
            if(digitalRead(left_pin)==true){return 30;}// (1*3)*10---nhán cả left
            if(digitalRead(down_pin)==true){ return 40;}//(1*4)*10---nhấn cả down
        return 1;//chỉ mỗi nút right
    }//nếu chưa thỏa mãn thì duyệt tiếp
    if(digitalRead(up_pin)==true){//nếu up được nhấn 
             if(digitalRead(left_pin)==true){ return 60;}// (2*3)*10---nhấn cả left
             if(digitalRead(down_pin)==true){return 80;}//(2*4)*10---nhấn cả down
         return 2;//chỉ mỗi nút up
     }// nếu chưa thỏa mãn thì duyệt tiếp
    if(digitalRead(left_pin)==true){// left được nhấn
             if (digitalRead(down_pin)==true){return 120;}// (3*4)*100---nhấn cả down
         return 3; //chỉ mỗi left

    }
// nếu chưa thỏa mãn thì đây phải là down
    return 4;// chỉ mỗi nút down
}//đóng else

}// đóng 4button_pullup

///////////


void Analog( int x, int y, int w, int h, int value, boolean Color){
// mặc dù value mình đặt là uint16_t, nhưng, value chỉ được trong đoạn 0->250
 int Xi,Yi, v ;
boolean non=!Color;
w+=x;
h+=y;
v= (int)map (value, 0,500, h, y); //value max =500
DrawPixel(w-1, v, Color); // vẽ mồi điểm xuất phát tại cột cuối cùng, không thì hàm sẽ không hoạt động


for(Xi=x; Xi<w; Xi++ ){ // Quets hàng ngang
for (Yi=y ; Yi< h; Yi++){ //Quets hàng dọc
if (GetPixel(Xi, Yi)) {// Kiểm tra điểm đó có được vẽ hay không
  DrawPixel(Xi-1, Yi, Color);// vẽ sang bên trái 1 điểm tương tự
  DrawPixel(Xi, Yi, non); // Xóa ddiemr cũ bẵng một điểm có màu trắng
break;//thoát quét hàng dọc ngay lập tức

}


} //quét xong hàng dọc



}// quét xong hàng ngang


 }
 
 ////////////////////////
void Number_Ulong(int x,int y, long a,int select_font, int he_so_phong_to, boolean Color){
   
   Number_Long( x, y,  a,select_font, he_so_phong_to, Color);
   
 }
void Number_Ulong(int x,int y, long a,int select_font, boolean Color){
   
   Number_Long( x, y,  a,select_font, Color);
   
   
 }
 ////////
 
 
};// class
class ST7565 extends LCD_SCREEN{// khởi tạo class có tên ST7565

 
ST7565(int RST,int SCLK,int A0,int SID,int CS){
};

ST7565(int RST,int SCLK,int A0,int SID){
};

};// class

class PCD8544 extends LCD_SCREEN{// khởi tạo class có tên ST7565
 PCD8544(int RST,int SCLK,int A0,int SID,int CS){
};

 PCD8544(int RST,int SCLK,int A0,int SID){
};

};// class
