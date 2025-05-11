ScriptName LaikasCaloriesFoodData Extends ReferenceAlias

Import Utility
Import Math

LaikasCalories Property LC Auto
LaikasCaloriesMCM Property LCM Auto

Float Function GetVolume(Form foodItem)
    If foodItem == Game.GetFormFromFile(0x000EBA01, "Skyrim.esm") ;AppleCabbageStew
        Return volumeAppleCabbageStew
    ElseIf foodItem == Game.GetFormFromFile(0x03003533, "HearthFires.esm") ;AppleDumpling
        Return volumeAppleDumpling
    ElseIf foodItem == Game.GetFormFromFile(0x00064B43, "Skyrim.esm") ;ApplePie
        Return volumeApplePie
    ElseIf foodItem == Game.GetFormFromFile(0x0403d125, "Dragonborn.esm") ;AshHopperLegRaw
        Return volumeAshHopperLegRaw
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd15, "Dragonborn.esm") ;AshHopperMeatRaw
        Return volumeAshHopperMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x040206e7, "Dragonborn.esm") ;AshYam
        Return volumeAshYam
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3A, "Skyrim.esm") ;BakedPotatoes
        Return volumeBakedPotatoes
    ElseIf foodItem == Game.GetFormFromFile(0x000F4314, "Skyrim.esm") ;BeefStew
        Return volumeBeefStew
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd14, "Dragonborn.esm") ;BoarMeatRaw
        Return volumeBoarMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x00064B30, "Skyrim.esm") ;BoiledCremeTreat
        Return volumeBoiledCremeTreat
    ElseIf foodItem == Game.GetFormFromFile(0x000009DB, "Hearthfire.esm") ;BraidedBread
        Return volumeBraidedBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C97, "Skyrim.esm") ;Bread
        Return volumeBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C98, "Skyrim.esm") ;BreadHalf
        Return volumeBreadHalf
    ElseIf foodItem == Game.GetFormFromFile(0x0000353C, "Hearthfire.esm") ;Butter
        Return volumeButter
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3F, "Skyrim.esm") ;Cabbage
        Return volumeCabbage
    ElseIf foodItem == Game.GetFormFromFile(0x000F431B, "Skyrim.esm") ;CabbagePotatoSoup
        Return volumeCabbagePotatoSoup
    ElseIf foodItem == Game.GetFormFromFile(0x000EBA02, "Skyrim.esm") ;CabbageSoup
        Return volumeCabbageSoup
    Else
        Debug.Notification("Food not recognized: " + foodItem.GetName() + "!")
        Return 0.0 ;If Object isn't food
    EndIf
EndFunction

Float Function GetCalories(Form foodItem)
    If foodItem == Game.GetFormFromFile(0x000EBA01, "Skyrim.esm") ;AppleCabbageStew
        Return caloriesAppleCabbageStew
    ElseIf foodItem == Game.GetFormFromFile(0x03003533, "HearthFires.esm") ;AppleDumpling
        Return caloriesAppleDumpling
    ElseIf foodItem == Game.GetFormFromFile(0x00064B43, "Skyrim.esm") ;ApplePie
        Return caloriesApplePie
    ElseIf foodItem == Game.GetFormFromFile(0x0403d125, "Dragonborn.esm") ;AshHopperLegRaw
        Return caloriesAshHopperLegRaw
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd15, "Dragonborn.esm") ;AshHopperMeatRaw
        Return caloriesAshHopperMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x040206e7, "Dragonborn.esm") ;AshYam
        Return caloriesAshYam
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3A, "Skyrim.esm") ;BakedPotatoes
        Return caloriesBakedPotatoes
    ElseIf foodItem == Game.GetFormFromFile(0x000F4314, "Skyrim.esm") ;BeefStew
        Return caloriesBeefStew
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd14, "Dragonborn.esm") ;BoarMeatRaw
        Return caloriesBoarMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x00064B30, "Skyrim.esm") ;BoiledCremeTreat
        Return caloriesBoiledCremeTreat
    ElseIf foodItem == Game.GetFormFromFile(0x000009DB, "Hearthfire.esm") ;BraidedBread
        Return caloriesBraidedBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C97, "Skyrim.esm") ;Bread
        Return caloriesBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C98, "Skyrim.esm") ;BreadHalf
        Return caloriesBreadHalf
    ElseIf foodItem == Game.GetFormFromFile(0x0000353C, "Hearthfire.esm") ;Butter
        Return caloriesButter
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3F, "Skyrim.esm") ;Cabbage
        Return caloriesCabbage
    ElseIf foodItem == Game.GetFormFromFile(0x000F431B, "Skyrim.esm") ;CabbagePotatoSoup
        Return caloriesCabbagePotatoSoup
    ElseIf foodItem == Game.GetFormFromFile(0x000EBA02, "Skyrim.esm") ;CabbageSoup
        Return caloriesCabbageSoup
    Else
        Return 0.0 ;If Object isn't food
    EndIf
