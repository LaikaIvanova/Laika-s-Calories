ScriptName LaikasCaloriesMCM Extends SKI_ConfigBase

LaikasCalories Property WMorphs Auto
LaikasCaloriesWeights Property LCW Auto

Int Property SKEE_VERSION = 1 AutoReadOnly
Int Property NIOVERRIDE_SCRIPT_VERSION = 6 AutoReadOnly
Int _myCustomFood
Int _myCamillaWeightSetting
Actor Property PlayerRef Auto
String GeschlechtMCM
String Rasse
String RasseNordWeiblich
String NordRace
Int _myEnabled
Int RealisticWeightSetting
Int _myScanFood
Int _myIngredients
Int _myPotions
Int _myMultLoss
Int _myMultGainLight
Int _myMultGainMedium
Int _myMultGainHeavy
Int _myStamina
Int _mySpeed
Int _myMinWeight
Int _myMaxWeight
Int _myWeight
Int _mySetWeight
Int _myCamillaSetWeight
Int _mySetCalories
Int _myMultBreastsNewSH
Int _myMultBigBelly
Int _myMultBigTorso
Int _myMultButtShape2
Int _myMultChubbyArms
Int _myFatStored
Int _myProlactinBreast
Int _myMuscles
Int _myMultChubbyButt
Int _myMultChubbyLegs
Int _myMultWaist
Int _myMultWideWaistLine
Int _myMultCalfSize
Int _myMultLowBreastsNewSH
Int _myMultLowBigBelly
Int _myMultLowBigTorso
Int _myMultLowButtShape2
Int _myMultLowChubbyArms
Int _myMultLowChubbyButt
Int _myMultLowChubbyLegs
Int _myMultLowWaist
Int _myMultLowWideWaistLine
Int _myMultLowCalfSize
Int _myMultSamuel
Int _myMultSamson
Int _myMultLowSamuel
Int _myMultLowSamson
Int _myMultAnkleSize
Int _myMultAppleCheeks
Int _myMultAreolaSize
Int _myMultArms
Int _myMultBack
Int _myMultBackArch
Int _myMultBelly
Int _myMultBigButt
Int _myMultBreastCenter
Int _myMultBreastCenterBig
Int _myMultBreastCleavage
Int _myMultBreastFlatness2
Int _myMultBreastFlatness
Int _myMultBreastGravity2
Int _myMultBreastHeight
Int _myMultBreastPerkiness
Int _myMultBreasts
Int _myMultBreastsFantasy
Int _myMultBreastsGone
Int _myMultBreastsSmall
Int _myMultBreastsSmall2
Int _myMultBreastsTogether
Int _myMultBreastTopSlope
Int _myMultBreastWidth
Int _myMultButt
Int _myMultButtClassic
Int _myMultButtCrack
Int _myMultButtSmall
Int _myMultCalfSmooth
Int _myMultChestDepth
Int _myMultChestWidth
Int _myMultChubbyWaist
Int _myMultCrotchBack
Int _myMultDoubleMelon
Int _myMultForearmSize
Int _myMultGroin
Int _myMultHipBone
Int _myMultHipForward
Int _myMultHips
Int _myMultHipUpperWidth
Int _myMultKneeHeight
Int _myMultKneeShape
Int _myMultLegShapeClassic
Int _myMultLegsThin
Int _myMultMuscleAbs
Int _myMultMuscleArms
Int _myMultMuscleButt
Int _myMultMuscleLegs
Int _myMultMusclePecs
Int _myMultNipBGone
Int _myMultNippleDistance
Int _myMultNippleDown
Int _myMultNippleLength
Int _myMultNippleManga
Int _myMultNipplePerkiness
Int _myMultNipplePerkManga
Int _myMultNippleSize
Int _myMultNippleTip
Int _myMultNippleTipManga
Int _myMultNippleUp
Int _myMultPregnancyBelly
Int _myMultPushUp
Int _myMultRibsProminance
Int _myMultRoundAss
Int _myMultShoulderSmooth
Int _myMultShoulderTweak
Int _myMultShoulderWidth
Int _myMultSlimThighs
Int _myMultSternumDepth
Int _myMultSternumHeight
Int _myMultThighs
Int _myMultTummyTuck
Int _myMultWaistHeight
Int _myMultWristSize
Int _myMultFeetFeminine
Int _myMultLowAnkleSize
Int _myMultLowAppleCheeks
Int _myMultLowAreolaSize
Int _myMultLowArms
Int _myMultLowBack
Int _myMultLowBackArch
Int _myMultLowBelly
Int _myMultLowBigButt
Int _myMultLowBreastCenter
Int _myMultLowBreastCenterBig
Int _myMultLowBreastCleavage
Int _myMultLowBreastFlatness2
Int _myMultLowBreastFlatness
Int _myMultLowBreastGravity2
Int _myMultLowBreastHeight
Int _myMultLowBreastPerkiness
Int _myMultLowBreasts
Int _myMultLowBreastsFantasy
Int _myMultLowBreastsGone
Int _myMultLowBreastsSmall
Int _myMultLowBreastsSmall2
Int _myMultLowBreastsTogether
Int _myMultLowBreastTopSlope
Int _myMultLowBreastWidth
Int _myMultLowButt
Int _myMultLowButtClassic
Int _myMultLowButtCrack
Int _myMultLowButtSmall
Int _myMultLowCalfSmooth
Int _myMultLowChestDepth
Int _myMultLowChestWidth
Int _myMultLowChubbyWaist
Int _myMultLowCrotchBack
Int _myMultLowDoubleMelon
Int _myMultLowForearmSize
Int _myMultLowGroin
Int _myMultLowHipBone
Int _myMultLowHipForward
Int _myMultLowHips
Int _myMultLowHipUpperWidth
Int _myMultLowKneeHeight
Int _myMultLowKneeShape
Int _myMultLowLegShapeClassic
Int _myMultLowLegsThin
Int _myMultLowMuscleAbs
Int _myMultLowMuscleArms
Int _myMultLowMuscleButt
Int _myMultLowMuscleLegs
Int _myMultLowMusclePecs
Int _myMultLowNipBGone
Int _myMultLowNippleDistance
Int _myMultLowNippleDown
Int _myMultLowNippleLength
Int _myMultLowNippleManga
Int _myMultLowNipplePerkiness
Int _myMultLowNipplePerkManga
Int _myMultLowNippleSize
Int _myMultLowNippleTip
Int _myMultLowNippleTipManga
Int _myMultLowNippleUp
Int _myMultLowPregnancyBelly
Int _myMultLowPushUp
Int _myMultLowRibsProminance
Int _myMultLowRoundAss
Int _myMultLowShoulderSmooth
Int _myMultLowShoulderTweak
Int _myMultLowShoulderWidth
Int _myMultLowSlimThighs
Int _myMultLowSternumDepth
Int _myMultLowSternumHeight
Int _myMultLowThighs
Int _myMultLowTummyTuck
Int _myMultLowWaistHeight
Int _myMultLowWristSize
Int _myMultLowFeetFeminine
Float BrustUmfangFormelValueNeu = 1.5 ;1.19
Float WaistCircumference = 1.12
Float Property HueftumfangFormelValueNeu = 1.36 Auto
Float KoerperfettFormelValueNeu = 0.414
Float Property ProlactinBurnPassiveMCM Auto

Function SetBustCircumference()
	WMorphs.BrustumfangFormel = (50 + ((WMorphs.Weight / 4.0) + (WMorphs.ProlactinBreast / 87.824)))
	;WMorphs.BHSize = (((WMorphs.UnterbrustumfangFormel + 2.5) / 5) + 1)
	;WMorphs.BHSize = (WMorphs.BrustumfangFormel - WMorphs.UnterbrustumfangFormel)
EndFunction

Function SetCupSize()
	WMorphs.BHType = WMorphs.ProlactinBreast / 87.824
EndFunction

Function SetWaistCircumference()
	WaistCircumference = ((WMorphs.Weight * 1.22) + ((WMorphs.FatStored / 100) * 0.5))
EndFunction

Function SetHipCircumference()
	WMorphs.HueftumfangFormel = ((0.25 * WMorphs.Weight) + 77.5)
EndFunction

Event OnGameReload()
	Pages = new String[4]
	Pages[0] = "$LAIKASCALORIES_PAGE_0"
	Pages[1] = "$LAIKASCALORIES_NEEDS"
	Pages[2] = "$LAIKASCALORIES_PAGE_3"
	Pages[3] = "$LAIKASCALORIES_PAGE_2"
EndEvent

Event OnPlayerLoadGame()
	Pages = new String[4]
	Pages[0] = "$LAIKASCALORIES_PAGE_0"
	Pages[1] = "$LAIKASCALORIES_NEEDS"
	Pages[2] = "$LAIKASCALORIES_PAGE_3"
	Pages[3] = "$LAIKASCALORIES_PAGE_2"
EndEvent

