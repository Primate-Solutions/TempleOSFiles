U0 Narrate(U32 pauseMs, U8 *st)
{
  "%s\n",st;
  Sleep(pauseMs);
}

U0 Speak(U8 *fmt,...)
{
  fmt=MStrPrint("%s ",fmt); //Append a space to fmt
  U8 *buf=StrPrintJoin(NULL,fmt,argc,argv);
  PutS(buf);
  Free(buf);
  Free(fmt);
  while (GetKey() != 10); //Enter key
  "\n";
}

Bool canYouUnderstand()
{
  U8 *sentences[6];
  sentences[0]="Can you understand me now?";
  sentences[1]="How about now?";
  sentences[2]="...a sada?"; //Serbian
  sentences[3]="Mozhe bi sega?"; //Bulgarian
  sentences[4]="E adesso?"; //Italian
  sentences[5]="...";
  I32 attempt=0;
  while (attempt < 6) {
    "Dog: %s ",sentences[attempt];
    U8 *st=GetStr;
    if (!StrICmp(st,"yes") || !StrICmp(st,"y")) {
      Free(st);
      return TRUE;
    }
    Free(st);
    attempt++;
  }
  return FALSE;
}

U0 Main()
{
  Narrate(3000, "You wake up and you don't know where you are.");
  Narrate(3000, "Your eyes are wide open but you can't see anything.");
  Narrate(3000, "Suddenly a dog appears in front of you.");
  Speak("Dog: Arf. Arf arf arf?");
  Speak("Dog: ...");
  Speak("Dog: I apologize, I have not spoken to one of you in a long time.");
  if (!canYouUnderstand()) {
    Narrate(0, "The dog vanishes.");
    return;
  }
  Narrate(2000, "Dog: Good. We don't have much time.");
  U8 *name=GetStr("Dog: My name is Walter, what is your name? ");
  Speak("Walter: %s now listen to me carefully...",name);
  Free(name);
}
Main;