EndFunction

Float Function GetProteins(Form foodItem)
    If foodItem == Game.GetFormFromFile(0x000EBA01, "Skyrim.esm") ;AppleCabbageStew
        Return proteinAppleCabbageStew
    ElseIf foodItem == Game.GetFormFromFile(0x03003533, "HearthFires.esm") ;AppleDumpling
        Return proteinAppleDumpling
    ElseIf foodItem == Game.GetFormFromFile(0x00064B43, "Skyrim.esm") ;ApplePie
        Return proteinApplePie
    ElseIf foodItem == Game.GetFormFromFile(0x0403d125, "Dragonborn.esm") ;AshHopperLegRaw
        Return proteinAshHopperLegRaw
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd15, "Dragonborn.esm") ;AshHopperMeatRaw
        Return proteinAshHopperMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x040206e7, "Dragonborn.esm") ;AshYam
        Return proteinAshYam
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3A, "Skyrim.esm") ;BakedPotatoes
        Return proteinBakedPotatoes
    ElseIf foodItem == Game.GetFormFromFile(0x000F4314, "Skyrim.esm") ;BeefStew
        Return proteinBeefStew
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd14, "Dragonborn.esm") ;BoarMeatRaw
        Return proteinBoarMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x00064B30, "Skyrim.esm") ;BoiledCremeTreat
        Return proteinBoiledCremeTreat
    ElseIf foodItem == Game.GetFormFromFile(0x000009DB, "Hearthfire.esm") ;BraidedBread
        Return proteinBraidedBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C97, "Skyrim.esm") ;Bread
        Return proteinBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C98, "Skyrim.esm") ;BreadHalf
        Return proteinBreadHalf
    ElseIf foodItem == Game.GetFormFromFile(0x0000353C, "Hearthfire.esm") ;Butter
        Return proteinButter
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3F, "Skyrim.esm") ;Cabbage
        Return proteinCabbage
    ElseIf foodItem == Game.GetFormFromFile(0x000F431B, "Skyrim.esm") ;CabbagePotatoSoup
        Return proteinCabbagePotatoSoup
    ElseIf foodItem == Game.GetFormFromFile(0x000EBA02, "Skyrim.esm") ;CabbageSoup
        Return proteinCabbageSoup
    Else
        Return 0.0  ;If Object isn't food
    EndIf
EndFunction

