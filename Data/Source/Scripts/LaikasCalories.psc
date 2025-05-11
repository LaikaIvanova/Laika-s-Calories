ScriptName LaikasCalories Extends ReferenceAlias

Import Utility
Import Math

LaikasCaloriesMCM Property WMorphsMCM Auto
LaikasCaloriesWeights Property LCW Auto
LaikasCaloriesFoodData Property LCF Auto

Float Property CaloricRateBaseMultiplier = 24.68 Auto
Float Property NordFemaleCaloricRateMultiplier = 1.25 Auto
Float Property VariableNumber = 50.0 Auto
Float Property NordFemaleStomachMultiplier = 50.0 Auto

iWant_Widgets Property iWidgets Auto
Float delay = 1.0
Bool running = True
Bool oneTimeCheck = True
Float OldInventoryWeight = 0.0
Float OldBodyWeight = 0.0
Float OldCalories = 0.0
Float TempCalories = 0.0
String OldHungerString = "Test"

Event OnInit()
	Version = LAIKASCALORIES_VERSION
	RegisterEvents(True)
	RegisterForUpdateGameTime(0.1)
EndEvent

Event OnPlayerLoadGame()
	SetPlayerRaceSexNeeds()
	SetWellFedSpell()
EndEvent

Event OnRaceSwitchComplete()
	If Enabled
		RegisterEvents(true)
	EndIf
EndEvent

Function SetPlayerRaceSexNeeds() ;Sets variables based on the player race and sex
	ActorBase PlayerBase = Game.GetPlayer().GetActorBase()

	If (PlayerBase.GetSex() == 1) ;Player is female
		Geschlecht = "$LAIKASCALORIES_GESCHLECHT_WEIBLICH"
		If PlayerRef.GetRace() == RaceNord ;Player is a female nord
			StomachCapacity = Weight * NordFemaleStomachMultiplier
			CaloriesBurnPassive = ((CaloricRateBaseMultiplier * Weight) * NordFemaleCaloricRateMultiplier)	;1542.5 Calories
			ProteinBurnPassive = (((Weight * 0.96) / 240) + ((Muscles / 240) / 90)) 												;48 Proteins
			CarbohydratesBurnPassive = ((Weight * 5.5) / 240)																								;275 Carbohydrates
			FatsBurnPassive = (((Weight * 1.22)  / 240) + ((FatStored / 240) / 180))												;61 Fats
			ProlactinBurnPassive = (((ProlactinBreast / 54.89) / 240)) 																			;20 Prolactin
		EndIf
	ElseIf (PlayerBase.GetSex() == 0) ;Player is male
		Geschlecht = "$LAIKASCALORIES_GESCHLECHT_MAENNLICH"
		If PlayerRef.GetRace() == RaceNord ;Player is a male nord
			StomachCapacity = 2750
			CaloriesBurnPassive = ((Weight * 0.1716) / 10000) 																							;1875 Calories
			ProteinBurnPassive = (((Weight * 1.056) / 240) + ((Muscles / 240) / 90)) 												;48 Proteins
			CarbohydratesBurnPassive = ((Weight * 5.5) / 240)																								;275 Carbohydrates
			FatsBurnPassive = (((Weight * 1.342)  / 240) + ((FatStored / 240) / 180))												;61 Fats
			ProlactinBurnPassive = (((ProlactinBreast / 54.89) / 240))																			;20 Prolactin
		EndIf
	ElseIf (PlayerBase.GetSex() == 1)
		Geschlecht = "$LAIKASCALORIES_GESCHLECHT_WEIBLICH"
		If PlayerRef.GetRace() == RaceNord ;Player is a female
			StomachCapacity = Weight * NordFemaleStomachMultiplier
			CaloriesBurnPassive = ((CaloricRateBaseMultiplier * Weight) * NordFemaleCaloricRateMultiplier)	;1542.5 Calories
			ProteinBurnPassive = (((Weight * 0.96) / 240) + ((Muscles / 240) / 90)) 												;48 Proteins
			CarbohydratesBurnPassive = ((Weight * 5.5) / 240)																								;275 Carbohydrates
			FatsBurnPassive = (((Weight * 1.22)  / 240) + ((FatStored / 240) / 180))												;61 Fats
			ProlactinBurnPassive = (((ProlactinBreast / 54.89) / 240)) 																			;20 Prolactin
		EndIf
	ElseIf (PlayerBase.GetSex() == 0)
			Geschlecht = "$LAIKASCALORIES_GESCHLECHT_MAENNLICH"
		If PlayerRef.GetRace() == RaceNord ;Player is a male
			StomachCapacity = 2750
			CaloriesBurnPassive = ((Weight * 0.1716) / 10000) 																							;1875 Calories
			ProteinBurnPassive = (((Weight * 1.056) / 240) + ((Muscles / 240) / 90)) 												;48 Proteins
			CarbohydratesBurnPassive = ((Weight * 5.5) / 240)																								;275 Carbohydrates
			FatsBurnPassive = (((Weight * 1.342)  / 240) + ((FatStored / 240) / 180))												;61 Fats
			ProlactinBurnPassive = (((ProlactinBreast / 54.89) / 240))																			;20 Prolactin
		EndIf
	EndIf
EndFunction

Function SetStatisticTotalWeightGain() ;Updates total weight gain stat
	ActorBase PlayerBase = Game.GetPlayer().GetActorBase()
	WeightLast = Weight
	If (WeightLast < Weight)
	TotalGain += WeightLast - Weight
	EndIf
EndFunction

Function SetBellyMeasurement() ;Updates belly gain stat
	BauchumfangNew = Bauchumfang
	If BauchumfangNew - Bauchumfang > 0
		TotalBellyGain += BauchumfangNew - Bauchumfang
	EndIf
EndFunction

Function RegisterExternalFunctions() ;Registers game to consistently run code
	RegisterForUpdateGameTime(0.1) ;OnUpdateGameTime triggers every 6 minutes
EndFunction

Function SetWriteToFile() ;Saves date to text file
	If (GameHourSaved != GetPassedGameHours())
			GameHourSaved = GetPassedGameHours()
			ProlactinBreastWriteToFile = ProlactinBreast
			ProlactinBreastWriteToFile2 = ProlactinBreastWriteToFile / 1000
			ProlactinBreastWriteToFile3 = ProlactinBreastWriteToFile2 + 1.0886
			MiscUtil.WriteToFile("Weight.txt", GameHourSaved + ":00 Uhr" + " | " + Round(Weight, 4) + "kg" + " | " + Round(ProlactinBreastWriteToFile3, 4) + "kg" + "\n", True, True)
	EndIf
EndFunction

Function SetWellFedSpell() ;Adds and removes well fed spell
	If (Calories > 0)
		If (WellFed == 540) ;Player has been eating properly for 72 hours
			PlayerRef.AddSpell(LaikaWellFed)
		ElseIf (WellFed < 540)
			WellFed += 1
		EndIf
	ElseIf (Calories < 0.05) ;Player has not eaten properly
		WellFed = 0
		PlayerRef.RemoveSpell(LaikaWellFed)
	EndIf
EndFunction

Function ProcessStart()
	TimePresent = Utility.GetCurrentGameTime()
	TimeWaitSleep = math.floor(TimePresent*24-TimePast*24)
EndFunction

Function ProcessStomach()
	If TimeWaitSleep > 0
		If Stomach - ((Stomach / 240) * TimeWaitSleep * 10) > 0
			Stomach -= ((Stomach / 240) * TimeWaitSleep * 10)
		Else
			Stomach = 0
		EndIf
	ElseIf	TimeWaitSleep == 0
		If Stomach - (Stomach / 240) > 0
			Stomach -= (Stomach / 240)
		Else
			Stomach = 0
		EndIf
	EndIf
EndFunction

Function ProcessCalories()
	If TimeWaitSleep > 0
		Weight += (((Calories / 240) / 10000) * TimeWaitSleep * 10) - ((((CaloriesBurnPassive / 240) / 10000) * TimeWaitSleep * 10))
		Calories -= ((Calories / 240) * TimeWaitSleep * 10)
		If Calories - ((Calories / 240) * TimeWaitSleep * 10) < 0
		Calories = 0
		EndIf
	ElseIf	TimeWaitSleep == 0
		Weight += ((Calories / 240) / 10000) - (((CaloriesBurnPassive / 240) / 10000))
		Calories -= (Calories / 240)
		If Calories - (Calories / 240) < 0
		Calories = 0
		EndIf
	EndIf
EndFunction

Function ProcessProteins()
	If TimeWaitSleep > 0
		If Protein - (((Protein / 240) * TimeWaitSleep * 10) + (ProteinBurnPassive * TimeWaitSleep * 10)) > 0
			Protein -= (((Protein / 240) * TimeWaitSleep * 10) + (ProteinBurnPassive * TimeWaitSleep * 10))
		Else
			Protein = 0
		EndIf
		Muscles += (((Protein / 240) * TimeWaitSleep * 10) - (ProteinBurnPassive * TimeWaitSleep * 10))
	ElseIf	TimeWaitSleep == 0
		If Protein - ((Protein / 240) + ProteinBurnPassive) > 0
			Protein -= ((Protein / 240) + ProteinBurnPassive)
		Else
			Protein = 0
		EndIf
		Muscles += ((Protein / 240) - ProteinBurnPassive)
	EndIf
EndFunction

Function ProcessCarbohydrates()
	If TimeWaitSleep > 0
		If Carbohydrates - (((Carbohydrates / 240) * TimeWaitSleep * 10) + (CarbohydratesBurnPassive * TimeWaitSleep * 10)) > 0
			Carbohydrates -= (((Carbohydrates / 240) * TimeWaitSleep * 10) + (CarbohydratesBurnPassive * TimeWaitSleep * 10))
		Else
			Carbohydrates = 0
		EndIf
	ElseIf	TimeWaitSleep == 0
		If Carbohydrates - ((Carbohydrates / 240) + CarbohydratesBurnPassive) > 0
			Carbohydrates -= ((Carbohydrates / 240) + CarbohydratesBurnPassive)
		Else
			Carbohydrates = 0
		EndIf
	EndIf
EndFunction

Function ProcessFats()
	If TimeWaitSleep > 0
		If Fats - (((Fats / 240) * TimeWaitSleep * 10) + (FatsBurnPassive * TimeWaitSleep * 10)) > 0
			Fats -= (((Fats / 240) * TimeWaitSleep * 10) + (FatsBurnPassive * TimeWaitSleep * 10))
		Else
			Fats = 0
		EndIf
		FatStored += (((Fats / 240) * TimeWaitSleep * 10) - (FatsBurnPassive * TimeWaitSleep * 10))
	ElseIf	TimeWaitSleep == 0
		If Fats - ((Fats / 240) + FatsBurnPassive) > 0
			Fats -= ((Fats / 240) + FatsBurnPassive)
		Else
			Fats = 0
		EndIf
		FatStored += ((Fats / 240) - FatsBurnPassive)
	EndIf
EndFunction

Function ProcessProlactin()
	If TimeWaitSleep > 0
		If Prolactin - (((Prolactin / 240) * TimeWaitSleep * 10) + (ProlactinBurnPassive * TimeWaitSleep * 10)) > 0
			Prolactin -= (((Prolactin / 240) * TimeWaitSleep * 10) + (ProlactinBurnPassive * TimeWaitSleep * 10))
		Else
			Prolactin = 0
		EndIf
		ProlactinBreast += (((Prolactin / 240) * TimeWaitSleep * 10) - (ProlactinBurnPassive * TimeWaitSleep * 10))
	ElseIf	TimeWaitSleep == 0
		If Prolactin - ((Prolactin / 240) + ProlactinBurnPassive) > 0
			Prolactin -= ((Prolactin / 240) + ProlactinBurnPassive)
		Else
			Prolactin = 0
		EndIf
		ProlactinBreast += ((Prolactin / 240) - ProlactinBurnPassive)
	EndIf
EndFunction

Function ProcessFinish()
	If FatStored < 0
		FatStored = 0
	EndIf
	If Muscles < 0
		Muscles = 0
	EndIf
	If ProlactinBreast < 1097.8
		ProlactinBreast = 1097.8
	EndIf
	TimePast = Utility.GetCurrentGameTime()
	UpdateWeight()
EndFunction

Function SetBoobSize() ;Updates boobs size and stats
	;Körbchenumfang berechnen:
	;(Unterbrustumfang + 2,5) / 5=Zahl vor dem Komma * 5 = BH Größe
	BrustumfangFormel = Weight * BrustUmfangFormelValue * (MultBreasts + (ProlactinBreast / 1000))
	UnterbrustumfangFormel = Weight * 0.98 * MultBigTorso
	BHSize = ((UnterbrustumfangFormel + 2.5) / 5)
	BHSize = BHSize as Int * 5
	;Cup Größe berechnen:
	;((Oberbrustumfang - Unterbrustumfang) - 11) / 2 [Ergebnis ist Zahl im Alphabet]
	BHType = (((BrustumfangFormel - UnterbrustumfangFormel) - 11) / 2)
	If BHType <= 1
		BHType = "A"
	ElseIf BHType <= 2
		BHType = "B"
	ElseIf BHType <= 3
		BHType = "C"
	ElseIf BHType <= 4
		BHType = "D"
	ElseIf BHType <= 5
		BHType = "E"
	ElseIf BHType <= 6
		BHType = "F"
	ElseIf BHType <= 7
		BHType = "G"
	ElseIf BHType <= 8
		BHType = "H"
	ElseIf BHType <= 9
		BHType = "I"
	ElseIf BHType <= 10
		BHType = "J"
	ElseIf BHType <= 11
		BHType = "K"
	ElseIf BHType <= 12
		BHType = "L"
	EndIf
	;Körbchengröße
	BHSizeType = BHSize as Int + BHType
	;Bauchumfang berechnen
	BauchumfangFormel = (Weight / 1.1) * BauchumfangFormelValue * (MultBelly + (FatStored / 1000))
	;HüftumfangFormel berechnen
	HueftumfangFormel = Weight * HueftumfangFormelValue * (MultButt + (FatStored / 1000))
	;Notification on Screen
	;Debug.Notification("Hunger: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg " + WeightGainMeter)
	;Hunger: Vollgestopft [100]
	;Hunger: Satt [80]
	;Hunger: Appetit [50]
	;Hunger: Hungernd [30]
	If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.1)
		HungerString = "Ausgehungert"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.2)
		HungerString = "Sehr Hungrig"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
		HungerString = "Hungrig"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.4)
		HungerString = "Leicht Hungrig"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
		HungerString = "Leichter Appetit"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.6)
		HungerString = "Ausgeglichen"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.7)
		HungerString = "Angenehm Satt"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
		HungerString = "Satt"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.9)
		HungerString = "Gut Gefüllt"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
		HungerString = "Vollgestopft"
	EndIf
