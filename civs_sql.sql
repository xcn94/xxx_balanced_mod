-- great people --
-- Remove movement bonus from Classical Great Generals
UPDATE ModifierArguments SET Value='NULL' WHERE ModifierId='GREATPERSON_MOVEMENT_AOE_CLASSICAL_LAND';

--POLOCIES
UPDATE ModifierArguments SET Value='35' WHERE ModifierId='PROFESSIONAL_ARMY_UNITUPGRADEDISCOUNT' and Name='Amount';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='OLIGARCHY_MELEE_BUFF' and Name='Amount';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='OLIGARCHY_LEGACY_MELEE_BUFF' and Name='Amount';
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='OLIGARCHY_UNIT_EXPERIENCE' and Name='Amount';
-- improvements

--INSERT INTO Improvement_ValidFeatures(ImprovementType , FeatureType)
--	VALUES ('IMPROVEMENT_PLANTATION', 'FEATURE_FOREST');
INSERT INTO Improvement_BonusYieldChanges(Id, ImprovementType, YieldType, BonusYieldChange, PrereqTech)
	VALUES ('201', 'IMPROVEMENT_QUARRY', 'YIELD_PRODUCTION', 1, 'TECH_BANKING');
INSERT INTO Improvement_YieldChanges(ImprovementType , YieldType, YieldChange)
	VALUES ('IMPROVEMENT_FARM', 'YIELD_PRODUCTION','0');
INSERT INTO Improvement_BonusYieldChanges(Id, ImprovementType, YieldType, BonusYieldChange, PrereqCivic)
	VALUES ('202', 'IMPROVEMENT_FARM', 'YIELD_PRODUCTION', 1, 'CIVIC_FEUDALISM');
-- religious --



-- god of the sun +1food for rice and wheat
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_GOD_OF_THE_SUN', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_GOD_OF_THE_SUN', 'LOC_BELIEF_GOD_OF_THE_SUN_NAME', 'LOC_BELIEF_GOD_OF_THE_SUN_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GOD_OF_THE_SUN', 'GOD_OF_THE_SUN_BONUS_FARM_FOOD');
	

INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_FOOD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_FOOD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_BONUS_FARM_REQUIREMENTS');

INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS', 'REQUIRES_RICE_IN_PLOT');	
	INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS', 'REQUIRES_WHEAT_IN_PLOT');	
--INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
--	VALUES ('PLOT_HAS_BONUS_FARM_REQUIREMENTS', 'REQUIRES_PLOT_HAS_FARM');	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_FOOD', 'ModifierId','GOD_OF_THE_SUN_BONUS_FARM_FOOD_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_FOOD_MODIFIER', 'YieldType','YIELD_FOOD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GOD_OF_THE_SUN_BONUS_FARM_FOOD_MODIFIER', 'Amount', 1);

-- goddess of the moon +1science per luxury fishboats
INSERT INTO Types(Type, Kind)
	VALUES ('BELIEF_GODDESS_OF_THE_MOON', 'KIND_BELIEF');