Float Function GetFats(Form foodItem)
    If foodItem == Game.GetFormFromFile(0x000EBA01, "Skyrim.esm") ;AppleCabbageStew
        Return fatsAppleCabbageStew
    ElseIf foodItem == Game.GetFormFromFile(0x03003533, "HearthFires.esm") ;AppleDumpling
        Return fatsAppleDumpling
    ElseIf foodItem == Game.GetFormFromFile(0x00064B43, "Skyrim.esm") ;ApplePie
        Return fatsApplePie
    ElseIf foodItem == Game.GetFormFromFile(0x0403d125, "Dragonborn.esm") ;AshHopperLegRaw
        Return fatsAshHopperLegRaw
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd15, "Dragonborn.esm") ;AshHopperMeatRaw
        Return fatsAshHopperMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x040206e7, "Dragonborn.esm") ;AshYam
        Return fatsAshYam
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3A, "Skyrim.esm") ;BakedPotatoes
        Return fatsBakedPotatoes
    ElseIf foodItem == Game.GetFormFromFile(0x000F4314, "Skyrim.esm") ;BeefStew
        Return fatsBeefStew
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd14, "Dragonborn.esm") ;BoarMeatRaw
        Return fatsBoarMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x00064B30, "Skyrim.esm") ;BoiledCremeTreat
        Return fatsBoiledCremeTreat
    ElseIf foodItem == Game.GetFormFromFile(0x000009DB, "Hearthfire.esm") ;BraidedBread
        Return fatsBraidedBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C97, "Skyrim.esm") ;Bread
        Return fatsBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C98, "Skyrim.esm") ;BreadHalf
        Return fatsBreadHalf
    ElseIf foodItem == Game.GetFormFromFile(0x0000353C, "Hearthfire.esm") ;Butter
        Return fatsButter
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3F, "Skyrim.esm") ;Cabbage
        Return fatsCabbage
    ElseIf foodItem == Game.GetFormFromFile(0x000F431B, "Skyrim.esm") ;CabbagePotatoSoup
        Return fatsCabbagePotatoSoup
    ElseIf foodItem == Game.GetFormFromFile(0x000EBA02, "Skyrim.esm") ;CabbageSoup
        Return fatsCabbageSoup
    Else
        Return 0.0  ;If Object isn't food
    EndIf
EndFunction

Float Function GetCarbohydrates(Form foodItem)
    If foodItem == Game.GetFormFromFile(0x000EBA01, "Skyrim.esm") ;AppleCabbageStew
        Return carbohydratesAppleCabbageStew
    ElseIf foodItem == Game.GetFormFromFile(0x03003533, "HearthFires.esm") ;AppleDumpling
        Return carbohydratesAppleDumpling
    ElseIf foodItem == Game.GetFormFromFile(0x00064B43, "Skyrim.esm") ;ApplePie
        Return carbohydratesApplePie
    ElseIf foodItem == Game.GetFormFromFile(0x0403d125, "Dragonborn.esm") ;AshHopperLegRaw
        Return carbohydratesAshHopperLegRaw
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd15, "Dragonborn.esm") ;AshHopperMeatRaw
        Return carbohydratesAshHopperMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x040206e7, "Dragonborn.esm") ;AshYam
        Return carbohydratesAshYam
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3A, "Skyrim.esm") ;BakedPotatoes
        Return carbohydratesBakedPotatoes
    ElseIf foodItem == Game.GetFormFromFile(0x000F4314, "Skyrim.esm") ;BeefStew
        Return carbohydratesBeefStew
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd14, "Dragonborn.esm") ;BoarMeatRaw
        Return carbohydratesBoarMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x00064B30, "Skyrim.esm") ;BoiledCremeTreat
        Return carbohydratesBoiledCremeTreat
    ElseIf foodItem == Game.GetFormFromFile(0x000009DB, "Hearthfire.esm") ;BraidedBread
        Return carbohydratesBraidedBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C97, "Skyrim.esm") ;Bread
        Return carbohydratesBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C98, "Skyrim.esm") ;BreadHalf
        Return carbohydratesBreadHalf
    ElseIf foodItem == Game.GetFormFromFile(0x0000353C, "Hearthfire.esm") ;Butter
        Return carbohydratesButter
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3F, "Skyrim.esm") ;Cabbage
        Return carbohydratesCabbage
    ElseIf foodItem == Game.GetFormFromFile(0x000F431B, "Skyrim.esm") ;CabbagePotatoSoup
        Return carbohydratesCabbagePotatoSoup
    ElseIf foodItem == Game.GetFormFromFile(0x000EBA02, "Skyrim.esm") ;CabbageSoup
        Return carbohydratesCabbageSoup
    Else
        Return 0.0  ;If Object isn't food
    EndIf
