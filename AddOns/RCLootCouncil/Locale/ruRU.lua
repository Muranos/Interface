-- Translate RCLootCouncil to your language at:
-- http://wow.curseforge.com/addons/rclootcouncil/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("RCLootCouncil", "ruRU")
if not L then return end

L[" is not active in this raid."] = "не участвует в текущем рейде."
L[" you are now the Master Looter and RCLootCouncil is now handling looting."] = "вы теперь Ответственный за Добычу и RCLootCouncil теперь занимается распределением добычи."
L["&p was awarded with &i for &r!"] = "&p получил &i для &r!"
--[[Translation missing --]]
--[[ L["A format to copy/paste to another player."] = ""--]] 
L["A new session has begun, type '/rc open' to open the voting frame."] = "Новая сессия запущена, введите '/rc open' для открытия окна голосования."
--[[Translation missing --]]
--[[ L["A tab delimited output for Excel. Might work with other spreadsheets."] = ""--]] 
L["Abort"] = "Сбросить"
L["Accept Whispers"] = "Принимать Личные сообщения"
--[[Translation missing --]]
--[[ L["accept_whispers_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Accepted imports: 'Player Export' and 'CSV'"] = ""--]] 
--[[Translation missing --]]
--[[ L["Active"] = ""--]] 
--[[Translation missing --]]
--[[ L["active_desc"] = ""--]] 
L["Add Item"] = "Добавить Предмет"
L["Add Note"] = "Добавить Заметку"
L["Add ranks"] = "Добавить ранги"
--[[Translation missing --]]
--[[ L["Add rolls"] = ""--]] 
L["Add Rolls"] = "Добавить броски"
L["add_ranks_desc"] = "Выберите минимальный ранг для участия в распределении добычи"
--[[Translation missing --]]
--[[ L["add_ranks_desc2"] = ""--]] 
--[[Translation missing --]]
--[[ L["add_rolls_desc"] = ""--]] 
L["Additional Buttons"] = "Дополнительные кнопки"
L["All items"] = "Все предметы"
--[[Translation missing --]]
--[[ L["All items have been awarded and the loot session concluded"] = ""--]] 
--[[Translation missing --]]
--[[ L["All items usable by the candidate"] = ""--]] 
--[[Translation missing --]]
--[[ L["All unawarded items"] = ""--]] 
--[[Translation missing --]]
--[[ L["Alt click Looting"] = ""--]] 
--[[Translation missing --]]
--[[ L["alt_click_looting_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Alternatively, flag the loot as award later."] = ""--]] 
L["Always show owner"] = "Всегда показывать владельца"
--[[Translation missing --]]
--[[ L["Always use RCLootCouncil with Personal Loot"] = ""--]] 
--[[Translation missing --]]
--[[ L["always_show_tooltip_howto"] = ""--]] 
L["Announce Awards"] = "Огласить награды"
--[[Translation missing --]]
--[[ L["Announce Considerations"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_&i_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_&l_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_&m_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_&n_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_&o_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_&p_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_&r_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_&s_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_&t_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_awards_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_awards_desc2"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_considerations_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_considerations_desc2"] = ""--]] 
--[[Translation missing --]]
--[[ L["announce_item_string_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Announcements"] = ""--]] 
L["Anonymous Voting"] = "Анонимное Голосование"
L["anonymous_voting_desc"] = "Включить анонимное голосование (т.е. люди не видят кто за что проголосовал)"
L["Append realm names"] = "Добавлять названия игровых миров"
L["Are you sure you want to abort?"] = "Вы уверены, что хотите отменить?"
L["Are you sure you want to give #item to #player?"] = "Вы уверены, что хотите передать %s персонажу %s?"
--[[Translation missing --]]
--[[ L["Are you sure you want to reannounce all unawarded items to %s?"] = ""--]] 
--[[Translation missing --]]
--[[ L["Are you sure you want to request rolls for all unawarded items from %s?"] = ""--]] 
--[[Translation missing --]]
--[[ L["Armor Token"] = ""--]] 
--[[Translation missing --]]
--[[ L["Ask me every time Personal Loot is enabled"] = ""--]] 
L["Auto Award"] = "Автоматическое Вручение"
L["Auto Award to"] = "Автоматически Вручать"
--[[Translation missing --]]
--[[ L["Auto awarded 'item'"] = ""--]] 
L["Auto Close"] = "Автоматически закрывать"
--[[Translation missing --]]
--[[ L["Auto Enable"] = ""--]] 
--[[Translation missing --]]
--[[ L["Auto extracted from whisper"] = ""--]] 
L["Auto Open"] = "Автоматически открывать"
--[[Translation missing --]]
--[[ L["Auto Pass"] = ""--]] 
--[[Translation missing --]]
--[[ L["Auto pass BoE"] = ""--]] 
--[[Translation missing --]]
--[[ L["Auto Pass Trinkets"] = ""--]] 
--[[Translation missing --]]
--[[ L["Auto Start"] = ""--]] 
--[[Translation missing --]]
--[[ L["Auto Trade"] = ""--]] 
L["auto_award_desc"] = "Включить автоматическое распределение"
L["auto_award_to_desc"] = "Игроки для автоматического распределения. Список игроков для выбора появляется если вы в рейдовой группе."
--[[Translation missing --]]
--[[ L["auto_close_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_enable_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_loot_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_open_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_pass_boe_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_pass_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_pass_trinket_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_start_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Autoloot all BoE"] = ""--]] 
L["Autoloot BoE"] = "Автосбор БОЕ-предметов"
--[[Translation missing --]]
--[[ L["autoloot_BoE_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["autoloot_others_BoE_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["autoloot_others_item_combat"] = ""--]] 
L["Autopass"] = "Автопас"
--[[Translation missing --]]
--[[ L["Autopassed on 'item'"] = ""--]] 
--[[Translation missing --]]
--[[ L["Autostart isn't supported when testing"] = ""--]] 
--[[Translation missing --]]
--[[ L["award"] = ""--]] 
L["Award"] = "Вручить"
--[[Translation missing --]]
--[[ L["Award Announcement"] = ""--]] 
L["Award for ..."] = "Вручить для..."
L["Award later"] = "Наградить позже"
--[[Translation missing --]]
--[[ L["Award later isn't supported when testing."] = ""--]] 
--[[Translation missing --]]
--[[ L["Award later?"] = ""--]] 
L["Award Reasons"] = "Причина Вручения"
L["award_reasons_desc"] = [=[Причины вручения, которые не могут быть выбраны во время ролла.
Используется при изменении ответа в меню по правой кнопки мыши, и для автоматического вручения.]=]
--[[Translation missing --]]
--[[ L["Awarded"] = ""--]] 
--[[Translation missing --]]
--[[ L["Awarded item cannot be awarded later."] = ""--]] 
L["Awards"] = "Награды"
L["Azerite Armor"] = "Азеритовая броня"
L["Background"] = "Фон"
L["Background Color"] = "Цвет фона"
L["Banking"] = "В банк"
--[[Translation missing --]]
--[[ L["BBCode export, tailored for SMF."] = ""--]] 
L["Border"] = "Граница"
L["Border Color"] = "Цвет границы"
L["Button"] = "Кнопка"
--[[Translation missing --]]
--[[ L["Buttons and Responses"] = ""--]] 
--[[Translation missing --]]
--[[ L["buttons_and_responses_desc"] = ""--]] 
L["Candidate didn't respond on time"] = "Кандидат не ответил вовремя"
L["Candidate has disabled RCLootCouncil"] = "Кандидат отключил RCLootCouncil"
L["Candidate is not in the instance"] = "Кандидат отсутствует в подземелье  "
L["Candidate is selecting response, please wait"] = "Кандидат делает выбор, пожалуйста подождите"
L["Candidate removed"] = "Кандидат удален"
L["Candidates that can't use the item"] = "Кандидаты которые не могут использовать предмет"
--[[Translation missing --]]
--[[ L["Cannot autoaward:"] = ""--]] 
--[[Translation missing --]]
--[[ L["Cannot give 'item' to 'player' due to Blizzard limitations. Gave it to you for distribution."] = ""--]] 
--[[Translation missing --]]
--[[ L["Change Award"] = ""--]] 
--[[Translation missing --]]
--[[ L["Change Response"] = ""--]] 
L["Changing loot threshold to enable Auto Awarding"] = "Измените порог распределения добычи, чтобы включить Автоматическое Вручение"
L["Changing LootMethod to Master Looting"] = "Разделение добычи производится по системе Ответственный за добычу."
--[[Translation missing --]]
--[[ L["channel_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Chat print"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat tVersion string"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat version String"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_cmd_add_invalid_owner"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_add"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_award"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_config"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_council"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_history"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_open"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_reset"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_sync"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_test"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_version"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_whisper"] = ""--]] 
--[[Translation missing --]]
--[[ L["chat_commands_winners"] = ""--]] 
--[[Translation missing --]]
--[[ L["Check this to loot the items and distribute them later."] = ""--]] 
--[[Translation missing --]]
--[[ L["Check to append the realmname of a player from another realm"] = ""--]] 
--[[Translation missing --]]
--[[ L["Check to have all frames minimize when entering combat"] = ""--]] 
--[[Translation missing --]]
--[[ L["Choose timeout length in seconds"] = ""--]] 
--[[Translation missing --]]
--[[ L["Choose when to use RCLootCouncil"] = ""--]] 
L["Clear Loot History"] = "Очистить историю лута"
--[[Translation missing --]]
--[[ L["Clear Selection"] = ""--]] 
--[[Translation missing --]]
--[[ L["clear_loot_history_desc"] = ""--]] 
L["Click to add note to send to the council."] = "Нажмите что бы добавить записку для консула."
L["Click to change your note."] = "Нажмите для изменения записки."
L["Click to expand/collapse more info"] = "Нажмите что бы развернуть/свернуть информацию"
L["Click to switch to 'item'"] = "Нажмите чтобы переключиться на %s"
L["config"] = "настройка"
--[[Translation missing --]]
--[[ L["confirm_award_later_text"] = ""--]] 
--[[Translation missing --]]
--[[ L["confirm_usage_text"] = ""--]] 
--[[Translation missing --]]
--[[ L["Conqueror Token"] = ""--]] 
--[[Translation missing --]]
--[[ L["Corruption if awarded:"] = ""--]] 
--[[Translation missing --]]
--[[ L["Could not Auto Award i because the Loot Threshold is too high!"] = ""--]] 
--[[Translation missing --]]
--[[ L["Could not find 'player' in the group."] = ""--]] 
L["Couldn't find any councilmembers in the group"] = "Члены консула в группе не найдены"
L["council"] = "совет"
L["Council"] = "Консул"
L["Current Council"] = "Текущий Консул"
L["current_council_desc"] = "Нажмите, чтобы удалить определенных людей из совета"
--[[Translation missing --]]
--[[ L["Customize appearance"] = ""--]] 
--[[Translation missing --]]
--[[ L["customize_appearance_desc"] = ""--]] 
L["Data Received"] = "Данные получены"
L["Date"] = "Дата"
L["days and x months"] = "%s и %d месяцев"
L["days, x months, y years"] = "%s, %d месяцев и %d лет"
L["Delete Skin"] = "Удалить скин"
--[[Translation missing --]]
--[[ L["delete_skin_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Deselect responses to filter them"] = ""--]] 
L["Diff"] = "Илвл"
--[[Translation missing --]]
--[[ L["Discord friendly output."] = ""--]] 
--[[Translation missing --]]
--[[ L["disenchant_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Do you want to keep %s for yourself or trade?"] = ""--]] 
L["Do you want to keep %s for yourself?"] = "Вы хотите оставить %s себе?"
--[[Translation missing --]]
--[[ L["Done syncing"] = ""--]] 
--[[Translation missing --]]
--[[ L["Double click to delete this entry."] = ""--]] 
--[[Translation missing --]]
--[[ L["Dropped by:"] = ""--]] 
--[[Translation missing --]]
--[[ L["Edit Entry"] = ""--]] 
L["Enable Loot History"] = "Включить Историю Лута"
--[[Translation missing --]]
--[[ L["Enable Timeout"] = ""--]] 
L["enable_loot_history_desc"] = "Включает ведение истории. RCLootCouncil не будет ничего записывать если отключено."
--[[Translation missing --]]
--[[ L["enable_timeout_desc"] = ""--]] 
L["Enter your note:"] = "Введите вашу записку:"
--[[Translation missing --]]
--[[ L["EQdkp-Plus XML output, tailored for Enjin import."] = ""--]] 
--[[Translation missing --]]
--[[ L["error_test_as_non_leader"] = ""--]] 
--[[Translation missing --]]
--[[ L["Everybody is up to date."] = ""--]] 
L["Everyone have voted"] = "Все проголосовали"
L["Export"] = "Экспорт"
--[[Translation missing --]]
--[[ L["Fake Loot"] = ""--]] 
--[[Translation missing --]]
--[[ L["Following items were registered in the award later list:"] = ""--]] 
--[[Translation missing --]]
--[[ L["Following winners was registered:"] = ""--]] 
--[[Translation missing --]]
--[[ L["Found the following outdated versions"] = ""--]] 
--[[Translation missing --]]
--[[ L["Frame options"] = ""--]] 
L["Free"] = "Бесплатно"
L["Full Bags"] = "Полные сумки"
L["g1"] = "п1"
L["g2"] = "п2"
--[[Translation missing --]]
--[[ L["Gave the item to you for distribution."] = ""--]] 
L["General options"] = "Основные опции"
L["Group Council Members"] = "Групповые Участники Консула"
L["group_council_members_desc"] = "Используйте это, чтобы добавить членов совета с другого сервера или гильдии."
L["group_council_members_head"] = "Добавить члена совета из текущей группы."
L["Guild Council Members"] = "Гильдейские Участники Консула"
L["Hide Votes"] = "Скрыть Голоса"
L["hide_votes_desc"] = "Только проголосовавшие игроки могут видеть результаты голосования"
--[[Translation missing --]]
--[[ L["How to sync"] = ""--]] 
--[[Translation missing --]]
--[[ L["huge_export_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Ignore List"] = ""--]] 
--[[Translation missing --]]
--[[ L["Ignore Options"] = ""--]] 
--[[Translation missing --]]
--[[ L["ignore_input_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["ignore_input_usage"] = ""--]] 
--[[Translation missing --]]
--[[ L["ignore_list_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["ignore_options_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Import aborted"] = ""--]] 
--[[Translation missing --]]
--[[ L["import_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["import_malformed"] = ""--]] 
--[[Translation missing --]]
--[[ L["import_malformed_header"] = ""--]] 
--[[Translation missing --]]
--[[ L["import_not_supported"] = ""--]] 
--[[Translation missing --]]
--[[ L["Invalid selection"] = ""--]] 
L["Item"] = "Предмет"
--[[Translation missing --]]
--[[ L["'Item' is added to the award later list."] = ""--]] 
--[[Translation missing --]]
--[[ L["Item quality is below the loot threshold"] = ""--]] 
--[[Translation missing --]]
--[[ L["Item received and added from 'player'"] = ""--]] 
L["Item was awarded to"] = "Предмет был выдан"
--[[Translation missing --]]
--[[ L["Item(s) replaced:"] = ""--]] 
--[[Translation missing --]]
--[[ L["item_in_bags_low_trade_time_remaining_reminder"] = ""--]] 
--[[Translation missing --]]
--[[ L["Items stored in the loot master's bag for award later cannot be awarded later."] = ""--]] 
L["Items under consideration:"] = "Предметы, ожидающие рассмотрения:"
--[[Translation missing --]]
--[[ L["Keep"] = ""--]] 
--[[Translation missing --]]
--[[ L["Latest item(s) won"] = ""--]] 
--[[Translation missing --]]
--[[ L["Length"] = ""--]] 
L["Log"] = "Лог"
--[[Translation missing --]]
--[[ L["log_desc"] = ""--]] 
L["Loot announced, waiting for answer"] = "Добыча объявлена, ожидание ответа"
--[[Translation missing --]]
--[[ L["Loot Everything"] = ""--]] 
L["Loot History"] = "История Лута"
--[[Translation missing --]]
--[[ L["Loot Status"] = ""--]] 
L["Loot won:"] = "Предмет выиграл:"
--[[Translation missing --]]
--[[ L["loot_everything_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["loot_history_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Looted"] = ""--]] 
L["Looted by:"] = "Предмет забрал:"
--[[Translation missing --]]
--[[ L["lootFrame_error_note_required"] = ""--]] 
--[[Translation missing --]]
--[[ L["lootHistory_moreInfo_winnersOfItem"] = ""--]] 
--[[Translation missing --]]
--[[ L["Looting options"] = ""--]] 
L["Lower Quality Limit"] = "Нижняя Граница Качества"
L["lower_quality_limit_desc"] = [=[Выберите нижний предел качества для автораспределения (это качество включается!).
Примечание: Это отменяет нормальный порог лута.]=]
L["Mainspec/Need"] = "Основной спек/Нужно"
--[[Translation missing --]]
--[[ L["Mass deletion of history entries."] = ""--]] 
L["Master Looter"] = "Ответственный за Добычу"
--[[Translation missing --]]
--[[ L["master_looter_desc"] = ""--]] 
L["Message"] = "Сообщение"
--[[Translation missing --]]
--[[ L["Message for each item"] = ""--]] 
--[[Translation missing --]]
--[[ L["message_desc"] = ""--]] 
L["Minimize in combat"] = "Свернуть в бою"
L["Minor Upgrade"] = "Незначительное улучшение"
L["Missing votes from:"] = "Отсутствуют голоса от:"
L["ML sees voting"] = "МЛ видит результаты голосования"
--[[Translation missing --]]
--[[ L["ml_sees_voting_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["module_tVersion_outdated_msg"] = ""--]] 
--[[Translation missing --]]
--[[ L["module_version_outdated_msg"] = ""--]] 
L["Modules"] = "Модули"
L["More Info"] = "Больше информации"
--[[Translation missing --]]
--[[ L["more_info_desc"] = ""--]] 
L["Multi Vote"] = "Множественное голосование"
L["multi_vote_desc"] = "Включить возможность голосовать за нескольких кандидатов."
--[[Translation missing --]]
--[[ L["'n days' ago"] = ""--]] 
L["Never use RCLootCouncil"] = "Никогда не использовать RCLootCouncil"
--[[Translation missing --]]
--[[ L["new_ml_bagged_items_reminder"] = ""--]] 
--[[Translation missing --]]
--[[ L["No (dis)enchanters found"] = ""--]] 
L["No entries in the Loot History"] = "Нет доступной информации в Истории Лута"
--[[Translation missing --]]
--[[ L["No entry in the award later list is removed."] = ""--]] 
--[[Translation missing --]]
--[[ L["No items to award later registered"] = ""--]] 
--[[Translation missing --]]
--[[ L["No recipients available"] = ""--]] 
--[[Translation missing --]]
--[[ L["No session running"] = ""--]] 
--[[Translation missing --]]
--[[ L["No winners registered"] = ""--]] 
--[[Translation missing --]]
--[[ L["non_tradeable_reason_nil"] = ""--]] 
--[[Translation missing --]]
--[[ L["non_tradeable_reason_not_tradeable"] = ""--]] 
--[[Translation missing --]]
--[[ L["non_tradeable_reason_rejected_trade"] = ""--]] 
--[[Translation missing --]]
--[[ L["Non-tradeable reason:"] = ""--]] 
L["Not announced"] = "Не анонсированно"
--[[Translation missing --]]
--[[ L["Not cached, please reopen."] = ""--]] 
L["Not Found"] = "Не найдено"
L["Not in your guild"] = "Не в гильдии"
L["Not installed"] = "Не установлено"
L["Notes"] = "Заметки"
L["notes_desc"] = "Позволяет кандидатам отправлять их заметки консулу вместе с результатами бросков."
--[[Translation missing --]]
--[[ L["Now handles looting"] = ""--]] 
L["Number of buttons"] = "Количество кнопок"
--[[Translation missing --]]
--[[ L["Number of raids received loot from:"] = ""--]] 
L["Number of reasons"] = "Количество причин"
--[[Translation missing --]]
--[[ L["Number of responses"] = ""--]] 
--[[Translation missing --]]
--[[ L["number_of_buttons_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["number_of_reasons_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Observe"] = ""--]] 
--[[Translation missing --]]
--[[ L["observe_desc"] = ""--]] 
L["Offline or RCLootCouncil not installed"] = "Не в игре или RCLootCouncil не установлен"
L["Offspec/Greed"] = "Оффспек/Не откажусь"
--[[Translation missing --]]
--[[ L["Only use in raids"] = ""--]] 
--[[Translation missing --]]
--[[ L["onlyUseInRaids_desc"] = ""--]] 
L["open"] = "открыть"
L["Open the Loot History"] = "Открыть Историю Лута"
--[[Translation missing --]]
--[[ L["open_the_loot_history_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Opens the synchronizer"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_addButton_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_autoTrade_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_award_later_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_buttonsGroup_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_chatFrameName_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_deleteDate_confirm"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_deleteDate_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_deleteName_confirm"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_deleteName_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_deletePatch_confirm"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_deletePatch_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_deleteRaid_confirm"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_deleteRaid_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_moreButtons_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_printCompletedTrade_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_printCompletedTrade_Name"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_rejectTrade_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_rejectTrade_Name"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_saveBonusRolls_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_saveBonusRolls_Name"] = ""--]] 
--[[Translation missing --]]
--[[ L["options_autoAwardBoE_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["options_autoAwardBoE_name"] = ""--]] 
--[[Translation missing --]]
--[[ L["options_ml_outOfRaid_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["options_ml_outOfRaid_name"] = ""--]] 
--[[Translation missing --]]
--[[ L["options_requireNotes_desc"] = ""--]] 
L["Original Owner"] = "Изначальный владелец"
L["Out of instance"] = "Вне подземелья"
--[[Translation missing --]]
--[[ L["Patch"] = ""--]] 
--[[Translation missing --]]
--[[ L["Personal Loot - Non tradeable"] = ""--]] 
--[[Translation missing --]]
--[[ L["Personal Loot - Rejected Trade"] = ""--]] 
--[[Translation missing --]]
--[[ L["'player' can't receive 'type'"] = ""--]] 
--[[Translation missing --]]
--[[ L["'player' declined your sync request"] = ""--]] 
--[[Translation missing --]]
--[[ L["'player' has asked you to reroll"] = ""--]] 
--[[Translation missing --]]
--[[ L["'player' has ended the session"] = ""--]] 
--[[Translation missing --]]
--[[ L["'player' has rolled 'roll' for: 'item'"] = ""--]] 
--[[Translation missing --]]
--[[ L["'player' hasn't opened the sync window"] = ""--]] 
--[[Translation missing --]]
--[[ L["Player is ineligible for this item"] = ""--]] 
--[[Translation missing --]]
--[[ L["Player is not in the group"] = ""--]] 
--[[Translation missing --]]
--[[ L["Player is not in this instance"] = ""--]] 
--[[Translation missing --]]
--[[ L["Player is offline"] = ""--]] 
--[[Translation missing --]]
--[[ L["Please wait a few seconds until all data has been synchronized."] = ""--]] 
--[[Translation missing --]]
--[[ L["Please wait before trying to sync again."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print Responses"] = ""--]] 
--[[Translation missing --]]
--[[ L["print_response_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Protector Token"] = ""--]] 
--[[Translation missing --]]
--[[ L["Raw lua output. Doesn't work well with date selection."] = ""--]] 
--[[Translation missing --]]
--[[ L["RCLootCouncil - Synchronizer"] = ""--]] 
--[[Translation missing --]]
--[[ L["RCLootCouncil Loot Frame"] = ""--]] 
L["RCLootCouncil Loot History"] = "История Лута RCLootCouncil"
--[[Translation missing --]]
--[[ L["RCLootCouncil Session Setup"] = ""--]] 
--[[Translation missing --]]
--[[ L["RCLootCouncil Version Checker"] = ""--]] 
--[[Translation missing --]]
--[[ L["RCLootCouncil Voting Frame"] = ""--]] 
--[[Translation missing --]]
--[[ L["rclootcouncil_trade_add_item_confirm"] = ""--]] 
--[[Translation missing --]]
--[[ L["Reannounce ..."] = ""--]] 
--[[Translation missing --]]
--[[ L["Reannounced 'item' to 'target'"] = ""--]] 
L["Reason"] = "Причина"
--[[Translation missing --]]
--[[ L["reason_desc"] = ""--]] 
L["Remove All"] = "Убрать всё"
L["Remove from consideration"] = "Убрать с голосования"
--[[Translation missing --]]
--[[ L["remove_all_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Requested rolls for 'item' from 'target'"] = ""--]] 
--[[Translation missing --]]
--[[ L["Require Notes"] = ""--]] 
L["Reset Skin"] = "Сбросить скин"
--[[Translation missing --]]
--[[ L["Reset skins"] = ""--]] 
--[[Translation missing --]]
--[[ L["reset_announce_to_default_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["reset_buttons_to_default_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["reset_skin_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["reset_skins_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["reset_to_default_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Response"] = ""--]] 
--[[Translation missing --]]
--[[ L["Response color"] = ""--]] 
L["Response isn't available. Please upgrade RCLootCouncil."] = "Ответ не доступен. Пожалуйста обновите RCLootCouncil."
L["Response options"] = "Опции ответов"
--[[Translation missing --]]
--[[ L["Response to 'item'"] = ""--]] 
--[[Translation missing --]]
--[[ L["Response to 'item' acknowledged as 'response'"] = ""--]] 
--[[Translation missing --]]
--[[ L["response_color_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Responses"] = ""--]] 
--[[Translation missing --]]
--[[ L["Responses from Chat"] = ""--]] 
--[[Translation missing --]]
--[[ L["responses_from_chat_desc"] = ""--]] 
L["Save Skin"] = "Сохранить скин"
--[[Translation missing --]]
--[[ L["save_skin_desc"] = ""--]] 
L["Self Vote"] = "Своё голосование"
--[[Translation missing --]]
--[[ L["self_vote_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Send History"] = ""--]] 
L["Send to Guild"] = "Отправить в Гильдию"
--[[Translation missing --]]
--[[ L["send_history_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["send_to_guild_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Sending 'type' to 'player'..."] = ""--]] 
--[[Translation missing --]]
--[[ L["Sent whisper help to 'player'"] = ""--]] 
--[[Translation missing --]]
--[[ L["session_error"] = ""--]] 
--[[Translation missing --]]
--[[ L["session_help_from_bag"] = ""--]] 
--[[Translation missing --]]
--[[ L["session_help_not_direct"] = ""--]] 
--[[Translation missing --]]
--[[ L["Set the text for button i's response."] = ""--]] 
--[[Translation missing --]]
--[[ L["Set the text on button 'number'"] = ""--]] 
--[[Translation missing --]]
--[[ L["Set the whisper keys for button i."] = ""--]] 
--[[Translation missing --]]
--[[ L["Show Spec Icon"] = ""--]] 
--[[Translation missing --]]
--[[ L["show_spec_icon_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Silent Auto Pass"] = ""--]] 
--[[Translation missing --]]
--[[ L["silent_auto_pass_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Simple BBCode output."] = ""--]] 
--[[Translation missing --]]
--[[ L["Skins"] = ""--]] 
--[[Translation missing --]]
--[[ L["skins_description"] = ""--]] 
--[[Translation missing --]]
--[[ L["Slot"] = ""--]] 
--[[Translation missing --]]
--[[ L["Socket"] = ""--]] 
L["Something went wrong :'("] = "Что-то пошло не так :'("
--[[Translation missing --]]
--[[ L["Something went wrong during syncing, please try again."] = ""--]] 
--[[Translation missing --]]
--[[ L["Sort Items"] = ""--]] 
--[[Translation missing --]]
--[[ L["sort_items_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Standard .csv output."] = ""--]] 
--[[Translation missing --]]
--[[ L["Standard JSON output."] = ""--]] 
--[[Translation missing --]]
--[[ L["Status texts"] = ""--]] 
--[[Translation missing --]]
--[[ L["Store in bag and award later"] = ""--]] 
--[[Translation missing --]]
--[[ L["Succesfully deleted %d entries"] = ""--]] 
--[[Translation missing --]]
--[[ L["Succesfully deleted %d entries from %s"] = ""--]] 
--[[Translation missing --]]
--[[ L["Successfully imported 'number' entries."] = ""--]] 
--[[Translation missing --]]
--[[ L["Successfully received 'type' from 'player'"] = ""--]] 
--[[Translation missing --]]
--[[ L["Sync"] = ""--]] 
--[[Translation missing --]]
--[[ L["sync_detailed_description"] = ""--]] 
L["test"] = "тест"
L["Test"] = "Тест"
--[[Translation missing --]]
--[[ L["test_desc"] = ""--]] 
L["Text color"] = "Цвет текста"
L["Text for reason #i"] = "Текст причины #"
--[[Translation missing --]]
--[[ L["text_color_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["The award later list has been cleared."] = ""--]] 
--[[Translation missing --]]
--[[ L["The award later list is empty."] = ""--]] 
L["The following council members have voted"] = "Данные участники консула проголосовали"
--[[Translation missing --]]
--[[ L["The following entries are removed from the award later list:"] = ""--]] 
--[[Translation missing --]]
--[[ L["The following items are removed from the award later list and traded to 'player'"] = ""--]] 
--[[Translation missing --]]
--[[ L["The item can only be looted by you but it is not bind on pick up"] = ""--]] 
--[[Translation missing --]]
--[[ L["The item will be awarded later"] = ""--]] 
--[[Translation missing --]]
--[[ L["The item would now be awarded to 'player'"] = ""--]] 
--[[Translation missing --]]
--[[ L["The loot is already on the list"] = ""--]] 
--[[Translation missing --]]
--[[ L["The loot master"] = ""--]] 
L["The Master Looter doesn't allow multiple votes."] = "Ответственный за добычу не разрешил голосование за нескольких."
L["The Master Looter doesn't allow votes for yourself."] = "Ответственный за добычу не разрешил голосовать за себя."
--[[Translation missing --]]
--[[ L["The session has ended."] = ""--]] 
L["This item"] = "Этот предмет"
L["This item has been awarded"] = "Этот предмет был вручен"
--[[Translation missing --]]
--[[ L["Tier 19"] = ""--]] 
--[[Translation missing --]]
--[[ L["Tier 20"] = ""--]] 
--[[Translation missing --]]
--[[ L["Tier 21"] = ""--]] 
--[[Translation missing --]]
--[[ L["Tier Tokens ..."] = ""--]] 
--[[Translation missing --]]
--[[ L["Tier tokens received from here:"] = ""--]] 
--[[Translation missing --]]
--[[ L["tier_token_heroic"] = ""--]] 
--[[Translation missing --]]
--[[ L["tier_token_mythic"] = ""--]] 
--[[Translation missing --]]
--[[ L["tier_token_normal"] = ""--]] 
L["Time"] = "Время"
--[[Translation missing --]]
--[[ L["time_remaining_warning"] = ""--]] 
--[[Translation missing --]]
--[[ L["Timeout"] = ""--]] 
--[[Translation missing --]]
--[[ L["Timeout when giving 'item' to 'player'"] = ""--]] 
--[[Translation missing --]]
--[[ L["To target"] = ""--]] 
--[[Translation missing --]]
--[[ L["Tokens received"] = ""--]] 
--[[Translation missing --]]
--[[ L["Total awards"] = ""--]] 
--[[Translation missing --]]
--[[ L["Total items received:"] = ""--]] 
--[[Translation missing --]]
--[[ L["Total items won:"] = ""--]] 
--[[Translation missing --]]
--[[ L["trade_complete_message"] = ""--]] 
--[[Translation missing --]]
--[[ L["trade_item_to_trade_not_found"] = ""--]] 
--[[Translation missing --]]
--[[ L["trade_wrongwinner_message"] = ""--]] 
--[[Translation missing --]]
--[[ L["tVersion_outdated_msg"] = ""--]] 
--[[Translation missing --]]
--[[ L["Unable to give 'item' to 'player'"] = ""--]] 
--[[Translation missing --]]
--[[ L["Unable to give 'item' to 'player' - (player offline, left group or instance?)"] = ""--]] 
--[[Translation missing --]]
--[[ L["Unable to give out loot without the loot window open."] = ""--]] 
--[[Translation missing --]]
--[[ L["Unawarded"] = ""--]] 
L["Unguilded"] = "Не в гильдии"
L["Unknown date"] = "Неизвестная дата"
--[[Translation missing --]]
--[[ L["Unknown/Chest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Unlooted"] = ""--]] 
L["Unvote"] = "Снять"
L["Upper Quality Limit"] = "Лимит улучшения качества"
--[[Translation missing --]]
--[[ L["upper_quality_limit_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Usage"] = ""--]] 
--[[Translation missing --]]
--[[ L["Usage Options"] = ""--]] 
--[[Translation missing --]]
--[[ L["Vanquisher Token"] = ""--]] 
L["version"] = "версия"
L["Version"] = "Версия"
L["Version Check"] = "Проверка версии"
L["version_check_desc"] = "Открытие модуля проверки версии аддона."
L["version_outdated_msg"] = "Ваша версия аддона %s устарела. Последняя версия %s , пожалуйста обновите RCLootCouncil."
L["Vote"] = "Голос"
L["Voters"] = "Голосующие"
L["Votes"] = "Голоса"
L["Voting options"] = "Опции голосования"
L["Waiting for response"] = "Ожидание ответа"
--[[Translation missing --]]
--[[ L["whisper_guide"] = ""--]] 
--[[Translation missing --]]
--[[ L["whisper_guide2"] = ""--]] 
L["whisper_help"] = [=[Рейдеры могут использовать систему личных сообщений, в случае если кто-то не имеет аддона.
Шепнув "rchelp" ответственному за добычу, они получат список ключевых слов, который может быть изменен в меню "Кнопки и Ответы".
Ответственному за добычу рекомендуется включить "Анонс Сообщений" для каждого предмета, потому что номер каждого предмета необходим для использования системы личных сообщений.
Примечание: Людям следует устанавливать аддон, в противном случае об игроке будет доступна не вся информация.]=]
L["whisperKey_greed"] = "не откажусь, оффспек, ос, 2"
L["whisperKey_minor"] = "минимальное улучшение, минимально, 3"
L["whisperKey_need"] = "нужно, мейнспек, мс, 1"
L["Windows reset"] = "Окна сброшены"
L["winners"] = "выигравшие"
L["x days"] = "%d дней"
L["x out of x have voted"] = "%d из %d проголосовало"
L["You are not allowed to see the Voting Frame right now."] = "Вы не можете видеть окно голосования прямо сейчас."
L["You are not in an instance"] = "Вы не в подземелье"
L["You can only auto award items with a quality lower than 'quality' to yourself due to Blizaard restrictions"] = "Вы можете автоматически передавать себе только те предметы, качество которых ниже, чем %s , из-за ограничений, установленных разработчиками игры"
L["You cannot start an empty session."] = "Вы не можете начать \"пустую\" сессию распределения добычи."
L["You cannot use the menu when the session has ended."] = "Вы не можете использовать меню, если распределение добычи завершено."
L["You cannot use this command without being the Master Looter"] = "Вы не можете использовать эту команду, не будучи ответственным за распределение добычи"
L["You can't start a loot session while in combat."] = "Вы не можете запустить распределение добычи, находясь в бою."
L["You can't start a session before all items are loaded!"] = "Вы не можете начать распределение добычи, прежде чем будут загружены все предметы!"
--[[Translation missing --]]
--[[ L["You haven't selected an award reason to use for disenchanting!"] = ""--]] 
L["You haven't set a council! You can edit your council by typing '/rc council'"] = "Вы не выбрали членов консула! Вы можете изменить состав консула через команду '/rc council'"
L["You must select a target"] = "Вы должны выбрать цель"
L["Your note:"] = "Ваша заметка:"
L["You're already running a session."] = "Вы уже запустили сессию распределения добычи."