INSERT INTO Beliefs(BeliefType, Name, Description, BeliefClassType)
	VALUES ('BELIEF_GODDESS_OF_THE_MOON', 'LOC_BELIEF_GODDESS_OF_THE_MOON_NAME', 'LOC_BELIEF_GODDESS_OF_THE_MOON_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO BeliefModifiers(BeliefType , ModifierId)
	VALUES ('BELIEF_GODDESS_OF_THE_MOON', 'GODDESS_OF_THE_MOON_LUXURY_SCIENCE');

INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_LUXURY_FISHBOATS_REQUIREMENTS');	
	
INSERT INTO RequirementSets(RequirementSetId , RequirementSetType)
	VALUES ('PLOT_HAS_LUXURY_FISHBOATS_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_LUXURY_FISHBOATS_REQUIREMENTS', 'REQUIRES_PLOT_HAS_LUXURY');	
INSERT INTO RequirementSetRequirements(RequirementSetId , RequirementId)
	VALUES ('PLOT_HAS_LUXURY_FISHBOATS_REQUIREMENTS', 'REQUIRES_PLOT_HAS_FISHINGBOATS');	
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE', 'ModifierId','GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER', 'YieldType','YIELD_SCIENCE');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('GODDESS_OF_THE_MOON_LUXURY_SCIENCE_MODIFIER', 'Amount', 1);
	
-- Defender of Faith +4 instead of +10
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='DEFENDER_OF_FAITH_COMBAT_BONUS_MODIFIER';
-- Crusader +7 instead of +10
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='JUST_WAR_COMBAT_BONUS_MODIFIER';
-- god of the forge 15%
UPDATE ModifierArguments SET Value='15' WHERE ModifierId='GOD_OF_THE_FORGE_UNIT_ANCIENT_CLASSICAL_PRODUCTION_MODIFIER' and Name='Amount';
-- Goddess of the Harvest is +50% faith from chops instead of +100%
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='GODDESS_OF_THE_HARVEST_HARVEST_MODIFIER' and Name='Amount';
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='GODDESS_OF_THE_HARVEST_REMOVE_FEATURE_MODIFIER' and Name='Amount';
-- Monument to the Gods affects all wonders... not just Ancient and Classical Era
UPDATE ModifierArguments SET Value='ERA_INFORMATION' WHERE ModifierId='MONUMENT_TO_THE_GODS_ANCIENTCLASSICALWONDER_MODIFIER' AND Name='EndEra';
-- dance of the aurora +0.5faith per tundar terrian
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('DANCE_OF_THE_AURORA_FAITHTUNDRAADJACENCY', 'TilesRequired',2);
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY', 'TilesRequired',2);
-- god of craftsmen +2 per stragetic mine
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='GOD_OF_CRAFTSMEN_STRATEGIC_MINE_PRODUCTION_MODIFIER' and Name='Amount';
-- fertility rites +15% city growth
UPDATE ModifierArguments SET Value='15' WHERE ModifierId='FERTILITY_RITES_GROWTH' and Name='Amount';
--stone circle +2faith,+1gold per 
INSERT INTO BeliefModifiers(BeliefType, ModifierId)
	VALUES ('BELIEF_STONE_CIRCLES', 'STONE_CIRCLES_QUARRY_GOLD');
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES ('STONE_CIRCLES_QUARRY_GOLD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES ('STONE_CIRCLES_QUARRY_GOLD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','PLOT_HAS_QUARRY_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('STONE_CIRCLES_QUARRY_GOLD', 'ModifierId','STONE_CIRCLES_QUARRY_GOLD_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('STONE_CIRCLES_QUARRY_GOLD_MODIFIER', 'YieldType','YIELD_GOLD');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('STONE_CIRCLES_QUARRY_GOLD_MODIFIER', 'Amount',1);
-- divine spark great_scientist --> great_admirals
DELETE FROM BeliefModifiers WHERE BeliefType='BELIEF_DIVINE_SPARK' and ModifierId='DIVINE_SPARK_CAMPUS';
INSERT INTO BeliefModifiers(BeliefType, ModifierId)
	VALUES ('BELIEF_DIVINE_SPARK', 'DIVINE_SPARK_HARBOR');
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_HARBOR', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER','CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES ('DIVINE_SPARK_HARBOR_MODIFIER', 'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS','DISTRICT_IS_HARBOR');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('DIVINE_SPARK_HARBOR', 'ModifierId','DIVINE_SPARK_HARBOR_MODIFIER');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('DIVINE_SPARK_HARBOR_MODIFIER', 'GreatPersonClassType','GREAT_PERSON_CLASS_ADMIRAL');
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('DIVINE_SPARK_HARBOR_MODIFIER', 'Amount',1);

-- districts & buildings
UPDATE Adjacency_YieldChanges SET YieldChange='3' WHERE ID='Harbor_City_Gold';
UPDATE Buildings SET Cost='100' WHERE BuildingType='BUILDING_STABLE';

--UNITS
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='ECHELON_ADDITIONAL_CAVALRY_BONUS' and Name='Amount';
UPDATE ModifierArguments SET Value='7' WHERE ModifierId='TORTOISE_DEFENSE_BONUS_VS_RANGED_COMBAT' and Name='Amount';
UPDATE Units SET Cost=300,Combat=45,RangedCombat=55 WHERE UnitType='UNIT_FIELD_CANNON';
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='ARROW_STORM_BONUS_VS_LAND_AND_SEA_UNITS' and Name='Amount';
UPDATE Units SET Cost=390,BaseMoves=3 WHERE UnitType='UNIT_INFANTRY';
UPDATE Units SET RangedCombat=70,Range=2 WHERE UnitType='UNIT_MACHINE_GUN';
INSERT INTO ModifierArguments(ModifierId , Name, Value)
	VALUES ('REDEPLOY_ADDITIONAL_CAVALRY_BONUS', 'Amount',5);
INSERT INTO Modifiers(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES ('REDEPLOY_ADDITIONAL_CAVALRY_BONUS', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH','ECHELON_REQUIREMENTS');
INSERT INTO UnitPromotionModifiers(UnitPromotionType , ModifierId)
	VALUES ('PROMOTION_REDEPLOY', 'REDEPLOY_ADDITIONAL_CAVALRY_BONUS');
INSERT INTO ModifierStrings(ModifierId , Context, Text)
	VALUES ('REDEPLOY_ADDITIONAL_CAVALRY_BONUS', 'Preview','+{1_Amount} {LOC_PROMOTION_REDEPLOY_NAME}');
	
UPDATE Units SET Combat=27 WHERE UnitType='UNIT_SPEARMAN';
UPDATE Units SET PrereqTech='TECH_RADIO' WHERE UnitType='UNIT_OBSERVATION_BALLOON';
UPDATE Units SET Cost=160 WHERE UnitType='UNIT_PIKEMAN';
UPDATE Units SET PrereqTech='TECH_ASTRONOMY' WHERE UnitType='UNIT_PIKE_AND_SHOT';
UPDATE Units SET Combat=42,Cost=125 WHERE UnitType='UNIT_WARRIOR_MONK';
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='EXPLODING_PALMS_INCREASED_COMBAT_STRENGTH';
INSERT INTO UnitPromotionModifiers(UnitPromotionType , ModifierId)
	VALUES ('PROMOTION_MONK_TWILIGHT_VEIL', 'TWILIGHT_VEIL_INCREASED_COMBAT_STRENGTH');
INSERT INTO Modifiers(ModifierId , ModifierType)
	VALUES ('TWILIGHT_VEIL_INCREASED_COMBAT_STRENGTH', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TWILIGHT_VEIL_INCREASED_COMBAT_STRENGTH' , 'Amount', 5);
--GOVERNERS
--liang
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='ZONING_COMMISSIONER_FASTER_DISTRICT_CONSTRUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='INFRASTRUCTURE_FASTER_MONUMENT_CONSTRUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='INFRASTRUCTURE_FASTER_GRANARY_CONSTRUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='INFRASTRUCTURE_FASTER_WATER_MILL_CONSTRUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='INFRASTRUCTURE_FASTER_SEWER_CONSTRUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='INFRASTRUCTURE_FASTER_GOVERNMENT_BUILDING_CONSTRUCTION' and Name='Amount';
INSERT INTO Improvement_YieldChanges(ImprovementType , YieldType, YieldChange)
	VALUES ('IMPROVEMENT_FISHERY', 'YIELD_PRODUCTION','0');
UPDATE Adjacency_YieldChanges SET YieldType='YIELD_PRODUCTION' WHERE ID='Fishery_SeaResourceAdjacency';
--cardinal
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='CARDINAL_FASTER_HOLY_SITE_BUILDING_CONSTRUCTION' and Name='Amount';
UPDATE GovernorPromotions SET Level='3', Column='1' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD';
UPDATE GovernorPromotions SET Level='2', Column='2' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD' and PrereqGovernorPromotion='GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT' and PrereqGovernorPromotion='GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT' and PrereqGovernorPromotion='GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD';
INSERT INTO GovernorPromotionPrereqs(GovernorPromotionType , PrereqGovernorPromotion)
	VALUES ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD', 'GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT');
INSERT INTO GovernorPromotionPrereqs(GovernorPromotionType , PrereqGovernorPromotion)
	VALUES ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD', 'GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS');
INSERT INTO GovernorPromotionPrereqs(GovernorPromotionType , PrereqGovernorPromotion)
	VALUES ('GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT', 'GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT');
-- resource manager
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='GROUNDBREAKER_BONUS_HARVEST_YIELDS' and Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='INDUSTRIALIST_PRODUCTION_FROM_STRATEGIC_RESOURCES' and Name='Amount';
UPDATE GovernorPromotions SET Level='1', Column='2' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';
UPDATE GovernorPromotions SET Level='2', Column='2' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION' and PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER' and PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION';
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION' and PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';
INSERT INTO GovernorPromotionPrereqs(GovernorPromotionType , PrereqGovernorPromotion)
	VALUES ('GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER');
INSERT INTO GovernorPromotionPrereqs(GovernorPromotionType , PrereqGovernorPromotion)
	VALUES ('GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER');
INSERT INTO GovernorPromotionPrereqs(GovernorPromotionType , PrereqGovernorPromotion)
	VALUES ('GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION');

--WONDERS	
-- natural wonders
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='SPEAR_OF_FIONN_ADJUST_COMBAT_STRENGTH' and Name='Amount';	
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='GREAT_GENERAL_ZHANGYE' and Name='Amount';	
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='GREAT_MERCHANT_ZHANGYE' and Name='Amount';	
INSERT INTO Feature_YieldChanges (FeatureType , YieldType , YieldChange)
	VALUES ('FEATURE_CLIFFS_DOVER' , 'YIELD_SCIENCE', 2);
INSERT INTO Feature_YieldChanges (FeatureType , YieldType , YieldChange)
	VALUES ('FEATURE_DEAD_SEA' , 'YIELD_SCIENCE', 2);
UPDATE Feature_AdjacentYields SET YieldChange='1' WHERE FeatureType='FEATURE_EYJAFJALLAJOKULL' and YieldType='YIELD_FOOD';
UPDATE Feature_AdjacentYields SET YieldChange='1' WHERE FeatureType='FEATURE_GALAPAGOS' and YieldType='YIELD_SCIENCE';
INSERT INTO Feature_AdjacentYields (FeatureType , YieldType , YieldChange)
	VALUES ('FEATURE_GALAPAGOS' , 'YIELD_PRODUCTION', 1);
UPDATE Feature_YieldChanges SET YieldChange='1' WHERE FeatureType='FEATURE_PANTANAL' and YieldType='YIELD_CULTURE';	
UPDATE Feature_YieldChanges SET YieldChange='3' WHERE FeatureType='FEATURE_PANTANAL' and YieldType='YIELD_FOOD';
INSERT INTO Feature_YieldChanges (FeatureType , YieldType , YieldChange)
	VALUES ('FEATURE_PANTANAL' , 'YIELD_SCIENCE', 1);
UPDATE Feature_YieldChanges SET YieldChange='4' WHERE FeatureType='FEATURE_BARRIER_REEF' and YieldType='YIELD_FOOD';
UPDATE Feature_YieldChanges SET YieldChange='3' WHERE FeatureType='FEATURE_CRATER_LAKE' and YieldType='YIELD_SCIENCE';
UPDATE Feature_AdjacentYields SET YieldChange='2' WHERE FeatureType='FEATURE_YOSEMITE' and YieldType='YIELD_GOLD';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_RORAIMA' and YieldType='YIELD_SCIENCE';
UPDATE Feature_AdjacentYields SET YieldChange='1' WHERE FeatureType='FEATURE_RORAIMA' and YieldType='YIELD_FAITH';
INSERT INTO Feature_AdjacentYields (FeatureType , YieldType , YieldChange)
	VALUES ('FEATURE_RORAIMA' , 'YIELD_GOLD', 1);
	
INSERT INTO Feature_AdjacentYields (FeatureType , YieldType , YieldChange)
	VALUES ('FEATURE_ULURU' , 'YIELD_GOLD', 2);
UPDATE Feature_YieldChanges SET YieldChange='2' WHERE FeatureType='FEATURE_EYE_OF_THE_SAHARA' and YieldType='YIELD_PRODUCTION';
INSERT INTO Feature_YieldChanges (FeatureType , YieldType , YieldChange)
	VALUES ('FEATURE_EYE_OF_THE_SAHARA' , 'YIELD_GOLD', 2);
UPDATE Feature_YieldChanges SET YieldChange='2' WHERE FeatureType='FEATURE_LAKE_RETBA' and YieldType='YIELD_PRODUCTION';
UPDATE Feature_YieldChanges SET YieldChange='2' WHERE FeatureType='FEATURE_UBSUNUR_HOLLOW' and YieldType='YIELD_FOOD';
INSERT INTO Feature_AdjacentYields (FeatureType , YieldType , YieldChange)
	VALUES ('FEATURE_DELICATE_ARCH' , 'YIELD_PRODUCTION', 1);
UPDATE Feature_AdjacentYields SET YieldChange='2' WHERE FeatureType='FEATURE_EVEREST' and YieldType='YIELD_FAITH';
-- world wonders
UPDATE Buildings SET Cost=260 WHERE BuildingType='BUILDING_STONEHENGE';
UPDATE Buildings SET Cost=910 WHERE BuildingType='BUILDING_ALHAMBRA';
UPDATE Buildings SET Cost=1230 WHERE BuildingType='BUILDING_FORBIDDEN_CITY';
UPDATE Buildings SET Cost=290 WHERE BuildingType='BUILDING_TEMPLE_ARTEMIS';
UPDATE Building_YieldChanges SET YieldChange=10 WHERE BuildingType='BUILDING_MONT_ST_MICHEL';
UPDATE Building_YieldChanges SET YieldChange=3 WHERE BuildingType='BUILDING_STONEHENGE';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ORACLE_GREATGENERALPOINTS' and Name='Amount';	
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ORACLE_GREATADMIRALPOINTS' and Name='Amount';	
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ORACLE_GREATENGINEERPOINTS' and Name='Amount';	
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ORACLE_GREATMERCHANTPOINTS' and Name='Amount';	
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ORACLE_GREATPROPHETPOINTS' and Name='Amount';	
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ORACLE_GREATSCIENTISTPOINTS' and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ORACLE_GREATWRITERPOINTS' and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='ANGKORWAT_ADDPOPULATION' and Name='Amount';	
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='HALICARNASSUS_ADJUST_ENGINEER_CHARGES' and Name='Amount';		
UPDATE Building_YieldChanges SET YieldChange=1 WHERE BuildingType='BUILDING_COLOSSEUM' and YieldType='YIELD_CULTURE';
UPDATE Buildings SET Entertainment=1 WHERE BuildingType='BUILDING_COLOSSEUM';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='HUEY_LAKE_FOOD_MODIFIER' and Name='Amount';	
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='HUEY_LAKE_PRODUCTION_MODIFIER' and Name='Amount';	
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='APADANA_AWARD_TWO_INFLUENCE_TOKEN_MODIFIER';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='GREAT_ZIMBABWE_ADDTRADEROUTE' and Name='Amount';	
-- korea
UPDATE Adjacency_YieldChanges SET YieldChange=2 WHERE ID='BaseDistrict_Science';
INSERT INTO Adjacency_YieldChanges
	(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentImprovement)
	VALUES ('Mine_Science', 'LOC_DISTRICT_MINE_SCIENCE', 'YIELD_SCIENCE', 1, 2, 'IMPROVEMENT_MINE');
INSERT INTO District_Adjacencies
	(DistrictType , YieldChangeId)
	VALUES ('DISTRICT_SEOWON', 'Mine_Science');
UPDATE Units SET RangedCombat=55,Cost=270,Maintenance=5 WHERE UnitType='UNIT_KOREAN_HWACHA';
-- mapuche
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='TRAIT_TOQUI_COMBAT_BONUS_VS_GOLDEN_AGE_CIV';
UPDATE RequirementArguments SET Value='1' WHERE RequirementId='NEAR_FRIENDLY_TERRITORY' and Name='MaxRange';
-- nubia
UPDATE Units SET BaseMoves=2,Combat=15, RangedCombat=28 WHERE UnitType='UNIT_NUBIAN_PITATI';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_ANCIENT_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_CLASSICAL_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_MEDIEVAL_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_RENAISSANCE_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_INDUSTRIAL_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_MODERN_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_ATOMIC_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_INFORMATION_RANGED_UNIT_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_RANGED_EXPERIENCE_MODIFIER' and Name='Amount';
-- persia
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_FALLBABYLON_SURPRISE_MOVEMENT' and Name='Amount';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD' and Name='Amount';
UPDATE Units SET Combat=33 WHERE UnitType='UNIT_PERSIAN_IMMORTAL';
		
-- zulu
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
    VALUES ('PLAYER_HAS_MOBILIZATION_REQUIREMENTS' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO Requirements (RequirementId, RequirementType)
    VALUES ('REQUIRES_PLAYER_HAS_MOBILIZATION' , 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId , Name , Value)
    VALUES ('REQUIRES_PLAYER_HAS_MOBILIZATION' , 'CivicType' , 'CIVIC_MOBILIZATION');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
    VALUES ('PLAYER_HAS_MOBILIZATION_REQUIREMENTS' , 'REQUIRES_PLAYER_HAS_MOBILIZATION');
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_MOBILIZATION_REQUIREMENTS' WHERE ModifierId='TRAIT_LAND_CORPS_COMBAT_STRENGTH';
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_MOBILIZATION_REQUIREMENTS' WHERE ModifierId='TRAIT_LAND_ARMIES_COMBAT_STRENGTH';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_LAND_CORPS_COMBAT_STRENGTH' and Name='Amount';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='TRAIT_LAND_ARMIES_COMBAT_STRENGTH' and Name='Amount';
-- khmer
UPDATE Units SET Cost=280, Maintenance=4, Combat=50, Bombard=60, MandatoryObsoleteTech='TECH_GUIDANCE_SYSTEMS', PrereqTech='TECH_METAL_CASTING' WHERE UnitType='UNIT_KHMER_DOMREY';
INSERT INTO UnitReplaces (CivUniqueUnitType, ReplacesUnitType)
	VALUES ('UNIT_KHMER_DOMREY', 'UNIT_BOMBARD');
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_MONASTERIES_KING', 'TRAIT_HOLY_SITE_RIVER_FAITH');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FAITH', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'PLOT_IS_HOLY_SITE_RIVER_FAITH_REQUIREMENTS');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
	VALUES ('PLOT_IS_HOLY_SITE_RIVER_FAITH_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLOT_IS_HOLY_SITE_RIVER_FAITH_REQUIREMENTS', 'REQUIRES_PLOT_ADJACENT_TO_RIVER');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	VALUES ('PLOT_IS_HOLY_SITE_RIVER_FAITH_REQUIREMENTS', 'REQUIRES_DISTRICT_IS_HOLY_SITE');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FAITH','Amount', 3);
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('TRAIT_HOLY_SITE_RIVER_FAITH', 'YieldType', 'YIELD_FAITH');
-- netherlands	
UPDATE Improvements SET ValidAdjacentTerrainAmount=2 WHERE ImprovementType='IMPROVEMENT_POLDER';
-- indonesia
UPDATE Units SET PrereqCivic="CIVIC_EXPLORATION"  WHERE UnitType='UNIT_INDONESIAN_JONG';
DELETE FROM Improvement_Adjacencies WHERE ImprovementType='IMPROVEMENT_KAMPUNG' and YieldChangeId='Kampung_FoodFishingBoats';
INSERT INTO Improvement_Adjacencies (ImprovementType, YieldChangeId)
	VALUES ('IMPROVEMENT_KAMPUNG', 'Kampung_ProductionFishingBoats');
DELETE FROM Adjacency_YieldChanges WHERE ID='Kampung_FoodFishingBoats';
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentImprovement)
	VALUES ('Kampung_ProductionFishingBoats', 'Placeholder', 'YIELD_PRODUCTION', 1, 1, 'IMPROVEMENT_FISHING_BOATS');
-- australia
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='TRAIT_CITADELCIVILIZATION_LIBERATION_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='10' WHERE ModifierId='TRAIT_CITADELCIVILIZATION_LIBERATION_PRODUCTION' and Name='TurnsActive';
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_CITADELCIVILIZATION_DEFENSIVE_PRODUCTION' and Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='TRAIT_BREATHTAKING_CAMPUS' and Name='YieldChange';
UPDATE Units SET BaseMoves=3 WHERE UnitType='UNIT_DIGGER';
UPDATE Improvements SET PrereqCivic="CIVIC_FEUDALISM" WHERE ImprovementType='IMPROVEMENT_OUTBACK_STATION';

-- india chadragupta
UPDATE ModifierArguments SET Value='0' WHERE Name='Amount' AND ModifierId='TRAIT_TERRITORIAL_WAR_MOVEMENT';
UPDATE ModifierArguments SET Value='0' WHERE Name='Amount' AND ModifierId='TRAIT_TERRITORIAL_WAR_COMBAT';
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_LEADER_ARTHASHASTRA' , 'TRAIT_EXPANSION_COMBAT_BONUS_CPLMOD');
INSERT INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_LEADER_ARTHASHASTRA' , 'TRAIT_EXPANSION_MOVEMENT_BONUS_CPLMOD');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('TRAIT_EXPANSION_COMBAT_BONUS_CPLMOD' , 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER');
INSERT INTO Modifiers (ModifierId , ModifierType)
	VALUES ('TRAIT_EXPANSION_MOVEMENT_BONUS_CPLMOD' , 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER');
INSERT INTO Modifiers (ModifierId , ModifierType , OwnerRequirementSetId, SubjectRequirementSetId)
	VALUES ('EXPANSION_COMBAT_BONUS_MODIFIER_CPLMOD' , 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH' , 'REQUIREMENTSET_LAND_MILITARY_CPLMOD', 'PLAYER_UNITS_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD');
INSERT INTO Modifiers (ModifierId , ModifierType , OwnerRequirementSetId, SubjectRequirementSetId)
	VALUES ('EXPANSION_MOVEMENT_BONUS_MODIFIER_CPLMOD' , 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT' , 'REQUIREMENTSET_LAND_MILITARY_CPLMOD', 'PLAYER_UNITS_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD');

INSERT INTO RequirementArguments (RequirementId , Name , Value)
	VALUES ('REQUIREMENTS_LAND_MILITARY_CPLMOD' , 'UnitFormationClass' , 'FORMATION_CLASS_LAND_COMBAT');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_EXPANSION_COMBAT_BONUS_CPLMOD' , 'ModifierId', 'EXPANSION_COMBAT_BONUS_MODIFIER_CPLMOD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('TRAIT_EXPANSION_MOVEMENT_BONUS_CPLMOD' , 'ModifierId', 'EXPANSION_MOVEMENT_BONUS_MODIFIER_CPLMOD');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('EXPANSION_COMBAT_BONUS_MODIFIER_CPLMOD' , 'Amount' , '2');
INSERT INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('EXPANSION_MOVEMENT_BONUS_MODIFIER_CPLMOD' , 'Amount' , '1');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('PLAYER_UNITS_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD' , 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSets (RequirementSetId , RequirementSetType)
	VALUES ('REQUIREMENTSET_LAND_MILITARY_CPLMOD' , 'REQUIREMENTSET_TEST_ANY');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('PLAYER_UNITS_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD' , 'CHANDRAGUPTA_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIREMENTSET_LAND_MILITARY_CPLMOD' , 'REQUIREMENTS_LAND_MILITARY_CPLMOD');
INSERT INTO RequirementSetRequirements (RequirementSetId , RequirementId)
	VALUES ('REQUIREMENTSET_LAND_MILITARY_CPLMOD' , 'REQUIRES_UNIT_IS_RELIGIOUS_ALL');
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('CHANDRAGUPTA_WITHIN_TERRITORY_REQUIREMENTS_CPLMOD' , 'REQUIREMENT_UNIT_IN_OWNER_TERRITORY');	
INSERT INTO Requirements (RequirementId , RequirementType , Inverse)
	VALUES ('CHANDRAGUPTA_FOREIGN_TERRITORY_REQUIREMENTS_CPLMOD' , 'REQUIREMENT_UNIT_IN_OWNER_TERRITORY' , 1);
INSERT INTO Requirements (RequirementId , RequirementType)
	VALUES ('REQUIREMENTS_LAND_MILITARY_CPLMOD', 'REQUIREMENT_UNIT_FORMATION_CLASS_MATCHES');
INSERT INTO ModifierStrings (ModifierId, Context, Text)
	VALUES ('EXPANSION_COMBAT_BONUS_MODIFIER_CPLMOD' , 'Preview' , 'LOC_EXPANSION_COMBAT_BONUS_MODIFIER_CPLMOD');
-- scotland	
UPDATE ModifierArguments SET Value='10' WHERE ModifierId='TRAIT_SCIENCE_HAPPY' and Name='Amount';
UPDATE ModifierArguments SET Value='20' WHERE ModifierId='TRAIT_SCIENCE_ECSTATIC' and Name='Amount';
UPDATE ModifierArguments SET Value='10' WHERE ModifierId='TRAIT_PRODUCTION_HAPPY' and Name='Amount';
UPDATE ModifierArguments SET Value='20' WHERE ModifierId='TRAIT_PRODUCTION_ECSTATIC' and Name='Amount';
-- mongolia
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_TRADING_POST_DIPLO_VISIBILITY' and Name='Amount';
UPDATE ModifierArguments SET Value='2' WHERE ModifierId='TRAIT_COMBAT_BONUS_FOR_CAVALRY' and Name='Amount';
UPDATE Units SET RangedCombat=42 WHERE UnitType='UNIT_MONGOLIAN_KESHIG';
UPDATE Buildings SET Cost=90 WHERE BuildingType='BUILDING_ORDU';

-- macedon
UPDATE Units SET Cost=90 WHERE UnitType='UNIT_MACEDONIAN_HYPASPIST';
UPDATE ModifierArguments SET Value='50' WHERE ModifierId='HYPASPIST_SUPPORT_BONUS' and Name='Percent';
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='HETAIROI_GREAT_GENERAL_COMBAT_BONUS' and Name='Amount';
--cree
UPDATE Units SET Combat=15, Cost=35 WHERE UnitType='UNIT_CREE_OKIHTCITAW';

--DELETE FROM Improvement_Adjacencies WHERE YieldChangeId='Mekewap_FirstBonusAdjacency';
--DELETE FROM Improvement_Adjacencies WHERE YieldChangeId='Mekewap_SecondBonusAdjacency';
--INSERT INTO Improvement_Adjacencies (ImprovementType, YieldChangeId)
--	VALUES ('IMPROVEMENT_MEKEWAP' , 'Mekewap_BonusAdjacency');
--INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentResourceClass)
--	VALUES ('Mekewap_BonusAdjacency', 'Placeholder', 'YIELD_FOOD', 1, 1, 'RESOURCECLASS_BONUS');
INSERT INTO Improvement_BonusYieldChanges (ID, ImprovementType, YieldType, BonusYieldChange, PrereqCivic)
	VALUES ('25', 'IMPROVEMENT_MEKEWAP', 'YIELD_FOOD', 1, 'CIVIC_MEDIEVAL_FAIRES');	

-- georgia
UPDATE Units SET Combat=43 WHERE UnitType='UNIT_GEORGIAN_KHEVSURETI';
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='KHEVSURETI_HILLS_BUFF' and Name='Amount';
UPDATE BuildingReplaces SET ReplacesBuildingType='BUILDING_CASTLE' WHERE CivUniqueBuildingType='BUILDING_TSIKHE';
UPDATE BuildingPrereqs SET PrereqBuilding='BUILDING_WALLS' WHERE Building='BUILDING_TSIKHE';
UPDATE Buildings SET Cost=120, PrereqTech='TECH_CASTLES' WHERE BuildingType='BUILDING_TSIKHE';
DELETE FROM TraitModifiers WHERE TraitType='TRAIT_LEADER_RELIGION_CITY_STATES' and ModifierId='TRAIT_PROTECTORATE_WAR_FAITH';
DELETE FROM TraitModifiers WHERE TraitType='TRAIT_LEADER_RELIGION_CITY_STATES' and ModifierId='TRAIT_CITY_STATE_TOKEN_SAME_RELIGION';
INSERT INTO TraitModifiers (TraitType, ModifierId)
	VALUES ('TRAIT_LEADER_RELIGION_CITY_STATES', 'UNIQUE_LEADER_FAITH_KILLS');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('UNIQUE_LEADER_FAITH_KILLS', 'YieldType' , 'YIELD_FAITH');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('UNIQUE_LEADER_FAITH_KILLS', 'PercentDefeatedStrength' , '40');
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('UNIQUE_LEADER_FAITH_KILLS', 'MODIFIER_PLAYER_UNITS_ADJUST_POST_COMBAT_YIELD');
-- rome
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING';
UPDATE Districts SET Entertainment=2 WHERE DistrictType='DISTRICT_BATH';
INSERT INTO DistrictModifiers (DistrictType, ModifierId)
	VALUES ('DISTRICT_BATH', 'BATH_CULTURE');
INSERT INTO Modifiers (ModifierId, ModifierType)
	VALUES ('BATH_CULTURE', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('BATH_CULTURE', 'YieldType', 'YIELD_CULTURE');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES ('BATH_CULTURE', 'Amount', 1);





