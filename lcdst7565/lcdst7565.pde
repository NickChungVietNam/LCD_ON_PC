


void setup() {size (1025, 600); set_lcd(128,64); stroke(150); noSmooth(); background(0); noLoop();}
void draw() {UPDATE_LCD(); }
void mousePressed() { SETUP();SET_TIME();  while(true){ LOOP();}}

///////////////////////////////////////////
// Từ thành công của 2 bộ thư viện lcd, do nhu cầu của công việc và mong muốn từ phía cộng đồng
// Việc triển khai các ý tưởng với lcd sẽ nhanh hơn với bộ công cụ này
// Đây là công cụ giả lập lcd , giúp bạn lập trình các dự án với lcd nhanh hơn và thuận tiện hơn.
// Các lcd được hỗ trợ thư viện cho arduino  là lcd ST7565 và NOKIA5110 
//  ST7565 :http://arduino.vn/tutorial/1319-st7565-huong-dan-su-dung-glcd-st7565-homephone-va-chia-se-thu-vien
// ST7565 git : https://github.com/NickChungVietNam/st7565_library_arduino
// NOKIA5110 : http://arduino.vn/tutorial/1345-nokia5110-huong-dan-su-dung-va-chia-se-thu-vien-hoang-sa
// NOKIA5110  git: https://github.com/NickChungVietNam/HOANG_SA_LIBRARY_LCD5110_NOKIA
// mã nguồn dự án này :https://github.com/NickChungVietNam/LCD_ON_PC
//////////////////////////////////////////
// hàm set_lcd(128,64); sẽ giúp bạn tùy chỉnh kích thước màn hình


ST7565 lcd=new ST7565(4,5,6,7);

void SETUP(){
  
  lcd.ON();
  lcd.SET(25,0,0,0,0);
  lcd.Clear();
}




void LOOP(){
  //lcd.DrawPixel(  10,10,BLACK);
 // lcd.DrawLine(0,0,10,10,BLACK);
// lcd.Rect(5,5, 10,10, BLACK);
//lcd.FillRect(5,5, 10,10, BLACK);
//lcd.Corner(5,5, 50,40,10, BLACK);
//lcd.FillCorner(5,5, 50,40,10, BLACK);
//lcd.FillTri(0,0, 100,30, 50,50, BLACK);
//lcd.Tri(0,0, 100,30, 50,50, BLACK);
//lcd.Elip( 50,30,30,20,BLACK);
//lcd.FillElip( 50,30,30,20,BLACK);
/*
  int x,y;
 int x0=60, y0=30, a=30,b=20;
  for( int goc=0; goc<360; goc++){
    
    lcd.Find_XY_Elip(x0,y0,a,b,goc);
    x=lcd.X_Elip();
    y=lcd.Y_Elip();

    
    lcd.DrawPixel( x,y,BLACK);
    lcd.Display();
    delay(10);
  }
  */
  
  //lcd.Bitmap(50,20,32,32,icon, BLACK);
  
 //lcd.Bitmap(50,20,32,32,icon, BLACK);
 // lcd.Bitmap(0,0,120,16,casio_number, BLACK);
  /*
   for(int goc=0; goc<=360; goc+=90){
  lcd.Plus_Bitmap(50,20,32,32,icon,goc,NO_MIRROR,BLACK);
  lcd.Display();
  delay(1000);
  }
  */
 // lcd.Asc_Char(10,10,'A',BLACK);
   /*
   String str1="cach 1";
  lcd.Asc_String(0,0,str1, BLACK);
  lcd.Asc_String(0,10,"cach 2", BLACK);
  
  lcd.Asc_String(0,10,Asc("cach 3"), BLACK);
  */
  //ASCII_NUMBER =0;
// CASIO_NUMBER =1;
// STYLE_NUMBER =2;
// chọn FONT số

 // lcd.draw_single_number(30,10,4,ASCII_NUMBER,BLACK);
   //lcd.Number_Long( 10,10,-454765,ASCII_NUMBER,BLACK);
   //lcd.Number_Float(10,10,67.87678, 5,ASCII_NUMBER, BLACK);
//   lcd.Uni_Char(10,10,'Ệ',BLACK);
//lcd.Uni_String(10,10," ò ó o" , BLACK);
//lcd.Uni_String(10,10,Uni("Phùng Thái Sơn") , BLACK);

 //lcd.Number_Long( 10,10,-4545,2,2,BLACK);
// lcd.Number_Long( 10,10,-4545,2,BLACK);
//lcd.Number_Float(10,10, 57.56545,3, 2, 2,BLACK);
  
 /// println(lcd.Pullup_4('a','s','w','d'));
 
 //lcd.AllPixel();   
 
 //lcd.Clear();  
 int x=6;
 boolean Trang_thai=true;
 while(true){
   
  lcd.Circle(x, 10,6, BLACK);
  lcd.Display();
  delay(50);
  lcd.Circle(x, 10,6, DELETE);
  // hoặc lcd.Clear();
   if(Trang_thai==true){
   x=x+1;
   }else{
    x--; 
   }
   
   if(x +6 > WIDTH_LCD || x -6< 0){
    Trang_thai=!Trang_thai; 
   }
   if(x==60){
    lcd.Asc_String(30,30,"Middle", BLACK);
    lcd.Display();
   }
 }
  

    
 // lcd.Clear();
  
 

}