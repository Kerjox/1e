//comprobación de tarjeta
//RST          D9
//SDA(SS)      D10
//MOSI         D11
//MISO         D12
//SCK          D13
 
#include <SPI.h>
#include <MFRC522.h>
#include <Arduino.h>
#include <Wire.h>
#include <SoftwareSerial.h>

long DO=523.25, //definimos las frecuencias de las notas
        DoS=554.37,
        RE=587.33,
        RES=622.25,
        MI=659.26,
        FA=698.46,
        FAS=739.99,
        SOL=783.99,
        SOLS=830.61,
        LA=880,
        LAS=932.33,
        SI=987.77,
        RE2=1174.66,
        FAS2=1479.98,
        DO2=1046.50,
        PAU=30000; //pausa
int melodia[] = {MI, SOL, DO2, SI, FA, FA, FA, FA, FA, SOL, SI, LA, MI, MI, MI, MI, MI,FA, LA, SOL, RE, RE, RE, RE, RE, FA, LA, SOL, MI, SOL, DO2, SI, FA, FA, FA, FA, FA, SOL, SI, LA, MI, MI, MI, MI, MI, FA, LA, SOL, RE, RE, RE, SOL, FA, MI, RE, DO, SOL, FA, MI, RE, SOL, MI, RE, DO, SOL, FA, MI, RE, LA, SOL, SOL, LA, DO2, LA, MI, MI, FA, FA, MI, FA, SOL, FA, RE, SOL, MI, RE, DO, SOL, FA, RE, LA, SOL, SOL, LA, DO, LA, SOL, MI, FA, FA, MI, RE, DO, DO, DO, DO, LA, SOL, SOL, SOL, SOL, FA, MI, RE, LA, SOL, DO, DO, DO2, DO2, LA, SOL, SOL, SOL, SOL, LA, FA, SI, SOL, DO2, DO2
};
int d=1000, e=500, m=250, c=125; //definimos los tiempos de doble, entera, media y cuarta
int duracionNota[] = {e, e, e, m, c, m, m, m, m, m, m, m, c, m, m, m, m, m, m, e, c, m, m, m, m, m, m, d, m, m, m, e, c, m, m, m, m, m, m, m, e, c, m, m, m, m, m, m, m, e, c, m, m, m, m, m, m, d, e, d, m, e, e, d, m, e, e, d, m, e, e, d, e, d, e, e, d, e, m, d, m, m, m, d, e, d, e, e, d, m, e, m, d, e, e, d, e, d, e, e, d, d, d, m, m, m, d, m, m, d, m, m, d, m, m, m, e, e, e, e, d, m, m, d, m, m, d, m, m, m, e, e, e, e, d, d 
};
 
const int RST_PIN = 9;        // Pin 9 para el reset del RC522
const int SS_PIN = 10;        // Pin 10 para el SS (SDA) del RC522
MFRC522 mfrc522(SS_PIN, RST_PIN);   // Crear instancia del MFRC522
 
byte validKey1[4] = { 0x17, 0x1C, 0xCD, 0x73 };  // Ejemplo de clave valida
 
//Función para comparar dos vectores
bool isEqualArray(byte* arrayA, byte* arrayB, int length)
{
  for (int index = 0; index < length; index++)
  {
    if (arrayA[index] != arrayB[index]) return false;
  }
  return true;
}
 
void setup() {
  pinMode(3, OUTPUT);
  Serial.begin(9600); // Iniciar serial
  SPI.begin();        // Iniciar SPI
  mfrc522.PCD_Init(); // Iniciar MFRC522
}
 
void loop() {
  // Detectar tarjeta
  if (mfrc522.PICC_IsNewCardPresent())
  {
    //Seleccionamos una tarjeta
    if (mfrc522.PICC_ReadCardSerial())
    {
      // Comparar ID con las claves válidas
      if (isEqualArray(mfrc522.uid.uidByte, validKey1, 4)){
        Serial.println("Tarjeta valida");
        for (int notaActual = 0; notaActual < 112; notaActual++) {  //va a repetir las 112 notas
tone(3, melodia[notaActual]); //da el tono a la frecuencia de la nota en ese momento
delay(duracionNota[notaActual]);//se mantiene con la nota el tiempo definido para esa nota
noTone(3); //finaliza la melodía}
}}
      else
        Serial.println("Tarjeta invalida");
        
      // Finalizar lectura actual
      mfrc522.PICC_HaltA();
    }

  delay(250);
}}
 
