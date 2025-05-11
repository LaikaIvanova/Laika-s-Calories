ScriptName LaikasCaloriesWeights Extends ReferenceAlias

Import Utility
Import Math

LaikasCalories Property WMorphs Auto
LaikasCaloriesMCM Property WMorphsMCM Auto

;Armour
Armor Property ArmorAmulettArkay Auto
Armor Property ArmorBandedIronShield Auto
Armor Property ArmorDaedricHelmet Auto
Armor Property ArmorDaedricArmour Auto
Armor Property ArmorDaedricGauntlets Auto
Armor Property ArmorDaedricBoots Auto
Armor Property ArmorDragonplateHelmet Auto
Armor Property ArmorDragonplateArmour Auto
Armor Property ArmorDragonplateGauntlets Auto
Armor Property ArmorDragonplateBoots Auto
Armor Property ArmorDragonScaleShield Auto
Armor Property ArmorDwemerShield Auto
Armor Property ArmorGlassShield Auto
Armor Property ArmorIronArmor Auto
Armor Property ArmorIronBracers Auto
Armor Property ArmorIronBoots Auto
Armor Property ArmorIronHelmet Auto
Armor Property ArmorIronShield Auto
Armor Property ArmorJewelryGoldRing Auto
Armor Property ArmorJewelrySilverRing Auto
Armor Property ArmorLeatherArmor Auto
Armor Property ArmorLeatherBracers Auto
Armor Property ArmorLeatherBoots Auto
Armor Property ArmorLeatherHelmet Auto
Armor Property ArmorNordicShield Auto
Armor Property ArmorPeltShield Auto
Armor Property ArmorStalhrimShield Auto
Armor Property ArmorSteelArmour Auto
Armor Property ArmorSteelBoots Auto
Armor Property ArmorSteelBracelets Auto
Armor Property ArmorSteelHelmet Auto
Armor Property ArmorSteelShield Auto
;Ingredients
Ingredient Property IngredientAntlerLarge Auto
Ingredient Property IngredientAntlerSmall Auto
Ingredient Property IngredientDeadlyNightshade Auto
Ingredient Property IngredientFlowerBlue Auto
Ingredient Property IngredientFlowerRed Auto
Ingredient Property IngredientFlowerPurple Auto
Ingredient Property IngredientHagravenFeathers Auto
Ingredient Property IngredientImpStool Auto
Ingredient Property IngredientLavender Auto
Ingredient Property IngredientSaltPile Auto
Ingredient Property IngredientSnowberries Auto
Ingredient Property IngredientWheat Auto
Ingredient Property IngredientThistleBranch Auto
Ingredient Property IngredientToadstool Auto
Ingredient Property IngredientTundracotton Auto
;Food
Potion Property PotionAppleCabbageSoup Auto
Potion Property PotionAppleDumpling Auto
Potion Property PotionApplePie Auto
Potion Property PotionAshHopperLegRaw Auto
Potion Property PotionAshHopperMeatRaw Auto
Potion Property PotionAshYam Auto
Potion Property PotionBakedPotatoes Auto
Potion Property PotionBeefStew Auto
Potion Property PotionBoarMeatRaw Auto
Potion Property PotionBoiledCremeTreat Auto
Potion Property PotionBraidedBread Auto
Potion Property PotionBread Auto
Potion Property PotionBreadHalf Auto
Potion Property PotionButter Auto
Potion Property PotionCabbage Auto


