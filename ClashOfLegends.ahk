﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------
SetDefaultMouseSpeed 0

; ======================
; === Variables here ===
CLASH_FIGHT := Decorate("FANTASICA IMAGES/Event/ClashofLegends/selection/fight.png")
CLASH_NO := Decorate("FANTASICA IMAGES/Event/ClashofLegends/selection/no.png")
CLASH_START := Decorate("FANTASICA IMAGES/Event/ClashofLegends/preparation/start.png")
CLASH_YES := Decorate("FANTASICA IMAGES/Event/ClashofLegends/preparation/yes.png")
; ======================
loop
{
  if (DetectObject(CLASH_FIGHT)) {
    ClickObject(CLASH_FIGHT)
  }

  if (DetectObject(CLASH_NO)) {
    ClickObject(CLASH_NO)
  }

  if (DetectObject(CLASH_START)) {
    ClickObject(CLASH_START)
  }

  if (DetectObject(CLASH_YES)) {
    ClickObject(CLASH_YES)
  }
}
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