EndFunction

Function UpdateHungerString()
  If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.1)
		HungerString = "Ausgehungert"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.2)
		HungerString = "Sehr Hungrig"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
		HungerString = "Hungrig"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.4)
		HungerString = "Leicht Hungrig"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
		HungerString = "Leichter Appetit"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.6)
		HungerString = "Ausgeglichen"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.7)
		HungerString = "Angenehm Satt"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
		HungerString = "Satt"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.9)
		HungerString = "Gut Gefüllt"
	ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
		HungerString = "Vollgestopft"
	EndIf
EndFunction

String Function Round(Float Number, Int Precision) ;Round function for fancy numbers
    String Result = Number as Int
    Number -= Number as Int
    If Precision > 0
        Result += ","
    EndIf
    While Precision > 0
        Number *= 10
        Precision -= 1
        If Precision == 0
            Number += 0.5
        EndIf
        If Number >= 10
            Number = 9.9999
        EndIf
        Result += Number as Int
        Number -= Number as Int
    Endwhile
    Return Result
EndFunction


Int Function GetPassedGameHours() Global ;Gets current ingame time for other functions
	Float GameTime
	Float GameHoursPassed
 
	GameTime = GetCurrentGameTime()
	GameHoursPassed = ((GameTime - (GameTime As Int)) * 24)
	Return GameHoursPassed As Int
EndFunction

Event OnKeyDown(Int KeyCode) ;Registers hotkeys
	;K - Shows Character Stats
	If	KeyCode == 37
		Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
		;VariableNumber -= (2 + (-3))
		Debug.Notification(VariableNumber)
	;L - Shows Camilla Stats
	ElseIf (KeyCode == 38)
		If (Weight > 90)
			If (FatStored > 7500)
				Weight90Fat7500.Show()
			ElseIf (FatStored > 5000)
				Weight90Fat5000.Show()
			ElseIf (FatStored > 2500)
				Weight90Fat2500.Show()
			Else
				Weight90Fat0.Show()
			EndIf
		ElseIf (Weight < 60)
			If (FatStored > 7500)
				Weight50Fat7500.Show()
					Weight50Fat7500Reaction.Show()
			ElseIf (FatStored > 5000)
				Weight50Fat5000.Show()
					Weight50Fat5000Reaction.Show()
			ElseIf (FatStored > 2500)
				Weight50Fat2500.Show()
					Weight50Fat2500Reaction.Show()
			Else 
				int ibutton = Weight50Fat0.Show()
					If (ibutton == 0)
						int ibutton2 = Weight50Fat0Reaction.Show()
							If (ibutton2 == 0)
								Weight50Fat0ReactionGaining.Show()
							EndIf
					ElseIf (ibutton == 1)
						Weight50Fat0Reaction2.Show()
					EndIf
						
			EndIf
		EndIf
	EndIf
EndEvent

Event OnUpdateGameTime()
	SetPlayerRaceSexNeeds()
	SetStatisticTotalWeightGain()
	ProcessStart()
	ProcessStomach()
	ProcessCalories()
	ProcessProteins()
	ProcessCarbohydrates()
	ProcessFats()
	ProcessProlactin()
	ProcessFinish()
	SetBoobSize()
	SetBellyMeasurement()
	SetWriteToFile()
	SetWellFedSpell()
	LCW.SetRealisticWeight()
EndEvent

Event OnUpdate()
	If Enabled
		If CheckNiOverride()
				NiOverride.UpdateModelWeight(PlayerRef)
				NiOverride.UpdateModelWeight(Camilla)
		EndIf

		If effectsChanged
			effectsChanged = False
		EndIf

		RegisterForSingleUpdate(4)
	EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	If akSource == PlayerRef
		If asEventName == "FootLeft" || asEventName == "FootRight"
			Muscles += 0.000001
			Weight -= 0.000004
		ElseIf asEventName == "FootSprintLeft" || asEventName == "FootSprintRight"
			Muscles += 0.000001
			Weight -= 0.000004
		ElseIf asEventName == "JumpUp"
			Muscles += 0.00001
			Weight -= 0.000017
		EndIf
	EndIf
EndEvent

Event OnObjectEquipped(Form type, ObjectReference ref)
	If (Stomach > Weight * 50) ;When eating too much
		If (LCF.GetVolume(type) > 0.0)
			Stomach = 0.0
			Calories = 0.0
			Protein = 0.0
			Carbohydrates = 0.0
			Fats = 0.0
			Prolactin = 0.0
			UpdateWeight()
		EndIf
		If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.1)
			HungerString = "Ausgehungert"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.2)
			HungerString = "Sehr Hungrig"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
			HungerString = "Hungrig"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.4)
			HungerString = "Leicht Hungrig"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
			HungerString = "Leichter Appetit"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.6)
			HungerString = "Ausgeglichen"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.7)
			HungerString = "Angenehm Satt"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
			HungerString = "Satt"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.9)
			HungerString = "Gut Gef�llt"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
			HungerString = "Vollgestopft"
		EndIf
		Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
	ElseIf Stomach <= Weight * 50 ;When player can eat.
		Stomach += LCF.GetVolume(type)
		Calories += LCF.GetCalories(type)
		Protein += LCF.GetProteins(type)
		Carbohydrates += LCF.GetCarbohydrates(type)
		Fats += LCF.GetFats(type)
		Prolactin += LCF.GetProlactin(type)
		UpdateWeight()
		;Update Hunger
		If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.1)
			HungerString = "Ausgehungert"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.2)
			HungerString = "Sehr Hungrig"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
			HungerString = "Hungrig"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.4)
			HungerString = "Leicht Hungrig"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
			HungerString = "Leichter Appetit"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.6)
			HungerString = "Ausgeglichen"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.7)
			HungerString = "Angenehm Satt"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
			HungerString = "Satt"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.9)
			HungerString = "Gut Gef�llt"
		ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
			HungerString = "Vollgestopft"
		EndIf
			Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
	EndIf
	If (LCF.GetVolume(type) > 0.0)
		If HungerString == "Vollgestopft"
			BurpSound.Play(PlayerREF)
		ElseIf HungerString != "Vollgestopft"
			EatingSound.Play(PlayerRef)
		EndIf
	EndIf