Potion Property PotionAshSoup Auto
Potion Property PotionCabbageSoup Auto
Potion Property PotionCarrot Auto
Potion Property PotionCookedBeef Auto
Potion Property PotionCookedChicken Auto
Potion Property PotionCookedCrab Auto
Potion Property PotionCookedDeer Auto
Potion Property PotionCookedGoat Auto
Potion Property PotionCookedHorker Auto
Potion Property PotionCookedHorse Auto
Potion Property PotionCookedMammoth Auto
Potion Property PotionCookedPheasant Auto
Potion Property PotionCookedPork Auto
Potion Property PotionCookedRabbit Auto
Potion Property PotionCookedSalmonMeat Auto
Potion Property PotionCookedSalmonMeatTwo Auto
Potion Property PotionClamChowder Auto
Potion Property PotionDeerSoup Auto
Potion Property PotionEidarWedge Auto
Potion Property PotionElsweyrSoup Auto
Potion Property PotionFlour Auto
Potion Property PotionGoatCheeseWedge Auto
Potion Property PotionGreenApple Auto
Potion Property PotionHalfBread Auto
Potion Property PotionHorkerSoup Auto
Potion Property PotionLeek Auto
Potion Property PotionPotato Auto 
Potion Property PotionPotatoCabbageSoup Auto
Potion Property PotionPotatoSoup Auto
Potion Property PotionRawSalmon Auto
Potion Property PotionRedApple Auto
Potion Property PotionTomato Auto
Potion Property PotionTomatoSoup Auto
Potion Property PotionVegetableSoup Auto
;Drink
Potion Property PotionAle Auto
;Potions
Potion Property PotionCustom Auto
Potion Property PotionCustomPoison Auto
Potion Property PotionCustomPotionMarker Auto
Potion Property PotionHealingTwo Auto
Potion Property PotionParalysisOne Auto
;Weapons
Weapon Property WeaponPickaxe Auto
Weapon Property WeaponBowScopedHunting Auto
Weapon Property WeaponDawnbreaker Auto
Weapon Property WeaponPoachersAxe Auto
Weapon Property WeaponStaffOfBravery Auto
Weapon Property WeaponSteelDagger Auto
Weapon Property WeaponSteelSword Auto
;Books
Book Property BookBountyOne Auto
Book Property BookBountyTwo Auto
Book Property BookBountyThree Auto
Book Property BookBountyFour Auto
;Misc
MiscObject Property MiscBlackbearHide Auto
MiscObject Property MiscDeerHide Auto
MiscObject Property MiscGemAmethyst Auto
MiscObject Property MiscGemAmethystClean Auto
MiscObject Property MiscGemDiamond Auto
MiscObject Property MiscGemDiamondClean Auto
MiscObject Property MiscGemEmerald Auto
MiscObject Property MiscGemEmeraldClean Auto
MiscObject Property MiscGemGarnet Auto
MiscObject Property MiscGemGarnetClean Auto
MiscObject Property MiscGemRuby Auto
MiscObject Property MiscGemRubyClean Auto
MiscObject Property MiscGemSapphire Auto
MiscObject Property MiscGemSapphireClean Auto
MiscObject Property MiscIngotCopper Auto
MiscObject Property MiscIngotGold Auto
MiscObject Property MiscIngotIron Auto
MiscObject Property MiscIngotSilver Auto
MiscObject Property MiscOreCopper Auto
MiscObject Property MiscOreGold Auto
MiscObject Property MiscOreIron Auto
MiscObject Property MiscOreSilver Auto
MiscObject Property MiscStraw Auto
;Lights
Light Property MiscTorch Auto

Event OnInit()
	
EndEvent

Event OnPlayerLoadGame() ;Fires once when save game is loaded
	SetFoodCategoryName()
	SetRealisticWeight()
EndEvent

Function SetFoodCategoryName() ;Add food category labels in front of food names
		;Food
		PotionAppleCabbageSoup.SetName("Nahrung: Apfelkohlsuppe")
		PotionAppleDumpling.SetName("Nahrung: Apfelkloß")
		PotionApplePie.SetName("Nahrung: Apfelkuchen")
		PotionAshHopperLegRaw.SetName("Zutat: Rohes Aschenhüpferbein")
		PotionAshHopperMeatRaw.SetName("Zutat: Rohes Aschenhüpferfleisch")
		PotionAshYam.SetName("Zutat: Aschenkartoffel")
		PotionBakedPotatoes.SetName("Nahrung: Gebackene Kartoffeln")
		PotionBeefStew.SetName("Nahrung: Rindereintopf")
		PotionBoarMeatRaw.SetName("Zutat: Rohes Schweinefleisch")
		PotionBoiledCremeTreat.SetName("Nahrung: Cremetorte")
		PotionBraidedBread.SetName("Nahrung: Geflochtenes Brot")
		PotionBread.SetName("Nahrung: Brot")
		PotionBreadHalf.SetName("Nahrung: Halbes Brot")
		PotionButter.SetName("Zutat: Butter")
		PotionCabbage.SetName("Zutat: Kohl")
		;Drink
		;Ingredients
		IngredientSaltPile.SetName("Zutat: Salz")