Event OnPageReset(String a_page)
	ActorBase PlayerBase = Game.GetPlayer().GetActorBase()
	If (PlayerBase.GetSex() == 0)
		GeschlechtMCM = "$LAIKASCALORIES_GESCHLECHT_MAENNLICH"
		If PlayerRef.GetRace() == RaceNordRace
			Rasse == "$LAIKASCALORIES_RASSE_NORD_MAENNLICH"
		EndIf
	ElseIf (PlayerBase.GetSex() == 1)
		GeschlechtMCM = "$LAIKASCALORIES_GESCHLECHT_WEIBLICH"
		Race PlayerRace = Game.GetPlayer().GetRace()
		If PlayerRef.GetRace() == RaceNordRace
			Rasse == "$LAIKASCALORIES_RASSE_NORD_WEIBLICH"
		EndIf
	EndIf
	If (a_page == "")
		; Image size 256x256
		; X offset = 376 - (height / 2) = 258
		; Y offset = 223 - (width / 2) = 95
		LoadCustomContent("weightmorphs/res/mcm_logo.dds", 258, 95)
		Return
	Else
		UnloadCustomContent()
	EndIf
	LCW.SetRealisticWeight()

	If (a_page == Pages[0]) ;Main Page
		SetCursorFillMode(LEFT_TO_RIGHT)
		AddHeaderOption("$LAIKASCALORIES_STATUS")
		AddEmptyOption()
		WMorphs.BauchumfangFormel = (WMorphs.Weight * (WaistCircumference + (WMorphs.FatStored / 10000)))
		WMorphs.HueftumfangFormel = (WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000)))
		WMorphs.Bodyfat = (WMorphs.Weight * (KoerperfettFormelValueNeu + (WMorphs.FatStored / 10000)))
		If WMorphs.Weight > 120.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_SEHRFETTLEIBIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 110.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_FETTLEIBIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 100.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_LEICHTFETTLEIBIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 95.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_SEHRMOLLIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 90.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_MOLLIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 87.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_SEHRFUELLIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 85.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_FUELLIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 83.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_LEICHTFUELLIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 80.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_SEHRKURVIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 70.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_KURVIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 67.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_LEICHTKURVIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 65.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_NORMAL", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 60.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_SCHLANK", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 50.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_DUENN", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 47.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_LEICHTMAGERSUECHTIG", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.Weight >= 45.0
			_myWeight = AddTextOption("$LAIKASCALORIES_ZUSTAND", "$LAIKASCALORIES_ZUSTAND_MAGERSUECHTIG", OPTION_FLAG_DISABLED)
		EndIf
		AddEmptyOption()
		_myWeight = AddTextOption("$LAIKASCALORIES_GESCHLECHTMCM", GeschlechtMCM, OPTION_FLAG_DISABLED)
		AddEmptyOption()
		If WMorphs.PlayerRaceVariable == WMorphs.RaceNord
			_myWeight = AddTextOption("$LAIKASCALORIES_RASSE", "$LAIKASCALORIES_RASSE_NORD_WEIBLICH", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.PlayerRaceVariable == WMorphs.RaceArgonian
			_myWeight = AddTextOption("$LAIKASCALORIES_RASSE", "$LAIKASCALORIES_RASSE_ARGONIAN_WEIBLICH", OPTION_FLAG_DISABLED)
		Else
			_myWeight = AddTextOption("$LAIKASCALORIES_RASSE", "LAIKASCALORIES_RASSE_UNBEKANNT", OPTION_FLAG_DISABLED)
		EndIf
		AddEmptyOption()
		If WMorphs.UnitMeasurementSetting == 0
			_myWeight = AddTextOption("$LAIKASCALORIES_GEWICHT", WMorphs.Round(WMorphs.Weight, 2) + "kg", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.UnitMeasurementSetting == 1
			_myWeight = AddTextOption("$LAIKASCALORIES_GEWICHT", WMorphs.Round((WMorphs.Weight * 2.20462), 0) + "lbs", OPTION_FLAG_DISABLED)
		EndIf
		AddEmptyOption()
		_myWeight = AddTextOption("$LAIKASCALORIES_KALORIEN", (WMorphs.Calories) as Int, OPTION_FLAG_DISABLED)
		AddEmptyOption()
		If (WMorphs.Stomach <= (WMorphs.Weight * 50) * 0.3)
		_myWeight = AddTextOption("$LAIKASCALORIES_HUNGER", "$LAIKASCALORIES_HUNGER_HUNGRIG", OPTION_FLAG_DISABLED)
		ElseIf (WMorphs.Stomach <= (WMorphs.Weight * 50) * 0.5)
		_myWeight = AddTextOption("$LAIKASCALORIES_HUNGER", "$LAIKASCALORIES_HUNGER_LEICHTER_APPETIT", OPTION_FLAG_DISABLED)
		ElseIf (WMorphs.Stomach <= (WMorphs.Weight * 50) * 0.8)
		_myWeight = AddTextOption("$LAIKASCALORIES_HUNGER", "$LAIKASCALORIES_HUNGER_SATT", OPTION_FLAG_DISABLED)
		ElseIf (WMorphs.Stomach <= (WMorphs.Weight * 50) * 1.0)
		_myWeight = AddTextOption("$LAIKASCALORIES_HUNGER", "$LAIKASCALORIES_HUNGER_VOLLGESTOPFT", OPTION_FLAG_DISABLED)
		EndIf
		AddEmptyOption()
		
		SetBustCircumference()
		SetCupSize()
		;If WMorphs.UnitMeasurementSetting == 0
		;	WMorphs.BHSize = WMorphs.BHSize as Int * 5
		;ElseIf WMorphs.UnitMeasurementSetting == 1
		;	WMorphs.BHSize = ((WMorphs.BHSize as Int * 5) * 0.45)
		;EndIf
		;WMorphs.BHSize = (WMorphs.BrustumfangFormel - WMorphs.UnterbrustumfangFormel)
		;WMorphs.BHType = WMorphs.UnterbrustumfangFormel
		If WMorphs.UnitMeasurementSetting == 0
			If WMorphs.BHType <= 10
				WMorphs.BHType = "AA"
			ElseIf WMorphs.BHType <= 12.5
				WMorphs.BHType = "A"
			ElseIf WMorphs.BHType <= 15
				WMorphs.BHType = "B"
			ElseIf WMorphs.BHType <= 17.5
				WMorphs.BHType = "C"
			ElseIf WMorphs.BHType <= 20
				WMorphs.BHType = "D"
			ElseIf WMorphs.BHType <= 22.5
				WMorphs.BHType = "DD"
			ElseIf WMorphs.BHType <= 25
				WMorphs.BHType = "E"
			ElseIf WMorphs.BHType <= 27.5
				WMorphs.BHType = "F"
			ElseIf WMorphs.BHType <= 30
				WMorphs.BHType = "FF"
			ElseIf WMorphs.BHType <= 32.5
				WMorphs.BHType = "G"
			ElseIf WMorphs.BHType <= 35
				WMorphs.BHType = "GG"
			ElseIf WMorphs.BHType <= 37.5
				WMorphs.BHType = "H"
			EndIf
		ElseIf WMorphs.UnitMeasurementSetting == 1
			If WMorphs.BHType <= 10
				WMorphs.BHType = "AA"
			ElseIf WMorphs.BHType <= 12.5
				WMorphs.BHType = "A"
			ElseIf WMorphs.BHType <= 15
				WMorphs.BHType = "B"
			ElseIf WMorphs.BHType <= 17.5
				WMorphs.BHType = "C"
			ElseIf WMorphs.BHType <= 20
				WMorphs.BHType = "D"
			ElseIf WMorphs.BHType <= 22.5
				WMorphs.BHType = "DD"
			ElseIf WMorphs.BHType <= 25
				WMorphs.BHType = "DD"
			ElseIf WMorphs.BHType <= 27.5
				WMorphs.BHType = "DDD"
			ElseIf WMorphs.BHType <= 30
				WMorphs.BHType = "DDD"
			ElseIf WMorphs.BHType <= 32.5
				WMorphs.BHType = "DDDD"
			ElseIf WMorphs.BHType <= 35
				WMorphs.BHType = "G"
			ElseIf WMorphs.BHType <= 37.5
				WMorphs.BHType = "H"
			EndIf
		EndIf
		;WMorphs.Round(WMorphs.BHSize, 0)
		;WMorphs.BHSizeType = WMorphs.BHSize as Int + WMorphs.BHType
		If WMorphs.UnitMeasurementSetting == 0
			_myWeight = AddTextOption("$LAIKASCALORIES_BRUSTUMFANG", WMorphs.Round(WMorphs.BrustumfangFormel, 2) + "cm" + " | " + (WMorphs.Round((WMorphs.BrustumfangFormel / 5), 0) as Int * 5) + WMorphs.BHType, OPTION_FLAG_DISABLED)
		ElseIf WMorphs.UnitMeasurementSetting == 1
			_myWeight = AddTextOption("$LAIKASCALORIES_BRUSTUMFANG", WMorphs.Round((WMorphs.BrustumfangFormel * 0.393701), 0) + "in" + " | " + WMorphs.BHSizeType, OPTION_FLAG_DISABLED)
		EndIf
		
		AddEmptyOption()
		SetWaistCircumference()
		If WMorphs.UnitMeasurementSetting == 0
			_myWeight = AddTextOption("$LAIKASCALORIES_BAUCHUMFANG", WMorphs.Round(WaistCircumference, 2) + "cm", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.UnitMeasurementSetting == 1
			_myWeight = AddTextOption("$LAIKASCALORIES_BAUCHUMFANG", WMorphs.Round(WaistCircumference * 0.393701, 0) + "in", OPTION_FLAG_DISABLED)
		EndIf
		AddEmptyOption()
		;WMorphs.HueftumfangFormel = (WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000)))
		SetHipCircumference()
		If WMorphs.UnitMeasurementSetting == 0
			_myWeight = AddTextOption("$LAIKASCALORIES_HUEFTUMFANG", WMorphs.Round(WMorphs.HueftumfangFormel, 2) + "cm", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.UnitMeasurementSetting == 1
			_myWeight = AddTextOption("$LAIKASCALORIES_HUEFTUMFANG", WMorphs.Round((WMorphs.HueftumfangFormel * 0.393701), 0) + "in", OPTION_FLAG_DISABLED)
		EndIf
		AddEmptyOption()
		WMorphs.Bodyfat = (WMorphs.Weight * (WMorphs.KoerperfettFormelValue + (WMorphs.FatStored / 10000)))
		_myWeight = AddTextOption("$LAIKASCALORIES_KOERPERFETT", WMorphs.Round(WMorphs.Bodyfat, 2) + "%", OPTION_FLAG_DISABLED)
	EndIf	
	If (a_page == Pages[1]) ;Nutrient Needs
		SetCursorFillMode(LEFT_TO_RIGHT)
		AddHeaderOption("$LAIKASCALORIES_PAGE_1_ENERGY")
		AddHeaderOption("$LAIKASCALORIES_PAGE_1_STORED_IN_BODY")
		WMorphs.BauchumfangFormel = (WMorphs.Weight * (WaistCircumference + ( WMorphs.MultBelly + WMorphs.FatStored / 1000)))
		WMorphs.HueftumfangFormel = (WMorphs.Weight * (HueftumfangFormelValueNeu + ( WMorphs.MultChubbyButt + WMorphs.FatStored / 1000)))
		WMorphs.Bodyfat = (WMorphs.Weight * (KoerperfettFormelValueNeu + (WMorphs.FatStored / 1000)))
		;WMorphs.ProteinBurnPassiveDisplay = ((WMorphs.Weight * 0.96) + (WMorphs.Muscles / 90)) ;48 Proteins
		WMorphs.ProteinBurnPassiveDisplay = WMorphs.ProteinBurnPassive * 240
		WMorphs.CarbohydratesBurnPassiveDisplay = (WMorphs.Weight * 5.5) ;275 Carbohydrates
		WMorphs.FatsBurnPassiveDisplay = ((WMorphs.Weight * 1.22) + (WMorphs.FatStored / 180)) ;61 Fats
		WMorphs.ProlactinBurnPassiveDisplay = ((WMorphs.BrustumfangFormel * 0.328) + (WMorphs.ProlactinBreast / 30))
		If	(((WMorphs.Calories) as Int) > (WMorphs.CaloriesBurnPassive)) ;Calories
			_myWeight = AddTextOption("$LAIKASCALORIES_CALORIES_INTUS", WMorphs.Round(WMorphs.CaloriesBurnPassive, 0) + "" + " " + "[+]", OPTION_FLAG_DISABLED)
		ElseIf	(((WMorphs.Calories) as Int) == (WMorphs.CaloriesBurnPassive))
			_myWeight = AddTextOption("$LAIKASCALORIES_CALORIES_INTUS", WMorphs.Round(WMorphs.CaloriesBurnPassive, 0) + "" + " " + "[ ]", OPTION_FLAG_DISABLED)
		ElseIf	(((WMorphs.Calories) as Int) < (WMorphs.CaloriesBurnPassive))
			_myWeight = AddTextOption("$LAIKASCALORIES_CALORIES_INTUS", WMorphs.Round(WMorphs.CaloriesBurnPassive, 0) + "" + " " + "[-]", OPTION_FLAG_DISABLED)
		EndIf
		AddTextOption("Stomach Capacity:", WMorphs.Round(WMorphs.StomachCapacity, 0) + "ml", OPTION_FLAG_DISABLED)
		;_myWeight = AddTextOption("$Muskelmasse", WMorphs.Round(WMorphs.Muscles / 1000, 3) + "kg", OPTION_FLAG_DISABLED) ;Protein Stored
		AddHeaderOption("$LAIKASCALORIES_PAGE_1_NUTRITIONS")
		_myWeight = AddTextOption("$ExtraBoobsWeight", WMorphs.Round(WMorphs.ProlactinBreast, 2) + "kg", OPTION_FLAG_DISABLED) ;Fats Stored
		If	((WMorphs.Protein) - (WMorphs.ProteinBurnPassive) > 0) ;Protein
			_myWeight = AddTextOption("$LAIKASCALORIES_PROTEINS_INTUS", WMorphs.Round(WMorphs.ProteinBurnPassive * 240, 2) + "g" + " " + "[+]", OPTION_FLAG_DISABLED)
		ElseIf	((WMorphs.Protein) - (WMorphs.ProteinBurnPassive) == 0)
			_myWeight = AddTextOption("$LAIKASCALORIES_PROTEINS_INTUS", WMorphs.Round(WMorphs.ProteinBurnPassive * 240, 2) + "g" + " " + "[ ]", OPTION_FLAG_DISABLED)
		ElseIf	((WMorphs.Protein) - (WMorphs.ProteinBurnPassive) < 0)
			_myWeight = AddTextOption("$LAIKASCALORIES_PROTEINS_INTUS", WMorphs.Round(WMorphs.ProteinBurnPassive * 240, 2) + "g" + " " + "[-]", OPTION_FLAG_DISABLED)
		EndIf
		AddEmptyOption()
		If	((WMorphs.Carbohydrates) - (WMorphs.CarbohydratesBurnPassive) > 0) ;Carbohydrates
			_myWeight = AddTextOption("$LAIKASCALORIES_CARBOHYDRATES_INTUS", WMorphs.Round(WMorphs.CarbohydratesBurnPassive * 240, 2) + "g" + " " + "[+]", OPTION_FLAG_DISABLED)
		ElseIf	((WMorphs.Carbohydrates) - (WMorphs.CarbohydratesBurnPassive) == 0)
			_myWeight = AddTextOption("$LAIKASCALORIES_CARBOHYDRATES_INTUS", WMorphs.Round(WMorphs.CarbohydratesBurnPassive * 240, 2) + "g" + " " + "[ ]", OPTION_FLAG_DISABLED)
		ElseIf	((WMorphs.Carbohydrates) - (WMorphs.CarbohydratesBurnPassive) < 0)
			_myWeight = AddTextOption("$LAIKASCALORIES_CARBOHYDRATES_INTUS", WMorphs.Round(WMorphs.CarbohydratesBurnPassive * 240, 2) + "g" + " " + "[-]", OPTION_FLAG_DISABLED)
		EndIf
		AddEmptyOption()
		If	((WMorphs.Fats) - (WMorphs.FatsBurnPassive) > 0) ;Fats
			_myWeight = AddTextOption("$LAIKASCALORIES_FATS_INTUS", WMorphs.Round(WMorphs.FatsBurnPassive * 240, 2) + "g" + " " + "[+]", OPTION_FLAG_DISABLED)
		ElseIf	((WMorphs.Fats) - (WMorphs.FatsBurnPassive) == 0)
			_myWeight = AddTextOption("$LAIKASCALORIES_FATS_INTUS", WMorphs.Round(WMorphs.FatsBurnPassive * 240, 2) + "g" + " " + "[ ]", OPTION_FLAG_DISABLED)
		ElseIf	((WMorphs.Fats) - (WMorphs.FatsBurnPassive) < 0)
			_myWeight = AddTextOption("$LAIKASCALORIES_FATS_INTUS", WMorphs.Round(WMorphs.FatsBurnPassive * 240, 2) + "g" + " " + "[-]", OPTION_FLAG_DISABLED)
		EndIf
		AddEmptyOption()
		AddHeaderOption("$Miscellaneous")
		AddEmptyOption()
		ProlactinBurnPassiveMCM = WMorphs.ProlactinBurnPassive * 240
		If	((WMorphs.Prolactin) - (WMorphs.ProlactinBurnPassive) > 0) ;Prolactin
			_myWeight = AddTextOption("$LAIKASCALORIES_PROLACTIN_INTUS", WMorphs.Round(ProlactinBurnPassiveMCM, 2) + "g" + " " + "[+]", OPTION_FLAG_DISABLED)
		ElseIf	((WMorphs.Prolactin) - (WMorphs.ProlactinBurnPassive) == 0)
			_myWeight = AddTextOption("$LAIKASCALORIES_PROLACTIN_INTUS", WMorphs.Round(ProlactinBurnPassiveMCM, 2) + "g" + " " + "[ ]", OPTION_FLAG_DISABLED)
		ElseIf	((WMorphs.Prolactin) - (WMorphs.ProlactinBurnPassive) < 0)
			_myWeight = AddTextOption("$LAIKASCALORIES_PROLACTIN_INTUS", WMorphs.Round(ProlactinBurnPassiveMCM, 2) + "g" + " " + "[-]", OPTION_FLAG_DISABLED)
		EndIf
	EndIf
	If (a_page == Pages[3]) ;Settings
		SetCursorFillMode(LEFT_TO_RIGHT)
		AddHeaderOption("$LAIKASCALORIES_SETTINGS_HEADER_MEASUREMENT_SYSTEM")
		AddHeaderOption("$LAIKASCALORIES_SETTINGS_HEADER_BODY")
		If WMorphs.UnitMeasurementSetting == 0 ;Set Unit Measurement to Metric
			_myCustomFood = AddMenuOption("$LAIKA_SETTING_CONVERSION", "$LAIKA_SETTING_CONVERSION_METRIC")
		ElseIf WMorphs.UnitMeasurementSetting == 1 ;Set Unit Measurement to Imperial
			_myCustomFood = AddMenuOption("$LAIKA_SETTING_CONVERSION", "$LAIKA_SETTING_CONVERSION_IMPERIAL")
		EndIf
		WMorphs.BauchumfangFormel = (WMorphs.Weight * (WaistCircumference + (WMorphs.FatStored / 1000)))
		WMorphs.HueftumfangFormel = (WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 1000)))
		WMorphs.Bodyfat = (WMorphs.Weight * (WMorphs.KoerperfettFormelValue + (WMorphs.FatStored / 1000)))
		_myMultBreasts = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_BREASTS", WMorphs.MultBreasts, "{2}")
		AddHeaderOption("$LAIKASCALORIES_SETTINGS_HEADER_VALUES")
		_myMultBreastGravity2 = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_GRAVITY", WMorphs.MultBreastGravity2, "{2}")
		_myWeight = AddSliderOption("$LAIKASCALORIES_SETTINGS_OPTIONS_CHANGE_WEIGHT", WMorphs.Weight, "{2}")
		_myMultChubbyArms = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_ARME", WMorphs.MultChubbyArms, "{2}")
		_myFatStored = AddSliderOption("$SettingsSetFats", WMorphs.FatStored, "{2}")
		_myMultChubbyButt = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_BUTT", WMorphs.MultChubbyButt, "{2}")
		_myMuscles = AddSliderOption("$SettingsSetMuscleMass", WMorphs.Muscles, "{2}")
		_myMultBigTorso = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_OBERKOERPER", WMorphs.MultBigTorso, "{2}")
		_myProlactinBreast = AddSliderOption("$SettingsSetBoobsFat", WMorphs.ProlactinBreast, "{2}")
		_myMultBelly = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_BAUCH", WMorphs.MultBelly, "{2}")
		AddHeaderOption("$LAIKASCALORIES_SETTINGS_HEADER_GAMEPLAY")
		_myMultChubbyLegs = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_THIGHS", WMorphs.MultChubbyLegs, "{2}")
		_myEnabled = AddToggleOption("$LAIKASCALORIES_SETTINGS_HEADER_NO_EATING_LIMIT", WMorphs.EatingLimit)
		_myMultWaist = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_WAIST", WMorphs.MultWaist, "{2}")
		RealisticWeightSetting = AddToggleOption("$LAIKASCALORIES_SETTINGS_HEADER_REALISTIC_ITEM_WEIGHT", WMorphs.RealisticWeight)
		AddHeaderOption("$LAIKASCALORIES_SETTINGS_HEADER_MUSCLES")
		AddEmptyOption()
		_myMultLowMuscleAbs = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_BELLYMUSCLE", WMorphs.MultLowMuscleAbs, "{2}")
		AddEmptyOption()
		_myMultLowMuscleArms = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_ARMSMUSCLE", WMorphs.MultLowMuscleArms, "{2}")
		AddEmptyOption()
		_myMultLowMuscleButt = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_BUTTMUSCLE", WMorphs.MultLowMuscleButt, "{2}")
		AddEmptyOption()
		_myMultLowMuscleLegs = AddSliderOption("$LAIKASCALORIES_MORPH_FEMALE_LEGSMUSCLE", WMorphs.MultLowMuscleLegs, "{2}")
		AddEmptyOption()
	EndIf
	If (a_page == Pages[2]) ;Statistics
		SetCursorFillMode(LEFT_TO_RIGHT)
		AddHeaderOption("$LAIKASCALORIES_STATISTIKEN")
		AddEmptyOption()
		If WMorphs.UnitMeasurementSetting == 0
			_myWeight = AddTextOption("$LAIKASCALORIES_TOTAL_WEIGHT_GAINED", WMorphs.Round(WMorphs.TotalGain, 2) + "kg", OPTION_FLAG_DISABLED)
		ElseIf WMorphs.UnitMeasurementSetting == 1
			_myWeight = AddTextOption("$LAIKASCALORIES_TOTAL_WEIGHT_GAINED", WMorphs.Round(WMorphs.TotalGain * 2.20462, 0) + "lbs", OPTION_FLAG_DISABLED)
		EndIf
		AddEmptyOption()
		;Stat for Highest Weight
		If WMorphs.UnitMeasurementSetting == 0
			If (StatWeightHighest < WMorphs.Weight)
				StatWeightHighest = WMorphs.Weight
				_myWeight = AddTextOption("$LAIKASCALORIES_HIGHEST_WEIGHT", WMorphs.Round(StatWeightHighest, 2) + "cm", OPTION_FLAG_DISABLED)
			Else
				_myWeight = AddTextOption("$LAIKASCALORIES_HIGHEST_WEIGHT", WMorphs.Round(StatWeightHighest, 2) + "cm", OPTION_FLAG_DISABLED)
			EndIf
		ElseIf WMorphs.UnitMeasurementSetting == 1
			If (StatWeightHighest < WMorphs.Weight)
				StatWeightHighest = WMorphs.Weight
				_myWeight = AddTextOption("$LAIKASCALORIES_HIGHEST_WEIGHT", WMorphs.Round(StatWeightHighest * 2.20462, 0) + "lbs", OPTION_FLAG_DISABLED)
			Else
				_myWeight = AddTextOption("$LAIKASCALORIES_HIGHEST_WEIGHT", WMorphs.Round(StatWeightHighest * 2.20462, 0) + "lbs", OPTION_FLAG_DISABLED)
			EndIf
		EndIf
		;Stat for Lowest Weight
		If (StatWeightLowest < 5.0)
			StatWeightLowest = WMorphs.Weight
		EndIf
		If WMorphs.UnitMeasurementSetting == 0
			If (StatWeightLowest > WMorphs.Weight)
				StatWeightLowest = WMorphs.Weight
				_myWeight = AddTextOption("$LAIKASCALORIES_LOWEST_WEIGHT", WMorphs.Round(StatWeightLowest, 2) + "cm", OPTION_FLAG_DISABLED)
			Else
				_myWeight = AddTextOption("$LAIKASCALORIES_LOWEST_WEIGHT", WMorphs.Round(StatWeightLowest, 2) + "cm", OPTION_FLAG_DISABLED)
			EndIf
		ElseIf WMorphs.UnitMeasurementSetting == 1
			If (StatWeightLowest > WMorphs.Weight)
				StatWeightLowest = WMorphs.Weight
				_myWeight = AddTextOption("$LAIKASCALORIES_LOWEST_WEIGHT", WMorphs.Round(StatWeightLowest * 2.20462, 0) + "lbs", OPTION_FLAG_DISABLED)
			Else
				_myWeight = AddTextOption("$LAIKASCALORIES_LOWEST_WEIGHT", WMorphs.Round(StatWeightLowest * 2.20462, 0) + "lbs", OPTION_FLAG_DISABLED)
			EndIf
		EndIf
		;Calculate Highest Belly
		If WMorphs.UnitMeasurementSetting == 0
			If (StatBellyHighest < (WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000))))
				StatBellyHighest = WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000))
				_myWeight = AddTextOption("$LAIKASCALORIES_HIGHEST_BELLY_SIZE", WMorphs.Round(StatBellyHighest, 2) + "cm", OPTION_FLAG_DISABLED)
			Else
				_myWeight = AddTextOption("$LAIKASCALORIES_HIGHEST_BELLY_SIZE", WMorphs.Round(StatBellyHighest, 2) + "cm", OPTION_FLAG_DISABLED)
			EndIf
		ElseIf WMorphs.UnitMeasurementSetting == 1
			If (StatBellyHighest < (WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000))))
				StatBellyHighest = WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000))
				_myWeight = AddTextOption("$LAIKASCALORIES_HIGHEST_BELLY_SIZE", WMorphs.Round(StatBellyHighest * 0.393701, 0) + "IN", OPTION_FLAG_DISABLED)
			Else
				_myWeight = AddTextOption("$LAIKASCALORIES_HIGHEST_BELLY_SIZE", WMorphs.Round(StatBellyHighest * 0.393701, 0) + "IN", OPTION_FLAG_DISABLED)
			EndIf
		EndIf
		;Calculate Lowest Belly
		If (StatBellyLowest < 5.0)
			StatBellyLowest = (WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000)))
		EndIf
		If WMorphs.UnitMeasurementSetting == 0
			If (StatBellyLowest > (WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000))))
				StatBellyLowest = WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000))
				_myWeight = AddTextOption("$LAIKASCALORIES_LOWEST_BELLY_SIZE", WMorphs.Round(StatBellyLowest, 2) + "cm", OPTION_FLAG_DISABLED)
			Else
				_myWeight = AddTextOption("$LAIKASCALORIES_LOWEST_BELLY_SIZE", WMorphs.Round(StatBellyLowest, 2) + "cm", OPTION_FLAG_DISABLED)
			EndIf
		ElseIf WMorphs.UnitMeasurementSetting == 1
			If (StatBellyLowest > (WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000))))
				StatBellyLowest = WMorphs.Weight * (HueftumfangFormelValueNeu + (WMorphs.FatStored / 10000))
				_myWeight = AddTextOption("$LAIKASCALORIES_LOWEST_BELLY_SIZE", WMorphs.Round(StatBellyLowest * 0.393701, 0) + "IN", OPTION_FLAG_DISABLED)
			Else
				_myWeight = AddTextOption("$LAIKASCALORIES_LOWEST_BELLY_SIZE", WMorphs.Round(StatBellyLowest * 0.393701, 0) + "IN", OPTION_FLAG_DISABLED)
			EndIf
		EndIf
	EndIf