EndEvent
;/
			;Carrot
			ElseIf LaikaFoodCarrot.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 100.0
						Calories += 41.0
						Protein += 0.9
						Carbohydrates += 9.6
						Fats += 0.2
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 100.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Charred Skeever Meat
			ElseIf LaikaFoodCharredSkeeverMeat.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 85.0
						Calories += 122.0
						Protein += 22.0
						Carbohydrates += 2.7
						Fats += 1.6
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 85.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Chicken Breast Raw
			ElseIf LaikaFoodChickenBreastRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 120.0
						Calories += 198.0
						Protein += 37.0
						Carbohydrates += 0.0
						Fats += 4.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 120.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Chicken Dumpling
			ElseIf LaikaFoodChickenDumpling.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 125.0
						Calories += 245.0
						Protein += 17.5
						Carbohydrates += 28.5
						Fats += 6.5
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 125.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Clam Chowder
			ElseIf LaikaFoodClamChowder.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 254.0
						Calories += 201.0
						Protein += 6.6
						Carbohydrates += 21.0
						Fats += 10.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 254.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Clam Meat Raw
			ElseIf LaikaFoodClamMeatRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 113.0
						Calories += 168.0
						Protein += 29.3
						Carbohydrates += 5.9
						Fats += 2.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 113.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Cooked Beef
			ElseIf LaikaFoodBeefCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 221.0
						Calories += 614.0
						Protein += 58.0
						Carbohydrates += 0.0
						Fats += 41.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 221.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Cooked Boar Meat
			ElseIf LaikaFoodBoarMeatCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 169.0
						Calories += 538.0
						Protein += 58.7
						Carbohydrates += 0.0
						Fats += 32.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 169.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Dog Meat Raw
			ElseIf LaikaFoodDogMeatRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 113.0
						Calories += 256.0
						Protein += 31.0
						Carbohydrates += 0.0
						Fats += 14.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 113.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Eidar Cheese Wedge
			ElseIf LaikaFoodEidarCheeseWedge.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 108.0
						Calories += 424.0
						Protein += 29.0
						Carbohydrates += 1.6
						Fats += 33.0
						Prolactin += 14.1
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 108.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Eidar Cheese Wheel
			ElseIf LaikaFoodEidarCheeseWheel.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach + 0.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Elsweyr Fondue
			ElseIf LaikaFoodElsweyrFondue.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 216.0
						Calories += 576.0
						Protein += 34.0
						Carbohydrates += 3.3
						Fats += 36.8
						Prolactin += 8.3
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 216.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Garlic Bread
			ElseIf LaikaFoodGarlicBread.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 172.0
						Calories += 604.0
						Protein += 14.4
						Carbohydrates += 72.0
						Fats += 28.4
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 172.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Goat Cheese Wedge
			ElseIf LaikaFoodGoatCheeseWedge.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach <= Weight * 50
						Stomach += 112.0
						Calories += 300.0
						Protein += 21.2
						Carbohydrates += 0.0
						Fats += 24.0
						Prolactin += 10.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 112.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Goat Cheese Wheel
			ElseIf LaikaFoodGoatCheeseWheel.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach + 0.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Gourd
			ElseIf LaikaFoodGourd.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach + 0.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Green Apple
			ElseIf LaikaFoodAppleGreen.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach <= Weight * 50
						Stomach += 200.0
						Calories += 104.0
						Protein += 0.5
						Carbohydrates += 27.6
						Fats += 0.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 200.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Grilled Chicken Breast
			ElseIf LaikaFoodChickenBreastCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 90.0
						Calories += 198.0
						Protein += 37.0
						Carbohydrates += 0.0
						Fats += 4.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 90.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Grilled Leeks
			ElseIf LaikaFoodLeekCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 93.0
						Calories += 38.0
						Protein += 1.0
						Carbohydrates += 9.4
						Fats += 0.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 93.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Half Bread
			ElseIf LaikaFoodHalfBread.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 261.0
						Calories += 693.0
						Protein += 23.4
						Carbohydrates += 126.0
						Fats += 8.7
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 261.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Homecooked Meal
			ElseIf LaikaFoodHomecookedMeal.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 625.0
						Calories += 1480.0
						Protein += 12.0
						Carbohydrates += 215.0
						Fats += 70.0
						Prolactin += 38.25
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 625.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Honey
			ElseIf LaikaFoodHoney.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 126.0
						Calories += 384.0
						Protein += 0.4
						Carbohydrates += 102.0
						Fats += 0.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 126.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Honey Nut Treat
			ElseIf LaikaFoodHoneyNutTreat.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 148.0
						Calories += 560.0
						Protein += 13.2
						Carbohydrates += 120.0
						Fats += 7.6
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 148.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Horker and Ash Yam Stew
			ElseIf LaikaFoodHorkerAshYamStew.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 603.0
						Calories += 704.0
						Protein += 38.8
						Carbohydrates += 34.0
						Fats += 47.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 603.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Horker Meat Cooked
			ElseIf LaikaFoodHorkerMeatCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 169.0
						Calories += 538.0
						Protein += 58.7
						Carbohydrates += 0.0
						Fats += 32.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 169.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Horker Meat Raw
			ElseIf LaikaFoodHorkerMeatRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 226.0
						Calories += 538.0
						Protein += 58.7
						Carbohydrates += 0.0
						Fats += 32.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 226.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Horker Stew
			ElseIf LaikaFoodHorkerStew.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 482.0
						Calories += 685.0
						Protein += 38.0
						Carbohydrates += 30.0
						Fats += 47.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 482.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Horse Meat Cooked
			ElseIf LaikaFoodHorseMeatCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 148.0
						Calories += 347.0
						Protein += 56.0
						Carbohydrates += 0.0
						Fats += 11.9
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 148.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Horse Meat Raw
			ElseIf LaikaFoodHorseMeatRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 198.0
						Calories += 347.0
						Protein += 56.0
						Carbohydrates += 0.0
						Fats += 11.9
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 198.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Jazbay Crostata
			ElseIf LaikaFoodJazbayCrostata.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 150.0
						Calories += 362.0
						Protein += 3.2
						Carbohydrates += 37.0
						Fats += 23.0
						Prolactin += 14.5
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 150.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Jug of Milk
			ElseIf LaikaDrinkMilk.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 244.0
						Calories += 122.0
						Protein += 8.1
						Carbohydrates += 12.0
						Fats += 4.8
						Prolactin += 8.7
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 244.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Juniper Berry Crostata
			ElseIf LaikaFoodJuniperCrostata.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 190.0
						Calories += 392.0
						Protein += 3.2
						Carbohydrates += 37.0
						Fats += 23.0
						Prolactin += 16.5
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 190.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Lavender Dumpling
			ElseIf LaikaFoodLavenderDumpling.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 145.0
						Calories += 250.0
						Protein += 12.0
						Carbohydrates += 36.5
						Fats += 6.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 145.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Leek
			ElseIf LaikaFoodLeek.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 124.0
						Calories += 38.0
						Protein += 1.0
						Carbohydrates += 9.4
						Fats += 0.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 124.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Leg of Goat
			ElseIf LaikaFoodGoatMeatRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 170.0
						Calories += 243.0
						Protein += 46.0
						Carbohydrates += 0.0
						Fats += 5.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 170.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Leg of Goat Cooked
			ElseIf LaikaFoodGoatMeatCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 127.0
						Calories += 243.0
						Protein += 46.0
						Carbohydrates += 0.0
						Fats += 5.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 127.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Long Taffy Treat
			ElseIf LaikaFoodLongTaffyTreat.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 105.0
						Calories += 420.0
						Protein += 0.0
						Carbohydrates += 97.2
						Fats += 3.5
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 105.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Mammoth Cheese Bowl
			ElseIf LaikaFoodMammothCheeseBowl.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 476.0
						Calories += 1275.0
						Protein += 68.0
						Carbohydrates += 20.4
						Fats += 102.0
						Prolactin += 47.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 476.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Mammoth Meat Raw
			ElseIf LaikaFoodMammothMeatRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 448.0
						Calories += 736.0
						Protein += 108.0
						Carbohydrates += 0.0
						Fats += 34.8
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 448.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Mammoth Meat Cooked
			ElseIf LaikaFoodMammothMeatCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 336.0
						Calories += 736.0
						Protein += 108.0
						Carbohydrates += 0.0
						Fats += 34.8
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 336.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Mudcrab Meat Raw
			ElseIf LaikaFoodMudcrabMeatRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 118.0
						Calories += 98.0
						Protein += 21.0
						Carbohydrates += 0.0
						Fats += 0.9
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 118.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Pheasant Breast
			ElseIf LaikaFoodPheasantMeatRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 280.0
						Calories += 670.0
						Protein += 90.0
						Carbohydrates += 0.0
						Fats += 34.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 280.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Pheasant Roast
			ElseIf LaikaFoodPheasantMeatCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 210.0
						Calories += 670.0
						Protein += 90.0
						Carbohydrates += 0.0
						Fats += 34.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 210.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Potato
			ElseIf LaikaFoodPotato.Find(type) >= 0
				
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 173.0
						Calories += 161.0
						Protein += 4.3
						Carbohydrates += 37.0
						Fats += 0.2
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 173.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Potato Bread
			ElseIf LaikaFoodPotatoBread.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 224.0
						Calories += 595.0
						Protein += 28.0
						Carbohydrates += 105.0
						Fats += 7.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 224.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Potato Soup
			ElseIf LaikaFoodPotatoSoup.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 490.0
						Calories += 572.0
						Protein += 29.0
						Carbohydrates += 52.0
						Fats += 27.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 490.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Rabbit Haunch
			ElseIf LaikaFoodRabbitMeatCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 84.0
						Calories += 233.0
						Protein += 34.7
						Carbohydrates += 0.0
						Fats += 9.5
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 84.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Raw Beef
			ElseIf LaikaFoodBeefRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 276.0
						Calories += 614.0
						Protein += 58.0
						Carbohydrates += 0.0
						Fats += 41.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 276.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Raw Rabbit Leg
			ElseIf LaikaFoodRabbitMeatRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 114.0
						Calories += 233.0
						Protein += 34.7
						Carbohydrates += 0.0
						Fats += 9.5
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 114.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Red Apple
			ElseIf LaikaFoodAppleRed.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach <= Weight * 50
						Stomach += 200.0
						Calories += 114.0
						Protein += 0.6
						Carbohydrates += 30.3
						Fats += 0.4
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 200.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Sack of Flour
			ElseIf LaikaFoodSackOfFlour.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach + 0.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Salmon Meat
			ElseIf LaikaFoodSalmonMeatRaw.Find(type) >= 0
					If Stomach > Weight * 50
						Stomach = 0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
					ElseIf	Stomach <= Weight * 50
						Stomach += 227.0
						Calories += 468.0
						Protein += 50.0
						Carbohydrates += 0.0
						Fats += 28.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 227.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Salmon Steak Cooked
			ElseIf LaikaFoodSalmonMeatCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						;Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
						Debug.Notification("1")
				ElseIf	Stomach <= Weight * 50
						Stomach += 170.0
						Calories += 468.0
						Protein += 50.0
						Carbohydrates += 0.0
						Fats += 28.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						;Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
						Debug.Notification("2")
				ElseIf	Stomach + 170.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						;Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
						Debug.Notification("3")
				EndIf
			;Seared Slaughterfish
			ElseIf LaikaFoodSearedSlaughterfish.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach <= Weight * 50
						Stomach += 204.0
						Calories += 561.0
						Protein += 60.0
						Carbohydrates += 0.0
						Fats += 33.6
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 204.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Sliced Eidar Cheese
			ElseIf LaikaFoodSlicedEidarCheese.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach + 0.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Sliced Goat Cheese
			ElseIf LaikaFoodSlicedGoatCheese.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach + 0.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Snowberry Crostata
			ElseIf LaikaFoodSnowberryCrostata.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 228.0
						Calories += 470.0
						Protein += 3.8
						Carbohydrates += 44.4
						Fats += 27.6
						Prolactin += 19.8
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 228.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Soul Husk
			ElseIf LaikaFoodSoulHusk.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 100.0
						Calories += 0.0
						Protein += 0.0
						Carbohydrates += 0.0
						Fats += 0.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 100.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Spiced Beef
			ElseIf LaikaFoodSpicedBeef.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 243.0
						Calories += 675.0
						Protein += 63.8
						Carbohydrates += 0.0
						Fats += 45.1
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 243.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Steamed Mudcrab Legs
			ElseIf LaikaFoodMudcrabMeatCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 88.0
						Calories += 98.0
						Protein += 21.0
						Carbohydrates += 0.0
						Fats += 0.9
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 88.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Sweet Roll
			ElseIf LaikaFoodSweetroll.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 268.0
						Calories += 1048.0
						Protein += 8.0
						Carbohydrates += 152.0
						Fats += 48.0
						Prolactin += 29.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 268.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Tomato
			ElseIf LaikaFoodTomato.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 123.0
						Calories += 22.0
						Protein += 1.1
						Carbohydrates += 4.8
						Fats += 0.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 123.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Tomato Soup
			ElseIf LaikaFoodTomatoSoup.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 488.0
						Calories += 170.0
						Protein += 3.5
						Carbohydrates += 36.0
						Fats += 1.1
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 488.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Vegetable Soup
			ElseIf LaikaFoodVegetableSoup.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 482.0
						Calories += 159.0
						Protein += 5.8
						Carbohydrates += 26.0
						Fats += 3.8
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 482.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Venison
			ElseIf LaikaFoodVenisonMeatRaw.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 255.0
						Calories += 384.0
						Protein += 78.0
						Carbohydrates += 0.0
						Fats += 6.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 255.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Venison Chop
			ElseIf LaikaFoodVenisonMeatCooked.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 191.0
						Calories += 384.0
						Protein += 78.0
						Carbohydrates += 0.0
						Fats += 6.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 191.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
			;Venison Stew
			ElseIf LaikaFoodVenisonMeatStew.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf Stomach <= Weight * 50
						Stomach += 477.0
						Calories += 798.0
						Protein += 69.0
						Carbohydrates += 37.0
						Fats += 54.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 477.0 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				EndIf
		;Drink
			;Ale
			ElseIf LaikaDrinkAle.Find(type) >= 0
				If Stomach > Weight * 50
					Stomach = 0
					Calories = 0.0
					Protein = 0.0
					Carbohydrates = 0.0
					Fats = 0.0
					Prolactin = 0.0
					UpdateWeight()
					;Update Hunger
					If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
				ElseIf	Stomach <= Weight * 50
					Stomach += 356.0
					Calories += 153.0
					Protein += 1.6
					Carbohydrates += 13.0
					Fats += 0.0
					Prolactin += 0.0
					UpdateWeight()
					;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
				ElseIf	Stomach + 356 > Weight * 50
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
			;Mead with Juniper Berry
				EndIf
			EndIf
		ElseIf EatingLimit == False
			;Food
			;Apple Cabbage Stew
			If LaikaFoodAppleCabbageStew.Find(type) >= 0
						Stomach += 197.0
						Calories += 330.0
						Protein += 2.9
						Carbohydrates += 33.0
						Fats += 23.0
						Prolactin += 0.8
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Apple Dumpling
			ElseIf LaikaFoodAppleDumpling.Find(type) >= 0
						Stomach += 192.0
						Calories += 624.0
						Protein += 6.7
						Carbohydrates += 82.0
						Fats += 31.0
						Prolactin += 10.4
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Apple Pie
			ElseIf LaikaFoodApplePie.Find(type) >= 0
						Stomach += 125.0
						Calories += 296.0
						Protein += 2.4
						Carbohydrates += 43.0
						Fats += 14.0
						Prolactin += 7.65
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Ash Hopper Leg Raw
			ElseIf LaikaFoodAshHopperLegRaw.Find(type) >= 0
						Stomach += 135.0
						Calories += 99.0
						Protein += 22.2
						Carbohydrates += 0.0
						Fats += 0.4
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Ash Hopper Meat Raw
			ElseIf LaikaFoodAshHopperMeatRaw.Find(type) >= 0
						Stomach += 425.0
						Calories += 310.0
						Protein += 70.0
						Carbohydrates += 0.0
						Fats += 1.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Ash Yam
			ElseIf LaikaFoodAshYam.Find(type) >= 0
						Stomach += 121.5
						Calories += 19.0
						Protein += 0.8
						Carbohydrates += 4.0
						Fats += 0.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Baked Potatoes
			ElseIf LaikaFoodBakedPotatoes.Find(type) >= 0
						Stomach += 129.0
						Calories += 161.0
						Protein += 4.3
						Carbohydrates += 37.0
						Fats += 0.2
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Beef Stew
			ElseIf LaikaFoodBeefStew.Find(type) >= 0
						Stomach += 504.0
						Calories += 535.0
						Protein += 58.0
						Carbohydrates += 41.0
						Fats += 16.0
						Prolactin += 2.8
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Boar Meat Raw
			ElseIf LaikaFoodBoarMeatRaw.Find(type) >= 0
						Stomach += 226.0
						Calories += 538.0
						Protein += 58.7
						Carbohydrates += 0.0
						Fats += 32.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Boiled Creme Treat
			ElseIf LaikaFoodBoiledCremeTreat.Find(type) >= 0
						Stomach += 109.0
						Calories += 413.0
						Protein += 4.9
						Carbohydrates += 47.0
						Fats += 23.0
						Prolactin += 4.4
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Braided Bread
			ElseIf LaikaFoodBraidedBread.Find(type) >= 0
						Stomach += 168.0
						Calories += 654.0
						Protein += 18.6
						Carbohydrates += 84.0
						Fats += 25.2
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Bread
			ElseIf LaikaFoodBread.Find(type) >= 0
						Stomach += 522.0
						Calories += 1386.0
						Protein += 46.8
						Carbohydrates += 252.0
						Fats += 17.5
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Butter
			ElseIf LaikaFoodButter.Find(type) >= 0
						Stomach += 112.0
						Calories += 816.0
						Protein += 1.0
						Carbohydrates += 0.1
						Fats += 96.0
						Prolactin += 58.2
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Cabbage
			ElseIf LaikaFoodCabbage.Find(type) >= 0
						Stomach += 89.0
						Calories += 22.0
						Protein += 1.1
						Carbohydrates += 5.2
						Fats += 0.1
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Cabbage Potato Soup
			ElseIf LaikaFoodCabbagePotatoSoup.Find(type) >= 0
						Stomach += 482.0
						Calories += 360.0
						Protein += 5.6
						Carbohydrates += 39.0
						Fats += 22.0
						Prolactin += 13.4
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Cabbage Soup
			ElseIf LaikaFoodCabbageSoup.Find(type) >= 0
						Stomach += 490.0
						Calories += 170.0
						Protein += 3.4
						Carbohydrates += 14.0
						Fats += 12.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Carrot
			ElseIf LaikaFoodCarrot.Find(type) >= 0
						Stomach += 100.0
						Calories += 41.0
						Protein += 0.9
						Carbohydrates += 9.6
						Fats += 0.2
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Charred Skeever Meat
			ElseIf LaikaFoodCharredSkeeverMeat.Find(type) >= 0
						Stomach += 85.0
						Calories += 122.0
						Protein += 22.0
						Carbohydrates += 2.7
						Fats += 1.6
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Chicken Breast Raw
			ElseIf LaikaFoodChickenBreastRaw.Find(type) >= 0
						Stomach += 120.0
						Calories += 198.0
						Protein += 37.0
						Carbohydrates += 0.0
						Fats += 4.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Chicken Dumpling
			ElseIf LaikaFoodChickenDumpling.Find(type) >= 0
						Stomach += 125.0
						Calories += 245.0
						Protein += 17.5
						Carbohydrates += 28.5
						Fats += 6.5
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Clam Chowder
			ElseIf LaikaFoodClamChowder.Find(type) >= 0
						Stomach += 254.0
						Calories += 201.0
						Protein += 6.6
						Carbohydrates += 21.0
						Fats += 10.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Clam Meat Raw
			ElseIf LaikaFoodClamMeatRaw.Find(type) >= 0
						Stomach += 113.0
						Calories += 168.0
						Protein += 29.3
						Carbohydrates += 5.9
						Fats += 2.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Cooked Beef
			ElseIf LaikaFoodBeefCooked.Find(type) >= 0
						Stomach += 221.0
						Calories += 614.0
						Protein += 58.0
						Carbohydrates += 0.0
						Fats += 41.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Cooked Boar Meat
			ElseIf LaikaFoodBoarMeatCooked.Find(type) >= 0
						Stomach += 169.0
						Calories += 538.0
						Protein += 58.7
						Carbohydrates += 0.0
						Fats += 32.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Dog Meat Raw
			ElseIf LaikaFoodDogMeatRaw.Find(type) >= 0
						Stomach += 113.0
						Calories += 256.0
						Protein += 31.0
						Carbohydrates += 0.0
						Fats += 14.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Eidar Cheese Wedge
			ElseIf LaikaFoodEidarCheeseWedge.Find(type) >= 0
						Stomach += 108.0
						Calories += 424.0
						Protein += 29.0
						Carbohydrates += 1.6
						Fats += 33.0
						Prolactin += 14.1
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Eidar Cheese Wheel
			ElseIf LaikaFoodEidarCheeseWheel.Find(type) >= 0
						Stomach += 864.0
						Calories += 3392.0
						Protein += 232.0
						Carbohydrates += 12.8
						Fats += 264.0
						Prolactin += 112.8
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
			;Elsweyr Fondue
			ElseIf LaikaFoodElsweyrFondue.Find(type) >= 0
						Stomach += 216.0
						Calories += 576.0
						Protein += 34.0
						Carbohydrates += 3.3
						Fats += 36.8
						Prolactin += 8.3
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Garlic Bread
			ElseIf LaikaFoodGarlicBread.Find(type) >= 0
						Stomach += 172.0
						Calories += 604.0
						Protein += 14.4
						Carbohydrates += 72.0
						Fats += 28.4
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Goat Cheese Wedge
			ElseIf LaikaFoodGoatCheeseWedge.Find(type) >= 0
						Stomach += 112.0
						Calories += 300.0
						Protein += 21.2
						Carbohydrates += 0.0
						Fats += 24.0
						Prolactin += 10.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Goat Cheese Wheel
			ElseIf LaikaFoodGoatCheeseWheel.Find(type) >= 0
						Stomach = 896.0
						Calories = 2400.0
						Protein = 169.6
						Carbohydrates = 0.0
						Fats = 192.0
						Prolactin = 80.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
			;Gourd
			ElseIf LaikaFoodGourd.Find(type) >= 0
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
			;Green Apple
			ElseIf LaikaFoodAppleGreen.Find(type) >= 0
						Stomach += 200.0
						Calories += 104.0
						Protein += 0.5
						Carbohydrates += 27.6
						Fats += 0.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Grilled Chicken Breast
			ElseIf LaikaFoodChickenBreastCooked.Find(type) >= 0
						Stomach += 90.0
						Calories += 198.0
						Protein += 37.0
						Carbohydrates += 0.0
						Fats += 4.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Grilled Leeks
			ElseIf LaikaFoodLeekCooked.Find(type) >= 0
						Stomach += 93.0
						Calories += 38.0
						Protein += 1.0
						Carbohydrates += 9.4
						Fats += 0.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Half Bread
			ElseIf LaikaFoodHalfBread.Find(type) >= 0
						Stomach += 261.0
						Calories += 693.0
						Protein += 23.4
						Carbohydrates += 126.0
						Fats += 8.7
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Homecooked Meal
			ElseIf LaikaFoodHomecookedMeal.Find(type) >= 0
						Stomach += 625.0
						Calories += 1480.0
						Protein += 12.0
						Carbohydrates += 215.0
						Fats += 70.0
						Prolactin += 38.25
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Honey
			ElseIf LaikaFoodHoney.Find(type) >= 0
						Stomach += 126.0
						Calories += 384.0
						Protein += 0.4
						Carbohydrates += 102.0
						Fats += 0.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Honey Nut Treat
			ElseIf LaikaFoodHoneyNutTreat.Find(type) >= 0
						Stomach += 148.0
						Calories += 560.0
						Protein += 13.2
						Carbohydrates += 120.0
						Fats += 7.6
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Horker and Ash Yam Stew
			ElseIf LaikaFoodHorkerAshYamStew.Find(type) >= 0
						Stomach += 603.0
						Calories += 704.0
						Protein += 38.8
						Carbohydrates += 34.0
						Fats += 47.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Horker Meat Cooked
			ElseIf LaikaFoodHorkerMeatCooked.Find(type) >= 0
						Stomach += 169.0
						Calories += 538.0
						Protein += 58.7
						Carbohydrates += 0.0
						Fats += 32.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Horker Meat Raw
			ElseIf LaikaFoodHorkerMeatRaw.Find(type) >= 0
						Stomach += 226.0
						Calories += 538.0
						Protein += 58.7
						Carbohydrates += 0.0
						Fats += 32.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Horker Stew
			ElseIf LaikaFoodHorkerStew.Find(type) >= 0
						Stomach += 482.0
						Calories += 685.0
						Protein += 38.0
						Carbohydrates += 30.0
						Fats += 47.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Horse Meat Cooked
			ElseIf LaikaFoodHorseMeatCooked.Find(type) >= 0
						Stomach += 148.0
						Calories += 347.0
						Protein += 56.0
						Carbohydrates += 0.0
						Fats += 11.9
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Horse Meat Raw
			ElseIf LaikaFoodHorseMeatRaw.Find(type) >= 0
						Stomach += 198.0
						Calories += 347.0
						Protein += 56.0
						Carbohydrates += 0.0
						Fats += 11.9
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Jazbay Crostata
			ElseIf LaikaFoodJazbayCrostata.Find(type) >= 0
						Stomach += 150.0
						Calories += 362.0
						Protein += 3.2
						Carbohydrates += 37.0
						Fats += 23.0
						Prolactin += 14.5
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Jug of Milk
			ElseIf LaikaDrinkMilk.Find(type) >= 0
						Stomach += 244.0
						Calories += 122.0
						Protein += 8.1
						Carbohydrates += 12.0
						Fats += 4.8
						Prolactin += 8.7
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Juniper Berry Crostata
			ElseIf LaikaFoodJuniperCrostata.Find(type) >= 0
						Stomach += 190.0
						Calories += 392.0
						Protein += 3.2
						Carbohydrates += 37.0
						Fats += 23.0
						Prolactin += 16.5
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Lavender Dumpling
			ElseIf LaikaFoodLavenderDumpling.Find(type) >= 0
						Stomach += 145.0
						Calories += 250.0
						Protein += 12.0
						Carbohydrates += 36.5
						Fats += 6.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Leek
			ElseIf LaikaFoodLeek.Find(type) >= 0
						Stomach += 124.0
						Calories += 38.0
						Protein += 1.0
						Carbohydrates += 9.4
						Fats += 0.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Leg of Goat
			ElseIf LaikaFoodGoatMeatRaw.Find(type) >= 0
						Stomach += 170.0
						Calories += 243.0
						Protein += 46.0
						Carbohydrates += 0.0
						Fats += 5.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Leg of Goat Cooked
			ElseIf LaikaFoodGoatMeatCooked.Find(type) >= 0
						Stomach += 127.0
						Calories += 243.0
						Protein += 46.0
						Carbohydrates += 0.0
						Fats += 5.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Long Taffy Treat
			ElseIf LaikaFoodLongTaffyTreat.Find(type) >= 0
						Stomach += 105.0
						Calories += 420.0
						Protein += 0.0
						Carbohydrates += 97.2
						Fats += 3.5
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Mammoth Cheese Bowl
			ElseIf LaikaFoodMammothCheeseBowl.Find(type) >= 0
						Stomach += 476.0
						Calories += 1275.0
						Protein += 68.0
						Carbohydrates += 20.4
						Fats += 102.0
						Prolactin += 47.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Mammoth Meat Raw
			ElseIf LaikaFoodMammothMeatRaw.Find(type) >= 0
						Stomach += 448.0
						Calories += 736.0
						Protein += 108.0
						Carbohydrates += 0.0
						Fats += 34.8
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Mammoth Meat Cooked
			ElseIf LaikaFoodMammothMeatCooked.Find(type) >= 0
						Stomach += 336.0
						Calories += 736.0
						Protein += 108.0
						Carbohydrates += 0.0
						Fats += 34.8
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Mudcrab Meat Raw
			ElseIf LaikaFoodMudcrabMeatRaw.Find(type) >= 0
						Stomach += 118.0
						Calories += 98.0
						Protein += 21.0
						Carbohydrates += 0.0
						Fats += 0.9
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Pheasant Breast
			ElseIf LaikaFoodPheasantMeatRaw.Find(type) >= 0
						Stomach += 280.0
						Calories += 670.0
						Protein += 90.0
						Carbohydrates += 0.0
						Fats += 34.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Pheasant Roast
			ElseIf LaikaFoodPheasantMeatCooked.Find(type) >= 0
						Stomach += 210.0
						Calories += 670.0
						Protein += 90.0
						Carbohydrates += 0.0
						Fats += 34.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Potato
			ElseIf LaikaFoodPotato.Find(type) >= 0
						Stomach += 173.0
						Calories += 161.0
						Protein += 4.3
						Carbohydrates += 37.0
						Fats += 0.2
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Potato Bread
			ElseIf LaikaFoodPotatoBread.Find(type) >= 0
						Stomach += 224.0
						Calories += 595.0
						Protein += 28.0
						Carbohydrates += 105.0
						Fats += 7.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Potato Soup
			ElseIf LaikaFoodPotatoSoup.Find(type) >= 0
						Stomach += 490.0
						Calories += 572.0
						Protein += 29.0
						Carbohydrates += 52.0
						Fats += 27.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Rabbit Haunch
			ElseIf LaikaFoodRabbitMeatCooked.Find(type) >= 0
						Stomach += 84.0
						Calories += 233.0
						Protein += 34.7
						Carbohydrates += 0.0
						Fats += 9.5
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Raw Beef
			ElseIf LaikaFoodBeefRaw.Find(type) >= 0
						Stomach += 276.0
						Calories += 614.0
						Protein += 58.0
						Carbohydrates += 0.0
						Fats += 41.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Raw Rabbit Leg
			ElseIf LaikaFoodRabbitMeatRaw.Find(type) >= 0
						Stomach += 114.0
						Calories += 233.0
						Protein += 34.7
						Carbohydrates += 0.0
						Fats += 9.5
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Red Apple
			ElseIf LaikaFoodAppleRed.Find(type) >= 0
						Stomach += 200.0
						Calories += 114.0
						Protein += 0.6
						Carbohydrates += 30.3
						Fats += 0.4
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Sack of Flour
			ElseIf LaikaFoodSackOfFlour.Find(type) >= 0
						Stomach = 0.0
						Calories = 0.0
						Protein = 0.0
						Carbohydrates = 0.0
						Fats = 0.0
						Prolactin = 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
			;Salmon Meat
			ElseIf LaikaFoodSalmonMeatRaw.Find(type) >= 0
						Stomach += 227.0
						Calories += 468.0
						Protein += 50.0
						Carbohydrates += 0.0
						Fats += 28.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Salmon Steak Cooked
			ElseIf LaikaFoodSalmonMeatCooked.Find(type) >= 0
						Stomach += 170.0
						Calories += 468.0
						Protein += 50.0
						Carbohydrates += 0.0
						Fats += 28.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						;Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Seared Slaughterfish
			ElseIf LaikaFoodSearedSlaughterfish.Find(type) >= 0
						Stomach += 204.0
						Calories += 561.0
						Protein += 60.0
						Carbohydrates += 0.0
						Fats += 33.6
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Sliced Eidar Cheese
			ElseIf LaikaFoodSlicedEidarCheese.Find(type) >= 0
						Stomach += 756.0
						Calories += 2968.0
						Protein += 203.0
						Carbohydrates += 11.2
						Fats += 231.0
						Prolactin += 98.7
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
			;Sliced Goat Cheese
			ElseIf LaikaFoodSlicedGoatCheese.Find(type) >= 0
						Stomach += 784.0
						Calories += 2100.0
						Protein += 148.4
						Carbohydrates += 0.0
						Fats += 168.0
						Prolactin += 70.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Du hast dich vollgefressen und dich übergeben.")
			;Snowberry Crostata
			ElseIf LaikaFoodSnowberryCrostata.Find(type) >= 0
						Stomach += 228.0
						Calories += 470.0
						Protein += 3.8
						Carbohydrates += 44.4
						Fats += 27.6
						Prolactin += 19.8
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Soul Husk
			ElseIf LaikaFoodSoulHusk.Find(type) >= 0
						Stomach += 100.0
						Calories += 0.0000
						Protein += 0.0
						Carbohydrates += 0.0
						Fats += 0.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Spiced Beef
			ElseIf LaikaFoodSpicedBeef.Find(type) >= 0
						Stomach += 243.0
						Calories += 675.0
						Protein += 63.8
						Carbohydrates += 0.0
						Fats += 45.1
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Steamed Mudcrab Legs
			ElseIf LaikaFoodMudcrabMeatCooked.Find(type) >= 0
						Stomach += 88.0
						Calories += 98.0
						Protein += 21.0
						Carbohydrates += 0.0
						Fats += 0.9
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Sweet Roll
			ElseIf LaikaFoodSweetroll.Find(type) >= 0
						Stomach += 268.0
						Calories += 1048.0
						Protein += 8.0
						Carbohydrates += 152.0
						Fats += 48.0
						Prolactin += 29.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Tomato
			ElseIf LaikaFoodTomato.Find(type) >= 0
						Stomach += 123.0
						Calories += 22.0
						Protein += 1.1
						Carbohydrates += 4.8
						Fats += 0.3
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Tomato Soup
			ElseIf LaikaFoodTomatoSoup.Find(type) >= 0
						Stomach += 488.0
						Calories += 170.0
						Protein += 3.5
						Carbohydrates += 36.0
						Fats += 1.1
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Vegetable Soup
			ElseIf LaikaFoodVegetableSoup.Find(type) >= 0
						Stomach += 482.0
						Calories += 159.0
						Protein += 5.8
						Carbohydrates += 26.0
						Fats += 3.8
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Venison
			ElseIf LaikaFoodVenisonMeatRaw.Find(type) >= 0
						Stomach += 255.0
						Calories += 384.0
						Protein += 78.0
						Carbohydrates += 0.0
						Fats += 6.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Venison Chop
			ElseIf LaikaFoodVenisonMeatCooked.Find(type) >= 0
						Stomach += 191.0
						Calories += 384.0
						Protein += 78.0
						Carbohydrates += 0.0
						Fats += 6.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Venison Stew
			ElseIf LaikaFoodVenisonMeatStew.Find(type) >= 0
						Stomach += 477.0
						Calories += 798.0
						Protein += 69.0
						Carbohydrates += 37.0
						Fats += 54.0
						Prolactin += 0.0
						UpdateWeight()
						;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
		;Drink
			;Ale
			ElseIf LaikaDrinkAle.Find(type) >= 0
					Stomach += 356.0
					Calories += 153.0
					Protein += 1.6
					Carbohydrates += 13.0
					Fats += 0.0
					Prolactin += 0.0
					UpdateWeight()
					;Update Hunger
						If (Stomach <= (Weight * (StomachCapacity / 50)) * 0.3)
						HungerString = "Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.5)
						HungerString = "Leicht Hungrig"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 0.8)
						HungerString = "Satt"
					ElseIf (Stomach <= (Weight * (StomachCapacity / 50)) * 1.0)
						HungerString = "Vollgestopft"
					EndIf
						Debug.Notification("Status: " + HungerString + " | " + "Gewicht: " + Round(Weight, 2) + "kg")
			;Mead with Juniper Berry
				EndIf
			EndIf
		EndIf
		
	EndIf
