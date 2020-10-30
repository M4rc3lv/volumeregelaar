// Volumeregelaar 27 oktober 2020
#include <Keyboard.h>
#include <Adafruit_NeoPixel.h>

#define LEDRING   9
#define NUMPIXELS 16
#define ROT_CLK   8
#define ROT_DATA  7
#define PAUZE 10
#define UIT   6

Adafruit_NeoPixel LedRing(NUMPIXELS, LEDRING, NEO_GRB + NEO_KHZ800);

uint32_t Kleuren[] = {
 0x002000,0x004000,0x006000,0x008000,0x00a000,0x00c000,0x00e000,
 0x20e000,0x40e000,0x60e000,0x80e000,0xa0e000,0xc0e000,0xe0e000,
 0xe0c000,0xe0a000,0xe08000,0xe06000,0xe04000,0xe02000,0xe00000
};
#define PAARS 0x120010
#define ROOD  0xAD0000

void setup() {
 LedRing.begin(); 
 Kleur(ROOD); 
 delay(10000);
 Serial.begin(115200);
 Serial.println("Klaar!");
 pinMode(ROT_CLK, INPUT_PULLUP); 
 pinMode(ROT_DATA,INPUT_PULLUP);
 pinMode(PAUZE,INPUT_PULLUP);
 pinMode(UIT,INPUT_PULLUP);
 Keyboard.begin(); 
 Kleur(Kleuren[7]);
}

static uint8_t prevNextCode = 0;
static uint16_t store=0;

int Vol=7,Vorigekleur=-1;
bool Uit=true;

void loop() {  
 Uit = digitalRead(UIT)!=0;
 if(Uit) Kleur(PAARS);
 
 if(!Uit && read_rotary()) {  
  if(prevNextCode==0x0b) 
   {Vol--; VolDown();}
  else if(prevNextCode==0x07)    
   {Vol++; VolUp();}
  Serial.println(Vol);

  int k=Vol;
  if(k<0) k=0; if(k>20)k=20;
  if(k!=Vorigekleur) {
   Vorigekleur=k;
   Kleur(Kleuren[k]);   
  }
 } 

 if(!Uit) {
  if(digitalRead(PAUZE)==0) {
   // VLC
   Keyboard.press(KEY_LEFT_SHIFT);
   Keyboard.press(KEY_LEFT_ALT);
   Keyboard.press(KEY_F7);
   delay(180);
   Keyboard.releaseAll();
   // Audaciuos
   Keyboard.press(KEY_LEFT_CTRL);
   Keyboard.press(KEY_LEFT_ALT);
   Keyboard.press('p');
   delay(180);
   Keyboard.releaseAll();  
  } 
 }    
}

void Kleur(uint32_t k) {
 for(int i=0; i<NUMPIXELS; i++)
  LedRing.setPixelColor(i, k);
 LedRing.show();
}

void VolUp() {
 // VLC
 Keyboard.press(KEY_LEFT_SHIFT);
 Keyboard.press(KEY_LEFT_ALT);
 Keyboard.press(KEY_F9);
 delay(90);
 Keyboard.releaseAll();
 // Audacious
 Keyboard.press(KEY_LEFT_SHIFT);
 Keyboard.press(KEY_LEFT_ALT);
 Keyboard.press(']'); 
 delay(90);
 Keyboard.releaseAll(); 
}

void VolDown() {
 Keyboard.press(KEY_LEFT_SHIFT);
 Keyboard.press(KEY_LEFT_ALT);
 Keyboard.press(KEY_F8); 
 delay(90);
 Keyboard.releaseAll();
 // Audacious
 Keyboard.press(KEY_LEFT_SHIFT);
 Keyboard.press(KEY_LEFT_ALT);
 Keyboard.press('['); 
 delay(90);
 Keyboard.releaseAll(); 
}

int8_t read_rotary() {
 // Goede code om rotary encoder uit te lezen (met ingebouwde debounce) van John Main
 // Zie: https://www.best-microcontroller-projects.com/rotary-encoder.html
 static int8_t rot_enc_table[] = {0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0};
 prevNextCode <<= 2;
 if (digitalRead(ROT_DATA)) prevNextCode |= 0x02;
 if (digitalRead(ROT_CLK)) prevNextCode |= 0x01;
 prevNextCode &= 0x0f; 
 if  (rot_enc_table[prevNextCode] ) {
  store <<= 4;
  store |= prevNextCode;
  if ((store&0xff)==0x2b) return -1;
  if ((store&0xff)==0x17) return 1;
 }
 return 0;
}