EndFunction

Float Function GetProlactin(Form foodItem)
    If foodItem == Game.GetFormFromFile(0x000EBA01, "Skyrim.esm") ;AppleCabbageStew
        Return prolactinAppleCabbageStew
    ElseIf foodItem == Game.GetFormFromFile(0x03003533, "HearthFires.esm") ;AppleDumpling
        Return prolactinAppleDumpling
    ElseIf foodItem == Game.GetFormFromFile(0x00064B43, "Skyrim.esm") ;ApplePie
        Return prolactinApplePie
    ElseIf foodItem == Game.GetFormFromFile(0x0403d125, "Dragonborn.esm") ;AshHopperLegRaw
        Return prolactinAshHopperLegRaw
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd15, "Dragonborn.esm") ;AshHopperMeatRaw
        Return prolactinAshHopperMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x040206e7, "Dragonborn.esm") ;AshYam
        Return prolactinAshYam
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3A, "Skyrim.esm") ;BakedPotatoes
        Return prolactinBakedPotatoes
    ElseIf foodItem == Game.GetFormFromFile(0x000F4314, "Skyrim.esm") ;BeefStew
        Return prolactinBeefStew
    ElseIf foodItem == Game.GetFormFromFile(0x0403bd14, "Dragonborn.esm") ;BoarMeatRaw
        Return prolactinBoarMeatRaw
    ElseIf foodItem == Game.GetFormFromFile(0x00064B30, "Skyrim.esm") ;BoiledCremeTreat
        Return prolactinBoiledCremeTreat
    ElseIf foodItem == Game.GetFormFromFile(0x000009DB, "Hearthfire.esm") ;BraidedBread
        Return prolactinBraidedBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C97, "Skyrim.esm") ;Bread
        Return prolactinBread
    ElseIf foodItem == Game.GetFormFromFile(0x00065C98, "Skyrim.esm") ;BreadHalf
        Return prolactinBreadHalf
    ElseIf foodItem == Game.GetFormFromFile(0x0000353C, "Hearthfire.esm") ;Butter
        Return prolactinButter
    ElseIf foodItem == Game.GetFormFromFile(0x00064B3F, "Skyrim.esm") ;Cabbage
        Return prolactinCabbage
    ElseIf foodItem == Game.GetFormFromFile(0x000F431B, "Skyrim.esm") ;CabbagePotatoSoup
        Return prolactinCabbagePotatoSoup
    ElseIf foodItem == Game.GetFormFromFile(0x000EBA02, "Skyrim.esm") ;CabbageSoup
        Return prolactinCabbageSoup
    Else
        Return 0.0  ;If Object isn't food
    EndIf
EndFunction

Float volumeAppleCabbageStew = 480.0
Float caloriesAppleCabbageStew = 330.0
Float proteinAppleCabbageStew = 2.9
Float carbohydratesAppleCabbageStew = 33.0
Float fatsAppleCabbageStew = 23.0
Float prolactinAppleCabbageStew = 0.8

Float volumeAppleDumpling = 192.0
Float caloriesAppleDumpling = 624.0
Float proteinAppleDumpling = 6.7
Float carbohydratesAppleDumpling = 82.0
Float fatsAppleDumpling = 31.0
Float prolactinAppleDumpling = 10.4

Float volumeApplePie = 1250.0
Float caloriesApplePie = 296.0
Float proteinApplePie = 2.4
Float carbohydratesApplePie = 43.0
Float fatsApplePie = 14.0
Float prolactinApplePie = 7.65

Float volumeAshHopperLegRaw = 135.0
Float caloriesAshHopperLegRaw = 99.0
Float proteinAshHopperLegRaw = 22.2
Float carbohydratesAshHopperLegRaw = 0.0
Float fatsAshHopperLegRaw = 0.4
Float prolactinAshHopperLegRaw = 0.0