EndEvent
/;

Function UpdateWeight()
	If CheckNiOverride()
		Int PlayerSex = PlayerRef.GetActorBase().GetSex()
		Int CamillaSex = CamillaRef.GetActorBase().GetSex()

		; Female
		If PlayerSex == 1
			If Weight >= 0.0
				;NiOverride.SetBodyMorph(PlayerRef, "BreastsNewSH", LaikasCaloriesKey, Weight * MultBreastsNewSH)
				;NiOverride.SetBodyMorph(PlayerRef, "BigBelly", LaikasCaloriesKey, Weight * MultBigBelly)
				NiOverride.SetBodyMorph(CamillaRef, "BigTorso", LaikasCaloriesKey, ( 1 * MultBigTorso))
				NiOverride.SetBodyMorph(PlayerRef, "BigTorso", LaikasCaloriesKey, ((Weight / 50) - 1) * (MultBigTorso))
				;NiOverride.SetBodyMorph(PlayerRef, "ButtShape2", LaikasCaloriesKey, Weight * MultButtShape2)
				NiOverride.SetBodyMorph(PlayerRef, "ChubbyArms", LaikasCaloriesKey, ((Weight / 50) - 1) * (MultChubbyArms))
				NiOverride.SetBodyMorph(Camilla, "ChubbyButt", LaikasCaloriesKey, (1 * MultChubbyButt))
				NiOverride.SetBodyMorph(PlayerRef, "ChubbyButt", LaikasCaloriesKey, ((Weight / 50) - 1) * (MultChubbyButt))
				NiOverride.SetBodyMorph(Camilla, "ChubbyLegs", LaikasCaloriesKey, (1 * MultChubbyLegs))
				NiOverride.SetBodyMorph(PlayerRef, "ChubbyLegs", LaikasCaloriesKey, ((Weight / 50) - 1) * (MultChubbyLegs))
				NiOverride.SetBodyMorph(PlayerRef, "Waist", LaikasCaloriesKey, ((Weight / 50) - 1) * (MultWaist))
				;NiOverride.SetBodyMorph(PlayerRef, "WideWaistLine", LaikasCaloriesKey, Weight * MultWideWaistLine)
				;NiOverride.SetBodyMorph(PlayerRef, "CalfSize", LaikasCaloriesKey, Weight * MultCalfSize)

				;NiOverride.SetBodyMorph(PlayerRef, "AnkleSize", LaikasCaloriesKey, Weight * MultAnkleSize)
				;NiOverride.SetBodyMorph(PlayerRef, "AppleCheeks", LaikasCaloriesKey, Weight * MultAppleCheeks)
				;NiOverride.SetBodyMorph(PlayerRef, "AreolaSize", LaikasCaloriesKey, Weight * MultAreolaSize)
				;NiOverride.SetBodyMorph(PlayerRef, "Arms", LaikasCaloriesKey, Weight * MultArms)
				;NiOverride.SetBodyMorph(PlayerRef, "Back", LaikasCaloriesKey, Weight * MultBack)
				;NiOverride.SetBodyMorph(PlayerRef, "BackArch", LaikasCaloriesKey, Weight * MultBackArch)
				ActorBase pActorBase = Game.GetPlayer().GetActorBase()
				Float playerweight = pActorBase.GetWeight()
				NiOverride.SetBodyMorph(CamillaRef, "Belly", LaikasCaloriesKey, (((CamillaWeight / 50) - 1 ) * MultBelly))
				NiOverride.SetBodyMorph(PlayerRef, "Belly", LaikasCaloriesKey, (((Weight / 50) - 1) * (MultBelly + (FatStored / 10000)) - (playerweight / 100)))
				;NiOverride.SetBodyMorph(PlayerRef, "BigButt", LaikasCaloriesKey, Weight * MultBigButt)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastCenter", LaikasCaloriesKey, Weight * MultBreastCenter)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastCenterBig", LaikasCaloriesKey, Weight * MultBreastCenterBig)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastCleavage", LaikasCaloriesKey, Weight * MultBreastCleavage)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastFlatness2", LaikasCaloriesKey, Weight * MultBreastFlatness2)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastFlatness", LaikasCaloriesKey, Weight * MultBreastFlatness)
				NiOverride.SetBodyMorph(PlayerRef, "BreastGravity2", LaikasCaloriesKey, ((Weight / 50) - 1) * (MultBreastGravity2))
				;NiOverride.SetBodyMorph(PlayerRef, "BreastHeight", LaikasCaloriesKey, Weight * MultBreastHeight)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastPerkiness", LaikasCaloriesKey, Weight * MultBreastPerkiness)
					;NiOverride.SetBodyMorph(PlayerRef, "Breasts", LaikasCaloriesKey, (((Weight / 50) - 1) * MultBreasts) + (ProlactinBreast / 2500))
					;NiOverride.SetBodyMorph(PlayerRef, "Breasts", LaikasCaloriesKey, (((Weight / 50) - 1) * MultBreasts) + (Round((ProlactinBreast * 1.5) , 0) as Float * 0.001))
					NiOverride.SetBodyMorph(CamillaRef, "Breasts", LaikasCaloriesKey, ((MultBreasts * (ProlactinBreast / 1097.8))) * 0.50)
					NiOverride.SetBodyMorph(PlayerRef, "Breasts", LaikasCaloriesKey, ((MultBreasts * (ProlactinBreast / 1097.8))) * 0.25)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastsFantasy", LaikasCaloriesKey, Weight * MultBreastsFantasy)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastsGone", LaikasCaloriesKey, Weight * MultBreastsGone)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastsSmall", LaikasCaloriesKey, Weight * MultBreastsSmall)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastsSmall2", LaikasCaloriesKey, Weight * MultBreastsSmall2)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastsTogether", LaikasCaloriesKey, Weight * MultBreastsTogether)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastTopSlope", LaikasCaloriesKey, Weight * MultBreastTopSlope)
				;NiOverride.SetBodyMorph(PlayerRef, "BreastWidth", LaikasCaloriesKey, Weight * MultBreastWidth)
				NiOverride.SetBodyMorph(Camilla, "Butt", LaikasCaloriesKey, (1 * MultButt))
				NiOverride.SetBodyMorph(PlayerRef, "Butt", LaikasCaloriesKey, ((Weight / 50) - 1) * (MultButt))
				;NiOverride.SetBodyMorph(PlayerRef, "ButtClassic", LaikasCaloriesKey, Weight * MultButtClassic)
				;NiOverride.SetBodyMorph(PlayerRef, "ButtCrack", LaikasCaloriesKey, Weight * MultButtCrack)
				;NiOverride.SetBodyMorph(PlayerRef, "ButtSmall", LaikasCaloriesKey, Weight * MultButtSmall)
				;NiOverride.SetBodyMorph(PlayerRef, "CalfSmooth", LaikasCaloriesKey, Weight * MultCalfSmooth)
				;NiOverride.SetBodyMorph(PlayerRef, "ChestDepth", LaikasCaloriesKey, Weight * MultChestDepth)
				;NiOverride.SetBodyMorph(PlayerRef, "ChestWidth", LaikasCaloriesKey, Weight * MultChestWidth)
				;NiOverride.SetBodyMorph(PlayerRef, "ChubbyWaist", LaikasCaloriesKey, Weight * MultChubbyWaist)
				;NiOverride.SetBodyMorph(PlayerRef, "CrotchBack", LaikasCaloriesKey, Weight * MultCrotchBack)
				;NiOverride.SetBodyMorph(PlayerRef, "DoubleMelon", LaikasCaloriesKey, Weight * MultDoubleMelon)
				;NiOverride.SetBodyMorph(PlayerRef, "ForearmSize", LaikasCaloriesKey, Weight * MultForearmSize)
				;NiOverride.SetBodyMorph(PlayerRef, "Groin", LaikasCaloriesKey, Weight * MultGroin)
				;NiOverride.SetBodyMorph(PlayerRef, "HipBone", LaikasCaloriesKey, Weight * MultHipBone)
				;NiOverride.SetBodyMorph(PlayerRef, "HipForward", LaikasCaloriesKey, Weight * MultHipForward)
				NiOverride.SetBodyMorph(PlayerRef, "Hips", LaikasCaloriesKey, ((Weight / 50) - 1) * (MultHips))
				;NiOverride.SetBodyMorph(PlayerRef, "HipUpperWidth", LaikasCaloriesKey, Weight * MultHipUpperWidth)
				;NiOverride.SetBodyMorph(PlayerRef, "KneeHeight", LaikasCaloriesKey, Weight * MultKneeHeight)
				;NiOverride.SetBodyMorph(PlayerRef, "KneeShape", LaikasCaloriesKey, Weight * MultKneeShape)
				;NiOverride.SetBodyMorph(PlayerRef, "LegShapeClassic", LaikasCaloriesKey, Weight * MultLegShapeClassic)
				;NiOverride.SetBodyMorph(PlayerRef, "LegsThin", LaikasCaloriesKey, Weight * MultLegsThin)
				NiOverride.SetBodyMorph(PlayerRef, "MuscleAbs", LaikasCaloriesKey, ((Weight / 50) / 1) * (MultMuscleAbs + (Muscles / 2000)))
				NiOverride.SetBodyMorph(PlayerRef, "MuscleArms", LaikasCaloriesKey, ((Weight / 50) / 1) * (MultMuscleArms + (Muscles / 2000)))
				NiOverride.SetBodyMorph(PlayerRef, "MuscleButt", LaikasCaloriesKey, ((Weight / 50) / 1) * (MultMuscleButt + (Muscles / 2000)))
				NiOverride.SetBodyMorph(PlayerRef, "MuscleLegs", LaikasCaloriesKey, ((Weight / 50) / 1) * (MultMuscleLegs + (Muscles / 2000)))
				NiOverride.SetBodyMorph(PlayerRef, "MusclePecs", LaikasCaloriesKey, ((Weight / 50) / 1) * (MultMusclePecs + (Muscles / 2000)))
				;NiOverride.SetBodyMorph(PlayerRef, "NipBGone", LaikasCaloriesKey, Weight * MultNipBGone)
				;NiOverride.SetBodyMorph(PlayerRef, "NippleDistance", LaikasCaloriesKey, Weight * MultNippleDistance)
				;NiOverride.SetBodyMorph(PlayerRef, "NippleDown", LaikasCaloriesKey, Weight * MultNippleDown)
				;NiOverride.SetBodyMorph(PlayerRef, "NippleLength", LaikasCaloriesKey, Weight * MultNippleLength)
				;NiOverride.SetBodyMorph(PlayerRef, "NippleManga", LaikasCaloriesKey, Weight * MultNippleManga)
				;NiOverride.SetBodyMorph(PlayerRef, "NipplePerkiness", LaikasCaloriesKey, Weight * MultNipplePerkiness)
				;NiOverride.SetBodyMorph(PlayerRef, "NipplePerkManga", LaikasCaloriesKey, Weight * MultNipplePerkManga)
				;NiOverride.SetBodyMorph(PlayerRef, "NippleSize", LaikasCaloriesKey, Weight * MultNippleSize)
				;NiOverride.SetBodyMorph(PlayerRef, "NippleTip", LaikasCaloriesKey, Weight * MultNippleTip)
				;NiOverride.SetBodyMorph(PlayerRef, "NippleTipManga", LaikasCaloriesKey, Weight * MultNippleTipManga)
				;NiOverride.SetBodyMorph(PlayerRef, "NippleUp", LaikasCaloriesKey, Weight * MultNippleUp)
				;NiOverride.SetBodyMorph(PlayerRef, "PregnancyBelly", LaikasCaloriesKey, Weight * MultPregnancyBelly)
				;NiOverride.SetBodyMorph(PlayerRef, "PushUp", LaikasCaloriesKey, Weight * MultPushUp)
				;NiOverride.SetBodyMorph(PlayerRef, "RibsProminance", LaikasCaloriesKey, Weight * MultRibsProminance)
				;NiOverride.SetBodyMorph(PlayerRef, "RoundAss", LaikasCaloriesKey, Weight * MultRoundAss)
				;NiOverride.SetBodyMorph(PlayerRef, "ShoulderSmooth", LaikasCaloriesKey, Weight * MultShoulderSmooth)
				;NiOverride.SetBodyMorph(PlayerRef, "ShoulderTweak", LaikasCaloriesKey, Weight * MultShoulderTweak)
				;NiOverride.SetBodyMorph(PlayerRef, "ShoulderWidth", LaikasCaloriesKey, Weight * MultShoulderWidth)
				;NiOverride.SetBodyMorph(PlayerRef, "SlimThighs", LaikasCaloriesKey, Weight * MultSlimThighs)
				;NiOverride.SetBodyMorph(PlayerRef, "SternumDepth", LaikasCaloriesKey, Weight * MultSternumDepth)
				;NiOverride.SetBodyMorph(PlayerRef, "SternumHeight", LaikasCaloriesKey, Weight * MultSternumHeight)
				;NiOverride.SetBodyMorph(PlayerRef, "Thighs", LaikasCaloriesKey, Weight * MultThighs)
				;NiOverride.SetBodyMorph(PlayerRef, "TummyTuck", LaikasCaloriesKey, Weight * MultTummyTuck)
				;NiOverride.SetBodyMorph(PlayerRef, "WaistHeight", LaikasCaloriesKey, Weight * MultWaistHeight)
				;NiOverride.SetBodyMorph(PlayerRef, "WristSize", LaikasCaloriesKey, Weight * MultWristSize)
				;NiOverride.SetBodyMorph(PlayerRef, "FeetFeminine", LaikasCaloriesKey, Weight * MultFeetFeminine)
			Else
				NiOverride.SetBodyMorph(PlayerRef, "BreastsNewSH", LaikasCaloriesKey, -Weight / 100 * MultLowBreastsNewSH)
				NiOverride.SetBodyMorph(PlayerRef, "BigBelly", LaikasCaloriesKey, -Weight / 100 * MultLowBigBelly)
				NiOverride.SetBodyMorph(PlayerRef, "BigTorso", LaikasCaloriesKey, -Weight / 100 * MultLowBigTorso)
				NiOverride.SetBodyMorph(PlayerRef, "ButtShape2", LaikasCaloriesKey, -Weight / 100 * MultLowButtShape2)
				NiOverride.SetBodyMorph(PlayerRef, "ChubbyArms", LaikasCaloriesKey, -Weight / 100 * MultLowChubbyArms)
				NiOverride.SetBodyMorph(PlayerRef, "ChubbyButt", LaikasCaloriesKey, -Weight / 100 * MultLowChubbyButt)
				NiOverride.SetBodyMorph(PlayerRef, "ChubbyLegs", LaikasCaloriesKey, -Weight / 100 * MultLowChubbyLegs)
				NiOverride.SetBodyMorph(PlayerRef, "Waist", LaikasCaloriesKey, -Weight / 100 * MultLowWaist)
				NiOverride.SetBodyMorph(PlayerRef, "WideWaistLine", LaikasCaloriesKey, -Weight / 100 * MultLowWideWaistLine)
				NiOverride.SetBodyMorph(PlayerRef, "CalfSize", LaikasCaloriesKey, -Weight / 100 * MultLowCalfSize)

				NiOverride.SetBodyMorph(PlayerRef, "AnkleSize", LaikasCaloriesKey, Weight / 100 * MultLowAnkleSize)
				NiOverride.SetBodyMorph(PlayerRef, "AppleCheeks", LaikasCaloriesKey, Weight / 100 * MultLowAppleCheeks)
				NiOverride.SetBodyMorph(PlayerRef, "AreolaSize", LaikasCaloriesKey, Weight / 100 * MultLowAreolaSize)
				NiOverride.SetBodyMorph(PlayerRef, "Arms", LaikasCaloriesKey, Weight / 100 * MultLowArms)
				NiOverride.SetBodyMorph(PlayerRef, "Back", LaikasCaloriesKey, Weight / 100 * MultLowBack)
				NiOverride.SetBodyMorph(PlayerRef, "BackArch", LaikasCaloriesKey, Weight / 100 * MultLowBackArch)
				NiOverride.SetBodyMorph(PlayerRef, "Belly", LaikasCaloriesKey, Weight / 100 * MultLowBelly)
				NiOverride.SetBodyMorph(PlayerRef, "BigButt", LaikasCaloriesKey, Weight / 100 * MultLowBigButt)
				NiOverride.SetBodyMorph(PlayerRef, "BreastCenter", LaikasCaloriesKey, Weight / 100 * MultLowBreastCenter)
				NiOverride.SetBodyMorph(PlayerRef, "BreastCenterBig", LaikasCaloriesKey, Weight / 100 * MultLowBreastCenterBig)
				NiOverride.SetBodyMorph(PlayerRef, "BreastCleavage", LaikasCaloriesKey, Weight / 100 * MultLowBreastCleavage)
				NiOverride.SetBodyMorph(PlayerRef, "BreastFlatness2", LaikasCaloriesKey, Weight / 100 * MultLowBreastFlatness2)
				NiOverride.SetBodyMorph(PlayerRef, "BreastFlatness", LaikasCaloriesKey, Weight / 100 * MultLowBreastFlatness)
				NiOverride.SetBodyMorph(PlayerRef, "BreastGravity2", LaikasCaloriesKey, Weight / 100 * MultLowBreastGravity2)
				NiOverride.SetBodyMorph(PlayerRef, "BreastHeight", LaikasCaloriesKey, Weight / 100 * MultLowBreastHeight)
				NiOverride.SetBodyMorph(PlayerRef, "BreastPerkiness", LaikasCaloriesKey, Weight / 100 * MultLowBreastPerkiness)
				NiOverride.SetBodyMorph(PlayerRef, "Breasts", LaikasCaloriesKey, Weight / 100 * MultLowBreasts)
				NiOverride.SetBodyMorph(PlayerRef, "BreastsFantasy", LaikasCaloriesKey, Weight / 100 * MultLowBreastsFantasy)
				NiOverride.SetBodyMorph(PlayerRef, "BreastsGone", LaikasCaloriesKey, Weight / 100 * MultLowBreastsGone)
				NiOverride.SetBodyMorph(PlayerRef, "BreastsSmall", LaikasCaloriesKey, Weight / 100 * MultLowBreastsSmall)
				NiOverride.SetBodyMorph(PlayerRef, "BreastsSmall2", LaikasCaloriesKey, Weight / 100 * MultLowBreastsSmall2)
				NiOverride.SetBodyMorph(PlayerRef, "BreastsTogether", LaikasCaloriesKey, Weight / 100 * MultLowBreastsTogether)
				NiOverride.SetBodyMorph(PlayerRef, "BreastTopSlope", LaikasCaloriesKey, Weight / 100 * MultLowBreastTopSlope)
				NiOverride.SetBodyMorph(PlayerRef, "BreastWidth", LaikasCaloriesKey, Weight / 100 * MultLowBreastWidth)
				NiOverride.SetBodyMorph(PlayerRef, "Butt", LaikasCaloriesKey, Weight / 100 * MultLowButt)
				NiOverride.SetBodyMorph(PlayerRef, "ButtClassic", LaikasCaloriesKey, Weight / 100 * MultLowButtClassic)
				NiOverride.SetBodyMorph(PlayerRef, "ButtCrack", LaikasCaloriesKey, Weight / 100 * MultLowButtCrack)
				NiOverride.SetBodyMorph(PlayerRef, "ButtSmall", LaikasCaloriesKey, Weight / 100 * MultLowButtSmall)
				NiOverride.SetBodyMorph(PlayerRef, "CalfSmooth", LaikasCaloriesKey, Weight / 100 * MultLowCalfSmooth)
				NiOverride.SetBodyMorph(PlayerRef, "ChestDepth", LaikasCaloriesKey, Weight / 100 * MultLowChestDepth)
				NiOverride.SetBodyMorph(PlayerRef, "ChestWidth", LaikasCaloriesKey, Weight / 100 * MultLowChestWidth)
				NiOverride.SetBodyMorph(PlayerRef, "ChubbyWaist", LaikasCaloriesKey, Weight / 100 * MultLowChubbyWaist)
				NiOverride.SetBodyMorph(PlayerRef, "CrotchBack", LaikasCaloriesKey, Weight / 100 * MultLowCrotchBack)
				NiOverride.SetBodyMorph(PlayerRef, "DoubleMelon", LaikasCaloriesKey, Weight / 100 * MultLowDoubleMelon)
				NiOverride.SetBodyMorph(PlayerRef, "ForearmSize", LaikasCaloriesKey, Weight / 100 * MultLowForearmSize)
				NiOverride.SetBodyMorph(PlayerRef, "Groin", LaikasCaloriesKey, Weight / 100 * MultLowGroin)
				NiOverride.SetBodyMorph(PlayerRef, "HipBone", LaikasCaloriesKey, Weight / 100 * MultLowHipBone)
				NiOverride.SetBodyMorph(PlayerRef, "HipForward", LaikasCaloriesKey, Weight / 100 * MultLowHipForward)
				NiOverride.SetBodyMorph(PlayerRef, "Hips", LaikasCaloriesKey, Weight / 100 * MultLowHips)
				NiOverride.SetBodyMorph(PlayerRef, "HipUpperWidth", LaikasCaloriesKey, Weight / 100 * MultLowHipUpperWidth)
				NiOverride.SetBodyMorph(PlayerRef, "KneeHeight", LaikasCaloriesKey, Weight / 100 * MultLowKneeHeight)
				NiOverride.SetBodyMorph(PlayerRef, "KneeShape", LaikasCaloriesKey, Weight / 100 * MultLowKneeShape)
				NiOverride.SetBodyMorph(PlayerRef, "LegShapeClassic", LaikasCaloriesKey, Weight / 100 * MultLowLegShapeClassic)
				NiOverride.SetBodyMorph(PlayerRef, "LegsThin", LaikasCaloriesKey, Weight / 100 * MultLowLegsThin)
				NiOverride.SetBodyMorph(PlayerRef, "MuscleAbs", LaikasCaloriesKey, Weight / 100 * MultLowMuscleAbs)
				NiOverride.SetBodyMorph(PlayerRef, "MuscleArms", LaikasCaloriesKey, Weight / 100 * MultLowMuscleArms)
				NiOverride.SetBodyMorph(PlayerRef, "MuscleButt", LaikasCaloriesKey, Weight / 100 * MultLowMuscleButt)
				NiOverride.SetBodyMorph(PlayerRef, "MuscleLegs", LaikasCaloriesKey, Weight / 100 * MultLowMuscleLegs)
				NiOverride.SetBodyMorph(PlayerRef, "MusclePecs", LaikasCaloriesKey, Weight / 100 * MultLowMusclePecs)
				NiOverride.SetBodyMorph(PlayerRef, "NipBGone", LaikasCaloriesKey, Weight / 100 * MultLowNipBGone)
				NiOverride.SetBodyMorph(PlayerRef, "NippleDistance", LaikasCaloriesKey, Weight / 100 * MultLowNippleDistance)
				NiOverride.SetBodyMorph(PlayerRef, "NippleDown", LaikasCaloriesKey, Weight / 100 * MultLowNippleDown)
				NiOverride.SetBodyMorph(PlayerRef, "NippleLength", LaikasCaloriesKey, Weight / 100 * MultLowNippleLength)
				NiOverride.SetBodyMorph(PlayerRef, "NippleManga", LaikasCaloriesKey, Weight / 100 * MultLowNippleManga)
				NiOverride.SetBodyMorph(PlayerRef, "NipplePerkiness", LaikasCaloriesKey, Weight / 100 * MultLowNipplePerkiness)
				NiOverride.SetBodyMorph(PlayerRef, "NipplePerkManga", LaikasCaloriesKey, Weight / 100 * MultLowNipplePerkManga)
				NiOverride.SetBodyMorph(PlayerRef, "NippleSize", LaikasCaloriesKey, Weight / 100 * MultLowNippleSize)
				NiOverride.SetBodyMorph(PlayerRef, "NippleTip", LaikasCaloriesKey, Weight / 100 * MultLowNippleTip)
				NiOverride.SetBodyMorph(PlayerRef, "NippleTipManga", LaikasCaloriesKey, Weight / 100 * MultLowNippleTipManga)
				NiOverride.SetBodyMorph(PlayerRef, "NippleUp", LaikasCaloriesKey, Weight / 100 * MultLowNippleUp)
				NiOverride.SetBodyMorph(PlayerRef, "PregnancyBelly", LaikasCaloriesKey, Weight / 100 * MultLowPregnancyBelly)
				NiOverride.SetBodyMorph(PlayerRef, "PushUp", LaikasCaloriesKey, Weight / 100 * MultLowPushUp)
				NiOverride.SetBodyMorph(PlayerRef, "RibsProminance", LaikasCaloriesKey, Weight / 100 * MultLowRibsProminance)
				NiOverride.SetBodyMorph(PlayerRef, "RoundAss", LaikasCaloriesKey, Weight / 100 * MultLowRoundAss)
				NiOverride.SetBodyMorph(PlayerRef, "ShoulderSmooth", LaikasCaloriesKey, Weight / 100 * MultLowShoulderSmooth)
				NiOverride.SetBodyMorph(PlayerRef, "ShoulderTweak", LaikasCaloriesKey, Weight / 100 * MultLowShoulderTweak)
				NiOverride.SetBodyMorph(PlayerRef, "ShoulderWidth", LaikasCaloriesKey, Weight / 100 * MultLowShoulderWidth)
				NiOverride.SetBodyMorph(PlayerRef, "SlimThighs", LaikasCaloriesKey, Weight / 100 * MultLowSlimThighs)
				NiOverride.SetBodyMorph(PlayerRef, "SternumDepth", LaikasCaloriesKey, Weight / 100 * MultLowSternumDepth)
				NiOverride.SetBodyMorph(PlayerRef, "SternumHeight", LaikasCaloriesKey, Weight / 100 * MultLowSternumHeight)
				NiOverride.SetBodyMorph(PlayerRef, "Thighs", LaikasCaloriesKey, Weight / 100 * MultLowThighs)
				NiOverride.SetBodyMorph(PlayerRef, "TummyTuck", LaikasCaloriesKey, Weight / 100 * MultLowTummyTuck)
				NiOverride.SetBodyMorph(PlayerRef, "WaistHeight", LaikasCaloriesKey, Weight / 100 * MultLowWaistHeight)
				NiOverride.SetBodyMorph(PlayerRef, "WristSize", LaikasCaloriesKey, Weight / 100 * MultLowWristSize)
				NiOverride.SetBodyMorph(PlayerRef, "FeetFeminine", LaikasCaloriesKey, Weight / 100 * MultLowFeetFeminine)
			EndIf

		; Male
		ElseIf PlayerSex == 0
			If Weight >= 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Samuel", LaikasCaloriesKey, Weight * MultSamuel)
				NiOverride.SetBodyMorph(PlayerRef, "Samson", LaikasCaloriesKey, Weight * MultSamson)
			Else
				NiOverride.SetBodyMorph(PlayerRef, "Samuel", LaikasCaloriesKey, -Weight * MultLowSamuel)
				NiOverride.SetBodyMorph(PlayerRef, "Samson", LaikasCaloriesKey, -Weight * MultLowSamson)
			EndIf
		EndIf

			NiOverride.UpdateModelWeight(PlayerRef)
	EndIf

	effectsChanged = True
