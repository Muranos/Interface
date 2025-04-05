-- Translate RCLootCouncil to your language at:
-- http://wow.curseforge.com/addons/rclootcouncil/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("RCLootCouncil", "esMX")
if not L then return end

L[" is not active in this raid."] = "no está activo en esta banda."
L[" you are now the Master Looter and RCLootCouncil is now handling looting."] = "ahora eres el Maestro despojador y RCLootCouncil está manejando el botín."
L["&p was awarded with &i for &r!"] = "¡&p le fue adjudicado &i por &r!"
L["A format to copy/paste to another player."] = "Un formato para copiar/pegar a otro jugador."
L["A new session has begun, type '/rc open' to open the voting frame."] = "Una nueva sesión ha empezado, escribe '/rc open' para abrir la ventana de votación."
L["Abort"] = "Abortar"
L["Accept Whispers"] = "Aceptar susurros"
L["accept_whispers_desc"] = "Permite a los jugadores susurrarte sus objetos actuales para ser agregados a la ventana de votación."
L["Accepted imports: 'Player Export' and 'CSV'"] = "Importaciones aceptadas: Player Export' y 'CSV'"
L["Active"] = "Activo"
L["active_desc"] = "Desmarque para deshabilitar RCLootCouncil. Útil si estás en un grupo de banda pero sin participar en el mismo. Nota: Esta opción se restablece con cada desconexión."
L["Add Item"] = "Agregar objeto"
L["Add Note"] = "Agregar nota"
L["Add ranks"] = "Agregar rangos"
L["Add rolls"] = "Agregar dados"
L["Add Rolls"] = "Agregar dados"
L["add_candidate"] = "Agregar candidato"
L["add_ranks_desc"] = "Escoja el rango mínimo que puede participar en consejo de botín:"
L["add_ranks_desc2"] = "Agrega todos los miembros del rango seleccionado o superior al consejo. Clic en los rangos de la izquierda para agregar jugadores individuales al consejo. Clic en la pestaña Consejo Actual para ver los miembros actuales."
L["add_rolls_desc"] = "Agrega una tirada de dados aleatoria de 1 - 100 en todas las sesiones."
L["Additional Buttons"] = "Botones adicionales"
L["All items"] = "Todos los objetos"
L["All items have been awarded and the loot session concluded"] = "Todos los objetos han sido adjudicados y la sesión de botín ha finalizado"
L["All items usable by the candidate"] = "Todos los objetos utilizables por el candidato"
L["All unawarded items"] = "Todos los objetos sin adjudicar"
L["Alternatively, flag the loot as award later."] = "Alternativamente, marca el botín para ser repartido más tarde."
L["Always show owner"] = "Siempre muestre el dueño"
L["Always use RCLootCouncil with Personal Loot"] = "Siempre usar RCLootCouncil con Botín Personal"
L["always_show_tooltip_howto"] = "Doble clic para activar descripción"
L["Announce Awards"] = "Anunciar adjudicaciones"
L["Announce Considerations"] = "Anunciar objetos a repartir"
L["announce_&i_desc"] = "|cfffcd400 &i|r: vínculo de objeto."
L["announce_&l_desc"] = "|cfffcd400 &l|r: nivel de objeto."
L["announce_&m_desc"] = "|cfffcd400 &m|r: nota de candidatos."
L["announce_&n_desc"] = "|cfffcd400 &n|r: dados, si proporcionados."
L["announce_&o_desc"] = "|cfffcd400 &o|r: dueño de objeto, si aplica."
L["announce_&p_desc"] = "|cfffcd400 &p|r:nombre del jugador que obtendrá el objeto."
L["announce_&r_desc"] = "|cfffcd400 &r|r: motivo."
L["announce_&s_desc"] = "|cfffcd400 &s|r: id de sesión."
L["announce_&t_desc"] = "|cfffcd400 &t|r: tipo de objeto."
L["announce_awards_desc"] = "Habilita el anuncio de las adjudicaciones en el chat."
L["announce_awards_desc2"] = "Elija en qué canal(es) desea anunciar las adjudicaciones con el texto deseado, las siguientes palabras claves se pueden usar como substitutos:"
L["announce_considerations_desc"] = "Activa el anuncio de los objetos a ser repartidos siempre que una sesión inicie."
L["announce_considerations_desc2"] = "Elija en qué canal desea anunciar los objetos a repartir y el mensaje. Este mensaje será el encabezado de la lista de objetos."
L["announce_item_string_desc"] = "Escriba el texto para anunciar cada objeto. Las siguientes palabras claves se pueden usar como substitutos:"
L["Announcements"] = "Anuncios"
L["Anonymous Voting"] = "Votación anónima"
L["anonymous_voting_desc"] = "Habilita la votación anónima (las personas no pueden ver quién está votando por quién)."
L["Append realm names"] = "Añadir nombres de reino"
L["Are you sure you want to abort?"] = "¿Seguro que desea abortar?"
L["Are you sure you want to give #item to #player?"] = "¿Estás seguro de que quieres dar %s a %s?"
L["Are you sure you want to reannounce all unawarded items to %s?"] = "¿Estás seguro de que quieres volver a anunciar todos los objetos a %s?"
L["Are you sure you want to request rolls for all unawarded items from %s?"] = "¿Estás seguro de que quieres solicitarle a %s tirar dados por todos los objetos sin adjudicar?"
L["Armor Token"] = "Ficha de armadura"
L["Ask me every time Personal Loot is enabled"] = "Pregúntame cada vez que botín personal está habilitado"
L["Auto Award"] = "Adjudicar automáticamente"
L["Auto Award to"] = "Adjudicar automáticamente a"
L["Auto awarded 'item'"] = "Adjudicado automáticamente a %s"
L["Auto Close"] = "Autocerrar"
L["Auto Enable"] = "Autohabilitar"
L["Auto extracted from whisper"] = "Extraído de un susurro automáticamente"
L["Auto Open"] = "Autoabrir"
L["Auto Pass"] = "Autopasar"
L["Auto pass BoE"] = "Autopasar 'BoE'"
L["Auto Pass Transmog"] = "Autopasar transfiguración"
L["Auto Pass Transmog Source"] = "Autopasar transfiguración conocida"
L["Auto Pass Trinkets"] = "Autopasar abalorios"
L["Auto Trade"] = "Comerciar automáticamente"
L["auto_award_desc"] = "Activa adjudicar automáticamente"
L["auto_award_to_desc"] = "Agrega un candidato a la lista. Puedes agregar varios nombres separados por comas o espacios. Solo los jugadores que has visto recientemente tienen información de clase."
L["auto_close_desc"] = "Marcar para automáticamente cerrar la ventana de votación cuando el Maestro despojador termine la sesión"
L["auto_enable_desc"] = "Marcar para dejar que 'RCLootCouncil'  maneje siempre el botín. Desmarcarlo hará que 'RCLootCouncil' te pregunte si quieres usarlo cada vez que entres a una banda o cuando te conviertas en Maestro Despojador."
L["auto_open_desc"] = "Marcar para abrir automáticamente la ventana de votación cuando esté disponible. La ventana de votación puede ser abierta con '/rc open'. Nota: Esto requiere el permiso del Maestro despojador."
L["auto_pass_boe_desc"] = "Desmarcar para nunca pasar automáticamente objetos que se ligan al equiparse."
L["auto_pass_desc"] = "Marcar para permitir pasar automáticamente los objetos que su clase no puede usar."
L["auto_pass_transmog_desc"] = "Marcar para permitir pasar automáticamente los objetos que su clase solo puede usar para transfigurar."
L["auto_pass_transmog_source_desc"] = "Marcar para permitir pasar automáticamente los objetos que su clase solo puede usar para transfigurar y la apariencia ya es conocida de otro objeto."
L["auto_pass_trinket_desc"] = "Marcar para permitir pasar automáticamente los abalorios que no están listados para su clase en la guía de aventura."
L["autoGroupLoot_warning"] = "Nota: La configuración del líder de grupo causará que 'RCLootCouncil' administre automáticamente el botín del grupo."
L["autoloot_others_item_combat"] = "%s ha despojado %s. Este objeto será agregado a la ventana en sesión una vez finalice el combate."
L["Autopass"] = "Autopasar"
L["Autopassed on 'item'"] = "%s pasado automáticamente"
L["Autostart isn't supported when testing"] = "Inicio automático no está disponible en modo de prueba"
L["award"] = "adjudicar"
L["Award"] = "Adjudicar"
L["Award Announcement"] = "Anunciar adjudicación"
L["Award for ..."] = "Adjudicar por ..."
L["Award later"] = "Adjudicar más tarde"
L["Award later isn't supported when testing."] = "Adjudicar más tarde no está disponible en modo de prueba"
L["Award later?"] = "¿Adjudicar más tarde?"
L["Award Reasons"] = "Motivos para adjudicar"
L["award_reasons_desc"] = "Motivos para adjudicar que no pueden ser elegidos durante la selección. Se usa cuando se cambia una respuesta con el menú de clic derecho y para adjudicaciones automáticas."
L["Awarded"] = "Adjudicado"
L["Awarded item cannot be awarded later."] = "Objeto adjudicado no puede ser adjudicado más tarde."
L["Awards"] = "Adjudicaciones"
L["Background"] = "Fondo"
L["Background Color"] = "Color de fondo"
L["Banking"] = "Banco"
L["BBCode export, tailored for SMF."] = "Exportación BBCode, ajustado para SMF"
L["Border"] = "Borde"
L["Border Color"] = "Color de borde"
L["Button"] = "Botón"
L["Buttons and Responses"] = "Botones y respuestas"
L["buttons_and_responses_desc"] = "Configura la selección de botones para mostrar en la ventana de botín de los jugadores. El orden aquí mostrado determina el orden durante la ventana de botín y es acomodado de izquierda a derecha, use la barra deslizadora para elegir la cantidad de botones que quiera (máximo %d). Un botón de \"Pasar\" es agregado automáticamente a la derecha del todo."
L["Candidate didn't respond on time"] = "Candidato no respondió a tiempo"
L["Candidate has disabled RCLootCouncil"] = "Candidato ha deshabilitado 'RCLootCouncil'"
L["Candidate is not in the instance"] = "Candidato no está dentro de la estancia"
L["Candidate is selecting response, please wait"] = "Candidato está seleccionando una respuesta, por favor espere"
L["Candidate removed"] = "Candidato removido"
L["Candidates that can't use the item"] = "Candidatos que no pueden usar el objeto"
L["Cannot autoaward:"] = "No se puede adjudicar automáticamente:"
L["Cannot give 'item' to 'player' due to Blizzard limitations. Gave it to you for distribution."] = "No se puede dar %s a %s debido a limitaciones de Blizzard. Otorgado a ti para que lo repartas."
L["Catalyst_Items"] = "Objetos catalizables"
L["Change Award"] = "Cambiar adjudicación"
L["Change Response"] = "Cambiar respuesta"
L["Changing loot threshold to enable Auto Awarding"] = "Cambiando el umbral de botín para habilitar adjudicación automática"
L["Changing LootMethod to Master Looting"] = "Cambiando el método de botín a Maestro despojador"
L["channel_desc"] = "Canal por el cual se enviará el mensaje."
L["Chat print"] = "Escribir al chat"
L["chat tVersion string"] = "|cFF87CEFARCLootCouncil |cFFFFFFFFversión|cFFFFA500 %s - %s"
L["chat version String"] = "|cFF87CEFARCLootCouncil |cFFFFFFFFversión|cFFFFA500 %s"
L["chat_cmd_add_found_items"] = "Se encontraron %d objetos con temporizador de comercio en tus bolsas."
L["chat_cmd_add_invalid_owner"] = "El jugador %s es inválido o no es candidato."
L["chat_command_start_error_onlyUseInRaids"] = "No se puede iniciar: usted está en un grupo y tiene habilitada la opción de 'solo usar en bandas'."
L["chat_command_start_error_start_PartyIsLFG"] = "No se puede iniciar: usted está en un grupo de buscador de bandas."
L["chat_command_start_error_usageNever"] = "No se puede iniciar: la opción de uso 'solo usar en bandas' está desmarcada."
L["chat_commands_add"] = "Agrega un objeto a la ventana de la sesión."
L["chat_commands_add_all"] = "Agregar todos los objetos transferibles a la ventana de la sesión."
L["chat_commands_award"] = "Iniciar una sesión con los objetos en tu inventario"
L["chat_commands_clear"] = "Remueve todos los objetos de la lista 'adjudicar más tarde'"
L["chat_commands_config"] = "Abre la interfaz de opciones (alt. 'c', 'options', 'opt')"
L["chat_commands_council"] = "Abre la interfaz de concilio"
L["chat_commands_export"] = "Exporta los objetos actualmente en sesión"
L["chat_commands_groupLeader_only"] = "Comandos del Líder de grupo"
L["chat_commands_history"] = "Abre el historial de botín (alt. 'h' o 'his')"
L["chat_commands_list"] = "Enlista todos los objetos marcados para 'adjudicar más tarde'"
L["chat_commands_ML_only"] = "Comandos de Maestro despojador"
L["chat_commands_open"] = "Abrir la ventana de votación"
L["chat_commands_profile"] = "Abrir el manejador de perfiles"
L["chat_commands_remove"] = "Remueve el objeto con 'index' (índice) de la lista de 'adjudicar más tarde'"
L["chat_commands_reset"] = "Restablece las posiciones de todos los marcos del accesorio"
L["chat_commands_session"] = "Abre la ventana de la sesión (alt. 'ses' o 's')"
L["chat_commands_start"] = "Empieza a administrar el botín"
L["chat_commands_stop"] = "Deja de administrar el botín"
L["chat_commands_sync"] = "Abre la ventana de sincronización"
L["chat_commands_test"] = "Emula una sesión de botín con # objetos, 1 si se omite"
L["chat_commands_trade"] = "Abre la interfaz de transferencias"
L["chat_commands_version"] = "Abre el verificador de versión (alt. 'v' o 'ver')"
L["chat_commands_whisper"] = "Muestra la ayuda de los comandos por susurro"
L["chatCommand_stop_error_notHandlingLoot"] = "No se puede detener: no se está administrando el botín."
L["Check this to loot the items and distribute them later."] = "Marca esto para despojar los objetos y repartirlos más tarde."
L["Check to append the realmname of a player from another realm"] = "Marca esto para añadir el nombre del reino de un jugador de otro reino"
L["Check to have all frames minimize when entering combat"] = "Marca esto para minimizar todas las ventanas cuando se entra en combate."
L["Choose timeout length in seconds"] = "Escoja la duración del tiempo de expiración en segundos"
L["Choose when to use RCLootCouncil"] = "Elija cuando usar 'RCLootCouncil'"
L["Clear Loot History"] = "Borrar el historial de despojos"
L["Clear Selection"] = "Borrar seleccionados"
L["clear_loot_history_desc"] = "Elimina todo el historial de botín."
L["Click to add note to send to the council."] = "Clic para agregar una nota para enviar al concilio."
L["Click to change your note."] = "Clic para cambiar tu nota."
L["Click to expand/collapse more info"] = "Clic para expandir/colapsar más información"
L["Click to switch to 'item'"] = "Clic para cambiar a %s"
L["config"] = "configurar"
L["confirm_award_later_text"] = "¿Estás seguro de querer adjudicar %s más tarde? Los objetos serán anotados en la lista de adjudicar más tarde y vas a despojar los objetos si puedes recogerlos. Usted puede usar '/rc award' para repartirlos los objetos después."
L["confirm_usage_text"] = "|cFF87CEFA RCLootCouncil |r ¿Quieres usar RCLootCouncil con este grupo?"
L["Conqueror Token"] = "Ficha de conquistador"
--[[Translation missing --]]
L["Corruption if awarded:"] = "Corruption if awarded:"
L["Could not Auto Award i because the Loot Threshold is too high!"] = "¡No se pudo adjudicar automáticamente %s debido a que el umbral de botín está muy alto!"
L["Could not find 'player' in the group."] = "No se encuentra jugador %s en el grupo."
L["Couldn't find any councilmembers in the group"] = "No se encuentra ningún miembro del concilio en el grupo"
L["council"] = "concilio"
L["Council"] = "Concilio"
L["Current Council"] = "Concilio actual"
L["current_council_desc"] = "Clic para remover individuos específicos del concilio"
L["Customize appearance"] = "Personalizar apariencia"
L["customize_appearance_desc"] = "Aquí puedes personalizar la apariencia de 'RCLootCouncil'. Use la opción de guardar para rápidamente cambiar de apariencias."
L["Data Received"] = "Datos recibidos"
L["Date"] = "Fecha"
L["days and x months"] = "%s y %d meses"
L["days, x months, y years"] = "%s, %d meses  %d años"
L["Delete Skin"] = "Borrar apariencia"
L["delete_skin_desc"] = "Elimina la apariencia seleccionada que no sea por defecto de la lista."
--[[Translation missing --]]
L["Deselect responses to filter them"] = "Deselect responses to filter them"
L["Diff"] = "Dif."
--[[Translation missing --]]
L["Discord friendly output."] = "Discord friendly output."
--[[Translation missing --]]
L["disenchant_desc"] = "Select to use this reason when awarding an item via the 'Disenchant' button"
--[[Translation missing --]]
L["Do you want to keep %s for yourself or trade?"] = "Do you want to keep %s for yourself or trade?"
--[[Translation missing --]]
L["Done syncing"] = "Done syncing"
--[[Translation missing --]]
L["Double click to delete this entry."] = "Double click to delete this entry."
--[[Translation missing --]]
L["Dropped by:"] = "Dropped by:"
--[[Translation missing --]]
L["Edit Entry"] = "Edit Entry"
--[[Translation missing --]]
L["Enable Loot History"] = "Enable Loot History"
--[[Translation missing --]]
L["Enable Timeout"] = "Enable Timeout"
--[[Translation missing --]]
L["enable_loot_history_desc"] = "Enables the history. RCLootCouncil won't log anything if disabled."
--[[Translation missing --]]
L["enable_timeout_desc"] = "Check to enable timeout on the Loot Frame"
--[[Translation missing --]]
L["Enter your note:"] = "Enter your note:"
--[[Translation missing --]]
L["EQdkp-Plus XML output, tailored for Enjin import."] = "EQdkp-Plus XML output, tailored for Enjin import."
--[[Translation missing --]]
L["error_test_as_non_leader"] = "You cannot initiate a test while in a group without being the group leader."
--[[Translation missing --]]
L["Everybody is up to date."] = "Everybody is up to date."
--[[Translation missing --]]
L["Everyone have voted"] = "Everyone have voted"
--[[Translation missing --]]
L["Export"] = "Export"
--[[Translation missing --]]
L["Fake Loot"] = "Fake Loot"
--[[Translation missing --]]
L["Following items were registered in the award later list:"] = "Following items were registered in the award later list:"
--[[Translation missing --]]
L["Following winners was registered:"] = "Following winners was registered:"
--[[Translation missing --]]
L["Found the following outdated versions"] = "Found the following outdated versions"
--[[Translation missing --]]
L["Frame options"] = "Frame options"
--[[Translation missing --]]
L["Free"] = "Free"
--[[Translation missing --]]
L["Full Bags"] = "Full Bags"
--[[Translation missing --]]
L["g1"] = "g1"
--[[Translation missing --]]
L["g2"] = "g2"
--[[Translation missing --]]
L["Gave the item to you for distribution."] = "Gave the item to you for distribution."
--[[Translation missing --]]
L["General options"] = "General options"
--[[Translation missing --]]
L["Group Council Members"] = "Group Council Members"
--[[Translation missing --]]
L["group_council_members_desc"] = "Use this to add council members from another realm or guild."
--[[Translation missing --]]
L["group_council_members_head"] = "Add council members from your current group."
--[[Translation missing --]]
L["Guild Council Members"] = "Guild Council Members"
--[[Translation missing --]]
L["Hide Votes"] = "Hide Votes"
--[[Translation missing --]]
L["hide_votes_desc"] = "Only players that have already voted will be able to see votes."
--[[Translation missing --]]
L["history_export_excel_international_tip"] = "Tab delimited export for international version of Excel that uses ',' as formula delimiter."
--[[Translation missing --]]
L["history_export_sheets_tip"] = "Tab delimited export for Google Sheets and English version of Excel that uses ';' as formula delimiter."
--[[Translation missing --]]
L["How to sync"] = "How to sync"
--[[Translation missing --]]
L["huge_export_desc"] = "Huge Export. Only show first line to avoid freezing the game. Ctrl+C to copy full content."
--[[Translation missing --]]
L["Ignore List"] = "Ignore List"
--[[Translation missing --]]
L["Ignore Options"] = "Ignore Options"
--[[Translation missing --]]
L["ignore_input_desc"] = "Enter an itemID to add to the ignore list causing RCLootCouncil to never add the item to a session"
--[[Translation missing --]]
L["ignore_input_usage"] = "This function only accepts itemIDs (number), itemName or itemLink."
--[[Translation missing --]]
L["ignore_list_desc"] = "Items RCLootCouncil is ignoring. Click on a item to remove it."
--[[Translation missing --]]
L["ignore_options_desc"] = "Control which items RCLootCouncil should ignore. If you add an item that isn't cached, you need switch to another tab and back before you'll see it in the list."
--[[Translation missing --]]
L["Import"] = "Import"
--[[Translation missing --]]
L["Import aborted"] = "Import aborted"
--[[Translation missing --]]
L["import_desc"] = "Paste data here. Only show first 2500 characters to avoid freezing the game."
--[[Translation missing --]]
L["import_malformed"] = "The import was malformed (not a string)"
--[[Translation missing --]]
L["import_malformed_header"] = "Malformed header"
--[[Translation missing --]]
L["import_not_supported"] = "The import type is either very malformed or not supported."
--[[Translation missing --]]
L["Invalid selection"] = "Invalid selection"
--[[Translation missing --]]
L["Item"] = "Item"
--[[Translation missing --]]
L["'Item' is added to the award later list."] = "%s is added to the award later list."
--[[Translation missing --]]
L["Item quality is below the loot threshold"] = "Item quality is below the loot threshold"
--[[Translation missing --]]
L["Item received and added from 'player'"] = "Item received and added from %s."
--[[Translation missing --]]
L["Item was awarded to"] = "Item was awarded to"
--[[Translation missing --]]
L["Item(s) replaced:"] = "Item(s) replaced:"
--[[Translation missing --]]
L["item_in_bags_low_trade_time_remaining_reminder"] = "The following bind on pick up items in your inventory are in the award later list and have less than %s trade time remaining. To avoid this reminder, trade the item, or '/rc remove [index]' to remove the item from the list, or '/rc clear' to clear the award later list, or equip the item to make the item untradable."
--[[Translation missing --]]
L["Items stored in the loot master's bag for award later cannot be awarded later."] = "Items stored in the loot master's bag for award later cannot be awarded later."
--[[Translation missing --]]
L["Items under consideration:"] = "Items under consideration:"
--[[Translation missing --]]
L["Keep"] = "Keep"
--[[Translation missing --]]
L["Latest item(s) won"] = "Latest item(s) won"
--[[Translation missing --]]
L["Length"] = "Length"
--[[Translation missing --]]
L["Log"] = "Log"
--[[Translation missing --]]
L["log_desc"] = "Enables logging in Loot History."
--[[Translation missing --]]
L["Loot announced, waiting for answer"] = "Loot announced, waiting for answer"
--[[Translation missing --]]
L["Loot History"] = "Loot History"
--[[Translation missing --]]
L["Loot Status"] = "Loot Status"
--[[Translation missing --]]
L["Loot won:"] = "Loot won:"
--[[Translation missing --]]
L["loot_history_desc"] = [=[RCLootCouncil automatically records relevant information from sessions.
The raw data is stored in ".../SavedVariables/RCLootCouncil.lua".

Note: Non-MasterLooters can only store data sent from the MasterLooter.
]=]
--[[Translation missing --]]
L["Looted"] = "Looted"
--[[Translation missing --]]
L["Looted by:"] = "Looted by:"
--[[Translation missing --]]
L["lootFrame_error_note_required"] = "You must add a note before submitting your response - %s"
--[[Translation missing --]]
L["lootHistory_moreInfo_winnersOfItem"] = "Winners of %s:"
--[[Translation missing --]]
L["Looting options"] = "Looting options"
--[[Translation missing --]]
L["Lower Quality Limit"] = "Lower Quality Limit"
--[[Translation missing --]]
L["lower_quality_limit_desc"] = [=[Select the lower quality limit of items to auto award (this quality included!).
Note: This overrides the normal loot treshhold.]=]
--[[Translation missing --]]
L["Mainspec/Need"] = "Mainspec/Need"
--[[Translation missing --]]
L["Mass deletion of history entries."] = "Mass deletion of history entries."
--[[Translation missing --]]
L["Master Looter"] = "Master Looter"
--[[Translation missing --]]
L["master_looter_desc"] = "Note: These settings will only be used when you're the Master Looter."
--[[Translation missing --]]
L["Message"] = "Message"
--[[Translation missing --]]
L["Message for each item"] = "Message for each item"
--[[Translation missing --]]
L["message_desc"] = "The message to send to the selected channel."
--[[Translation missing --]]
L["Minimize in combat"] = "Minimize in combat"
--[[Translation missing --]]
L["Minor Upgrade"] = "Minor Upgrade"
--[[Translation missing --]]
L["Missing votes from:"] = "Missing votes from:"
--[[Translation missing --]]
L["ML sees voting"] = "ML sees voting"
--[[Translation missing --]]
L["ML_ADD_INVALID_ITEM"] = "Invalid itemLink or itemID: %s"
--[[Translation missing --]]
L["ML_ADD_ITEM_MAX_ATTEMPTS"] = "Couldn't fetch item info for %s - probably not a real item."
--[[Translation missing --]]
L["ml_sees_voting_desc"] = "Allows the Master Looter to see who's voting for whom."
--[[Translation missing --]]
L["module_tVersion_outdated_msg"] = "Newest module %s test version is: %s"
--[[Translation missing --]]
L["module_version_outdated_msg"] = "The module %s version %s is outdated. Newer version is %s."
--[[Translation missing --]]
L["Modules"] = "Modules"
--[[Translation missing --]]
L["More Info"] = "More Info"
--[[Translation missing --]]
L["more_info_desc"] = "Select how many of your responses you want to see the latest awarded items for. E.g. selecting 2 will (with default settings) show the latest awarded Mainspec and Offspec items, along with how long ago they were awarded."
--[[Translation missing --]]
L["Multi Vote"] = "Multi Vote"
--[[Translation missing --]]
L["multi_vote_desc"] = "Enables multi voting, i.e. voters can vote for several candidates."
--[[Translation missing --]]
L["'n days' ago"] = "%d days ago"
--[[Translation missing --]]
L["Never use RCLootCouncil"] = "Never use RCLootCouncil"
--[[Translation missing --]]
L["new_ml_bagged_items_reminder"] = "There are recent items in your award later list. '/rc list' to view the list, '/rc clear' to clear the list, '/rc remove [index]' to remove selected entry from the list. '/rc award' to start a session from the award later list, '/rc add' with award later checked to add the item into the list."
--[[Translation missing --]]
L["No (dis)enchanters found"] = "No (dis)enchanters found"
--[[Translation missing --]]
L["No entries in the Loot History"] = "No entries in the Loot History"
--[[Translation missing --]]
L["No entry in the award later list is removed."] = "No entry in the award later list is removed."
--[[Translation missing --]]
L["No items to award later registered"] = "No items to award later registered"
--[[Translation missing --]]
L["No recipients available"] = "No recipients available"
--[[Translation missing --]]
L["No session running"] = "No session running"
--[[Translation missing --]]
L["No winners registered"] = "No winners registered"
--[[Translation missing --]]
L["non_tradeable_reason_nil"] = "Unknown"
--[[Translation missing --]]
L["non_tradeable_reason_not_tradeable"] = "Not Tradeable"
--[[Translation missing --]]
L["non_tradeable_reason_rejected_trade"] = "Wanted to keep item"
--[[Translation missing --]]
L["Non-tradeable reason:"] = "Non-tradeable reason:"
--[[Translation missing --]]
L["Not announced"] = "Not announced"
--[[Translation missing --]]
L["Not cached, please reopen."] = "Not cached, please reopen."
--[[Translation missing --]]
L["Not Found"] = "Not Found"
--[[Translation missing --]]
L["Not in your guild"] = "Not in your guild"
--[[Translation missing --]]
L["Not installed"] = "Not installed"
--[[Translation missing --]]
L["Notes"] = "Notes"
--[[Translation missing --]]
L["Now handles looting"] = "Now handles looting"
--[[Translation missing --]]
L["Number of buttons"] = "Number of buttons"
--[[Translation missing --]]
L["Number of raids received loot from:"] = "Number of raids received loot from:"
--[[Translation missing --]]
L["Number of reasons"] = "Number of reasons"
--[[Translation missing --]]
L["Number of responses"] = "Number of responses"
--[[Translation missing --]]
L["number_of_buttons_desc"] = "Slide to change the number of buttons."
--[[Translation missing --]]
L["number_of_reasons_desc"] = "Slide to change the number of reasons."
--[[Translation missing --]]
L["Observe"] = "Observe"
--[[Translation missing --]]
L["observe_desc"] = "Allows non-council members to see the voting frame. They are not allowed to vote however."
--[[Translation missing --]]
L["Offline or RCLootCouncil not installed"] = "Offline or RCLootCouncil not installed"
--[[Translation missing --]]
L["Offspec/Greed"] = "Offspec/Greed"
--[[Translation missing --]]
L["Only use in raids"] = "Only use in raids"
--[[Translation missing --]]
L["onlyUseInRaids_desc"] = "Check to automatically disable RCLootCouncil in parties."
--[[Translation missing --]]
L["open"] = "open"
--[[Translation missing --]]
L["Open the Loot History"] = "Open the Loot History"
--[[Translation missing --]]
L["open_the_loot_history_desc"] = "Click to open the Loot History."
--[[Translation missing --]]
L["Opens the synchronizer"] = "Opens the synchronizer"
--[[Translation missing --]]
L["opt_addButton_desc"] = "Add a new button group for the selected slot."
--[[Translation missing --]]
L["opt_autoAddBoEs_desc"] = "Automatically add all BoE (Bind on Equip) items to a session."
--[[Translation missing --]]
L["opt_autoAddBoEs_name"] = "Auto Add BoEs"
--[[Translation missing --]]
L["opt_autoAddItems_desc"] = "Automatically add all eligible items to a session."
--[[Translation missing --]]
L["opt_autoAddItems_name"] = "Auto Add Items"
--[[Translation missing --]]
L["opt_autoAddPets_desc"] = "Automatically add all Companion Pets to a session."
--[[Translation missing --]]
L["opt_autoAddPets_name"] = "Add Pets"
--[[Translation missing --]]
L["opt_autoAwardPrioList_desc"] = "Items are awarded to the first candidate found in your group according to this priority list."
--[[Translation missing --]]
L["opt_autoGroupLoot_desc"] = "When enabled, RCLootCouncil will automatically click the pass and greed buttons so that all items lands in your inventory."
--[[Translation missing --]]
L["opt_autoGroupLoot_name"] = "Auto Group Loot"
--[[Translation missing --]]
L["opt_autoGroupLootGuildGroupOnly_desc"] = "When enabled, RCLootCouncil will only do group loot auto pass when you're in a guild group."
--[[Translation missing --]]
L["opt_autoGroupLootGuildGroupOnly_name"] = "Guild Groups Only"
--[[Translation missing --]]
L["opt_autoPassWeapons_desc"] = "Check to enable auto passing of weapons your class can't equip."
--[[Translation missing --]]
L["opt_autoPassWeapons_name"] = "Auto Pass Weapons"
--[[Translation missing --]]
L["opt_autoTrade_desc"] = "Check to automatically add awarded items to the trade window when trading with the winner. If disabled, you'll see a popup before items are added."
--[[Translation missing --]]
L["opt_award_later_desc"] = "Check to automatically check the 'Award Later' option in the Session Frame."
--[[Translation missing --]]
L["opt_buttonsGroup_desc"] = [=[Options group for %s buttons and responses.
See above for a detailed explanation.]=]
--[[Translation missing --]]
L["opt_chatFrameName_desc"] = "Select which chat frame you want RCLootCouncil to output information to."
--[[Translation missing --]]
L["opt_chatFrameName_name"] = "Chat Frame"
--[[Translation missing --]]
L["opt_closeWithEscape_desc"] = "When enabled, all non-critical RCLootCouncil frames can be closed by pressing 'Escape'. (Requires reload to take effect on already created frames)"
--[[Translation missing --]]
L["opt_closeWithEscape_name"] = "Escape Close"
--[[Translation missing --]]
L["opt_deleteDate_confirm"] = [=[Are you sure you want to delete everything older than the selected?
This cannot be undone.]=]
--[[Translation missing --]]
L["opt_deleteDate_desc"] = "Delete anything older than the selected number of days."
--[[Translation missing --]]
L["opt_deleteName_confirm"] = [=[Are you sure you want to delete all entries from %s?
This cannot be undone.]=]
--[[Translation missing --]]
L["opt_deleteName_desc"] = "Delete all entries from the selected candidate."
--[[Translation missing --]]
L["opt_deletePatch_confirm"] = [=[Are you sure you want to delete everything older than the selected patch?
 This cannot be undone.]=]