Float volumeAshHopperMeatRaw = 425.0
Float caloriesAshHopperMeatRaw = 310.0
Float proteinAshHopperMeatRaw = 70.0
Float carbohydratesAshHopperMeatRaw = 0.0
Float fatsAshHopperMeatRaw = 1.3
Float prolactinAshHopperMeatRaw = 0.0

Float volumeAshYam = 121.5
Float caloriesAshYam = 19.0
Float proteinAshYam = 0.8
Float carbohydratesAshYam = 4.0
Float fatsAshYam = 0.0
Float prolactinAshYam = 0.0

Float volumeBakedPotatoes = 129.0
Float caloriesBakedPotatoes = 161.0
Float proteinBakedPotatoes = 4.3
Float carbohydratesBakedPotatoes = 37.0
Float fatsBakedPotatoes = 0.2
Float prolactinBakedPotatoes = 0.0

Float volumeBeefStew = 504.0
Float caloriesBeefStew = 535.0
Float proteinBeefStew = 58.0
Float carbohydratesBeefStew = 41.0
Float fatsBeefStew = 16.0
Float prolactinBeefStew = 2.8

Float volumeBoarMeatRaw = 226.0
Float caloriesBoarMeatRaw = 538.0
Float proteinBoarMeatRaw = 58.7
Float carbohydratesBoarMeatRaw = 0.0
Float fatsBoarMeatRaw = 32.0
Float prolactinBoarMeatRaw = 0.0

Float volumeBoiledCremeTreat = 109.0
Float caloriesBoiledCremeTreat = 413.0
Float proteinBoiledCremeTreat = 4.9
Float carbohydratesBoiledCremeTreat = 47.0
Float fatsBoiledCremeTreat = 23.0
Float prolactinBoiledCremeTreat = 4.4

Float volumeBraidedBread = 285.0
Float caloriesBraidedBread = 654.0
Float proteinBraidedBread = 18.6
Float carbohydratesBraidedBread = 84.0
Float fatsBraidedBread = 25.2
Float prolactinBraidedBread = 0.0

Float volumeBread = 522.0
Float caloriesBread = 1386.0
Float proteinBread = 46.8
Float carbohydratesBread = 252.0
Float fatsBread = 17.5
Float prolactinBread = 0.0

Float volumeBreadHalf = 261.0
Float caloriesBreadHalf = 693.0
Float proteinBreadHalf = 23.4
Float carbohydratesBreadHalf = 126.0
Float fatsBreadHalf = 8.7
Float prolactinBreadHalf = 0.0

Float volumeButter = 112.0
Float caloriesButter = 816.0
Float proteinButter = 1.0
Float carbohydratesButter = 0.1
Float fatsButter = 96.0
Float prolactinButter = 58.2

Float volumeCabbage = 89.0
Float caloriesCabbage = 22.0
Float proteinCabbage = 1.1
Float carbohydratesCabbage = 5.2
Float fatsCabbage = 0.1
Float prolactinCabbage = 0.0

Float volumeCabbagePotatoSoup = 482.0
Float caloriesCabbagePotatoSoup = 360.0
Float proteinCabbagePotatoSoup = 5.6
Float carbohydratesCabbagePotatoSoup = 39.0
Float fatsCabbagePotatoSoup = 22.0
Float prolactinCabbagePotatoSoup = 13.4

Float volumeCabbageSoup = 490.0
Float caloriesCabbageSoup = 170.0
Float proteinCabbageSoup = 3.4
Float carbohydratesCabbageSoup = 14.0
Float fatsCabbageSoup = 12.0
Float prolactinCabbageSoup = 0.0

;/
Float volumeSweetroll = 268.0
Float caloriesSweetroll = 1048.0
Float proteinSweetroll = 8.0
Float carbohydratesSweetroll = 152.0
Float fatsSweetroll = 48.0
Float prolactinSweetroll = 29.0
/;
