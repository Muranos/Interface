-- Generated from CurseForge on Wed Oct  9 07:18:17 UTC 2024
local ns = select(2, ...) ---@class ns @The addon namespace.

if ns:IsSameLocale("frFR") then

	local L = ns.L or ns:NewLocale()
	ns.L = L

	L.LOCALE_NAME = "frFR"

L["ALLOW_IN_LFD"] = "Autoriser pour la Recherche de Donjon"
L["ALLOW_IN_LFD_CLASSIC"] = "Autoriser pour la Recherche de Groupe"
L["ALLOW_IN_LFD_CLASSIC_DESC"] = "Clic droit sur les groupes ou les joueurs dans l'outil de recherche de groupe pour copier l'URL du profil Raider.IO."
L["ALLOW_IN_LFD_DESC"] = "Clic droit sur les groupes ou les joueurs dans l'outil de recherche de groupe pour copier l'URL du profil Raider.IO."
L["ALLOW_ON_PLAYER_UNITS"] = "Autoriser pour les cadres d'unité"
L["ALLOW_ON_PLAYER_UNITS_DESC"] = "Ajoute une option pour copier l'url du profil Raider.IO dans le menu bouton droit d'un cadre d'unité."
L["API_DEPRECATED"] = [=[|cffFF0000Attention!|r L'Addon |cffFFFFFF%s|r appelle une fonction obsolète de RaiderIO.%s. Cette fonction sera supprimées dans les versions futures. Veuillez encourager l'auteur de %s 
à mettre à jour son addon. Pile d'exécution: %s ]=]
L["API_DEPRECATED_UNKNOWN_ADDON"] = "<AddOn Inconnu>"
L["API_DEPRECATED_UNKNOWN_FILE"] = "<Fichier d'AddOn Inconnu>"
L["API_DEPRECATED_WITH"] = "|cffFF0000Attention!|r L'Addon |cffFFFFFF%s|r appelle une fonction obsolète de RaiderIO.%s. Cette fonction sera supprimée dans de futures versions. Veuillez encourager l'auteur de %s à se mettre à jour vers la nouvelle API de RaiderIO.%s à la place. Pile d'exécution: %s "
L["API_INVALID_DATABASE"] = "|cffFF0000Attention !|r Détection d'une base de données Raider.IO non valide dans |cffFFFFFF%s|r. Veuillez actualiser toutes les régions et factions dans le client Raider.IO ou réinstaller l'addon manuellement."
L["AUTO_COMBATLOG"] = "Activer Automatiquement le Journal de Combat dans les Raids et Donjons"
L["AUTO_COMBATLOG_DESC"] = "Active ou Désactive Automatiquement le Journalisation de Combat quand vous entrez et sortez des Raids et Donjons pris en charge."
--[[Translation missing --]]
--[[ L["AUTO_COMBATLOG_DISABLED_DESC"] = ""--]] 
L["BEST_FOR_DUNGEON"] = "Meilleure clé pour le donjon"
L["BEST_RUN"] = "Meilleure clé"
L["BEST_SCORE"] = "Meilleur Score M+ (%s)"
L["BINDING_CATEGORY_RAIDERIO"] = "Raider.IO"
--[[Translation missing --]]
--[[ L["BINDING_HEADER_RAIDERIO_REPLAYUI"] = ""--]] 
--[[Translation missing --]]
--[[ L["BINDING_NAME_RAIDERIO_REPLAYUI_TIMING_BOSS"] = ""--]] 
--[[Translation missing --]]
--[[ L["BINDING_NAME_RAIDERIO_REPLAYUI_TIMING_DUNGEON"] = ""--]] 
--[[Translation missing --]]
--[[ L["BINDING_NAME_RAIDERIO_REPLAYUI_TOGGLE"] = ""--]] 
L["CANCEL"] = "Annuler"
L["CHANGES_REQUIRES_UI_RELOAD"] = "Vos modifications ont été enregistrées, mais vous devez recharger votre interface pour qu'elles prennent effet. Souhaitez-vous le faire maintenant ?"
L["CHARACTER_LF_GUILD_MPLUS"] = "Cherche une guilde Mythique +"
L["CHARACTER_LF_GUILD_MPLUS_WITH_SCORE"] = "Cherche une guilde Mythique +"
L["CHARACTER_LF_GUILD_PVP"] = "Cherche une guilde JcJ"
L["CHARACTER_LF_GUILD_RAID_DEFAULT"] = "Cherche une guilde pour les raids"
L["CHARACTER_LF_GUILD_RAID_HEROIC"] = "Cherche une guilde pour les raids héroïques"
L["CHARACTER_LF_GUILD_RAID_MYTHIC"] = "Cherche une guilde pour les raids mythiques"
L["CHARACTER_LF_GUILD_RAID_NORMAL"] = "Cherche une guilde pour les raids \"normal\""
L["CHARACTER_LF_GUILD_SOCIAL"] = "Cherche une guilde pour discuter"
L["CHARACTER_LF_TEAM_MPLUS_DEFAULT"] = "Cherche une équipe Mythique +"
--[[Translation missing --]]
--[[ L["CHARACTER_LF_TEAM_MPLUS_WITH_SCORE"] = ""--]] 
L["CHECKBOX_DISPLAY_WEEKLY"] = "Hebdomadaire"
L["CHOOSE_HEADLINE_HEADER"] = "Titre de l'infobulle Mythique+"
L["CONFIG_WHERE_TO_SHOW_TOOLTIPS"] = "Où afficher la progression Mythique+ et de Raid"
L["CONFIRM"] = "Confirmer"
L["COPY_RAIDERIO_PROFILE_URL"] = "Copier le profil Raider.IO"
L["COPY_RAIDERIO_RECRUITMENT_URL"] = "Copier l'URL de recrutement"
L["COPY_RAIDERIO_URL"] = "Copier l'URL de Raider.IO"
L["CURRENT_MAINS_SCORE"] = "Score M+ du personnage principal"
L["CURRENT_SCORE"] = "Score M+ Actuel"
L["DB_MODULES"] = "Modules de base de données"
L["DB_MODULES_HEADER_MYTHIC_PLUS"] = "Mythique+"
--[[Translation missing --]]
--[[ L["DB_MODULES_HEADER_RAIDING"] = ""--]] 
--[[Translation missing --]]
--[[ L["DB_MODULES_HEADER_RECRUITMENT"] = ""--]] 
L["DISABLE_DEBUG_MODE_RELOAD"] = [=[
Vous désactivez le mode de débogage.

Cliquez sur Confirmer pour recharger votre interface.]=]
L["DISABLE_RWF_MODE_BUTTON"] = "Désactiver"
L["DISABLE_RWF_MODE_BUTTON_TOOLTIP"] = "Cliquez pour désactiver le mode « World First ». Cela entraînera le rechargement de votre interface."
L["DISABLE_RWF_MODE_RELOAD"] = "Vous désactivez le mode « World First ». En cliquant sur Confirmer, vous rechargerez votre interface."
L["DPS"] = "DPS"
L["DUNGEON_SHORT_NAME_AA"] = "AA"
L["DUNGEON_SHORT_NAME_AD"] = "AD"
L["DUNGEON_SHORT_NAME_ARAK"] = "AraK"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_AV"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_BH"] = ""--]] 
L["DUNGEON_SHORT_NAME_BRH"] = "BdF"
L["DUNGEON_SHORT_NAME_COS"] = "CoS"
L["DUNGEON_SHORT_NAME_COT"] = "CdF"
L["DUNGEON_SHORT_NAME_DAWN"] = "LBA"
L["DUNGEON_SHORT_NAME_DHT"] = "FS"
L["DUNGEON_SHORT_NAME_DOS"] = "AC"
L["DUNGEON_SHORT_NAME_EB"] = "LFé"
L["DUNGEON_SHORT_NAME_FALL"] = "AdIRdG"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_FH"] = ""--]] 
L["DUNGEON_SHORT_NAME_GB"] = "GB "
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_GD"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_GMBT"] = ""--]] 
L["DUNGEON_SHORT_NAME_HOA"] = "SdE"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_HOI"] = ""--]] 
L["DUNGEON_SHORT_NAME_HOV"] = "SdI"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_ID"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_LOWR"] = ""--]] 
L["DUNGEON_SHORT_NAME_MISTS"] = "BdTS"
L["DUNGEON_SHORT_NAME_NELT"] = "NELT"
L["DUNGEON_SHORT_NAME_NL"] = "RdN"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_NO"] = ""--]] 
L["DUNGEON_SHORT_NAME_NW"] = "SN"
L["DUNGEON_SHORT_NAME_PF"] = "MP"
L["DUNGEON_SHORT_NAME_RISE"] = "AdIcdM"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_RLP"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_SBG"] = ""--]] 
L["DUNGEON_SHORT_NAME_SD"] = "SD"
L["DUNGEON_SHORT_NAME_SIEGE"] = "SIEGE"
L["DUNGEON_SHORT_NAME_SOA"] = "SOA"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_STRT"] = ""--]] 
L["DUNGEON_SHORT_NAME_SV"] = "CP"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_TJS"] = ""--]] 
L["DUNGEON_SHORT_NAME_TOP"] = "TOP"
L["DUNGEON_SHORT_NAME_TOTT"] = "TdM"
L["DUNGEON_SHORT_NAME_ULD"] = "ULD"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_UNDR"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_UPPR"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_VOTW"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_VP"] = ""--]] 
L["DUNGEON_SHORT_NAME_WM"] = "MM"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_WORK"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_YARD"] = ""--]] 
L["ENABLE_AUTO_FRAME_POSITION"] = "Positionner automatiquement le cadre de profil Raider.IO"
L["ENABLE_AUTO_FRAME_POSITION_DESC"] = "L'activation de cette option conservera l'info-bulle du profil M+ à côté du cadre de Recherche de donjon ou de l'info-bulle du joueur."
L["ENABLE_DEBUG_MODE_RELOAD"] = [=[Vous activez le mode de débogage. Ceci est destiné uniquement à des fins de test et de développement, et entraînera une utilisation supplémentaire de la mémoire.

 Cliquez sur Confirmer pour recharger votre interface.]=]