EndFunction

;Variables & Properties
FormList Property FoodList100  Auto  
Float Property WeightKG = 0.0 Auto  
FormList Property FoodList150  Auto  
FormList Property FoodList250  Auto  
Float Property BellyFat = 0.0 Auto  
Float Property WeightPlusBellyFat = 0.0 Auto  
FormList Property FoodList1500  Auto  
FormList Property FoodList1650  Auto  
FormList Property FoodList1750  Auto  
FormList Property FoodList300  Auto  
FormList Property FoodList350  Auto  
FormList Property FoodList450  Auto  
FormList Property FoodList500  Auto  
FormList Property FoodList560  Auto  
FormList Property FoodList575  Auto  
FormList Property FoodList600  Auto  
FormList Property FoodList620  Auto  
FormList Property FoodList700  Auto  
FormList Property FoodList750  Auto  
FormList Property FoodList800  Auto  
FormList Property FoodList900  Auto  
FormList Property FoodList850  Auto  
Float Property CaloriesBurnGeneralNordFemale Auto
Float Property CaloriesBurnTemperatureNordFemale Auto
Float Property CaloriesBurnMovementNordFemale Auto
Float Property Hunger Auto
String Property HungerString Auto
String Property WeightGainMeter Auto
String Property Zustand Auto
String Property Gewicht Auto
Int Property Kalorien Auto
Float Property Brustumfang Auto
Float Property Bauchumfang Auto
Float Property Hueftumfang  Auto  
Float Property Bodyfat  Auto  
String Property Koerbchengroesse Auto
Float WeightMultiplier = 100.0
Float Property BrustumfangFormel Auto ;77-138
;Weight * 1,22 = BrustumfangFormel
Float Property UnterbrustumfangFormel Auto ;63-112
;Weight * 1,22 = UnterbrustumfangFormel
Float Property BauchumfangFormel Auto  ;88-137
;Weight * 1,15 = BauchumfangFormel
Float Property HueftumfangFormel Auto  ;86-111
;Weight * 1,24 = BauchumfangFormel
Float Property BHSize Auto
String Property BHType Auto
String Property BHSizeType Auto
Race Property PlayerRaceVariable Auto
Race Property RaceNord  Auto  
Race Property RaceArgonian  Auto  
Float Property CaloriesBurnPassive Auto
Float Property Proteins Auto
Float Property Estrogen Auto
;UNUSED
Float Property Vitamins Auto
Float Property Minerals Auto
Float Property Water Auto
String Property Geschlecht Auto
String Rasse
Float Property ProteinsNeeds Auto
Float Property CarbohydratesNeeds Auto
Float Property FatsNeeds Auto
Float Property ProlactinNeeds Auto
Float Property EstrogenNeeds Auto
Float Property ProlactinBurnPassive Auto
Float Property ProlactinBreast = 1.0978 Auto
Float Property ProlactinBreastMultBreast Auto
;Calories & Stomach Burn Rate
Float Property Stomach = 2000.0 Auto
Float Property StomachCapacity Auto
Float Property Calories = 0.2000 Auto
;Nutrients Passive Burn Rate
Float Property CarbohydratesBurnPassive Auto
Float Property FatsBurnPassive Auto
Float Property ProteinBurnPassive Auto
;Laika's Calories
Float Property Protein = 48.0 Auto
Float Property Carbohydrates = 275.0 Auto
Float Property Fats = 61.0 Auto
Float Property Prolactin = 20.0 Auto
Float Property RoundNumber Auto
Float Property Muscles Auto
Float Property FatStored Auto
Float Property BrustUmfangFormelValue = 1.19 Auto
Float Property BauchumfangFormelValue = 1.12 Auto
Float Property HueftumfangFormelValue = 1.36 Auto
Float Property KoerperfettFormelValue = 0.414 Auto
String NordRace
FormList Property LaikaFoodAppleGreen  Auto  
FormList Property LaikaFoodBread  Auto  
FormList Property LaikaDrinkAle  Auto  
FormList Property LaikaFoodAppleCabbageStew  Auto  
FormList Property LaikaFoodAppleDumpling  Auto  
FormList Property LaikaFoodCarrot  Auto  
FormList Property LaikaFoodCabbage  Auto  
FormList Property LaikaFoodApplePie  Auto  
FormList Property LaikaDrinkMilk  Auto  
FormList Property LaikaNotFound  Auto 
Float Property CaloriesBurnPassiveDisplay Auto
Float Property ProteinBurnPassiveDisplay Auto
Float Property CarbohydratesBurnPassiveDisplay Auto
Float Property FatsBurnPassiveDisplay Auto
Float Property ProlactinBurnPassiveDisplay Auto
FormList Property LaikaFoodButter  Auto  
FormList Property LaikaFoodHalfBread  Auto  
FormList Property LaikaFoodBakedPotatoes  Auto  
FormList Property LaikaFoodBeefStew  Auto  
FormList Property LaikaFoodBoarMeatRaw  Auto  
FormList Property LaikaFoodBoarMeatCooked  Auto  
FormList Property LaikaFoodLeek  Auto  
FormList Property LaikaFoodBraidedBread  Auto  
FormList Property LaikaFoodBoiledCremeTreat  Auto  
FormList Property LaikaFoodAshHopperLegRaw  Auto  
FormList Property LaikaFoodAshHopperMeatRaw  Auto  
FormList Property LaikaFoodAshYam  Auto  
FormList Property LaikaFoodCabbagePotatoSoup  Auto  
FormList Property LaikaFoodCabbageSoup  Auto  
FormList Property LaikaFoodCharredSkeeverMeat  Auto  
FormList Property LaikaFoodChickenBreastRaw  Auto  
FormList Property LaikaFoodChickenDumpling  Auto  
FormList Property LaikaFoodClamChowder  Auto  
FormList Property LaikaFoodClamMeatRaw  Auto  
FormList Property LaikaFoodBeefCooked  Auto  
FormList Property LaikaFoodDogMeatRaw  Auto  
FormList Property LaikaFoodEidarCheeseWedge  Auto  
FormList Property LaikaFoodEidarCheeseWheel  Auto  
FormList Property LaikaFoodElsweyrFondue  Auto  
FormList Property LaikaFoodGarlicBread  Auto  
FormList Property LaikaFoodGoatCheeseWedge  Auto
FormList Property LaikaFoodGoatCheeseWheel  Auto    
Actor Property Camilla  Auto  
FormList Property LaikaFoodGourd  Auto  
FormList Property LaikaFoodChickenBreastCooked  Auto  
FormList Property LaikaFoodLeekCooked  Auto  
FormList Property LaikaFoodHomecookedMeal  Auto  
FormList Property LaikaFoodHoney  Auto  
FormList Property LaikaFoodHoneyNutTreat  Auto  
FormList Property LaikaFoodHorkerMeatRaw  Auto  
FormList Property LaikaFoodHorkerMeatCooked  Auto  
FormList Property LaikaFoodHorkerStew  Auto  
FormList Property LaikaFoodHorkerAshYamStew  Auto  
FormList Property LaikaFoodHorseMeatRaw  Auto  
FormList Property LaikaFoodHorseMeatCooked  Auto  
FormList Property LaikaFoodJazbayCrostata  Auto  
FormList Property LaikaFoodJuniperCrostata  Auto  
FormList Property LaikaFoodLavenderDumpling  Auto  
FormList Property LaikaFoodGoatMeatRaw  Auto  
FormList Property LaikaFoodGoatMeatCooked  Auto  
FormList Property LaikaFoodLongTaffyTreat  Auto  
FormList Property LaikaFoodMammothCheeseBowl  Auto  
FormList Property LaikaFoodMammothMeatRaw  Auto  
FormList Property LaikaFoodMammothMeatCooked  Auto  
FormList Property LaikaFoodMudcrabMeatRaw  Auto  
FormList Property LaikaFoodPheasantMeatRaw  Auto  
FormList Property LaikaFoodPheasantMeatCooked  Auto  
FormList Property LaikaFoodPotato  Auto  
FormList Property LaikaFoodPotatoBread  Auto  
FormList Property LaikaFoodPotatoSoup  Auto  
FormList Property LaikaFoodRabbitMeatCooked  Auto  
FormList Property LaikaFoodBeefRaw  Auto  
FormList Property LaikaFoodRabbitMeatRaw  Auto  
FormList Property LaikaFoodAppleRed  Auto  
FormList Property LaikaFoodSackOfFlour  Auto  
FormList Property LaikaFoodSalmonMeatRaw  Auto  
FormList Property LaikaFoodSalmonMeatCooked  Auto   
FormList Property LaikaFoodSearedSlaughterfish  Auto  
FormList Property LaikaFoodSlicedEidarCheese  Auto  
FormList Property LaikaFoodSlicedGoatCheese  Auto  
FormList Property LaikaFoodSnowberryCrostata  Auto  
FormList Property LaikaFoodSoulHusk  Auto  
FormList Property LaikaFoodSpicedBeef  Auto  
FormList Property LaikaFoodMudcrabMeatCooked  Auto  
FormList Property LaikaFoodSweetroll  Auto  
FormList Property LaikaFoodTomato  Auto  
FormList Property LaikaFoodTomatoSoup  Auto  
FormList Property LaikaFoodVegetableSoup  Auto  
FormList Property LaikaFoodVenisonMeatRaw  Auto  
FormList Property LaikaFoodVenisonMeatCooked  Auto  
FormList Property LaikaFoodVenisonMeatStew  Auto  
; Most relevant morphs high
Float Property MultBreastsNewSH = 0.4 Auto
Float Property MultBigBelly = 0.3 Auto
Float Property MultBigTorso = 1.0 Auto
Float Property MultButtShape2 = 0.5 Auto
Float Property MultChubbyArms = 1.0 Auto
Float Property MultChubbyButt = 1.0 Auto
Float Property MultChubbyLegs = 1.0 Auto
Float Property MultWaist = 1.0 Auto
Float Property MultWideWaistLine = 1.0 Auto
Float Property MultCalfSize = 0.5 Auto
; Most relevant morphs low
Float Property MultLowBreastsNewSH = -0.5 Auto
Float Property MultLowBigBelly = -0.4 Auto
Float Property MultLowBigTorso = -0.5 Auto
Float Property MultLowButtShape2 = -0.2 Auto
Float Property MultLowChubbyArms = -0.2 Auto
Float Property MultLowChubbyButt = -1.0 Auto
Float Property MultLowChubbyLegs = -0.3 Auto
Float Property MultLowWaist = 0.0 Auto
Float Property MultLowWideWaistLine = 0.0 Auto
Float Property MultLowCalfSize = -0.7 Auto
; Male morphs
Float Property MultSamuel = 1.0 Auto
Float Property MultSamson = 0.0 Auto
Float Property MultLowSamuel = 0.0 Auto
Float Property MultLowSamson = 0.0 Auto
; Other morphs high
Float Property MultAnkleSize = 0.0 Auto
Float Property MultAppleCheeks = 0.0 Auto
Float Property MultAreolaSize = 0.0 Auto
Float Property MultArms = 0.0 Auto
Float Property MultBack = 0.0 Auto
Float Property MultBackArch = 0.0 Auto
Float Property MultBelly = 1.0 Auto
Float Property MultBigButt = 0.0 Auto
Float Property MultBreastCenter = 0.0 Auto
Float Property MultBreastCenterBig = 0.0 Auto
Float Property MultBreastCleavage = 0.0 Auto
Float Property MultBreastFlatness2 = 0.0 Auto
Float Property MultBreastFlatness = 0.0 Auto
Float Property MultBreastGravity2 = 0.5 Auto
Float Property MultBreastHeight = 0.0 Auto
Float Property MultBreastPerkiness = 0.0 Auto
Float Property MultBreasts = 1.0 Auto
Float Property MultBreastsFantasy = 0.0 Auto
Float Property MultBreastsGone = 0.0 Auto
Float Property MultBreastsSmall = 0.0 Auto
Float Property MultBreastsSmall2 = 0.0 Auto
Float Property MultBreastsTogether = 0.0 Auto
Float Property MultBreastTopSlope = 0.0 Auto
Float Property MultBreastWidth = 0.0 Auto
Float Property MultButt = 0.0 Auto
Float Property MultButtClassic = 0.0 Auto
Float Property MultButtCrack = 0.0 Auto
Float Property MultButtSmall = 0.0 Auto
Float Property MultCalfSmooth = 0.0 Auto
Float Property MultChestDepth = 0.0 Auto
Float Property MultChestWidth = 0.0 Auto
Float Property MultChubbyWaist = 0.0 Auto
Float Property MultCrotchBack = 0.0 Auto
Float Property MultDoubleMelon = 0.0 Auto
Float Property MultForearmSize = 0.0 Auto
Float Property MultGroin = 0.0 Auto
Float Property MultHipBone = 0.0 Auto
Float Property MultHipForward = 0.0 Auto
Float Property MultHips = 0.0 Auto
Float Property MultHipUpperWidth = 0.0 Auto
Float Property MultKneeHeight = 0.0 Auto
Float Property MultKneeShape = 0.0 Auto
Float Property MultLegShapeClassic = 0.0 Auto
Float Property MultLegsThin = 0.0 Auto
Float Property MultMuscleAbs = 0.0 Auto
Float Property MultMuscleArms = 0.0 Auto
Float Property MultMuscleButt = 0.0 Auto
Float Property MultMuscleLegs = 0.0 Auto
Float Property MultMusclePecs = 0.0 Auto
Float Property MultNipBGone = 0.0 Auto
Float Property MultNippleDistance = 0.0 Auto
Float Property MultNippleDown = 0.0 Auto
Float Property MultNippleLength = 0.0 Auto
Float Property MultNippleManga = 0.0 Auto
Float Property MultNipplePerkiness = 0.0 Auto
Float Property MultNipplePerkManga = 0.0 Auto
Float Property MultNippleSize = 0.0 Auto
Float Property MultNippleTip = 0.0 Auto
Float Property MultNippleTipManga = 0.0 Auto
Float Property MultNippleUp = 0.0 Auto
Float Property MultPregnancyBelly = 0.0 Auto
Float Property MultPushUp = 0.0 Auto
Float Property MultRibsProminance = 0.0 Auto
Float Property MultRoundAss = 0.0 Auto
Float Property MultShoulderSmooth = 0.0 Auto
Float Property MultShoulderTweak = 0.0 Auto
Float Property MultShoulderWidth = 0.0 Auto
Float Property MultSlimThighs = 0.0 Auto
Float Property MultSternumDepth = 0.0 Auto
Float Property MultSternumHeight = 0.0 Auto
Float Property MultThighs = 0.0 Auto
Float Property MultTummyTuck = 0.0 Auto
Float Property MultWaistHeight = 0.0 Auto
Float Property MultWristSize = 0.0 Auto
Float Property MultFeetFeminine = 0.0 Auto
; Other morphs low
Float Property MultLowAnkleSize = 0.0 Auto
Float Property MultLowAppleCheeks = 0.0 Auto
Float Property MultLowAreolaSize = 0.0 Auto
Float Property MultLowArms = 0.0 Auto
Float Property MultLowBack = 0.0 Auto
Float Property MultLowBackArch = 0.0 Auto
Float Property MultLowBelly = 0.0 Auto
Float Property MultLowBigButt = 0.0 Auto
Float Property MultLowBreastCenter = 0.0 Auto
Float Property MultLowBreastCenterBig = 0.0 Auto
Float Property MultLowBreastCleavage = 0.0 Auto
Float Property MultLowBreastFlatness2 = 0.0 Auto
Float Property MultLowBreastFlatness = 0.0 Auto
Float Property MultLowBreastGravity2 = 0.0 Auto
Float Property MultLowBreastHeight = 0.0 Auto
Float Property MultLowBreastPerkiness = 0.0 Auto
Float Property MultLowBreasts = 0.0 Auto
Float Property MultLowBreastsFantasy = 0.0 Auto
Float Property MultLowBreastsGone = 0.0 Auto
Float Property MultLowBreastsSmall = 0.0 Auto
Float Property MultLowBreastsSmall2 = 0.0 Auto
Float Property MultLowBreastsTogether = 0.0 Auto
Float Property MultLowBreastTopSlope = 0.0 Auto
Float Property MultLowBreastWidth = 0.0 Auto
Float Property MultLowButt = 0.0 Auto
Float Property MultLowButtClassic = 0.0 Auto
Float Property MultLowButtCrack = 0.0 Auto
Float Property MultLowButtSmall = 0.0 Auto
Float Property MultLowCalfSmooth = 0.0 Auto
Float Property MultLowChestDepth = 0.0 Auto
Float Property MultLowChestWidth = 0.0 Auto
Float Property MultLowChubbyWaist = 0.0 Auto
Float Property MultLowCrotchBack = 0.0 Auto
Float Property MultLowDoubleMelon = 0.0 Auto
Float Property MultLowForearmSize = 0.0 Auto
Float Property MultLowGroin = 0.0 Auto
Float Property MultLowHipBone = 0.0 Auto
Float Property MultLowHipForward = 0.0 Auto
Float Property MultLowHips = 0.0 Auto
Float Property MultLowHipUpperWidth = 0.0 Auto
Float Property MultLowKneeHeight = 0.0 Auto
Float Property MultLowKneeShape = 0.0 Auto
Float Property MultLowLegShapeClassic = 0.0 Auto
Float Property MultLowLegsThin = 0.0 Auto
Float Property MultLowMuscleAbs = 0.0 Auto
Float Property MultLowMuscleArms = 0.0 Auto
Float Property MultLowMuscleButt = 0.0 Auto
Float Property MultLowMuscleLegs = 0.0 Auto
Float Property MultLowMusclePecs = 0.0 Auto
Float Property MultLowNipBGone = 0.0 Auto
Float Property MultLowNippleDistance = 0.0 Auto
Float Property MultLowNippleDown = 0.0 Auto
Float Property MultLowNippleLength = 0.0 Auto
Float Property MultLowNippleManga = 0.0 Auto
Float Property MultLowNipplePerkiness = 0.0 Auto
Float Property MultLowNipplePerkManga = 0.0 Auto
Float Property MultLowNippleSize = 0.0 Auto
Float Property MultLowNippleTip = 0.0 Auto
Float Property MultLowNippleTipManga = 0.0 Auto
Float Property MultLowNippleUp = 0.0 Auto
Float Property MultLowPregnancyBelly = 0.0 Auto
Float Property MultLowPushUp = 0.0 Auto
Float Property MultLowRibsProminance = 0.0 Auto
Float Property MultLowRoundAss = 0.0 Auto
Float Property MultLowShoulderSmooth = 0.0 Auto
Float Property MultLowShoulderTweak = 0.0 Auto
Float Property MultLowShoulderWidth = 0.0 Auto
Float Property MultLowSlimThighs = 0.0 Auto
Float Property MultLowSternumDepth = 0.0 Auto
Float Property MultLowSternumHeight = 0.0 Auto
Float Property MultLowThighs = 0.0 Auto
Float Property MultLowTummyTuck = 0.0 Auto
Float Property MultLowWaistHeight = 0.0 Auto
Float Property MultLowWristSize = 0.0 Auto
Float Property MultLowFeetFeminine = 0.0 Auto
Actor Property PlayerRef Auto
Actor Property CamillaRef Auto
Spell Property AbilityStamina Auto
Spell Property LaikaWellFed Auto
Spell Property AbilityStaminaNegative Auto
Spell Property AbilitySpeed Auto
Spell Property AbilitySpeedNegative Auto
FormList Property FoodLight Auto
FormList Property FoodMedium Auto
FormList Property FoodHeavy Auto
Bool Property Enabled = True Auto
Int Property CustomFood = 0 Auto
Int Property Potions = 1 Auto
Int Property Ingredients = 1 Auto
Float Property MultLoss = 1.0 Auto
Float Property MultGainLight = 1.0 Auto
Float Property MultGainMedium = 1.0 Auto
Float Property MultGainHeavy = 1.0 Auto
Float Property Stamina = 0.0 Auto
Float Property Speed = 0.0 Auto
Float Property MinWeight = 40.0 Auto
Float Property MaxWeight = 150.0 Auto
Float Property Weight = 50.0 Auto

