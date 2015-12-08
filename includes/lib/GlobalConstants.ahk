﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



Init_globals()
{
	; Declare that call variables in this function are global variables
	global
	
	; Discover the window title
	if WinExist("BlueStacks App Player")
	{
		BLUESTACK_WINDOW_TITLE := "BlueStacks App Player"
		WinActivate, %BLUESTACK_WINDOW_TITLE%
		WinWaitActive, %BLUESTACK_WINDOW_TITLE%, , 2
	}
	else if WinExist("Bluestacks App Player")
	{
		BLUESTACK_WINDOW_TITLE := "Bluestacks App Player"
		WinActivate, %BLUESTACK_WINDOW_TITLE%
		WinWaitActive, %BLUESTACK_WINDOW_TITLE%, , 2
	}
	else
	{
		MsgBox % "Did not find any of the following matching window titles: `n"
				 . "'BlueStacks App Player'`n'Bluestacks App Player'"
				 . "`nPausing the script."
		Pause
	}

	; Obtain the window size in terms of width and height.
	; We use the width and height to set the bot's parameters such as
	; initial scan coordinates, the location to idly click, and image paths.
	WinGetPos,,,width, height, %BLUESTACK_WINDOW_TITLE%
	if (width == 0 || height == 0)
	{
		MsgBox % "Invalid window size"
	}
	X2 := width
	Y2 := height


	if (width == 632 && height == 1030)
	{
		; The two coordinates tells the bot where it should idly click
		WAIT_X := 325
		WAIT_Y := 380

		; The first two parameters are coordinates taht tell the bot where 
		; the first bingo tile is located. 
		; The third parameter tells the bot the dimension (in pixels) of 
		; the square bingo tile.
		BINGO_START_X := 491
		BINGO_START_Y := 233
		BINGO_TILE_SIZE := 70

		; These four parameters are start and end coordinates used in the
		; quest procedure to control the amount of scrolling the bot should
		; perform (specified in pixels).
		QUEST_X1 := 293
		QUEST_Y1 := 840
		QUEST_X2 := 293
		QUEST_Y2 := 130

		; The first two parameters are coordinates used in the quest procedure's
		; findCoordinate functions and tells the bot where it should begin its
		; scan for a valid unit placement.
		; The third parameter tells the bot how large a unit tile roughly is.
		SCAN_START_X := 167
		SCAN_START_Y := 68
		SCAN_TILE_SIZE := 78
	}
	else if (width == 677 && height == 1102)
	{
		WAIT_X := 325
		WAIT_Y := 380

		BINGO_START_X := 491
		BINGO_START_Y := 233
		BINGO_TILE_SIZE := 70

		QUEST_X1 := 293
		QUEST_Y1 := 840
		QUEST_X2 := 293
		QUEST_Y2 := 130

		SCAN_START_X := 167
		SCAN_START_Y := 68
		SCAN_TILE_SIZE := 78
	}
	else if (width == 1282 && height == 749)
	{
		WAIT_X := 490
		WAIT_Y := 300

		BINGO_START_X := 491
		BINGO_START_Y := 233
		BINGO_TILE_SIZE := 70

		QUEST_X1 := 500
		QUEST_Y1 := 623
		QUEST_X2 := 500
		QUEST_Y2 := 163

		SCAN_START_X := 465
		SCAN_START_Y := 99
		SCAN_TILE_SIZE := 51
	}
	else if (width == 1920 && height == 1080)
	{
		WAIT_X := 735
		WAIT_Y := 425

		BINGO_START_X := 745
		BINGO_START_Y := 330
		BINGO_TILE_SIZE := 100

		QUEST_X1 := 840
		QUEST_Y1 := 870
		QUEST_X2 := 840
		QUEST_Y2 := 190

		SCAN_START_X := 702
		SCAN_START_Y := 132
		SCAN_TILE_SIZE := 75
	}
	else
	{
		WAIT_X := 325
		WAIT_Y := 380

		BINGO_START_X := 491
		BINGO_START_Y := 233
		BINGO_TILE_SIZE := 70

		QUEST_X1 := 293
		QUEST_Y1 := 840
		QUEST_X2 := 293
		QUEST_Y2 := 130

		SCAN_START_X := 167
		SCAN_START_Y := 68
		SCAN_TILE_SIZE := 78
	}
  
	FANTASICAAPP_BUTTON := "FANTASICA IMAGES\Bluestack\appfantasica-" . width . "_" . height . ".png"
  
	if (GARDEN == 1)
	{
		QUEST1_ICON := "FANTASICA IMAGES\Event\GardenOfTranquility\iconevent-" . width . "_" . height . ".png" ;Quest icon on home page
	}
	else
	{
		QUEST1_ICON := "FANTASICA IMAGES\MainPage\iconquest1-" . width . "_" . height . ".png" ;Quest icon on home page
	}	
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-" . width . "_" . height . ".png" ;Quest icon on home page
	
	EPISODESELECT1_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode1-" . width . "_" . height . ".png"
	EPISODESELECT2_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode2-" . width . "_" . height . ".png"
	EPISODESELECT3_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode3-" . width . "_" . height . ".png"
	EPISODESELECT4_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode4-" . width . "_" . height . ".png"
	EPISODESELECT5_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode5-" . width . "_" . height . ".png"
	EPISODESELECT6_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode6-" . width . "_" . height . ".png"
	EPISODESELECT7_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode7-" . width . "_" . height . ".png"
	EPISODESELECT8_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode8-" . width . "_" . height . ".png"
	EPISODESELECT9_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode9-" . width . "_" . height . ".png"
	EPISODESELECT10_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode10-" . width . "_" . height . ".png"
	
	EPISODELISTNEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnextpage-" . width . "_" . height . ".png"
	EPISODELISTNONEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnonextpage-" . width . "_" . height . ".png"
	
	SELECTEPISODE_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonselectepisode-" . width . "_" . height . ".png" ;The 'Select Episode' button for quest
	STARTQUEST1_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest1-" . width . "_" . height . ".png" ;quest #1
	STARTQUEST2_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest2-" . width . "_" . height . ".png" ;quest #2
	STARTQUEST3_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest3-" . width . "_" . height . ".png" ;quest #3
	STARTQUEST4_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest4-" . width . "_" . height . ".png" ;quest #4
	STARTQUEST5_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest5-" . width . "_" . height . ".png" ;quest #5
	STARTQUEST6_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest6-" . width . "_" . height . ".png" ;quest #6
	STARTQUEST7_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest7-" . width . "_" . height . ".png" ;quest #7 
	
	STARTTRAINING1_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining1-" . width . "_" . height . ".png"
	STARTTRAINING2_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining2-" . width . "_" . height . ".png" 
	STARTTRAINING3_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining3-" . width . "_" . height . ".png"
	STARTTRAINING4_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining4-" . width . "_" . height . ".png" 
	STARTTRAINING5_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining5-" . width . "_" . height . ".png"
	TRAININGCHALLENGE_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttrainingboss-" . width . "_" . height . ".png"
	TRAINING_TEXT := "FANTASICA IMAGES\Training\TrainingSelection\texttraining-" . width . "_" . height . ".png"
	ADVANCE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonadvance-" . width . "_" . height . ".png" 
	SENDBRAVE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonsendbrave-" . width . "_" . height . ".png"
	HEAL_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonheal-" . width . "_" . height . ".png" 
	OUTOFTP_TEXT := "FANTASICA IMAGES\Training\ActualTraining\texttrainingpoints-" . width . "_" . height . ".png"
	CONTINUETRAINING_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttoncontinuetraining-" . width . "_" . height . ".png"
	TRAININGMYPAGE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonmypage-" . width . "_" . height . ".png"
	TRAININGFIGHT_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonfight-" . width . "_" . height . ".png"
	TRAININGSUMMONALLY_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonsummonally-" . width . "_" . height . ".png"
	
	TRAININGPROGRESSCOMPLETE_TEXT := "FANTASICA IMAGES\Training\ActualTraining\textprogresscomplete-" . width . "_" . height . ".png"

	CALLALLY_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-" . width . "_" . height . ".png" ;the call ally button in questing
	CANCELPLACEMENT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-" . width . "_" . height . ".png" ; the cancel placement button
	CONFIRMUNITPLACEMENT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-" . width . "_" . height . ".png" ;confirm the location to place unit
	DEPLOYUNIT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-" . width . "_" . height . ".png"	;The 'Deploy' button during questing
	
	DEPLOYUNIT1_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-" . width . "_" . height . ".png" ;first unit in the 'Deploy List'
	DEPLOYUNIT2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit2-" . width . "_" . height . ".png" ;second unit in the 'Deploy List'
	DEPLOYUNIT3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit3-" . width . "_" . height . ".png" ;third unit in the 'Deploy List'
	DEPLOYUNIT4_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit4-" . width . "_" . height . ".png" ;fourth unit in the 'Deploy List'
	UNITFAVORITEON_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-" . width . "_" . height . ".png" ;favorite on
	UNIT1_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-" . width . "_" . height . ".png" ;first unit when unable to deploy (due to insufficient unit cost)
	UNIT2_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit2-" . width . "_" . height . ".png" ;second unit when unable to deploy (due to insufficient unit cost)
	UNIT3_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit3-" . width . "_" . height . ".png" ;third unit when unable to deploy (due to insufficient unit cost)
	UNIT4_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit4-" . width . "_" . height . ".png" ;fourth unit when unable to deploy (due to insufficient unit cost)
	
	DEPLOYALLY1_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally1-" . width . "_" . height . ".png"    ;ally1 top of the list
	DEPLOYALLY2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally2-" . width . "_" . height . ".png" ;ally2 second on the list
	DEPLOYALLY3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally3-" . width . "_" . height . ".png" ;ally3 third on the list
	NEXTPAGE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnextpage(allylist)-" . width . "_" . height . ".png" ;the 'next page' button on the ally selection
	NONEXTPAGE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnonextpage(allylist)-" . width . "_" . height . ".png" ;the 'no next page' button on the ally selection
	
	CALLALLYPAGE_TEXT := "FANTASICA IMAGES\Quest\QuestBattle\Ally\textcallallypage-" . width . "_" . height . ".png" ;the page titled 'Call Ally'
	
	BACKQUEST_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonbackallyselection-" . width . "_" . height . ".png" ;the back button found in quest's unit selection
	SORTBYDEFAULT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbydefault-" . width . "_" . height . ".png" ;no specific sort
	SORTBYGROUNDATK_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbygroundatk-" . width . "_" . height . ".png" ;Sort unit by strongest land to weakest
	SORTBYAIRATK_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyairatk-" . width . "_" . height . ".png" ;sort unit by strongest air to weakest
	SORTBYSEAATK_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyseaatk-" . width . "_" . height . ".png" ;sort unit by strongest sea to weakest
	UNITALL_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonunitall-" . width . "_" . height . ".png" ;type all
	UNITMELEE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmelee-" . width . "_" . height . ".png" ; type melee
	UNITMISSILE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmissile-" . width . "_" . height . ".png" ;type missile
	UNITMAGIC_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmagic-" . width . "_" . height . ".png" ;type magic
	
	BACKTOEVENT_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonbacktoevent(completed)-" . width . "_" . height . ".png" ; The 'Back to Event' button after defeating a event boss encountered during training
	CHOOSEQUESTCOMPLETED_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonchoosequest(completed)-" . width . "_" . height . ".png" ;The 'Choose Quest' button on the results page after completing a quest
	MYPAGE_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonmypage-" . width . "_" . height . ".png" ;The 'My Page' button on the results page after questing
	TOWERCOMPLETEREWARDCARDBACK_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonbacktowercompleterewardcard-" . width . "_" . height . ".png" ;The back button on reward card received upon completion of the tower
	QUESTCLEAR_TEXT := "FANTASICA IMAGES\Quest\QuestResult\textquestclear-" . width . "_" . height . ".png"
	
	CONNECTIONERROR_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonconnectionerror-" . width . "_" . height . ".png" ;The 'Yes' button when a connection error has occured.	
	FORCECLOSEAPP_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonforcecloseapp-" . width . "_" . height . ".png" ;force closes the app
	CONNECTIONERROR_TEXT := "FANTASICA IMAGES\ErrorRelated\textconnectionerror-1920_1080.png" ;the dialog which indicates we need to restart the app
	FANTASICALOADPAGE_TEXT := "FANTASICA IMAGES\ErrorRelated\textfantasicaloadpage-" . width . "_" . height . ".png" ;the background image while fantasica is launching/loading
	
	MAINTENANCEYES_BUTTON := "FANTASICA IMAGES\Maintenance\buttonmaintenanceyes-" . width . "_" . height . ".png"
	MAINTENANCEOPTION_BUTTON := "FANTASICA IMAGES\Maintenance\buttonoption.png"
	MAINTENANCE_TEXT := "FANTASICA IMAGES\Maintenance\textmaintenance-" . width . "_" . height . ".png"
	
	CONFIRMEXITAPP_BUTTON := "FANTASICA IMAGES\Bluestack\buttonconfirmexitapp-" . width . "_" . height . ".png" ;The 'yes' button when exiting the bluestack app
	
	DECLINEADVERTISEMENT_BUTTON := "FANTASICA IMAGES\StartScreen\buttondeclineadvertisement-" . width . "_" . height . ".png" ;the 'No Thanks' button when an advertisement pops up
	STARTGAME_BUTTON := "FANTASICA IMAGES\StartScreen\buttonstartgame-" . width . "_" . height . ".png" ;start game button 
	RESUMEQUESTNO_BUTTON := "FANTASICA IMAGES\StartScreen\buttonresumequestno-" . width . "_" . height . ".png" ;do not resume an interrupted quest
	
	DECLINEADVERTISEMENTMYPAGE_BUTTON := "FANTASICA IMAGES\Advertisement\buttondeclineadvertisement(mypage)-" . width . "_" . height . ".png" ;advertisement on mypage	
	MAYBELATERADVERTISEMENT_BUTTON := "FANTASICA IMAGES\Advertisement\buttonmaybelateradvertisement-" . width . "_" . height . ".png" ;the 'maybe' button for the advertisement for other apps at the start screen
	CANCELADVERTISEMENT_BUTTON := "FANTASICA IMAGES\Advertisement\buttoncanceladvertisement-" . width . "_" . height . ".png" ;cancel button for advertisement of other apps at the start screen
	CLOSEADVERTISEMENT_BUTTON := "FANTASICA IMAGES\Advertisement\buttoncloseadvertisement-" . width . "_" . height . ".png" ;closes the advertisement by clicking the 'x' button
	
	ANNOUNCEMENT_BUTTON := "FANTASICA IMAGES\Maintenance\buttonannouncement-" . width . "_" . height . ".png"
	
	ALLY_TEXT := "FANTASICA IMAGES\Ally\AllyList\textallies-" . width . "_" . height . ".png" ;the title of the ally list page
	ALLYPENDINGREQUEST_TEXT := "FANTASICA IMAGES\Ally\AllyPendingRequest\textallywaitingapproval-" . width . "_" . height . ".png" ; the text title of the ally requests pending page
	
	MYPAGEID_TEXT := "FANTASICA IMAGES\MainPage\textmypageid-" . width . "_" . height . ".png" ;The text called "id" at the very top of the fantasica homepage
	MYPAGEID2_TEXT := "FANTASICA IMAGES\MainPage\textmypageidarena-" . width . "_" . height . ".png" ;The text called "id" at the very topof the fantasica homepage, but offset due to arena info
	
	EVENT_ICON := "FANTASICA IMAGES\iconmandragoramarch!-" . width . "_" . height . ".png" ;Event icon on home page. Change this path for every event
	TRAINING1_ICON := "FANTASICA IMAGES\MainPage\icontraining1-" . width . "_" . height . ".png" ;Training icon on homepage at index 1 (starting with index 0)
	TRAINING2_ICON := "FANTASICA IMAGES\MainPage\icontraining2-" . width . "_" . height . ".png" ;Training icon on homepage at index 2 (starting with index 0)
	TRAINING3_ICON := "FANTASICA IMAGES\MainPage\icontraining3-" . width . "_" . height . ".png" ;Training icon on homepage at index 3 (starting with index 0)	
	
	LOGINBINGOPANEL_ICON := "FANTASICA IMAGES\MainPage\Bingo\iconbingopanel-" . width . "_" . height . ".png" ;login bingo panel
	LOGINBINGOMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage-" . width . "_" . height . ".png" ;button to return to mypage from login bingo
	LOGINBINGORECEIVE_BUTTON := "FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive-" . width . "_" . height . ".png" ; receive button when you click a panel in the daily login bingo
	LOGINBINGO_TEXT := "FANTASICA IMAGES\MainPage\Bingo\textbingo-" . width . "_" . height . ".png" ;"Login Bingo"
	
	ROULETTESTART_BUTTON := "FANTASICA IMAGES\MainPage\Roulette\buttonstartroulette-" . width . "_" . height . ".png" ;the start button to start spinning the wheel	
	ROULETTESTOP_BUTTON := "FANTASICA IMAGES\MainPage\Roulette\buttonstoproulette-" . width . "_" . height . ".png" ;the stop button to stop the wheel
	ROULETTENINEBLUE3_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textnineblue3-" . width . "_" . height . ".png" ;the blue panel 9 at the 3rd index
	ROULETTENINEBLUE4_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textnineblue4-" . width . "_" . height . ".png" ;the blue panel 9 at the 4th index
	ROULETTENINE_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textnine-" . width . "_" . height . ".png" ;the panel 9
	ROULETTETHREE_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textthree-" . width . "_" . height . ".png" ;the panel 3
	
	LOGINBONUSMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bonus\buttonmypage-" . width . "_" . height . ".png"
	
	BACK_BUTTON := "FANTASICA IMAGES\_GeneralPupose\buttonback-" . width . "_" . height . ".png" ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)
	
	CPBAR0_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar0-" . width . "_" . height . ".png"
	CPBAR1_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar1-" . width . "_" . height . ".png"
	CPBAR2_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar2-" . width . "_" . height . ".png"
	CPBAR3_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar3-" . width . "_" . height . ".png"
	TIMER6_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\texttimer6-" . width . "_" . height . ".png"
	FIGHT_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonfight-" . width . "_" . height . ".png"
	CRITICAL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttoncritical-" . width . "_" . height . ".png"
	DRAIN_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttondrain-" . width . "_" . height . ".png"
	SPEED_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonspeed-" . width . "_" . height . ".png"
	SKIP_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonskip-" . width . "_" . height . ".png"
	OPPONENT1_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent1-" . width . "_" . height . ".png"
	OPPONENT2_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent2-" . width . "_" . height . ".png"
	OPPONENT3_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent3-" . width . "_" . height . ".png"
	OPPONENT4_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent4-" . width . "_" . height . ".png"
	OPPONENT5_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent5-" . width . "_" . height . ".png"
	OPPONENT16_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent16-" . width . "_" . height . ".png"
	OPPONENT17_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent17-" . width . "_" . height . ".png"
	OPPONENT18_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent18-" . width . "_" . height . ".png"
	OPPONENT19_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent19-" . width . "_" . height . ".png"
	OPPONENT20_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent20-" . width . "_" . height . ".png"
	FRONTLINEBACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonback-" . width . "_" . height . ".png"
	REMATCH_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonrematch-" . width . "_" . height . ".png"
    CPCOUNT_TEXT := "FANTASICA IMAGES\Event\Frontlines\resultscreen\textcpcount-" . width . "_" . height . ".png"
	
	ASSIST_BUTTON  := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonassist-" . width . "_" . height . ".png"
    ASSIST_BACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistback-" . width . "_" . height . ".png"
    REQUESTASSISTANCE_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonrequestassistance-" . width . "_" . height . ".png"
	ASSIST_ALL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistall-" . width . "_" . height . ".png"
	
	;===========================================================================
	;***************************************************************************
	;---------------------------- EVENT VARIABLES ------------------------------
	;***************************************************************************
	;===========================================================================
	GOT_BATTLESTART_BUTTON := "FANTASICA IMAGES\Event\GardenOfTranquility\buttonbattlestart-" . width . "_" . height . ".png"
	GOT_MYPAGE_BUTTON := "FANTASICA IMAGES\Event\GardenOfTranquility\buttonmypage-" . width . "_" . height . ".png"
	POTD_SKIP_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\Battle\buttonskip-" . width . "_" . height . ".png"
	POTD_TOPPAGE_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\Results\buttonbacktoeventpage-" . width . "_" . height . ".png"
	POTD_GROUPSBATTLE_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\Results\buttongroupbattles-" . width . "_" . height . ".png"
	POTD_REQUESTHELP_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonrequesthelp-" . width . "_" . height . ".png"
	POTD_FIGHTAGAIN_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonfightagain-" . width . "_" . height . ".png"
	POTD_RESULTS_TEXT := "FANTASICA IMAGES\Event\PearlsOfTheDeep\Results\textresults-" . width . "_" . height . ".png"
	POTD_MAINICON_TEXT := "FANTASICA IMAGES\Event\PearlsOfTheDeep\icon1-" . width . "_" . height . ".png"
	POTD_NINESTAR1_TEXT := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\textninestar.png"
	POTD_FIGHTAGAINTE_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonfightagainte-" . width . "_" . height . ".png"
	POTD_FIGHTAGAINYES_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonfightagainyes-" . width . "_" . height . ".png"
}

;Bluestack
;---------
EXITAPP_BUTTON = FANTASICA IMAGES\Bluestack\buttonexitapp.png ;the exit app button in the lower left corner of bluestack