EndEvent

Event OnOptionHighlight(Int a_option)
	If a_option == _myEnabled
		SetInfoText("$LAIKASCALORIES_SETTINGS_HEADER_NO_EATING_LIMIT_DESCRIPTION")
	ElseIf a_option == RealisticWeightSetting
		SetInfoText("$LAIKASCALORIES_SETTINGS_HEADER_REALISTIC_ITEM_WEIGHT_DESCRIPTION")
	ElseIf a_option == _myScanFood
		SetInfoText("Scans all mods for food, potions and ingredients. Might take a few seconds.")
	ElseIf a_option == _myCustomFood
		SetInfoText("What kind of measurement units you want to display.")
	ElseIf a_option == _myPotions
		SetInfoText("How much potions affect the weight.")
	ElseIf a_option == _myIngredients
		SetInfoText("How much ingredients affect the weight.")
	ElseIf a_option == _myStamina
		SetInfoText("The effect of weight on stamina.\nStamina = Stamina + Weight * Stamina Modifier")
	ElseIf a_option == _mySpeed
		SetInfoText("The effect of weight on movement speed.\nSpeed = Speed + Weight * Speed Modifier")
	ElseIf a_option == _myMinWeight
		SetInfoText("The minimum weight that can be reached when not gaining any.")
	ElseIf a_option == _myMaxWeight
		SetInfoText("The maximum weight that can be reached.")
	ElseIf a_option == _myMultLoss
		SetInfoText("Multiplier for how fast weight is lost by doing certain actions.")
	ElseIf a_option == _myMultGainLight
		SetInfoText("Multiplier for how much weight is gained by light food/actions.")
	ElseIf a_option == _myMultGainMedium
		SetInfoText("Multiplier for how much weight is gained by medium food/actions.")
	ElseIf a_option == _myMultGainHeavy
		SetInfoText("Multiplier for how much weight is gained by heavy food/actions.")
	EndIf