Float Property OldWeightSaved = 0.0 Auto
Float Property StatWeightNew Auto
Float Property CamillaWeight = 50.0 Auto
Int Property UnitMeasurementSetting = 0 Auto
;Messages
Message Property HungerAndWeight  Auto  
;Time Stuff
Float Property TimePast Auto
Float Property TimePresent Auto
Float Property DesiredTime Auto
Int Property TimeWaitSleep = 0 Auto
Bool ReworkedWeight = False
Bool morphChanged = False
Bool effectsChanged = False
;Register Animation Events
Function RegisterEvents(Bool _enable)
	If _enable
		RegisterForAnimationEvent(PlayerRef, "FootLeft")
		RegisterForAnimationEvent(PlayerRef, "FootRight")
		RegisterForAnimationEvent(PlayerRef, "FootSprintLeft")
		RegisterForAnimationEvent(PlayerRef, "FootSprintRight")
		RegisterForAnimationEvent(PlayerRef, "JumpUp")
		RegisterForSingleUpdate(4)
	Else
		UnregisterForAnimationEvent(PlayerRef, "FootLeft")
		UnregisterForAnimationEvent(PlayerRef, "FootRight")
		UnregisterForAnimationEvent(PlayerRef, "FootSprintLeft")
		UnregisterForAnimationEvent(PlayerRef, "FootSprintRight")
		UnregisterForAnimationEvent(PlayerRef, "JumpUp")
		UnregisterForUpdate()
	EndIf