EndFunction

Function SetRealisticWeight() ;Gives items realistic weights
	If (WMorphs.RealisticWeight == True) ;Realistic
		;Armour
		ArmorAmulettArkay.SetWeight(0.61)
		ArmorBandedIronShield.SetWeight(5.12)
		ArmorDaedricHelmet.SetWeight(2.94)
		ArmorDaedricArmour.SetWeight(10.12)
		ArmorDaedricGauntlets.SetWeight(0.84)
		ArmorDaedricBoots.SetWeight(3.03)
		ArmorDragonplateHelmet.SetWeight(2.76)
		ArmorDragonplateArmour.SetWeight(9.52)
		ArmorDragonplateGauntlets.SetWeight(0.78)
		ArmorDragonplateBoots.SetWeight(2.82)
		ArmorDragonScaleShield.SetWeight(5.34)
		ArmorDwemerShield.SetWeight(6.08)
		ArmorGlassShield.SetWeight(5.17)
		ArmorIronHelmet.SetWeight(1.84)
		ArmorIronArmor.SetWeight(6.32)
		ArmorIronBracers.SetWeight(0.52)
		ArmorIronBoots.SetWeight(1.88)
		ArmorIronShield.SetWeight(4.63)
		ArmorJewelryGoldRing.SetWeight(0.07)
		ArmorJewelrySilverRing.SetWeight(0.04)
		ArmorLeatherHelmet.SetWeight(1.02)
		ArmorLeatherArmor.SetWeight(3.51)
		ArmorLeatherBracers.SetWeight(0.29)
		ArmorLeatherBoots.SetWeight(1.05)
		ArmorNordicShield.SetWeight(6.12)
		ArmorPeltShield.SetWeight(2.78)
		ArmorStalhrimShield.SetWeight(5.46)
		ArmorSteelHelmet.SetWeight(2.04)
		ArmorSteelArmour.SetWeight(7.02)
		ArmorSteelBracelets.SetWeight(0.58)
		ArmorSteelBoots.SetWeight(2.11)
		ArmorSteelShield.SetWeight(5.56)
		;Ingredients
		IngredientAntlerLarge.SetWeight(2.48)
		IngredientAntlerSmall.SetWeight(1.18)
		IngredientDeadlyNightshade.SetWeight(0.02)
		IngredientFlowerBlue.SetWeight(0.02)
		IngredientFlowerRed.SetWeight(0.02)
		IngredientFlowerPurple.SetWeight(0.02)
		IngredientHagravenFeathers.SetWeight(0.03)
		IngredientImpStool.SetWeight(0.04)
		IngredientLavender.SetWeight(0.02)
		IngredientSaltPile.SetWeight(0.04)
		IngredientSnowberries.SetWeight(0.05)
		IngredientToadstool.SetWeight(0.03)
		IngredientThistleBranch.SetWeight(0.02)
		IngredientTundracotton.SetWeight(0.04)
		IngredientWheat.SetWeight(0.09)
		;Food
		PotionAppleCabbageSoup.SetWeight(0.48)
		PotionAppleDumpling.SetWeight(0.14)
		PotionApplePie.SetWeight(0.84)
		PotionAshHopperLegRaw.SetWeight(0.17)
		PotionAshHopperMeatRaw.SetWeight(0.21)
		PotionAshYam.SetWeight(0.14)
		PotionBakedPotatoes.SetWeight(0.16)
		PotionBeefStew.SetWeight(0.48)
		PotionBoarMeatRaw.SetWeight(0.22)
		PotionBoiledCremeTreat.SetWeight(0.10)
		PotionBraidedBread.SetWeight(0.25)
		PotionBread.SetWeight(0.52)
		PotionBreadHalf.SetWeight(0.26)
		PotionButter.SetWeight(0.11)
		PotionCabbage.SetWeight(1.12)

		PotionAshSoup.SetWeight(0.43)
		PotionCarrot.SetWeight(0.12)
		PotionClamChowder.SetWeight(0.41)
		PotionCookedBeef.SetWeight(0.22)
		PotionCookedChicken.SetWeight(0.09)
		PotionCookedCrab.SetWeight(0.09)
		PotionCookedDeer.SetWeight(0.19)
		PotionCookedGoat.SetWeight(0.13)
		PotionCookedHorker.SetWeight(0.17)
		PotionCookedHorse.SetWeight(0.15)
		PotionCookedMammoth.SetWeight(0.34)
		PotionCookedPheasant.SetWeight(0.21)
		PotionCookedPork.SetWeight(0.17)
		PotionCookedSalmonMeat.SetWeight(0.17)
		PotionCookedSalmonMeatTwo.SetWeight(0.14)
		PotionEidarWedge.SetWeight(0.11)
		PotionElsweyrSoup.SetWeight(0.43)
		PotionFlour.SetWeight(0.52)
		PotionGoatCheeseWedge.SetWeight(0.11)
		PotionGreenApple.SetWeight(0.21)
		PotionHalfBread.SetWeight(0.26)
		PotionPotato.SetWeight(0.17)
		PotionHorkerSoup.SetWeight(0.48)
		PotionPotatoCabbageSoup.SetWeight(0.48)
		PotionRawSalmon.SetWeight(0.23)
		PotionTomato.SetWeight(0.09)
		PotionTomatoSoup.SetWeight(0.49)
		;Drink
		PotionAle.SetWeight(0.36)
		;Potions
		PotionCustom.SetWeight(0.12)
		PotionCustomPoison.SetWeight(0.12)
		PotionCustomPotionMarker.SetWeight(0.12)
		PotionHealingTwo.SetWeight(0.24)
		PotionParalysisOne.SetWeight(0.12)
		;Weapons
		WeaponBowScopedHunting.SetWeight(1.17)
		WeaponDawnbreaker.SetWeight(0.84)
		WeaponPoachersAxe.SetWeight(1.61)
		WeaponStaffOfBravery.SetWeight(1.62)
		WeaponSteelDagger.SetWeight(0.68)
		WeaponSteelSword.SetWeight(1.12)
		;Books
		BookBountyOne.SetWeight(0.06)
		BookBountyTwo.SetWeight(0.06)
		BookBountyThree.SetWeight(0.06)
		BookBountyFour.SetWeight(0.06)
		;Misc
		MiscBlackbearHide.SetWeight(5.68)
		MiscDeerHide.SetWeight(2.78)
		MiscGemAmethyst.SetWeight(0.25)
		MiscGemAmethystClean.SetWeight(0.23)
		MiscGemDiamond.SetWeight(0.28)
		MiscGemDiamondClean.SetWeight(0.25)
		MiscGemEmerald.SetWeight(0.27)
		MiscGemEmeraldClean.SetWeight(0.24)
		MiscGemGarnet.SetWeight(0.23)
		MiscGemGarnetClean.SetWeight(0.21)
		MiscGemRuby.SetWeight(0.26)
		MiscGemRubyClean.SetWeight(0.23)
		MiscGemSapphire.SetWeight(0.27)
		MiscGemSapphireClean.SetWeight(0.24)
		MiscIngotCopper.SetWeight(0.48)
		MiscIngotGold.SetWeight(1.05)
		MiscIngotIron.SetWeight(0.22)
		MiscIngotSilver.SetWeight(0.56)
		MiscOreCopper.SetWeight(0.73)
		MiscOreGold.SetWeight(1.57)
		MiscOreIron.SetWeight(0.34)
		MiscOreSilver.SetWeight(0.85)
		MiscStraw.SetWeight(0.73)
		MiscTorch.SetWeight(0.68)
	ElseIf (WMorphs.RealisticWeight == False) ;Vanilla
		;Armour
		ArmorBandedIronShield.SetWeight(12.0)
		ArmorDaedricHelmet.SetWeight(15.0)
		ArmorDaedricArmour.SetWeight(50.0)
		ArmorDaedricGauntlets.SetWeight(6.0)
		ArmorDaedricBoots.SetWeight(10.0)
		ArmorDwemerShield.SetWeight(12.0)
		ArmorDragonplateHelmet.SetWeight(8.0)
		ArmorDragonplateArmour.SetWeight(40.0)
		ArmorDragonplateGauntlets.SetWeight(8.0)
		ArmorDragonplateBoots.SetWeight(8.0)
		ArmorDragonScaleShield.SetWeight(6.0)
		ArmorGlassShield.SetWeight(6.0)
		ArmorIronArmor.SetWeight(30.0)
		ArmorIronBracers.SetWeight(5.0)
		ArmorIronBoots.SetWeight(6.0)
		ArmorIronHelmet.SetWeight(5.0)
		ArmorIronShield.SetWeight(12.0)
		ArmorJewelryGoldRing.SetWeight(0.25)
		ArmorJewelrySilverRing.SetWeight(0.25)
		ArmorLeatherArmor.SetWeight(6.0)
		ArmorLeatherBracers.SetWeight(2.0)
		ArmorLeatherBoots .SetWeight(2.0)
		ArmorLeatherHelmet.SetWeight(2.0)
		ArmorNordicShield.SetWeight(10.00)
		ArmorPeltShield.SetWeight(4.0)
		ArmorStalhrimShield.SetWeight(10.0)
		ArmorSteelArmour.SetWeight(35.0)
		ArmorSteelBoots.SetWeight(8.0)
		ArmorSteelBracelets.SetWeight(6.0)
		ArmorSteelHelmet.SetWeight(5.0)
		ArmorSteelShield.SetWeight(12.0)
		;Ingredients
		IngredientDeadlyNightshade.SetWeight(0.1)
		IngredientFlowerBlue.SetWeight(0.1)
		IngredientFlowerPurple.SetWeight(0.1)
		IngredientFlowerRed.SetWeight(0.1)
		IngredientHagravenFeathers.SetWeight(0.1)
		IngredientImpStool.SetWeight(0.3)
		IngredientLavender.SetWeight(0.1)
		IngredientSaltPile.SetWeight(0.2)
		IngredientSnowberries.SetWeight(0.1)
		IngredientWheat.SetWeight(0.1)
		IngredientAntlerLarge.SetWeight(0.1)
		IngredientToadstool.SetWeight(0.1)
		IngredientThistleBranch.SetWeight(0.1)
		IngredientTundracotton.SetWeight(0.1)
		;Food
		PotionAppleCabbageSoup.SetWeight(0.5)
		PotionAppleDumpling.SetWeight(0.1)
		PotionApplePie.SetWeight(0.5)
		PotionAshHopperLegRaw.SetWeight(1.0)
		PotionAshHopperMeatRaw.SetWeight(0.5)
		PotionAshYam.SetWeight(0.1)
		PotionBakedPotatoes.SetWeight(0.1)
		PotionBeefStew.SetWeight(0.5)
		PotionBoarMeatRaw.SetWeight(1.0)
		PotionBoiledCremeTreat.SetWeight(0.5)
		PotionBraidedBread.SetWeight(0.2)
		PotionBread.SetWeight(0.2)
		PotionBreadHalf.SetWeight(0.1)
		PotionButter.SetWeight(0.1)
		PotionCabbage.SetWeight(0.3)

		PotionAshSoup.SetWeight(0.5)
		PotionCarrot.SetWeight(0.1)
		PotionClamChowder.SetWeight(0.5)
		PotionCookedBeef.SetWeight(0.5)
		PotionCookedChicken.SetWeight(0.2)
		PotionCookedCrab.SetWeight(0.1)
		PotionCookedDeer.SetWeight(2.0)
		PotionCookedGoat.SetWeight(1.0)
		PotionCookedHorker.SetWeight(1.0)
		PotionCookedHorse.SetWeight(2.0)
		PotionCookedMammoth.SetWeight(2.0)
		PotionCookedPheasant.SetWeight(0.2)
		PotionCookedPork.SetWeight(1.0)
		PotionCookedSalmonMeat.SetWeight(0.1)
		PotionCookedSalmonMeatTwo.SetWeight(0.1)
		PotionEidarWedge.SetWeight(0.25)
		PotionElsweyrSoup.SetWeight(0.5)
		PotionFlour.SetWeight(0.5)
		PotionGoatCheeseWedge.SetWeight(0.3)
		PotionGreenApple.SetWeight(0.1)
		PotionHalfBread.SetWeight(0.2)
		PotionHorkerSoup.SetWeight(0.5)
		PotionPotato.SetWeight(0.1)
		PotionPotatoCabbageSoup.SetWeight(0.5)
		PotionRawSalmon.SetWeight(0.1)
		PotionTomato.SetWeight(0.1)
		PotionTomatoSoup.SetWeight(0.5)
		;Drink
		PotionAle.SetWeight(0.5)
		;Potions
		PotionCustom.SetWeight(0.5)
		PotionCustomPoison.SetWeight(0.5)
		PotionCustomPotionMarker.SetWeight(0.5)
		PotionHealingTwo.SetWeight(0.5)
		PotionParalysisOne.SetWeight(0.5)
		;Weapons
		WeaponBowScopedHunting.SetWeight(7.5)
		WeaponDawnbreaker.SetWeight(10.0)
		WeaponPickaxe.SetWeight(10.0)
		WeaponPoachersAxe.SetWeight(10.0)
		WeaponStaffOfBravery.SetWeight(8.0)
		WeaponSteelDagger.SetWeight(2.5)
		WeaponSteelSword.SetWeight(10.0)
		;Books
		BookBountyOne.SetWeight(0.0)
		BookBountyTwo.SetWeight(0.0)
		BookBountyThree.SetWeight(0.0)
		BookBountyFour.SetWeight(0.0)
		;Misc
		MiscBlackbearHide.SetWeight(3.0)
		MiscDeerHide.SetWeight(2.0)
		MiscGemAmethyst.SetWeight(0.1)
		MiscGemAmethystClean.SetWeight(0.1)
		MiscGemDiamond.SetWeight(0.1)
		MiscGemDiamondClean.SetWeight(0.1)
		MiscGemEmerald.SetWeight(0.1)
		MiscGemEmeraldClean.SetWeight(0.1)
		MiscGemGarnet.SetWeight(0.1)
		MiscGemGarnetClean.SetWeight(0.1)
		MiscGemRuby.SetWeight(0.1)
		MiscGemRubyClean.SetWeight(0.1)
		MiscGemSapphire.SetWeight(0.1)
		MiscGemSapphireClean.SetWeight(0.1)
		MiscIngotCopper.SetWeight(1.0)
		MiscIngotGold.SetWeight(1.0)
		MiscIngotIron.SetWeight(1.0)
		MiscIngotSilver.SetWeight(1.0)
		MiscOreCopper.SetWeight(1.0)
		MiscOreGold.SetWeight(1.0)
		MiscOreIron.SetWeight(1.0)
		MiscOreSilver.SetWeight(1.0)
		MiscStraw.SetWeight(1.0)
		MiscTorch.SetWeight(0.5)
	EndIf
EndFunction