EndEvent

Event OnOptionSelect(Int a_option)
	If a_option == _myEnabled
		WMorphs.EatingLimit = !WMorphs.EatingLimit
		SetToggleOptionValue(a_option, WMorphs.EatingLimit)
		;WMorphs.RegisterEvents(WMorphs.Enabled)
		;SetTextOptionValue(_myWeight, WMorphs.Weight)
	;ElseIf a_option == _myScanFood
		;EnableScan(False)
		;WMorphs.ScanFood()
		;EnableScan()
	EndIf
	If a_option == RealisticWeightSetting
		WMorphs.RealisticWeight = !WMorphs.RealisticWeight
		SetToggleOptionValue(a_option, WMorphs.RealisticWeight)
		LCW.SetRealisticWeight()
	EndIf
EndEvent

Event OnOptionMenuOpen(Int a_option)
	String[] menuWeight = new String[2]
	menuWeight[0] = "$LAIKA_SETTING_CONVERSION_METRIC"
	menuWeight[1] = "$LAIKA_SETTING_CONVERSION_IMPERIAL"

	If a_option == _myCustomFood
		SetMenuDialogOptions(menuWeight)
		SetMenuDialogStartIndex(WMorphs.UnitMeasurementSetting)
		SetMenuDialogDefaultIndex(0)
	ElseIf a_option == _myPotions
		SetMenuDialogOptions(menuWeight)
		SetMenuDialogStartIndex(WMorphs.Potions)
		SetMenuDialogDefaultIndex(1)
	ElseIf a_option == _myIngredients
		SetMenuDialogOptions(menuWeight)
		SetMenuDialogStartIndex(WMorphs.Ingredients)
		SetMenuDialogDefaultIndex(1)
	EndIf