EndFunction
Bool Function CheckNiOverride()
	Return SKSE.GetPluginVersion("skee") >= SKEE_VERSION && NiOverride.GetScriptVersion() >= NIOVERRIDE_SCRIPT_VERSION
EndFunction



; Version data
Int Property SKEE_VERSION = 1 AutoReadOnly
Int Property NIOVERRIDE_SCRIPT_VERSION = 6 AutoReadOnly
Int Property LAIKASCALORIES_VERSION = 1 AutoReadOnly
Int Property Version = 0 Auto
Float Property WeightLast Auto
Int Property WellFed = 0 Auto
String Property LaikasCaloriesKey = "Laika's Calories.esp" AutoReadOnly
Float Property TotalGain = 0.0 Auto 
Float Property BauchumfangOld = 0.0 Auto 
Float Property BauchumfangNew = 0.0 Auto 
Float Property TotalBellyGain = 0.0 Auto 
Float Property OldWeightTotalGain = 0.0 Auto 
Float Property NewWeightTotalGain = 0.0 Auto 
Int Property CamillaWeightSetting = 2 Auto 
Float Property CamillaWeightRNG = 0.0 Auto
Bool Property EatingLimit = True Auto 
Bool Property RealisticWeight = True Auto 
Sound Property EatingSound Auto 
Sound Property BurpSound Auto 
String Property WeightToString Auto
Message Property FatStoredAbove5000 Auto
Message Property FatStoredAbove2500 Auto
Message Property Weight50Fat0 Auto
Message Property Weight50Fat0Reaction Auto
Message Property Weight50Fat0ReactionGaining Auto
Message Property Weight50Fat0Reaction2 Auto
Message Property Weight50Fat2500 Auto
Message Property Weight50Fat2500Reaction Auto
Message Property Weight50Fat5000 Auto
Message Property Weight50Fat5000Reaction Auto
Message Property Weight50Fat7500 Auto
Message Property Weight50Fat7500Reaction Auto
Message Property Weight90Fat0 Auto
Message Property WellFedMessage Auto
Message Property Weight90Fat2500 Auto
Message Property Weight90Fat5000 Auto
Message Property Weight90Fat7500 Auto
GlobalVariable Property GameHour Auto
Int Property GameHourSaved = 0 Auto
Int Property ReturnSaved = 20 Auto
Float Property CarryWeightTemp Auto
Float Property ProlactinBreastWriteToFile Auto
Float Property ProlactinBreastWriteToFile2 Auto
Float Property ProlactinBreastWriteToFile3 Auto
Float Property HueftumfangFormelOld Auto