L["ENABLE_LOCK_PROFILE_FRAME"] = "Verrouiller le cadre de profil RaiderIO"
L["ENABLE_LOCK_PROFILE_FRAME_DESC"] = "Empêche le déplacement du cadre de profil M+. Cela n'a aucun effet si le cadre de profil M+ est configuré pour être positionné automatiquement. "
L["ENABLE_NO_SCORE_COLORS"] = "Désactiver les couleurs de score"
L["ENABLE_NO_SCORE_COLORS_DESC"] = "Tous les scores seront affichés en blanc."
L["ENABLE_RAIDERIO_CLIENT_ENHANCEMENTS"] = "Autoriser les améliorations du client RaiderIO "
L["ENABLE_RAIDERIO_CLIENT_ENHANCEMENTS_DESC"] = "Activer cette option vous permettra d’afficher les données détaillées du profil RaiderIO téléchargées à partir du client RaiderIO pour les personnages réclamés. "
L["ENABLE_REPLAY"] = "Afficher le système de relecture Mythique+"
--[[Translation missing --]]
--[[ L["ENABLE_REPLAY_DESC"] = ""--]] 
L["ENABLE_RWF_MODE_BUTTON"] = "Activer"
L["ENABLE_RWF_MODE_BUTTON_TOOLTIP"] = "Cliquez pour activer le mode « World First ». Cela entraînera le rechargement de votre interface."
L["ENABLE_RWF_MODE_RELOAD"] = "Vous activez le mode « World First ». Ceci est destiné à être utilisé avec la course au Mythique « World First » et ne doit être utilisé à cette fin qu'avec le client Raider.IO pour le téléchargement de données. En cliquant sur Confirmer, vous rechargerez votre interface."
L["ENABLE_SIMPLE_SCORE_COLORS"] = "Utiliser des couleurs simples pour le score"
L["ENABLE_SIMPLE_SCORE_COLORS_DESC"] = "Utiliser les couleurs de raretés (rare, épique, etc ...) pour les scores. Cela peut aider pour distinguer les tiers de score."
L["ENTER_REALM_AND_CHARACTER"] = "Entrez le serveur et le nom du personnage :"
L["EXPORTJSON_COPY_TEXT"] = "Copiez le texte suivant et collez-le n'importe où sur | cff00C8FFhttps://raider.io|r pour rechercher tous les joueurs. "
L["GENERAL_TOOLTIP_OPTIONS"] = "Options générales des info-bulles"
L["GUILD_BEST_SEASON"] = "Guilde: Top Saison"
L["GUILD_BEST_TITLE"] = "Enregistrements Raider.IO"
L["GUILD_BEST_WEEKLY"] = "Guilde : Top Semaine"
L["GUILD_LF_MPLUS_DEFAULT"] = "Recruter des joueurs Mythique +"
L["GUILD_LF_MPLUS_WITH_SCORE"] = "Recrutement de %d+ joueur(s) pour Mythique+"
L["GUILD_LF_PVP"] = "Recruter des joueurs JcJ"
L["GUILD_LF_RAID_DEFAULT"] = "Recrutement de joueur"
L["GUILD_LF_RAID_HEROIC"] = "Recrutement de joueur pour raid héroïque"
L["GUILD_LF_RAID_MYTHIC"] = "Recrutement de joueur pour raid mythique"
L["GUILD_LF_RAID_NORMAL"] = "Recrutement de joueur pour raid normal"
L["GUILD_LF_SOCIAL"] = "Recrutement de joueur"
L["HEALER"] = "Heal"
L["HIDE_OWN_PROFILE"] = "Masquer l'infobulle du profil RaiderIO personnel "
L["HIDE_OWN_PROFILE_DESC"] = "Lorsque cette option est activée, cette option n’affichera pas votre propre info-bulle de profil RaiderIO, mais peut afficher celles des autres joueurs s’ils en ont une. "
L["INVERSE_PROFILE_MODIFIER"] = "Inverser le modificateur de l'info bulle"
L["INVERSE_PROFILE_MODIFIER_DESC"] = "Activer cette option va inverser le comportement de l'info-bulle lorsque l'on utilise les touches (shift/ctrl/alt)."
--[[Translation missing --]]
--[[ L["LOCALE_NAME"] = ""--]] 
L["LOCKING_PROFILE_FRAME"] = "RaiderIO: Verrouiller le cadre de profil M+. "
L["MAINS_BEST_SCORE_BEST_SEASON"] = "Meilleur score M+ du personnage principal (%s)"
L["MAINS_RAID_PROGRESS"] = "Progression du personnage principal "
L["MAINS_SCORE"] = "Score du personnage principal"
L["MINIMAP_SHORTCUT_BROKER_ENABLE"] = "Activer le bouton du compartiment supplémentaire"
L["MINIMAP_SHORTCUT_BROKER_ENABLE_DESC"] = "Activez pour afficher l’icône dans le menu du compartiment complémentaire. Cela le rendra également disponible dans tout autre addon prenant en charge le système de courtage."
L["MINIMAP_SHORTCUT_ENABLE"] = "Activer le bouton"
L["MINIMAP_SHORTCUT_ENABLE_DESC"] = "Activez pour afficher l'icône autour de la mini-carte. Cela le rendra également disponible dans tout autre addon prenant en charge le système de courtage."
L["MINIMAP_SHORTCUT_HEADER"] = "Mini-carte"
L["MINIMAP_SHORTCUT_HELP"] = "|A:newplayertutorial-icon-mouse-leftbutton:16:12|a Recherche |A:newplayertutorial-icon-mouse-rightbutton:16:12|a Paramètres"
L["MINIMAP_SHORTCUT_HELP_LEFT_CLICK"] = "Clic gauche"
L["MINIMAP_SHORTCUT_HELP_RIGHT_CLICK"] = "Clic droit"
L["MINIMAP_SHORTCUT_HELP_SEARCH"] = "Recherche"
L["MINIMAP_SHORTCUT_HELP_SETTINGS"] = "Paramètres"
L["MINIMAP_SHORTCUT_LOCK"] = "Verrouiller le bouton"
L["MINIMAP_SHORTCUT_MINIMAP_ENABLE"] = "Activer le bouton de la mini-carte"
L["MINIMAP_SHORTCUT_MINIMAP_ENABLE_DESC"] = "Activez pour afficher le bouton autour de la mini-carte."
L["MINIMAP_SHORTCUT_MINIMAP_LOCK"] = "Verrouiller le bouton sur la mini-carte"
L["MODULE_AMERICAS"] = "Amérique"
L["MODULE_EUROPE"] = "Europe"
L["MODULE_KOREA"] = "Corée"
L["MODULE_TAIWAN"] = "Taïwan"
L["MY_PROFILE_TITLE"] = "Profil Raider.IO"
L["MYTHIC_PLUS_DB_MODULES"] = "Modules de base de données Mythique+"
L["MYTHIC_PLUS_SCORES"] = "Scores Mythique+ "
L["NO_GUILD_RECORD"] = "Aucun donjon de guilde"
L["OPEN_CONFIG"] = "Ouvrir la configuration"
L["OUT_OF_SYNC_DATABASE_S"] = "|cffFFFFFF%s|r a des données de faction Horde/Alliance qui ne sont pas synchronisées. Veuillez mettre à jour les paramètres de votre client Raider.IO pour synchroniser les deux factions."
L["OUTDATED_DATABASE"] = "Dernière mise à jour des scores il y a %d jours"
L["OUTDATED_DATABASE_HOURS"] = "Dernière mise à jour des scores il y a %d heures"
L["OUTDATED_DOWNLOAD_LINK"] = "Télécharger : %s"
L["OUTDATED_EXPIRED_ALERT"] = "|cffFFFFFF%s|r utilise des données périmées. Veuillez mettre à jour maintenant pour avoir des données les plus précises : |cffFFFFFF%s|r"
L["OUTDATED_EXPIRED_TITLE"] = "Les données Raider.IO ont expiré"
L["OUTDATED_EXPIRES_IN_DAYS"] = "Les données de Raider.IO expirent dans %d jours"
L["OUTDATED_EXPIRES_IN_HOURS"] = "Les données de Raider.IO expirent dans %d heures"
L["OUTDATED_EXPIRES_IN_MINUTES"] = "Les données de Raider.IO Expirent dans %d Minutes"
L["OUTDATED_PROFILE_TOOLTIP_MESSAGE"] = "Veuillez mettre à jour votre addon maintenant pour afficher des données les plus précises. Les joueurs travaillent dur pour améliorer leur progression, et afficher des données très anciennes ne leur rend pas service. Vous pouvez utiliser le client Raider.IO pour synchroniser automatiquement vos données."
L["PREVIOUS_SCORE"] = "Score M+ Précédent (%s)"
L["PROFILE_BEST_RUNS"] = "Meilleurs Donjons"
L["PROFILE_TOOLTIP_ANCHOR_TOOLTIP"] = "Verrouillez le cadre de profil Raider.IO ou activez le positionnement automatique afin de masquer cette ancre."
L["PROVIDER_NOT_LOADED"] = "|cffFF0000Attention:|r |cffFFFFFF%s|r Aucune donnée trouvée pour votre faction actuelle . Veuillez vérifier vos paramètres |cffFFFFFF/raiderio|r et activer les données d'info-bulle pour |cffFFFFFF%s|r."
L["PVP_DATA_HEADER"] = "Profil JcJ Raider.IO"
--[[Translation missing --]]
--[[ L["RAID_AATDH"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_AATSC"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_AVOTI"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATDH_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATDH_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATDH_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATDH_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATDH_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATDH_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATDH_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATDH_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATDH_9"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATSC_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATSC_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATSC_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATSC_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATSC_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATSC_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATSC_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATSC_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AATSC_9"] = ""--]] 
L["RAID_BOSS_ATDH_1"] = "Racine-Noueuse"
L["RAID_BOSS_ATDH_2"] = "Igira la Cruelle"
L["RAID_BOSS_ATDH_3"] = "Volcoross"
L["RAID_BOSS_ATDH_4"] = "Conseil des rêves"
L["RAID_BOSS_ATDH_5"] = "Larodar, gardien de la flamme"
L["RAID_BOSS_ATDH_6"] = "Nymue, la trame du cercle"
L["RAID_BOSS_ATDH_7"] = "Fumeron"
L["RAID_BOSS_ATDH_8"] = "Tindral Vifsage, prophète de flamme"
L["RAID_BOSS_ATDH_9"] = "Fyrakka le Flamboyant"
--[[Translation missing --]]
--[[ L["RAID_BOSS_ATSC_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ATSC_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ATSC_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ATSC_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ATSC_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ATSC_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ATSC_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ATSC_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ATSC_9"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AVOTI_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AVOTI_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AVOTI_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AVOTI_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AVOTI_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AVOTI_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AVOTI_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_AVOTI_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BOT_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BOT_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BOT_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BOT_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BOT_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BWD_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BWD_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BWD_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BWD_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BWD_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_BWD_6"] = ""--]] 
L["RAID_BOSS_CN_1"] = "Hurlaile"
L["RAID_BOSS_CN_10"] = "Sire Denathrius"
L["RAID_BOSS_CN_2"] = "Altimor le Veneur"
L["RAID_BOSS_CN_3"] = "Destructeur affamé"
L["RAID_BOSS_CN_4"] = "Artificier Xy'mox"
L["RAID_BOSS_CN_5"] = "Salut du roi-soleil"
L["RAID_BOSS_CN_6"] = "Dame Inerva Sombreveine"
L["RAID_BOSS_CN_7"] = "Le Conseil du Sang "
L["RAID_BOSS_CN_8"] = "Fangepoing"
L["RAID_BOSS_CN_9"] = "Généraux de la Légion de Pierre"
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_10"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_9"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_10"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_11"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_9"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_10"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_9"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_10"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_11"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_12"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_ICC_9"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_NP_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_NP_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_NP_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_NP_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_NP_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_NP_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_NP_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_NP_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_RS_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_10"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_11"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SFO_9"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SOD_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SOD_10"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SOD_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SOD_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SOD_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SOD_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SOD_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SOD_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SOD_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_SOD_9"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_TOTFW_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_TOTFW_2"] = ""--]] 
L["RAID_BOSS_VOTI_1"] = "Eranog"
L["RAID_BOSS_VOTI_2"] = "Terros"
L["RAID_BOSS_VOTI_3"] = "Le Conseil primordial"
L["RAID_BOSS_VOTI_4"] = "Sennarth, la Glaciale"
L["RAID_BOSS_VOTI_5"] = "Dathéa, transcendée"
L["RAID_BOSS_VOTI_6"] = "Kurog Totem-Sinistre"
L["RAID_BOSS_VOTI_7"] = "Garde-couvée Diurna"
L["RAID_BOSS_VOTI_8"] = "Raszageth la Mange-tempêtes"
--[[Translation missing --]]
--[[ L["RAID_BOT"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BWD"] = ""--]] 
L["RAID_DIFFICULTY_NAME_HEROIC"] = "Héroïque"
L["RAID_DIFFICULTY_NAME_HEROIC10"] = "Héroïque 10"
L["RAID_DIFFICULTY_NAME_HEROIC25"] = "Héroïque 25"
L["RAID_DIFFICULTY_NAME_MYTHIC"] = "Mythique"
L["RAID_DIFFICULTY_NAME_NORMAL"] = "Normal"
L["RAID_DIFFICULTY_NAME_NORMAL10"] = "Normal 10"
L["RAID_DIFFICULTY_NAME_NORMAL25"] = "Normal 25"
L["RAID_DIFFICULTY_SUFFIX_HEROIC"] = "H"
L["RAID_DIFFICULTY_SUFFIX_HEROIC10"] = "H10"
L["RAID_DIFFICULTY_SUFFIX_HEROIC25"] = "H25"
L["RAID_DIFFICULTY_SUFFIX_MYTHIC"] = "M"
L["RAID_DIFFICULTY_SUFFIX_NORMAL"] = "N"
L["RAID_DIFFICULTY_SUFFIX_NORMAL10"] = "N10"
L["RAID_DIFFICULTY_SUFFIX_NORMAL25"] = "N25"
L["RAID_ENCOUNTERS_DEFEATED_TITLE"] = "Rencontres de Raid vaincues"
L["RAID_ICC"] = "Citadelle de la Couronne de glace"
L["RAID_NP"] = "Palais des Nérub’ar"
--[[Translation missing --]]
--[[ L["RAID_RS"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_TOTFW"] = ""--]] 
L["RAIDERIO_AVERAGE_PLAYER_SCORE"] = "Moy. de score Raider.IO sur des +%s"
L["RAIDERIO_BEST_RUN"] = "Meilleur donjon M+ Raider.IO"
L["RAIDERIO_CLIENT_CUSTOMIZATION"] = "Modification avec le Client RaiderIO"
L["RAIDERIO_LIVE_TRACKING"] = "Raider.IO Suivi en Direct"
L["RAIDERIO_MP_BASE_SCORE"] = "Score MM+ Raider.IO de base "
L["RAIDERIO_MP_BEST_SCORE"] = "Score M+ Raider.IO (%s)"
L["RAIDERIO_MP_SCORE"] = "Score Raider.IO M+"
L["RAIDERIO_MYTHIC_OPTIONS"] = "Options de l'addon Raider.IO"
L["RAIDING_DATA_HEADER"] = "Progression de Raid Raider.IO"
--[[Translation missing --]]
--[[ L["RAIDING_DB_MODULES"] = ""--]] 
--[[Translation missing --]]
--[[ L["RECRUITMENT_DB_MODULES"] = ""--]] 
L["RELOAD_LATER"] = "Je rechargerai l'interface plus tard"
L["RELOAD_NOW"] = "Recharger l'interface maintenant"
--[[Translation missing --]]
--[[ L["RELOAD_RWF_MODE_BUTTON"] = ""--]] 
L["RELOAD_RWF_MODE_BUTTON_TOOLTIP"] = "Cliquez pour enregistrer le journal dans un fichier de stockage. Cela entraînera le rechargement de votre interface."
--[[Translation missing --]]
--[[ L["REPLAY_AUTO_SELECTION"] = ""--]] 
L["REPLAY_AUTO_SELECTION_DESC"] = "Choisissez le type de replay que vous souhaitez sélectionner automatiquement."
L["REPLAY_AUTO_SELECTION_GUILD_BEST"] = "Meilleur guilde"
L["REPLAY_AUTO_SELECTION_MOST_RECENT"] = "Plus récent"
L["REPLAY_AUTO_SELECTION_PERSONAL_BEST"] = "Record personnel"
L["REPLAY_AUTO_SELECTION_STARRED"] = "Favoris"
L["REPLAY_AUTO_SELECTION_TEAM_BEST"] = "Meilleur équipe"
--[[Translation missing --]]
--[[ L["REPLAY_BACKGROUND_COLOR"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_BACKGROUND_COLOR_DESC"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_DISABLE_CONFIRM"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_FRAME_ALPHA"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_FRAME_ALPHA_DESC"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_MENU_COPY_URL"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_MENU_DISABLE"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_MENU_DOCK"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_MENU_LOCK"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_MENU_POSITION"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_MENU_REPLAY"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_MENU_STYLE"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_MENU_TIMING"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_MENU_UNDOCK"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_MENU_UNLOCK"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_REPLAY_CHANGING"] = ""--]] 
L["REPLAY_SETTINGS_TOOLTIP"] = "Paramètres"
L["REPLAY_STYLE_TITLE_MDI"] = "MDI"
L["REPLAY_STYLE_TITLE_MODERN"] = "Standard"
L["REPLAY_STYLE_TITLE_MODERN_COMPACT"] = "Compact"
L["REPLAY_STYLE_TITLE_MODERN_SPLITS"] = "Uniquement les boss"
--[[Translation missing --]]
--[[ L["REPLAY_SUMMARY_LOGGED"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_TIMING_TITLE_BOSS"] = ""--]] 
--[[Translation missing --]]
--[[ L["REPLAY_TIMING_TITLE_DUNGEON"] = ""--]] 
L["RESET_BUTTON"] = "Réinitialiser par défaut"
L["RESET_CONFIRM_BUTTON"] = "Réinitialiser et recharger"
L["RESET_CONFIRM_TEXT"] = "Êtes-vous sûr de vouloir réinitialiser Raider.IO aux paramètres par défaut ?"
L["RWF_MINIBUTTON_TOOLTIP"] = "Clic gauche à chaque fois qu’il y a du butin en attente. Cela entraînera le rechargement de votre interface. Clic droit pour ouvrir le cadre « World First »."
--[[Translation missing --]]
--[[ L["RWF_SUBTITLE_LOGGING_FILTERED_LOOT"] = ""--]] 
--[[Translation missing --]]
--[[ L["RWF_SUBTITLE_LOGGING_LOOT"] = ""--]] 
L["RWF_TITLE"] = "|cffFFFFFFRaider.IO|r « World First »"
L["SEARCH_NAME_LABEL"] = "Pseudo"
L["SEARCH_REALM_LABEL"] = "Serveur"
L["SEARCH_REGION_LABEL"] = "Region"
L["SEASON_LABEL_1"] = "S1-P"
L["SEASON_LABEL_2"] = "S2"
L["SEASON_LABEL_3"] = "S3"
L["SEASON_LABEL_4"] = "S4"
L["SHOW_AVERAGE_PLAYER_SCORE_INFO"] = "Afficher le score moyen des joueurs pour une clé dans les temps"
L["SHOW_AVERAGE_PLAYER_SCORE_INFO_DESC"] = "Afficher la moyenne des scores Raider.IO des joueurs ayant fini une clé dans les temps. Cela est visible sur l'infobulle de la clé ainsi que des joueurs dans la recherche de groupe."
L["SHOW_BEST_MAINS_SCORE"] = "Afficher le score Mythique+ de la meilleure saison du personnage principal"
L["SHOW_BEST_MAINS_SCORE_DESC"] = "Affiche le score Mythique+ de la meilleure saison du personnage principal d'un joueur et la progression du raid sur l'info-bulle. Les joueurs doivent s'être inscrits sur Raider.IO et avoir déclaré un personnage principal."
L["SHOW_BEST_RUN"] = "Afficher le meilleur Mythique+ comme titre"
L["SHOW_BEST_RUN_DESC"] = "Afficher le meilleur Donjon M+ du joueur de la saison actuelle comme titre dans l'infobulle."
L["SHOW_BEST_SEASON"] = [=[
Afficher le meilleur score mythique+ de la saison en titre]=]
L["SHOW_BEST_SEASON_DESC"] = [=[
Affiche le meilleur score de la saison Mythique+ du joueur dans le titre de l'info-bulle. Si le score provient d'une saison précédente, la saison sera indiquée dans le titre de l'info-bulle.]=]
--[[Translation missing --]]
--[[ L["SHOW_CHESTS_AS_MEDALS"] = ""--]] 
--[[Translation missing --]]
--[[ L["SHOW_CHESTS_AS_MEDALS_DESC"] = ""--]] 
L["SHOW_CLIENT_GUILD_BEST"] = "Afficher les meilleurs records dans la recherche de groupes de Donjons Mythiques"
L["SHOW_CLIENT_GUILD_BEST_DESC"] = "Si vous activez cette option, le Top 5 de votre guilde (par saison ou semaine) sera affiché dans l'onglet Donjons Mythiques de la fenêtre Recherche de groupe."
L["SHOW_CURRENT_SEASON"] = "Afficher le score Mythique+ de la saison actuelle en titre"
L["SHOW_CURRENT_SEASON_DESC"] = "Affiche le score du joueur pour la saison Mythique+ actuelle comme titre de l'info-bulle."
L["SHOW_IN_FRIENDS"] = "Afficher dans la liste d'amis"
L["SHOW_IN_FRIENDS_DESC"] = "Afficher le score Mythique+ lorsqu'on survole un ami."
L["SHOW_IN_LFD"] = "Afficher dans la recherche de donjons"
--[[Translation missing --]]
--[[ L["SHOW_IN_LFD_CLASSIC"] = ""--]] 
L["SHOW_IN_LFD_DESC"] = "Afficher le score Mythique+ lorsqu'on survole un groupe ou un candidat."
L["SHOW_IN_SLASH_WHO_RESULTS"] = "Afficher dans les résultats du /qui"
L["SHOW_IN_SLASH_WHO_RESULTS_DESC"] = "Afficher le score Mythique+ lorsque l'on /qui quelqu'un de spécifique."
L["SHOW_IN_WHO_UI"] = "Afficher dans la fenêtre \"Qui\""
L["SHOW_IN_WHO_UI_DESC"] = "Afficher le score Mythique+ lorsqu'on survole les résultats de la fenêtre \"Qui\"."
L["SHOW_KEYSTONE_INFO"] = "Affiche les informations de la clé"
L["SHOW_KEYSTONE_INFO_DESC"] = "Ajoute des informations sur l'info-bulle de la clé. Propose un score Mythique+ pour le groupe."
L["SHOW_LEADER_PROFILE"] = "Activer l'utilisation des touches (shift/ctrl/alt)"
L["SHOW_LEADER_PROFILE_DESC"] = "Utiliser un des touches (shift/ctrl/alt), permet de changer entre la vue de son profil et celui du chef de groupe."
L["SHOW_MAINS_SCORE"] = "Afficher le score du personnage principal"
L["SHOW_MAINS_SCORE_DESC"] = "Afficher le score du personnage principal du joueur pour la saison actuelle. Ces joueurs doivent avoir un compte sur Raider.IO où il a définit un personnage comme son personnage principal."
L["SHOW_ON_GUILD_ROSTER"] = "Afficher dans l'onglet guilde"
L["SHOW_ON_GUILD_ROSTER_DESC"] = "Afficher le score Mythique+ lorsqu'on survole un joueur dans la liste des membres de la guilde."
L["SHOW_ON_PLAYER_UNITS"] = "Afficher sur les cadres d'unité"
L["SHOW_ON_PLAYER_UNITS_DESC"] = "Afficher le score Mythique+ lorsqu'on survole le cadre d'un joueur. "
L["SHOW_RAID_ENCOUNTERS_IN_PROFILE"] = "Affiche la progression du Raid dans l'infobulle du joueur"
L["SHOW_RAID_ENCOUNTERS_IN_PROFILE_DESC"] = "Si activé, affiche la progression de Raid du joueur dans l'infobulle Raider.IO"
L["SHOW_RAIDERIO_BESTRUN_FIRST"] = "(Expérimental) Prioriser l'affichage Raider.IO du meilleur donjon"
L["SHOW_RAIDERIO_BESTRUN_FIRST_DESC"] = "Ceci est une fonctionnalité expérimentale. Au lieu d'afficher le score Raider.IO comme première ligne, affiche le meilleur donjon du joueur."
L["SHOW_RAIDERIO_PROFILE"] = "Afficher le Profil Raider.IO dans la recherche de donjon"
L["SHOW_RAIDERIO_PROFILE_DESC"] = "Afficher le Profil Raider.IO en Info-Bulle dans la recherche de donjon"
L["SHOW_RAIDERIO_PROFILE_OPTION"] = "Afficher le profil Raider.IO"
L["SHOW_ROLE_ICONS"] = "Afficher les icônes de rôles dans les info-bulles"
L["SHOW_ROLE_ICONS_DESC"] = "Lorsque cette option est activée, les principaux rôles du joueur en Mythique+ seront affichés dans les info-bulles."
L["SHOW_SCORE_IN_COMBAT"] = "Afficher le score en combat"
L["SHOW_SCORE_IN_COMBAT_DESC"] = "Le désactiver pour diminuer l'impact sur les performances lorsque l'on survole un joueur en combat."
L["SHOW_SCORE_WITH_MODIFIER"] = "Montre l'Info-bulle Raider.IO avec modificateur"
L["SHOW_SCORE_WITH_MODIFIER_DESC"] = "Désactive l'Affichage des Données lors du survol des joueurs, sauf si une touche de modification est maintenue."
--[[Translation missing --]]
--[[ L["SHOW_WARBAND_SCORE"] = ""--]] 
--[[Translation missing --]]
--[[ L["SHOW_WARBAND_SCORE_DESC"] = ""--]] 
L["TANK"] = "Tank"
--[[Translation missing --]]
--[[ L["TEAM_LF_MPLUS_DEFAULT"] = ""--]] 
--[[Translation missing --]]
--[[ L["TEAM_LF_MPLUS_WITH_SCORE"] = ""--]] 
L["TIMED_10_RUNS"] = "10-14+ dans les temps"
L["TIMED_15_RUNS"] = "15+ dans les temps"
L["TIMED_20_RUNS"] = "20+ dans les temps"
L["TIMED_5_RUNS"] = "5-9+ dans les temps"
L["TIMED_RUNS_MINIMUM"] = "%d+  Timed Runs"
--[[Translation missing --]]
--[[ L["TIMED_RUNS_RANGE"] = ""--]] 
L["TOOLTIP_PROFILE"] = "Personnalisation de l'info-bulle du profil Raider.IO"
L["UNKNOWN_SERVER_FOUND"] = "|cffFFFFFF%s|r a rencontré une erreur. S'il vous plait, écrivez ces informations |cffFF9999{|r |cffFFFFFF%s|r |cffFF9999,|r |cffFFFFFF%s|r |cffFF9999}|r et reporter le aux développers. Merci !"
L["UNLOCKING_PROFILE_FRAME"] = "RaiderIO: Déverrouiller le cadre de profil M+."
L["USE_ENGLISH_ABBREVIATION"] = "Forcer les abréviations anglaises pour les Donjons"
L["USE_ENGLISH_ABBREVIATION_DESC"] = "Lorsque cette option est activée, les abréviations utilisées pour les Donjons seront les versions anglaises et non celles de votre langue actuelle."
L["USE_RAIDERIO_CLIENT_LIVE_TRACKING_SETTINGS"] = "Autorise le client Raider.IO à contrôler le Journal de Combat"
L["USE_RAIDERIO_CLIENT_LIVE_TRACKING_SETTINGS_DESC"] = "Autorise le client Raider.IO (si présent) à contrôler automatiquement vos paramètres de Journal de Combat."
--[[Translation missing --]]
--[[ L["WARBAND_BEST_SCORE_BEST_SEASON"] = ""--]] 
--[[Translation missing --]]
--[[ L["WARBAND_SCORE"] = ""--]] 
L["WARNING_DEBUG_MODE_ENABLE"] = "|cffFFFFFF%s|r Le mode de débogage est activé. Vous pouvez le désactiver en tapant |cffFFFFFF/raiderio debug|r."
L["WARNING_LOCK_POSITION_FRAME_AUTO"] = "Raider.IO : vous devez d'abord désactiver le positionnement automatique pour le profil Raider.IO."
--[[Translation missing --]]
--[[ L["WARNING_RWF_MODE_ENABLE"] = ""--]] 
--[[Translation missing --]]
--[[ L["WIPE_RWF_MODE_BUTTON"] = ""--]] 
L["WIPE_RWF_MODE_BUTTON_TOOLTIP"] = "Cliquez pour effacer le journal du fichier de stockage. Cela entraînera le rechargement de votre interface."

end