EndEvent

Event OnOptionMenuAccept(Int a_option, Int index)
	Bool menuWeight = a_option == _myCustomFood || a_option == _myPotions || a_option == _myIngredients
	If menuWeight
		EnableScan(False)
	EndIf

	If a_option == _myCustomFood
		WMorphs.UnitMeasurementSetting = index;
	ElseIf a_option == _myPotions
		WMorphs.Potions = index;
	ElseIf a_option == _myIngredients
		WMorphs.Ingredients = index;
	EndIf

	If menuWeight
		If index == 0
			SetMenuOptionValue(a_option, "$LAIKA_SETTING_CONVERSION_METRIC")
		ElseIf index == 1
			SetMenuOptionValue(a_option, "$LAIKA_SETTING_CONVERSION_IMPERIAL")
		EndIf
		;WMorphs.ScanFood()
		EnableScan()
	EndIf
EndEvent

Event OnOptionSliderOpen(Int a_option)
	If a_option == _myMultLoss
		SetSliderDialogStartValue(WMorphs.MultLoss)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
		;Change Weight
	ElseIf a_option == _myWeight
		SetSliderDialogStartValue(WMorphs.Weight)
		SetSliderDialogDefaultValue(70.0)
		SetSliderDialogRange(50.0, 120.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultGainLight
		SetSliderDialogStartValue(WMorphs.MultGainLight)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myFatStored
		SetSliderDialogStartValue(WMorphs.FatStored)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 10000.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myProlactinBreast
		SetSliderDialogStartValue(WMorphs.ProlactinBreast)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 5000.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMuscles
		SetSliderDialogStartValue(WMorphs.Muscles)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 5000.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultGainMedium
		SetSliderDialogStartValue(WMorphs.MultGainMedium)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultGainHeavy
		SetSliderDialogStartValue(WMorphs.MultGainHeavy)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myStamina
		SetSliderDialogStartValue(WMorphs.Stamina)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-500.0, 500.0)
		SetSliderDialogInterval(1.0)
	ElseIf a_option == _mySpeed
		SetSliderDialogStartValue(WMorphs.Speed)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-80.0, 80.0)
		SetSliderDialogInterval(1.0)
	ElseIf a_option == _myMinWeight
		SetSliderDialogStartValue(WMorphs.MinWeight)
		SetSliderDialogDefaultValue(-1.0)
		SetSliderDialogRange(-1.0, 0.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMaxWeight
		SetSliderDialogStartValue(WMorphs.MaxWeight)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 2.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastsNewSH
		SetSliderDialogStartValue(WMorphs.MultBreastsNewSH)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBigBelly
		SetSliderDialogStartValue(WMorphs.MultBigBelly)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _mySetWeight
		SetSliderDialogStartValue(WMorphs.Weight)
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(40.0, 150.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myCamillaSetWeight
		SetSliderDialogStartValue(WMorphs.CamillaWeight)
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(40.0, 150.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _mySetCalories
		SetSliderDialogStartValue(WMorphs.Calories)
		SetSliderDialogDefaultValue(0.1)
		SetSliderDialogRange(0.0, 0.5)
		SetSliderDialogInterval(0.0001)
	ElseIf a_option == _myMultBigTorso
		SetSliderDialogStartValue(WMorphs.MultBigTorso)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultButtShape2
		SetSliderDialogStartValue(WMorphs.MultButtShape2)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultChubbyArms
		SetSliderDialogStartValue(WMorphs.MultChubbyArms)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultChubbyButt
		SetSliderDialogStartValue(WMorphs.MultChubbyButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultChubbyLegs
		SetSliderDialogStartValue(WMorphs.MultChubbyLegs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultWaist
		SetSliderDialogStartValue(WMorphs.MultWaist)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultWideWaistLine
		SetSliderDialogStartValue(WMorphs.MultWideWaistLine)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultCalfSize
		SetSliderDialogStartValue(WMorphs.MultCalfSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultSamuel
		SetSliderDialogStartValue(WMorphs.MultSamuel)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultSamson
		SetSliderDialogStartValue(WMorphs.MultSamson)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)

	ElseIf a_option == _myMultAnkleSize
		SetSliderDialogStartValue(WMorphs.MultAnkleSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultAppleCheeks
		SetSliderDialogStartValue(WMorphs.MultAppleCheeks)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultAreolaSize
		SetSliderDialogStartValue(WMorphs.MultAreolaSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultArms
		SetSliderDialogStartValue(WMorphs.MultArms)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBack
		SetSliderDialogStartValue(WMorphs.MultBack)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBackArch
		SetSliderDialogStartValue(WMorphs.MultBackArch)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBelly
		SetSliderDialogStartValue(WMorphs.MultBelly)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(-1.0, 1.5)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBigButt
		SetSliderDialogStartValue(WMorphs.MultBigButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastCenter
		SetSliderDialogStartValue(WMorphs.MultBreastCenter)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastCenterBig
		SetSliderDialogStartValue(WMorphs.MultBreastCenterBig)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastCleavage
		SetSliderDialogStartValue(WMorphs.MultBreastCleavage)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastFlatness
		SetSliderDialogStartValue(WMorphs.MultBreastFlatness)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastFlatness2
		SetSliderDialogStartValue(WMorphs.MultBreastFlatness2)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastGravity2
		SetSliderDialogStartValue(WMorphs.MultBreastGravity2)
		SetSliderDialogDefaultValue(0.5)
		SetSliderDialogRange(0.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastHeight
		SetSliderDialogStartValue(WMorphs.MultBreastHeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastPerkiness
		SetSliderDialogStartValue(WMorphs.MultBreastPerkiness)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreasts
		SetSliderDialogStartValue(WMorphs.MultBreasts)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(-1.0, 2.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastsFantasy
		SetSliderDialogStartValue(WMorphs.MultBreastsFantasy)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastsGone
		SetSliderDialogStartValue(WMorphs.MultBreastsGone)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastsSmall
		SetSliderDialogStartValue(WMorphs.MultBreastsSmall)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastsSmall2
		SetSliderDialogStartValue(WMorphs.MultBreastsSmall2)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastsTogether
		SetSliderDialogStartValue(WMorphs.MultBreastsTogether)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastTopSlope
		SetSliderDialogStartValue(WMorphs.MultBreastTopSlope)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastWidth
		SetSliderDialogStartValue(WMorphs.MultBreastWidth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultButt
		SetSliderDialogStartValue(WMorphs.MultButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultButtClassic
		SetSliderDialogStartValue(WMorphs.MultButtClassic)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultButtCrack
		SetSliderDialogStartValue(WMorphs.MultButtCrack)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultButtSmall
		SetSliderDialogStartValue(WMorphs.MultButtSmall)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultCalfSmooth
		SetSliderDialogStartValue(WMorphs.MultCalfSmooth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultChestDepth
		SetSliderDialogStartValue(WMorphs.MultChestDepth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultChestWidth
		SetSliderDialogStartValue(WMorphs.MultChestWidth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultChubbyWaist
		SetSliderDialogStartValue(WMorphs.MultChubbyWaist)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultCrotchBack
		SetSliderDialogStartValue(WMorphs.MultCrotchBack)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultDoubleMelon
		SetSliderDialogStartValue(WMorphs.MultDoubleMelon)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultForearmSize
		SetSliderDialogStartValue(WMorphs.MultForearmSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultGroin
		SetSliderDialogStartValue(WMorphs.MultGroin)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultHipBone
		SetSliderDialogStartValue(WMorphs.MultHipBone)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultHipForward
		SetSliderDialogStartValue(WMorphs.MultHipForward)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultHips
		SetSliderDialogStartValue(WMorphs.MultHips)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultHipUpperWidth
		SetSliderDialogStartValue(WMorphs.MultHipUpperWidth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultKneeHeight
		SetSliderDialogStartValue(WMorphs.MultKneeHeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultKneeShape
		SetSliderDialogStartValue(WMorphs.MultKneeShape)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLegShapeClassic
		SetSliderDialogStartValue(WMorphs.MultLegShapeClassic)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLegsThin
		SetSliderDialogStartValue(WMorphs.MultLegsThin)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultMuscleAbs
		SetSliderDialogStartValue(WMorphs.MultMuscleAbs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultMuscleArms
		SetSliderDialogStartValue(WMorphs.MultMuscleArms)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultMuscleButt
		SetSliderDialogStartValue(WMorphs.MultMuscleButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultMuscleLegs
		SetSliderDialogStartValue(WMorphs.MultMuscleLegs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultMusclePecs
		SetSliderDialogStartValue(WMorphs.MultMusclePecs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNipBGone
		SetSliderDialogStartValue(WMorphs.MultNipBGone)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNippleDistance
		SetSliderDialogStartValue(WMorphs.MultNippleDistance)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNippleDown
		SetSliderDialogStartValue(WMorphs.MultNippleDown)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNippleLength
		SetSliderDialogStartValue(WMorphs.MultNippleLength)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNippleManga
		SetSliderDialogStartValue(WMorphs.MultNippleManga)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNipplePerkiness
		SetSliderDialogStartValue(WMorphs.MultNipplePerkiness)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNipplePerkManga
		SetSliderDialogStartValue(WMorphs.MultNipplePerkManga)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNippleSize
		SetSliderDialogStartValue(WMorphs.MultNippleSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNippleTip
		SetSliderDialogStartValue(WMorphs.MultNippleTip)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNippleTipManga
		SetSliderDialogStartValue(WMorphs.MultNippleTipManga)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultNippleUp
		SetSliderDialogStartValue(WMorphs.MultNippleUp)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultPregnancyBelly
		SetSliderDialogStartValue(WMorphs.MultPregnancyBelly)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultPushUp
		SetSliderDialogStartValue(WMorphs.MultPushUp)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultRibsProminance
		SetSliderDialogStartValue(WMorphs.MultRibsProminance)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultRoundAss
		SetSliderDialogStartValue(WMorphs.MultRoundAss)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultShoulderSmooth
		SetSliderDialogStartValue(WMorphs.MultShoulderSmooth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultShoulderTweak
		SetSliderDialogStartValue(WMorphs.MultShoulderTweak)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultShoulderWidth
		SetSliderDialogStartValue(WMorphs.MultShoulderWidth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultSlimThighs
		SetSliderDialogStartValue(WMorphs.MultSlimThighs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultSternumDepth
		SetSliderDialogStartValue(WMorphs.MultSternumDepth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultSternumHeight
		SetSliderDialogStartValue(WMorphs.MultSternumHeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultThighs
		SetSliderDialogStartValue(WMorphs.MultThighs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultTummyTuck
		SetSliderDialogStartValue(WMorphs.MultTummyTuck)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultWaistHeight
		SetSliderDialogStartValue(WMorphs.MultWaistHeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultWristSize
		SetSliderDialogStartValue(WMorphs.MultWristSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultFeetFeminine
		SetSliderDialogStartValue(WMorphs.MultFeetFeminine)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)

	ElseIf a_option == _myMultLowBreastsNewSH
		SetSliderDialogStartValue(WMorphs.MultLowBreastsNewSH)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBigBelly
		SetSliderDialogStartValue(WMorphs.MultLowBigBelly)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBigTorso
		SetSliderDialogStartValue(WMorphs.MultLowBigTorso)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowButtShape2
		SetSliderDialogStartValue(WMorphs.MultLowButtShape2)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowChubbyArms
		SetSliderDialogStartValue(WMorphs.MultLowChubbyArms)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowChubbyButt
		SetSliderDialogStartValue(WMorphs.MultLowChubbyButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowChubbyLegs
		SetSliderDialogStartValue(WMorphs.MultLowChubbyLegs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowWaist
		SetSliderDialogStartValue(WMorphs.MultLowWaist)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowWideWaistLine
		SetSliderDialogStartValue(WMorphs.MultLowWideWaistLine)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowCalfSize
		SetSliderDialogStartValue(WMorphs.MultLowCalfSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowSamuel
		SetSliderDialogStartValue(WMorphs.MultLowSamuel)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowSamson
		SetSliderDialogStartValue(WMorphs.MultLowSamson)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)

	ElseIf a_option == _myMultLowAnkleSize
		SetSliderDialogStartValue(WMorphs.MultLowAnkleSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowAppleCheeks
		SetSliderDialogStartValue(WMorphs.MultLowAppleCheeks)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowAreolaSize
		SetSliderDialogStartValue(WMorphs.MultLowAreolaSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowArms
		SetSliderDialogStartValue(WMorphs.MultLowArms)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBack
		SetSliderDialogStartValue(WMorphs.MultLowBack)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBackArch
		SetSliderDialogStartValue(WMorphs.MultLowBackArch)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBelly
		SetSliderDialogStartValue(WMorphs.MultLowBelly)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBigButt
		SetSliderDialogStartValue(WMorphs.MultLowBigButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastCenter
		SetSliderDialogStartValue(WMorphs.MultLowBreastCenter)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastCenterBig
		SetSliderDialogStartValue(WMorphs.MultLowBreastCenterBig)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastCleavage
		SetSliderDialogStartValue(WMorphs.MultLowBreastCleavage)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastFlatness
		SetSliderDialogStartValue(WMorphs.MultLowBreastFlatness)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastFlatness2
		SetSliderDialogStartValue(WMorphs.MultLowBreastFlatness2)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastGravity2
		SetSliderDialogStartValue(WMorphs.MultLowBreastGravity2)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastHeight
		SetSliderDialogStartValue(WMorphs.MultLowBreastHeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastPerkiness
		SetSliderDialogStartValue(WMorphs.MultLowBreastPerkiness)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreasts
		SetSliderDialogStartValue(WMorphs.MultLowBreasts)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(-1.0, 5.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastsFantasy
		SetSliderDialogStartValue(WMorphs.MultLowBreastsFantasy)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastsGone
		SetSliderDialogStartValue(WMorphs.MultLowBreastsGone)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastsSmall
		SetSliderDialogStartValue(WMorphs.MultLowBreastsSmall)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastsSmall2
		SetSliderDialogStartValue(WMorphs.MultLowBreastsSmall2)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastsTogether
		SetSliderDialogStartValue(WMorphs.MultLowBreastsTogether)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastTopSlope
		SetSliderDialogStartValue(WMorphs.MultLowBreastTopSlope)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowBreastWidth
		SetSliderDialogStartValue(WMorphs.MultLowBreastWidth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowButt
		SetSliderDialogStartValue(WMorphs.MultLowButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowButtClassic
		SetSliderDialogStartValue(WMorphs.MultLowButtClassic)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowButtCrack
		SetSliderDialogStartValue(WMorphs.MultLowButtCrack)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowButtSmall
		SetSliderDialogStartValue(WMorphs.MultLowButtSmall)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowCalfSmooth
		SetSliderDialogStartValue(WMorphs.MultLowCalfSmooth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowChestDepth
		SetSliderDialogStartValue(WMorphs.MultLowChestDepth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowChestWidth
		SetSliderDialogStartValue(WMorphs.MultLowChestWidth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowChubbyWaist
		SetSliderDialogStartValue(WMorphs.MultLowChubbyWaist)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowCrotchBack
		SetSliderDialogStartValue(WMorphs.MultLowCrotchBack)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowDoubleMelon
		SetSliderDialogStartValue(WMorphs.MultLowDoubleMelon)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowForearmSize
		SetSliderDialogStartValue(WMorphs.MultLowForearmSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowGroin
		SetSliderDialogStartValue(WMorphs.MultLowGroin)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowHipBone
		SetSliderDialogStartValue(WMorphs.MultLowHipBone)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowHipForward
		SetSliderDialogStartValue(WMorphs.MultLowHipForward)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowHips
		SetSliderDialogStartValue(WMorphs.MultLowHips)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowHipUpperWidth
		SetSliderDialogStartValue(WMorphs.MultLowHipUpperWidth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowKneeHeight
		SetSliderDialogStartValue(WMorphs.MultLowKneeHeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowKneeShape
		SetSliderDialogStartValue(WMorphs.MultLowKneeShape)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowLegShapeClassic
		SetSliderDialogStartValue(WMorphs.MultLowLegShapeClassic)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowLegsThin
		SetSliderDialogStartValue(WMorphs.MultLowLegsThin)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowMuscleAbs
		SetSliderDialogStartValue(WMorphs.MultLowMuscleAbs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowMuscleArms
		SetSliderDialogStartValue(WMorphs.MultLowMuscleArms)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowMuscleButt
		SetSliderDialogStartValue(WMorphs.MultLowMuscleButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowMuscleLegs
		SetSliderDialogStartValue(WMorphs.MultLowMuscleLegs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowMusclePecs
		SetSliderDialogStartValue(WMorphs.MultLowMusclePecs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNipBGone
		SetSliderDialogStartValue(WMorphs.MultLowNipBGone)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNippleDistance
		SetSliderDialogStartValue(WMorphs.MultLowNippleDistance)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNippleDown
		SetSliderDialogStartValue(WMorphs.MultLowNippleDown)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNippleLength
		SetSliderDialogStartValue(WMorphs.MultLowNippleLength)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNippleManga
		SetSliderDialogStartValue(WMorphs.MultLowNippleManga)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNipplePerkiness
		SetSliderDialogStartValue(WMorphs.MultLowNipplePerkiness)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNipplePerkManga
		SetSliderDialogStartValue(WMorphs.MultLowNipplePerkManga)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNippleSize
		SetSliderDialogStartValue(WMorphs.MultLowNippleSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNippleTip
		SetSliderDialogStartValue(WMorphs.MultLowNippleTip)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNippleTipManga
		SetSliderDialogStartValue(WMorphs.MultLowNippleTipManga)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowNippleUp
		SetSliderDialogStartValue(WMorphs.MultLowNippleUp)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowPregnancyBelly
		SetSliderDialogStartValue(WMorphs.MultLowPregnancyBelly)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowPushUp
		SetSliderDialogStartValue(WMorphs.MultLowPushUp)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowRibsProminance
		SetSliderDialogStartValue(WMorphs.MultLowRibsProminance)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowRoundAss
		SetSliderDialogStartValue(WMorphs.MultLowRoundAss)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowShoulderSmooth
		SetSliderDialogStartValue(WMorphs.MultLowShoulderSmooth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowShoulderTweak
		SetSliderDialogStartValue(WMorphs.MultLowShoulderTweak)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowShoulderWidth
		SetSliderDialogStartValue(WMorphs.MultLowShoulderWidth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowSlimThighs
		SetSliderDialogStartValue(WMorphs.MultLowSlimThighs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowSternumDepth
		SetSliderDialogStartValue(WMorphs.MultLowSternumDepth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowSternumHeight
		SetSliderDialogStartValue(WMorphs.MultLowSternumHeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowThighs
		SetSliderDialogStartValue(WMorphs.MultLowThighs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowTummyTuck
		SetSliderDialogStartValue(WMorphs.MultLowTummyTuck)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowWaistHeight
		SetSliderDialogStartValue(WMorphs.MultLowWaistHeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowWristSize
		SetSliderDialogStartValue(WMorphs.MultLowWristSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultLowFeetFeminine
		SetSliderDialogStartValue(WMorphs.MultLowFeetFeminine)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.01)
	EndIf
EndEvent

Event OnOptionSliderAccept(Int a_option, Float a_value)
	If a_option == _myMultLoss
		WMorphs.MultLoss = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLoss, "{2}")
	ElseIf a_option == _myMultGainLight
		WMorphs.MultGainLight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultGainLight, "{2}")
	ElseIf a_option == _myMultGainMedium
		WMorphs.MultGainMedium = a_value
		SetSliderOptionValue(a_option, WMorphs.MultGainMedium, "{2}")
	ElseIf a_option == _myMultGainHeavy
		WMorphs.MultGainHeavy = a_value
		SetSliderOptionValue(a_option, WMorphs.MultGainHeavy, "{2}")
	ElseIf a_option == _myStamina
		WMorphs.Stamina = a_value
		SetSliderOptionValue(a_option, WMorphs.Stamina, "{0}")
	ElseIf a_option == _mySpeed
		WMorphs.Speed = a_value
		SetSliderOptionValue(a_option, WMorphs.Speed, "{0}")
	ElseIf a_option == _myWeight
		WMorphs.Weight = a_value
		SetSliderOptionValue(a_option, WMorphs.Weight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastsNewSH
		WMorphs.MultBreastsNewSH = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastsNewSH, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myFatStored
		WMorphs.FatStored = a_value
		SetSliderOptionValue(a_option, WMorphs.FatStored, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myProlactinBreast
		WMorphs.ProlactinBreast = a_value
		SetSliderOptionValue(a_option, WMorphs.ProlactinBreast, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMuscles
		WMorphs.Muscles = a_value
		SetSliderOptionValue(a_option, WMorphs.Muscles, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBigBelly
		WMorphs.MultBigBelly = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBigBelly, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _mySetWeight
		WMorphs.Weight = a_value
		SetSliderOptionValue(a_option, WMorphs.Weight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myCamillaSetWeight
		WMorphs.CamillaWeight = a_value
		SetSliderOptionValue(a_option, WMorphs.CamillaWeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _mySetCalories
		WMorphs.Calories = a_value
		SetSliderOptionValue(a_option, WMorphs.Calories, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBigTorso
		WMorphs.MultBigTorso = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBigTorso, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultButtShape2
		WMorphs.MultButtShape2 = a_value
		SetSliderOptionValue(a_option, WMorphs.MultButtShape2, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultChubbyArms
		WMorphs.MultChubbyArms = a_value
		SetSliderOptionValue(a_option, WMorphs.MultChubbyArms, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultChubbyButt
		WMorphs.MultChubbyButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultChubbyButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultChubbyLegs
		WMorphs.MultChubbyLegs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultChubbyLegs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultWaist
		WMorphs.MultWaist = a_value
		SetSliderOptionValue(a_option, WMorphs.MultWaist, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultWideWaistLine
		WMorphs.MultWideWaistLine = a_value
		SetSliderOptionValue(a_option, WMorphs.MultWideWaistLine, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultCalfSize
		WMorphs.MultCalfSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultCalfSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultSamuel
		WMorphs.MultSamuel = a_value
		SetSliderOptionValue(a_option, WMorphs.MultSamuel, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultSamson
		WMorphs.MultSamson = a_value
		SetSliderOptionValue(a_option, WMorphs.MultSamson, "{2}")
		WMorphs.UpdateWeight()

	ElseIf a_option == _myMultAnkleSize
		WMorphs.MultAnkleSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultAnkleSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultAppleCheeks
		WMorphs.MultAppleCheeks = a_value
		SetSliderOptionValue(a_option, WMorphs.MultAppleCheeks, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultAreolaSize
		WMorphs.MultAreolaSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultAreolaSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultArms
		WMorphs.MultArms = a_value
		SetSliderOptionValue(a_option, WMorphs.MultArms, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBack
		WMorphs.MultBack = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBack, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBackArch
		WMorphs.MultBackArch = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBackArch, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBelly
		WMorphs.MultBelly = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBelly, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBigButt
		WMorphs.MultBigButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBigButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastCenter
		WMorphs.MultBreastCenter = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastCenter, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastCenterBig
		WMorphs.MultBreastCenterBig = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastCenterBig, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastCleavage
		WMorphs.MultBreastCleavage = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastCleavage, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastFlatness
		WMorphs.MultBreastFlatness = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastFlatness, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastFlatness2
		WMorphs.MultBreastFlatness2 = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastFlatness2, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastGravity2
		WMorphs.MultBreastGravity2 = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastGravity2, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastHeight
		WMorphs.MultBreastHeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastHeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastPerkiness
		WMorphs.MultBreastPerkiness = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastPerkiness, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreasts
		WMorphs.MultBreasts = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreasts, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastsFantasy
		WMorphs.MultBreastsFantasy = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastsFantasy, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastsGone
		WMorphs.MultBreastsGone = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastsGone, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastsSmall
		WMorphs.MultBreastsSmall = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastsSmall, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastsSmall2
		WMorphs.MultBreastsSmall2 = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastsSmall2, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastsTogether
		WMorphs.MultBreastsTogether = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastsTogether, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastTopSlope
		WMorphs.MultBreastTopSlope = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastTopSlope, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastWidth
		WMorphs.MultBreastWidth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastWidth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultButt
		WMorphs.MultButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultButtClassic
		WMorphs.MultButtClassic = a_value
		SetSliderOptionValue(a_option, WMorphs.MultButtClassic, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultButtCrack
		WMorphs.MultButtCrack = a_value
		SetSliderOptionValue(a_option, WMorphs.MultButtCrack, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultButtSmall
		WMorphs.MultButtSmall = a_value
		SetSliderOptionValue(a_option, WMorphs.MultButtSmall, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultCalfSmooth
		WMorphs.MultCalfSmooth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultCalfSmooth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultChestDepth
		WMorphs.MultChestDepth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultChestDepth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultChestWidth
		WMorphs.MultChestWidth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultChestWidth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultChubbyWaist
		WMorphs.MultChubbyWaist = a_value
		SetSliderOptionValue(a_option, WMorphs.MultChubbyWaist, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultCrotchBack
		WMorphs.MultCrotchBack = a_value
		SetSliderOptionValue(a_option, WMorphs.MultCrotchBack, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultDoubleMelon
		WMorphs.MultDoubleMelon = a_value
		SetSliderOptionValue(a_option, WMorphs.MultDoubleMelon, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultForearmSize
		WMorphs.MultForearmSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultForearmSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultGroin
		WMorphs.MultGroin = a_value
		SetSliderOptionValue(a_option, WMorphs.MultGroin, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultHipBone
		WMorphs.MultHipBone = a_value
		SetSliderOptionValue(a_option, WMorphs.MultHipBone, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultHipForward
		WMorphs.MultHipForward = a_value
		SetSliderOptionValue(a_option, WMorphs.MultHipForward, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultHips
		WMorphs.MultHips = a_value
		SetSliderOptionValue(a_option, WMorphs.MultHips, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultHipUpperWidth
		WMorphs.MultHipUpperWidth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultHipUpperWidth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultKneeHeight
		WMorphs.MultKneeHeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultKneeHeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultKneeShape
		WMorphs.MultKneeShape = a_value
		SetSliderOptionValue(a_option, WMorphs.MultKneeShape, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLegShapeClassic
		WMorphs.MultLegShapeClassic = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLegShapeClassic, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLegsThin
		WMorphs.MultLegsThin = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLegsThin, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultMuscleAbs
		WMorphs.MultMuscleAbs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultMuscleAbs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultMuscleArms
		WMorphs.MultMuscleArms = a_value
		SetSliderOptionValue(a_option, WMorphs.MultMuscleArms, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultMuscleButt
		WMorphs.MultMuscleButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultMuscleButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultMuscleLegs
		WMorphs.MultMuscleLegs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultMuscleLegs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultMusclePecs
		WMorphs.MultMusclePecs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultMusclePecs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNipBGone
		WMorphs.MultNipBGone = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNipBGone, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleDistance
		WMorphs.MultNippleDistance = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleDistance, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleDown
		WMorphs.MultNippleDown = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleDown, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleLength
		WMorphs.MultNippleLength = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleLength, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleManga
		WMorphs.MultNippleManga = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleManga, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNipplePerkiness
		WMorphs.MultNipplePerkiness = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNipplePerkiness, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNipplePerkManga
		WMorphs.MultNipplePerkManga = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNipplePerkManga, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleSize
		WMorphs.MultNippleSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleTip
		WMorphs.MultNippleTip = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleTip, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleTipManga
		WMorphs.MultNippleTipManga = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleTipManga, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleUp
		WMorphs.MultNippleUp = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleUp, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultPregnancyBelly
		WMorphs.MultPregnancyBelly = a_value
		SetSliderOptionValue(a_option, WMorphs.MultPregnancyBelly, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultPushUp
		WMorphs.MultPushUp = a_value
		SetSliderOptionValue(a_option, WMorphs.MultPushUp, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultRibsProminance
		WMorphs.MultRibsProminance = a_value
		SetSliderOptionValue(a_option, WMorphs.MultRibsProminance, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultRoundAss
		WMorphs.MultRoundAss = a_value
		SetSliderOptionValue(a_option, WMorphs.MultRoundAss, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultShoulderSmooth
		WMorphs.MultShoulderSmooth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultShoulderSmooth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultShoulderTweak
		WMorphs.MultShoulderTweak = a_value
		SetSliderOptionValue(a_option, WMorphs.MultShoulderTweak, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultShoulderWidth
		WMorphs.MultShoulderWidth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultShoulderWidth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultSlimThighs
		WMorphs.MultSlimThighs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultSlimThighs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultSternumDepth
		WMorphs.MultSternumDepth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultSternumDepth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultSternumHeight
		WMorphs.MultSternumHeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultSternumHeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultThighs
		WMorphs.MultThighs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultThighs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultTummyTuck
		WMorphs.MultTummyTuck = a_value
		SetSliderOptionValue(a_option, WMorphs.MultTummyTuck, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultWaistHeight
		WMorphs.MultWaistHeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultWaistHeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultWristSize
		WMorphs.MultWristSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultWristSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultFeetFeminine
		WMorphs.MultFeetFeminine = a_value
		SetSliderOptionValue(a_option, WMorphs.MultFeetFeminine, "{2}")
		WMorphs.UpdateWeight()

	ElseIf a_option == _myMultLowBreastsNewSH
		WMorphs.MultLowBreastsNewSH = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastsNewSH, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBigBelly
		WMorphs.MultLowBigBelly = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBigBelly, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBigTorso
		WMorphs.MultLowBigTorso = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBigTorso, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowButtShape2
		WMorphs.MultLowButtShape2 = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowButtShape2, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowChubbyArms
		WMorphs.MultLowChubbyArms = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowChubbyArms, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowChubbyButt
		WMorphs.MultLowChubbyButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowChubbyButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowChubbyLegs
		WMorphs.MultLowChubbyLegs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowChubbyLegs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowWaist
		WMorphs.MultLowWaist = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowWaist, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowWideWaistLine
		WMorphs.MultLowWideWaistLine = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowWideWaistLine, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowCalfSize
		WMorphs.MultLowCalfSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowCalfSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowSamuel
		WMorphs.MultLowSamuel = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowSamuel, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowSamson
		WMorphs.MultLowSamson = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowSamson, "{2}")
		WMorphs.UpdateWeight()

	ElseIf a_option == _myMultLowAnkleSize
		WMorphs.MultLowAnkleSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowAnkleSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowAppleCheeks
		WMorphs.MultLowAppleCheeks = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowAppleCheeks, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowAreolaSize
		WMorphs.MultLowAreolaSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowAreolaSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowArms
		WMorphs.MultLowArms = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowArms, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBack
		WMorphs.MultLowBack = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBack, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBackArch
		WMorphs.MultLowBackArch = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBackArch, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBelly
		WMorphs.MultLowBelly = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBelly, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBigButt
		WMorphs.MultLowBigButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBigButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastCenter
		WMorphs.MultLowBreastCenter = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastCenter, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastCenterBig
		WMorphs.MultLowBreastCenterBig = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastCenterBig, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastCleavage
		WMorphs.MultLowBreastCleavage = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastCleavage, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastFlatness
		WMorphs.MultLowBreastFlatness = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastFlatness, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastFlatness2
		WMorphs.MultLowBreastFlatness2 = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastFlatness2, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastGravity2
		WMorphs.MultLowBreastGravity2 = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastGravity2, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastHeight
		WMorphs.MultLowBreastHeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastHeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastPerkiness
		WMorphs.MultLowBreastPerkiness = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastPerkiness, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreasts
		WMorphs.MultLowBreasts = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreasts, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastsFantasy
		WMorphs.MultLowBreastsFantasy = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastsFantasy, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastsGone
		WMorphs.MultLowBreastsGone = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastsGone, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastsSmall
		WMorphs.MultLowBreastsSmall = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastsSmall, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastsSmall2
		WMorphs.MultLowBreastsSmall2 = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastsSmall2, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastsTogether
		WMorphs.MultLowBreastsTogether = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastsTogether, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastTopSlope
		WMorphs.MultLowBreastTopSlope = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastTopSlope, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowBreastWidth
		WMorphs.MultLowBreastWidth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowBreastWidth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowButt
		WMorphs.MultLowButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowButtClassic
		WMorphs.MultLowButtClassic = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowButtClassic, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowButtCrack
		WMorphs.MultLowButtCrack = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowButtCrack, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowButtSmall
		WMorphs.MultLowButtSmall = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowButtSmall, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowCalfSmooth
		WMorphs.MultLowCalfSmooth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowCalfSmooth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowChestDepth
		WMorphs.MultLowChestDepth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowChestDepth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowChestWidth
		WMorphs.MultLowChestWidth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowChestWidth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowChubbyWaist
		WMorphs.MultLowChubbyWaist = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowChubbyWaist, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowCrotchBack
		WMorphs.MultLowCrotchBack = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowCrotchBack, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowDoubleMelon
		WMorphs.MultLowDoubleMelon = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowDoubleMelon, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowForearmSize
		WMorphs.MultLowForearmSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowForearmSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowGroin
		WMorphs.MultLowGroin = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowGroin, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowHipBone
		WMorphs.MultLowHipBone = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowHipBone, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowHipForward
		WMorphs.MultLowHipForward = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowHipForward, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowHips
		WMorphs.MultLowHips = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowHips, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowHipUpperWidth
		WMorphs.MultLowHipUpperWidth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowHipUpperWidth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowKneeHeight
		WMorphs.MultLowKneeHeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowKneeHeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowKneeShape
		WMorphs.MultLowKneeShape = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowKneeShape, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowLegShapeClassic
		WMorphs.MultLowLegShapeClassic = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowLegShapeClassic, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowLegsThin
		WMorphs.MultLowLegsThin = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowLegsThin, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowMuscleAbs
		WMorphs.MultLowMuscleAbs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowMuscleAbs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowMuscleArms
		WMorphs.MultLowMuscleArms = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowMuscleArms, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowMuscleButt
		WMorphs.MultLowMuscleButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowMuscleButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowMuscleLegs
		WMorphs.MultLowMuscleLegs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowMuscleLegs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowMusclePecs
		WMorphs.MultLowMusclePecs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowMusclePecs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNipBGone
		WMorphs.MultLowNipBGone = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNipBGone, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNippleDistance
		WMorphs.MultLowNippleDistance = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNippleDistance, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNippleDown
		WMorphs.MultLowNippleDown = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNippleDown, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNippleLength
		WMorphs.MultLowNippleLength = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNippleLength, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNippleManga
		WMorphs.MultLowNippleManga = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNippleManga, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNipplePerkiness
		WMorphs.MultLowNipplePerkiness = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNipplePerkiness, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNipplePerkManga
		WMorphs.MultLowNipplePerkManga = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNipplePerkManga, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNippleSize
		WMorphs.MultLowNippleSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNippleSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNippleTip
		WMorphs.MultLowNippleTip = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNippleTip, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNippleTipManga
		WMorphs.MultLowNippleTipManga = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNippleTipManga, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowNippleUp
		WMorphs.MultLowNippleUp = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowNippleUp, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowPregnancyBelly
		WMorphs.MultLowPregnancyBelly = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowPregnancyBelly, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowPushUp
		WMorphs.MultLowPushUp = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowPushUp, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowRibsProminance
		WMorphs.MultLowRibsProminance = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowRibsProminance, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowRoundAss
		WMorphs.MultLowRoundAss = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowRoundAss, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowShoulderSmooth
		WMorphs.MultLowShoulderSmooth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowShoulderSmooth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowShoulderTweak
		WMorphs.MultLowShoulderTweak = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowShoulderTweak, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowShoulderWidth
		WMorphs.MultLowShoulderWidth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowShoulderWidth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowSlimThighs
		WMorphs.MultLowSlimThighs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowSlimThighs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowSternumDepth
		WMorphs.MultLowSternumDepth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowSternumDepth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowSternumHeight
		WMorphs.MultLowSternumHeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowSternumHeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowThighs
		WMorphs.MultLowThighs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowThighs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowTummyTuck
		WMorphs.MultLowTummyTuck = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowTummyTuck, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowWaistHeight
		WMorphs.MultLowWaistHeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowWaistHeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowWristSize
		WMorphs.MultLowWristSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowWristSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLowFeetFeminine
		WMorphs.MultLowFeetFeminine = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLowFeetFeminine, "{2}")
		WMorphs.UpdateWeight()
	EndIf
EndEvent

Function EnableScan(Bool enabled = True)
	If enabled
		SetOptionFlags(_myEnabled, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myScanFood, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myCamillaWeightSetting, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myIngredients, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myPotions, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMultLoss, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMultGainLight, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMultGainMedium, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMultGainHeavy, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myStamina, OPTION_FLAG_NONE, True)
		SetOptionFlags(_mySpeed, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMinWeight, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMaxWeight, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myWeight, OPTION_FLAG_NONE, True)
		SetTextOptionValue(_myScanFood, "$WEIGHTMORPHS_SCANFOOD")
	Else
		SetOptionFlags(_myEnabled, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myScanFood, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myCamillaWeightSetting, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myIngredients, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myPotions, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMultLoss, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMultGainLight, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMultGainMedium, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMultGainHeavy, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myStamina, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_mySpeed, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMinWeight, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMaxWeight, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myWeight, OPTION_FLAG_DISABLED, True)
		SetTextOptionValue(_myScanFood, "$WEIGHTMORPHS_SCANNING")
	EndIf
EndFunction

String Function GetSKSEVersion()
	Return SKSE.GetVersion() as String + "." + SKSE.GetVersionMinor() as String  + "." + SKSE.GetVersionBeta() as String
EndFunction

Int Function CheckSKSEVersion(Int major, Int minor, Int beta)
	Int skseMajor = SKSE.GetVersion()
	Int skseMinor = SKSE.GetVersionMinor()
	Int skseBeta  = SKSE.GetVersionBeta()

	If skseMajor == major
		If skseMinor == minor
			If skseBeta == beta
				Return 0
			ElseIf skseBeta > beta
				Return 1
			Else
				Return -1
			EndIf
		ElseIf skseMinor > minor
			Return 1
		Else
			Return -1
		EndIf
	ElseIf skseMajor > major
		Return 1
	Else
		Return -1
	EndIf
EndFunction

Race Property RaceNordRace  Auto  
Float Property StatBellyHighest Auto
Float Property StatBellyLowest Auto
Float Property StatWeightHighest Auto
Float Property StatWeightLowest Auto