--[[Translation missing --]]
L["opt_deletePatch_desc"] = "Delete all entries added before the selected patch."
--[[Translation missing --]]
L["opt_deleteRaid_confirm"] = [=[Are you sure you want to delete all entries from the selected instance?
This cannot be undone.]=]
--[[Translation missing --]]
L["opt_deleteRaid_desc"] = "Delete all entries from a specific instance."
--[[Translation missing --]]
L["opt_moreButtons_desc"] = "Add a new set of buttons for a specific gear slot. The most specific type is used, i.e. adding buttons for 'Head' and 'Catalyst Items' will make head type armor use the head buttons instead of catalyst."
--[[Translation missing --]]
L["opt_printCompletedTrade_Desc"] = "Check to enable a message every time a candidate trades an awarded item to the winner."
--[[Translation missing --]]
L["opt_printCompletedTrade_Name"] = "Trade Messages"
--[[Translation missing --]]
L["opt_profileSharing_export_desc"] = "Export your current profile."
--[[Translation missing --]]
L["opt_profileSharing_fail_noProfileData"] = "Data is not profile data. Ensure imported data originates from profile export."
--[[Translation missing --]]
L["opt_profileSharing_import_desc"] = "Import a new RCLootCouncil profile. Imports are non-destructive, unless you're overwriting an existing profile."
--[[Translation missing --]]
L["opt_profileSharing_profileExistsWarning"] = "A profile named \"%s\" already exists - do you want to overwrite it?"
--[[Translation missing --]]
L["opt_rejectTrade_Desc"] = "Check to enable candidates to choose whether they want to 'give' the item to the council or not. If unchecked, all tradeable PL items are added automatically."
--[[Translation missing --]]
L["opt_rejectTrade_Name"] = "Allow Keeping"
--[[Translation missing --]]
L["opt_savePersonalLoot_desc"] = "If disabled, personal loot will not be added to the history."
--[[Translation missing --]]
L["opt_savePersonalLoot_name"] = "Record Personal Loot"
--[[Translation missing --]]
L["opt_sharingProfile_success"] = "Succesfully imported profile: \"%s\""
--[[Translation missing --]]
L["opt_skipSessionFrame_desc"] = "Skips the Session Frame. NOTE: This causes the addon to start a session with all eligble items without you having a chance to edit the list!"
--[[Translation missing --]]
L["opt_skipSessionFrame_name"] = "Skip Session Frame"
--[[Translation missing --]]
L["opt_timeoutFlash_desc"] = "When enabled, the loot frame will flash when there's 5 seconds left to the item timeouts."
--[[Translation missing --]]
L["opt_timeoutFlash_name"] = "Timeout Flash"
--[[Translation missing --]]
L["opt_usage_AskGroupLoot"] = "Ask me every time Group Loot is enabled"
--[[Translation missing --]]
L["opt_usage_GroupLoot"] = "Always use RCLootCouncil with Group Loot"
--[[Translation missing --]]
L["opt_useSlashRC_desc"] = "Disable this if you want to restore '/rc' to ready check. RCLootCouncil commands are still available with '/rclc'. A '/reload' is required for this to take effect."
--[[Translation missing --]]
L["opt_useSlashRC_name"] = "Use /rc"
--[[Translation missing --]]
L["options_autoAwardBoE_desc"] = "Enable to automatically award all epic BoE (Bind on Equip) items to a specific person for the selected reason."
--[[Translation missing --]]
L["options_autoAwardBoE_name"] = "Auto Award BoE's"
--[[Translation missing --]]
L["options_ml_outOfRaid_desc"] = "When enabled, while in a group of 8 or more members, anyone that isn't in an instance when a session starts will automatically send an 'Out of Raid' response."
--[[Translation missing --]]
L["options_ml_outOfRaid_name"] = "Out of Raid Support"
--[[Translation missing --]]
L["options_requireNotes_desc"] = "If enabled, candidates cannot submit their response without having entered a note."
--[[Translation missing --]]
L["Original Owner"] = "Original Owner"
--[[Translation missing --]]
L["Out of instance"] = "Out of instance"
--[[Translation missing --]]
L["Patch"] = "Patch"
--[[Translation missing --]]
L["Personal Loot - Non tradeable"] = "Personal Loot - Non tradeable"
--[[Translation missing --]]
L["Personal Loot - Rejected Trade"] = "Personal Loot - Rejected Trade"
--[[Translation missing --]]
L["'player' can't receive 'type'"] = "%s can't receive %s - version mismatch?"
--[[Translation missing --]]
L["'player' declined your sync request"] = "%s declined your sync request"
--[[Translation missing --]]
L["'player' has asked you to reroll"] = "%s has asked you to reroll"
--[[Translation missing --]]
L["'player' has ended the session"] = "%s has ended the session"
--[[Translation missing --]]
L["'player' has rolled 'roll' for: 'item'"] = "%s has rolled %d for: %s"
--[[Translation missing --]]
L["'player' hasn't opened the sync window"] = "%s hasn't opened the sync window (/rc sync)"
--[[Translation missing --]]
L["Player is ineligible for this item"] = "Player is ineligible for this item"
--[[Translation missing --]]
L["Player is not in the group"] = "Player is not in the group"
--[[Translation missing --]]
L["Player is not in this instance"] = "Player is not in this instance"
--[[Translation missing --]]
L["Player is offline"] = "Player is offline"
--[[Translation missing --]]
L["Please wait a few seconds until all data has been synchronized."] = "Please wait a few seconds until all data has been synchronized."
--[[Translation missing --]]
L["Please wait before trying to sync again."] = "Please wait before trying to sync again."
--[[Translation missing --]]
L["Print Responses"] = "Print Responses"
--[[Translation missing --]]
L["print_response_desc"] = "Print your response in the chat window"
--[[Translation missing --]]
L["Protector Token"] = "Protector Token"
--[[Translation missing --]]
L["Raw lua output. Doesn't work well with date selection."] = "Raw lua output. Doesn't work well with date selection."
--[[Translation missing --]]
L["rcframe_help"] = [=[Double click here to minimize
Click and drag to move
Ctrl+scroll to change scale]=]
--[[Translation missing --]]
L["RCLootCouncil - Synchronizer"] = "RCLootCouncil - Synchronizer"
--[[Translation missing --]]
L["RCLootCouncil Loot Frame"] = "RCLootCouncil Loot Frame"
--[[Translation missing --]]
L["RCLootCouncil Loot History"] = "RCLootCouncil Loot History"
--[[Translation missing --]]
L["RCLootCouncil Session Setup"] = "RCLootCouncil Session Setup"
--[[Translation missing --]]
L["RCLootCouncil Version Checker"] = "RCLootCouncil Version Checker"
--[[Translation missing --]]
L["RCLootCouncil Voting Frame"] = "RCLootCouncil Voting Frame"
--[[Translation missing --]]
L["rclootcouncil_trade_add_item_confirm"] = "RCLootCouncil detects %d tradable items in your bags are awarded to %s. Do you want to add the items to the trade window?"
--[[Translation missing --]]
L["Reannounce ..."] = "Reannounce ..."
--[[Translation missing --]]
L["Reannounced 'item' to 'target'"] = "Reannounced %s to %s"
--[[Translation missing --]]
L["Reason"] = "Reason"
--[[Translation missing --]]
L["reason_desc"] = "The award reason to add to the Loot History when auto awarding."
--[[Translation missing --]]
L["Remove All"] = "Remove All"
--[[Translation missing --]]
L["Remove from consideration"] = "Remove from consideration"
--[[Translation missing --]]
L["remove_all_desc"] = "Remove all council members"
--[[Translation missing --]]
L["Requested rolls for 'item' from 'target'"] = "Requested rolls for %s from %s"
--[[Translation missing --]]
L["Require Notes"] = "Require Notes"
--[[Translation missing --]]
L["Reset Skin"] = "Reset Skin"
--[[Translation missing --]]
L["Reset skins"] = "Reset skins"
--[[Translation missing --]]
L["reset_announce_to_default_desc"] = "Resets all the announcement options to default"
--[[Translation missing --]]
L["reset_buttons_to_default_desc"] = "Resets all the buttons, colors and responses to default"
--[[Translation missing --]]
L["reset_skin_desc"] = "Resets all colors and background to the current skin."
--[[Translation missing --]]
L["reset_skins_desc"] = "Reset the default skins."
--[[Translation missing --]]
L["reset_to_default_desc"] = "Resets the award reasons to default."
--[[Translation missing --]]
L["Response"] = "Response"
--[[Translation missing --]]
L["Response color"] = "Response color"
--[[Translation missing --]]
L["Response isn't available. Please upgrade RCLootCouncil."] = "Response isn't available. Please upgrade RCLootCouncil."
--[[Translation missing --]]
L["Response options"] = "Response options"
--[[Translation missing --]]
L["Response to 'item'"] = "Response to %s"
--[[Translation missing --]]
L["Response to 'item' acknowledged as 'response'"] = "Response to %s acknowledged as \" %s \""
--[[Translation missing --]]
L["response_color_desc"] = "Set a color for the response."
--[[Translation missing --]]
L["response_NOTELIGIBLE"] = "Not eligible for this item"
--[[Translation missing --]]
L["Responses"] = "Responses"
--[[Translation missing --]]
L["Responses from Chat"] = "Responses from Chat"
--[[Translation missing --]]
L["responses_from_chat_desc"] = [=[In case someone haven't installed the addon (Button 1 is used if no keyword is specified).
Example: "/w ML_NAME 1 greed [ITEM]" would by default show up as you greeding on the first item in the session.
Below you can choose keywords for the individual buttons. Only A-Z, a-z and 0-9 is accepted for keywords, everything else is considered a seperation.
Players can recieve the keyword list by messaging 'rchelp' to the Master Looter once the addon is enabled (i.e. in a raid).]=]
--[[Translation missing --]]
L["Save Skin"] = "Save Skin"
--[[Translation missing --]]
L["save_skin_desc"] = "Enter a name for your skin and hit 'okay' to save it. Note you can overwrite any non default skin."
--[[Translation missing --]]
L["Self Vote"] = "Self Vote"
--[[Translation missing --]]
L["self_vote_desc"] = "Enables voters to vote for themselves."
--[[Translation missing --]]
L["Send History"] = "Send History"
--[[Translation missing --]]
L["Send to Guild"] = "Send to Guild"
--[[Translation missing --]]
L["send_history_desc"] = "Send data to everyone in the raid, regardless if you log it yourself. RCLootCouncil will only send data if you're the MasterLooter."
--[[Translation missing --]]
L["send_to_guild_desc"] = "Send history to guild members instead of your group. Useful if you're running multiple raid groups and want a combined history for your guild. The downside is non-guild members in your group won't register your history entries."
--[[Translation missing --]]
L["Sending 'type' to 'player'..."] = "Sending %s to %s..."
--[[Translation missing --]]
L["Sent whisper help to 'player'"] = "Sent whisper help to %s"
--[[Translation missing --]]
L["session_error"] = "Something went wrong - please restart the session"
--[[Translation missing --]]
L["session_help_from_bag"] = "After the session ends, you can use '/rc winners' to see who you should trade the items to."
--[[Translation missing --]]
L["session_help_not_direct"] = "Items in this session are not given to the candidates directly. Items needs to be traded."
--[[Translation missing --]]
L["Set the text for button i's response."] = "Set the text for button %d's response'"
--[[Translation missing --]]
L["Set the text on button 'number'"] = "Set the text on button %i"
--[[Translation missing --]]
L["Set the whisper keys for button i."] = "Set the whisper keys for button %d."
--[[Translation missing --]]
L["Show Spec Icon"] = "Show Spec Icon"
--[[Translation missing --]]
L["show_spec_icon_desc"] = "Check to replace candidates' class icons with their spec icon, if available."
--[[Translation missing --]]
L["Silent Auto Pass"] = "Silent Auto Pass"
--[[Translation missing --]]
L["silent_auto_pass_desc"] = "Check to hide autopass messages"
--[[Translation missing --]]
L["Simple BBCode output."] = "Simple BBCode output."
--[[Translation missing --]]
L["Skins"] = "Skins"
--[[Translation missing --]]
L["skins_description"] = "Select one of the default skins or create your own. Note this is purely aesthetic. Open the version checker to see the results right away ('/rc version')."
--[[Translation missing --]]
L["Slot"] = "Slot"
--[[Translation missing --]]
L["Socket"] = "Socket"
--[[Translation missing --]]
L["Something went wrong :'("] = "Something went wrong :'("
--[[Translation missing --]]
L["Something went wrong during syncing, please try again."] = "Something went wrong during syncing, please try again."
--[[Translation missing --]]
L["Sort Items"] = "Sort Items"
--[[Translation missing --]]
L["sort_items_desc"] = "Sort sessions by item type and item level."
--[[Translation missing --]]
L["Standard .csv output."] = "Standard CSV export that can be edited and reimported."
--[[Translation missing --]]
L["Standard JSON output."] = "JSON array containing one JSON object per history entry."
--[[Translation missing --]]
L["Status texts"] = "Status texts"
--[[Translation missing --]]
L["Stop"] = "Stop"
--[[Translation missing --]]
L["Store in bag and award later"] = "Store in bag and award later"
--[[Translation missing --]]
L["Succesfully deleted %d entries"] = "Succesfully deleted %d entries"
--[[Translation missing --]]
L["Succesfully deleted %d entries from %s"] = "Succesfully deleted %d entries from %s"
--[[Translation missing --]]
L["Successfully imported 'number' entries."] = "Successfully imported %d entries."
--[[Translation missing --]]
L["Successfully received 'type' from 'player'"] = "Successfully received %s from %s."
--[[Translation missing --]]
L["Sync"] = "Sync"
--[[Translation missing --]]
L["sync_detailed_description"] = [=[
1. Both of you should have the sync frame open (/rc sync).
2. Select the type of data you want to send.
3. Select the player you want to receive the data.
4. Hit 'Sync' - you'll now see a statusbar with the data being sent.

This window needs to be open to initiate a sync,
but closing it won't stop a sync in progress.

Targets include online guild- and groupmembers, friends and your current friendly target.]=]
--[[Translation missing --]]
L["sync_warning1"] = "Note: Syncing large amounts of data in game can be very slow (especially the loot history)."
--[[Translation missing --]]
L["sync_warning2"] = "Settings and loot history can both be exported/imported as an alternative - see '/rc profile' and/or '/rc history' respectively."
--[[Translation missing --]]
L["test"] = "test"
--[[Translation missing --]]
L["Test"] = "Test"
--[[Translation missing --]]
L["test_desc"] = "Click to emulate master looting items for yourself and anyone in your raid."
--[[Translation missing --]]
L["Text color"] = "Text color"
--[[Translation missing --]]
L["Text for reason #i"] = "Text for reason #"
--[[Translation missing --]]
L["text_color_desc"] = "Color of the text when displayed."
--[[Translation missing --]]
L["The award later list has been cleared."] = "The award later list has been cleared."
--[[Translation missing --]]
L["The award later list is empty."] = "The award later list is empty."
--[[Translation missing --]]
L["The following council members have voted"] = "The following council members have voted"
--[[Translation missing --]]
L["The following entries are removed from the award later list:"] = "The following entries are removed from the award later list:"
--[[Translation missing --]]
L["The following items are removed from the award later list and traded to 'player'"] = "The following items are removed from the award later list and are traded to %s"
--[[Translation missing --]]
L["The item can only be looted by you but it is not bind on pick up"] = "The item can only be looted by you but it is not bind on pick up"
--[[Translation missing --]]
L["The item will be awarded later"] = "The item will be awarded later"
--[[Translation missing --]]
L["The item would now be awarded to 'player'"] = "The item would now be awarded to %s"
--[[Translation missing --]]
L["The loot is already on the list"] = "The loot is already on the list"
--[[Translation missing --]]
L["The loot master"] = "The loot master"
--[[Translation missing --]]
L["The Master Looter doesn't allow multiple votes."] = "The Master Looter doesn't allow multiple votes."
--[[Translation missing --]]
L["The Master Looter doesn't allow votes for yourself."] = "The Master Looter doesn't allow votes for yourself."
--[[Translation missing --]]
L["The session has ended."] = "The session has ended."
--[[Translation missing --]]
L["This item"] = "This item"
--[[Translation missing --]]
L["This item has been awarded"] = "This item has been awarded"
--[[Translation missing --]]
L["Tier 19"] = "Tier 19"
--[[Translation missing --]]
L["Tier 20"] = "Tier 20"
--[[Translation missing --]]
L["Tier 21"] = "Tier 21"
--[[Translation missing --]]
L["Tier Tokens ..."] = "Tier Tokens ..."
--[[Translation missing --]]
L["Tier tokens received from here:"] = "Tier tokens received from here:"
--[[Translation missing --]]
L["tier_token_heroic"] = "Heroic"
--[[Translation missing --]]
L["tier_token_mythic"] = "Mythic"
--[[Translation missing --]]
L["tier_token_normal"] = "Normal"
--[[Translation missing --]]
L["Time"] = "Time"
--[[Translation missing --]]
L["time_remaining_warning"] = "Warning - The following items in your bags cannot be traded in less than %d minutes:"
--[[Translation missing --]]
L["Timeout"] = "Timeout"
--[[Translation missing --]]
L["Timeout when giving 'item' to 'player'"] = "Timeout when giving %s to %s"
--[[Translation missing --]]
L["To target"] = "To target"
--[[Translation missing --]]
L["Tokens received"] = "Tokens received"
--[[Translation missing --]]
L["Total awards"] = "Total awards"
--[[Translation missing --]]
L["Total items received:"] = "Total items received:"
--[[Translation missing --]]
L["Total items won:"] = "Total items won:"
--[[Translation missing --]]
L["trade_complete_message"] = "%s traded %s to %s."
--[[Translation missing --]]
L["trade_item_to_trade_not_found"] = "WARNING: Item to trade: %s couldn't be found in your inventory!"
--[[Translation missing --]]
L["trade_wrongwinner_message"] = "WARNING: %s traded %s to %s instead of %s!"
--[[Translation missing --]]
L["tVersion_outdated_msg"] = "Newest RCLootCouncil test version is: %s"
--[[Translation missing --]]
L["Unable to give 'item' to 'player'"] = "Unable to give %s to %s"
--[[Translation missing --]]
L["Unable to give 'item' to 'player' - (player offline, left group or instance?)"] = "Unable to give %s to %s - (player offline, left group or instance?)"
--[[Translation missing --]]
L["Unable to give out loot without the loot window open."] = "Unable to give out loot without the loot window open."
--[[Translation missing --]]
L["Unawarded"] = "Unawarded"
--[[Translation missing --]]
L["Unguilded"] = "Unguilded"
--[[Translation missing --]]
L["Unknown date"] = "Unknown date"
--[[Translation missing --]]
L["Unknown/Chest"] = "Unknown/Chest"
--[[Translation missing --]]
L["Unlooted"] = "Unlooted"
--[[Translation missing --]]
L["Unvote"] = "Unvote"
--[[Translation missing --]]
L["Upper Quality Limit"] = "Upper Quality Limit"
--[[Translation missing --]]
L["upper_quality_limit_desc"] = [=[Select the upper quality limit of items to auto award (this quality included!).
Note: This overrides the normal loot treshhold.]=]
L["Usage"] = "Uso"
L["Usage Options"] = "Opciones de uso"
--[[Translation missing --]]
L["Vanquisher Token"] = "Vanquisher Token"
--[[Translation missing --]]
L["version"] = "version"
--[[Translation missing --]]
L["Version"] = "Version"
--[[Translation missing --]]
L["Version Check"] = "Version Check"
--[[Translation missing --]]
L["version_check_desc"] = "Opens the version checker module."
--[[Translation missing --]]
L["version_outdated_msg"] = "Your version %s is outdated. Newer version is %s, please update RCLootCouncil."
--[[Translation missing --]]
L["Vote"] = "Vote"
--[[Translation missing --]]
L["Voters"] = "Voters"
--[[Translation missing --]]
L["Votes"] = "Votes"
--[[Translation missing --]]
L["Voting options"] = "Voting options"
--[[Translation missing --]]
L["Waiting for response"] = "Waiting for response"
--[[Translation missing --]]
L["whisper_guide"] = "[RCLootCouncil]: number response [item1] [item2]. Link your item(s) that item (number) would replace, (response) being of the keywords below: Ex. '1 Greed [item1]' would greed on item #1"
--[[Translation missing --]]
L["whisper_guide2"] = "[RCLootCouncil]: You'll get a confirmation message if you were successfully added."
--[[Translation missing --]]
L["whisper_help"] = [=[Raiders can use the whisper system in case someone haven't installed the addon.
Whispering 'rchelp' to the Master Looter will get them a guide along with the list of keywords, which can be edited at the 'Buttons and Responses' optiontab.
It's recommended for the ML to turn on 'Announce Considerations' as each item's number is required to use the whisper system.
NOTE: People should still get the addon installed, otherwise all player information won't be available.]=]
--[[Translation missing --]]
L["whisperKey_greed"] = "greed, offspec, os, 2"
--[[Translation missing --]]
L["whisperKey_minor"] = "minorupgrade, minor, 3"
--[[Translation missing --]]
L["whisperKey_need"] = "need, mainspec, ms, 1"
--[[Translation missing --]]
L["Windows reset"] = "Windows reset"
--[[Translation missing --]]
L["winners"] = "winners"
--[[Translation missing --]]
L["x days"] = "%d days"
--[[Translation missing --]]
L["x out of x have voted"] = "%d out of %d have voted"
--[[Translation missing --]]
L["You are not allowed to see the Voting Frame right now."] = "You are not allowed to see the Voting Frame right now."
--[[Translation missing --]]
L["You are not in an instance"] = "You are not in an instance"
--[[Translation missing --]]
L["You can only auto award items with a quality lower than 'quality' to yourself due to Blizaard restrictions"] = "You can only auto award items with a quality lower than %s to yourself due to Blizzard restrictions"
--[[Translation missing --]]
L["You cannot start an empty session."] = "You cannot start an empty session."
--[[Translation missing --]]
L["You cannot use the menu when the session has ended."] = "You cannot use the menu when the session has ended."
--[[Translation missing --]]
L["You cannot use this command without being the Master Looter"] = "You cannot use this command without being the Master Looter"
--[[Translation missing --]]
L["You can't start a loot session while in combat."] = "You can't start a loot session while in combat."
--[[Translation missing --]]
L["You can't start a session before all items are loaded!"] = "You can't start a session before all items are loaded!"
--[[Translation missing --]]
L["You haven't selected an award reason to use for disenchanting!"] = "You haven't selected an award reason to use for disenchanting!"
--[[Translation missing --]]
L["You haven't set a council! You can edit your council by typing '/rc council'"] = "You haven't set a council! You can edit your council by typing '/rc council'"
--[[Translation missing --]]
L["You must select a target"] = "You must select a target"
--[[Translation missing --]]
L["Your note:"] = "Your note:"
--[[Translation missing --]]
L["You're already running a session."] = "You're already running a session."

