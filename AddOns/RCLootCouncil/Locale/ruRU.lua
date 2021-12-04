-- Translate RCLootCouncil to your language at:
-- http://wow.curseforge.com/addons/rclootcouncil/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("RCLootCouncil", "ruRU")
if not L then return end

L[" is not active in this raid."] = "не участвует в текущем рейде."
L[" you are now the Master Looter and RCLootCouncil is now handling looting."] = "теперь вы мастерлутер и RCLootCouncil отвечает за распределение лута."
L["&p was awarded with &i for &r!"] = "&p получил &i для &r!"
L["A format to copy/paste to another player."] = "Формат для копирования / вставки для другого игрока."
L["A new session has begun, type '/rc open' to open the voting frame."] = "Новая сессия запущена, введите '/rc open' для открытия окна голосования."
L["A tab delimited output for Excel. Might work with other spreadsheets."] = "Вывод с разделителями табуляции для Excel. Может работать с другими табличными редакторами."
L["Abort"] = "Сбросить"
L["Accept Whispers"] = "Принимать ЛС"
L["accept_whispers_desc"] = "Позволяет игрокам шептать их нынешние вещи для того что бы добавить в окно голосования."
L["Accepted imports: 'Player Export' and 'CSV'"] = "Разрешенный импорт: 'Player Export' и 'CSV'"
L["Active"] = "Включен"
L["active_desc"] = "Снимите галочку что бы выключить RCLootCouncil. Полезно если вы в рейдовой группе, но не являетесь участником голосования. Заметка: Сбрасывается после каждого логаута."
L["Add Item"] = "Добавить предмет"
L["Add Note"] = "Добавить заметку"
L["Add ranks"] = "Добавить звания"
L["Add rolls"] = "Добавить роллы"
L["Add Rolls"] = "Добавить роллы"
L["add_candidate"] = "Добавить кандидата"
L["add_ranks_desc"] = "Выберите минимальное звание для участия в лутконсуле:"
--[[Translation missing --]]
--[[ L["add_ranks_desc2"] = ""--]] 
L["add_rolls_desc"] = "Автоматически добавлять случайный ролл 1-100 для каждой сессии."
L["Additional Buttons"] = "Дополнительные кнопки"
L["All items"] = "Все предметы"
L["All items have been awarded and the loot session concluded"] = "Все предметы были распределены и сессия лута завершена."
L["All items usable by the candidate"] = "Все предметы используемые кандидатом"
L["All unawarded items"] = "Все не распределенные предметы"
L["Alternatively, flag the loot as award later."] = "Альтернативно, пометьте лут что бы распределить позже."
L["Always show owner"] = "Всегда показывать владельца"
L["Always use RCLootCouncil with Personal Loot"] = "Всегда использовать RCLootCouncil с Персональной Добычей"
L["always_show_tooltip_howto"] = "Двойное нажатие что бы вызвать подсказку"
L["Announce Awards"] = "Анонс наград"
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
L["Announcements"] = "Анонсы"
L["Anonymous Voting"] = "Анонимное голосование"
L["anonymous_voting_desc"] = "Включить анонимное голосование (т.е. люди не видят кто за что проголосовал)"
L["Append realm names"] = "Добавлять названия игровых миров"
L["Are you sure you want to abort?"] = "Вы уверены, что хотите отменить?"
L["Are you sure you want to give #item to #player?"] = "Вы уверены, что хотите передать %s игроку %s?"
--[[Translation missing --]]
--[[ L["Are you sure you want to reannounce all unawarded items to %s?"] = ""--]] 
--[[Translation missing --]]
--[[ L["Are you sure you want to request rolls for all unawarded items from %s?"] = ""--]] 
L["Armor Token"] = "Токен брони"
--[[Translation missing --]]
--[[ L["Ask me every time Personal Loot is enabled"] = ""--]] 
L["Auto Award"] = "Автовручение"
L["Auto Award to"] = "Автовручить"
L["Auto awarded 'item'"] = "Автовручено %s"
L["Auto Close"] = "Автозакрытие"
--[[Translation missing --]]
--[[ L["Auto Enable"] = ""--]] 
--[[Translation missing --]]
--[[ L["Auto extracted from whisper"] = ""--]] 
L["Auto Open"] = "Автооткрытие"
L["Auto Pass"] = "Автопас"
L["Auto pass BoE"] = "Автопас БоЕ"
L["Auto Pass Trinkets"] = "Автопас Тринькетов"
L["Auto Trade"] = "Автотрейд"
L["auto_award_desc"] = "Включить автоматическое распределение"
L["auto_award_to_desc"] = "Игроки для автоматического распределения. Список игроков для выбора появляется если вы в рейдовой группе."
--[[Translation missing --]]
--[[ L["auto_close_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_enable_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_open_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_pass_boe_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_pass_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["auto_pass_trinket_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["autoloot_others_item_combat"] = ""--]] 
L["Autopass"] = "Автопас"
--[[Translation missing --]]
--[[ L["Autopassed on 'item'"] = ""--]] 
--[[Translation missing --]]
--[[ L["Autostart isn't supported when testing"] = ""--]] 
L["award"] = "вручить"
L["Award"] = "Вручить"
L["Award Announcement"] = "Анонс вручения"
L["Award for ..."] = "Вручить игроку..."
L["Award later"] = "Вручить позже"
L["Award later isn't supported when testing."] = "\"Вручить позже\" не поддерживается в режиме тестирования."
L["Award later?"] = "Вручить позже?"
L["Award Reasons"] = "Причина вручения"
L["award_reasons_desc"] = [=[Причины вручения, которые не могут быть выбраны во время ролла.
Используется при изменении ответа в меню по правой кнопки мыши, и для автоматического вручения.]=]
L["Awarded"] = "Вручено"
L["Awarded item cannot be awarded later."] = "Врученные ранее вещи не могут быть переданы позднее."
L["Awards"] = "Награды"
L["Azerite Armor"] = "Азеритовая броня"
L["Background"] = "Фон"
L["Background Color"] = "Цвет фона"
L["Banking"] = "Банк"
--[[Translation missing --]]
--[[ L["BBCode export, tailored for SMF."] = ""--]] 
L["Border"] = "Граница"
L["Border Color"] = "Цвет границы"
L["Button"] = "Кнопка"
L["Buttons and Responses"] = "Кнопки и ответы"
--[[Translation missing --]]
--[[ L["buttons_and_responses_desc"] = ""--]] 
L["Candidate didn't respond on time"] = "Кандидат не ответил вовремя"
L["Candidate has disabled RCLootCouncil"] = "Кандидат отключил RCLootCouncil"
L["Candidate is not in the instance"] = "Кандидат отсутствует в подземелье  "
L["Candidate is selecting response, please wait"] = "Кандидат делает выбор, пожалуйста подождите"
L["Candidate removed"] = "Кандидат удален"
L["Candidates that can't use the item"] = "Кандидаты которые не могут использовать предмет"
L["Cannot autoaward:"] = "Невозможно автонаградить:"
--[[Translation missing --]]
--[[ L["Cannot give 'item' to 'player' due to Blizzard limitations. Gave it to you for distribution."] = ""--]] 
--[[Translation missing --]]
--[[ L["Change Award"] = ""--]] 
--[[Translation missing --]]
--[[ L["Change Response"] = ""--]] 
L["Changing loot threshold to enable Auto Awarding"] = "Измените порог распределения добычи, чтобы включить Автоматическое Вручение"
L["Changing LootMethod to Master Looting"] = "Изменить систему лута на Мастерлут"
L["channel_desc"] = "Канал в который отправить сообщение."
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
L["clear_loot_history_desc"] = "Удалить всю историю лута."
L["Click to add note to send to the council."] = "Нажмите что бы добавить записку для консула."
L["Click to change your note."] = "Нажмите для изменения записки."
L["Click to expand/collapse more info"] = "Нажмите что бы развернуть/свернуть информацию"
L["Click to switch to 'item'"] = "Нажмите чтобы переключиться на %s"
L["config"] = "настройка"
--[[Translation missing --]]
--[[ L["confirm_award_later_text"] = ""--]] 
L["confirm_usage_text"] = "|cFF87CEFA RCLootCouncil |r Хотите использовать RCLootCouncil с этой группой?"
L["Conqueror Token"] = "Токен завоевателя"
--[[Translation missing --]]
--[[ L["Corruption if awarded:"] = ""--]] 
--[[Translation missing --]]
--[[ L["Could not Auto Award i because the Loot Threshold is too high!"] = ""--]] 
L["Could not find 'player' in the group."] = "Невозможно найти игрока %s в группе."
L["Couldn't find any councilmembers in the group"] = "Невозможно найти члена консула в группе"
L["council"] = "консул"
L["Council"] = "Консул"
L["Current Council"] = "Текущий Консул"
L["current_council_desc"] = "Нажмите, чтобы удалить определенных людей из консула"
--[[Translation missing --]]
--[[ L["Customize appearance"] = ""--]] 
--[[Translation missing --]]
--[[ L["customize_appearance_desc"] = ""--]] 
L["Data Received"] = "Данные получены"
L["Date"] = "Дата"
L["days and x months"] = "%s и %d месяцев"
L["days, x months, y years"] = "%s, %d месяцев и %d лет"
L["Delete Skin"] = "Удалить скин"
L["delete_skin_desc"] = "Удалить выбранный не стандартный скин из списка."
--[[Translation missing --]]
--[[ L["Deselect responses to filter them"] = ""--]] 
L["Diff"] = "Разница"
--[[Translation missing --]]
--[[ L["Discord friendly output."] = ""--]] 
--[[Translation missing --]]
--[[ L["disenchant_desc"] = ""--]] 
L["Do you want to keep %s for yourself or trade?"] = "Хотите оставить %s себе или передать?"
--[[Translation missing --]]
--[[ L["Done syncing"] = ""--]] 
--[[Translation missing --]]
--[[ L["Double click to delete this entry."] = ""--]] 
L["Dropped by:"] = "Упало с:"
--[[Translation missing --]]
--[[ L["Edit Entry"] = ""--]] 
L["Enable Loot History"] = "Включить историю лута"
--[[Translation missing --]]
--[[ L["Enable Timeout"] = ""--]] 
L["enable_loot_history_desc"] = "Включает ведение истории. RCLootCouncil не будет ничего записывать если отключено."
--[[Translation missing --]]
--[[ L["enable_timeout_desc"] = ""--]] 
L["Enter your note:"] = "Введите вашу записку:"
--[[Translation missing --]]
--[[ L["EQdkp-Plus XML output, tailored for Enjin import."] = ""--]] 
L["error_test_as_non_leader"] = "Вы не можете начать тестирование пока вы не являетесь лидером группы."
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
L["Frame options"] = "Настройки окна"
L["Free"] = "Даром"
L["Full Bags"] = "Полные сумки"
L["g1"] = "п1"
L["g2"] = "п2"
--[[Translation missing --]]
--[[ L["Gave the item to you for distribution."] = ""--]] 
L["General options"] = "Основные настройки"
L["Group Council Members"] = "Групповые участники Консула"
L["group_council_members_desc"] = "Используйте это, чтобы добавить членов консула с другого сервера или гильдии."
L["group_council_members_head"] = "Добавить члена консула из текущей группы."
L["Guild Council Members"] = "Гильдейские участники Консула"
L["Hide Votes"] = "Скрыть голоса"
L["hide_votes_desc"] = "Только проголосовавшие игроки могут видеть результаты голосования."
L["How to sync"] = "Как синхронизировать"
--[[Translation missing --]]
--[[ L["huge_export_desc"] = ""--]] 
L["Ignore List"] = "Список исключений"
L["Ignore Options"] = "Настройки исключений"
L["ignore_input_desc"] = "Введите itemID что бы RCLootCouncil добавил его в список исключений и никогда не выводил этот предмет на голосование"
L["ignore_input_usage"] = "Эта функция принимает только itemIDs (цифры), itemName или itemLink."
L["ignore_list_desc"] = "Предметы которые игнорирует RCLootCouncil. Нажмите на предмет что бы убрать."
--[[Translation missing --]]
--[[ L["ignore_options_desc"] = ""--]] 
L["Import aborted"] = "Импорт прерван"
L["import_desc"] = "Вставить данные сюда. Показывает только первые 2500 символов что бы игра не зависала."
--[[Translation missing --]]
--[[ L["import_malformed"] = ""--]] 
--[[Translation missing --]]
--[[ L["import_malformed_header"] = ""--]] 
--[[Translation missing --]]
--[[ L["import_not_supported"] = ""--]] 
--[[Translation missing --]]
--[[ L["Invalid selection"] = ""--]] 
L["Item"] = "Предмет"
L["'Item' is added to the award later list."] = "%s добавлен в список для награждения позже."
--[[Translation missing --]]
--[[ L["Item quality is below the loot threshold"] = ""--]] 
L["Item received and added from 'player'"] = "Предмет получен и добавлен от игрока %s."
L["Item was awarded to"] = "Предмет был выдан"
L["Item(s) replaced:"] = "Предмет(ы) заменены:"
--[[Translation missing --]]
--[[ L["item_in_bags_low_trade_time_remaining_reminder"] = ""--]] 
--[[Translation missing --]]
--[[ L["Items stored in the loot master's bag for award later cannot be awarded later."] = ""--]] 
L["Items under consideration:"] = "Предметы, ожидающие рассмотрения:"
L["Keep"] = "Оставить"
L["Latest item(s) won"] = "Последние вещи выиграны"
--[[Translation missing --]]
--[[ L["Length"] = ""--]] 
L["Log"] = "Лог"
L["log_desc"] = "Включить запись логов в истории лута."
L["Loot announced, waiting for answer"] = "Добыча объявлена, ожидание ответа"
L["Loot History"] = "История лута"
L["Loot Status"] = "Статус лута"
L["Loot won:"] = "Лут выиграл:"
--[[Translation missing --]]
--[[ L["loot_history_desc"] = ""--]] 
L["Looted"] = "Полутано"
L["Looted by:"] = "Полутал:"
L["lootFrame_error_note_required"] = "Вы должны добавить заметку прежде чем отправлять ваш ответ - %s"
L["lootHistory_moreInfo_winnersOfItem"] = "Победители %s:"
L["Looting options"] = "Настройки лута"
L["Lower Quality Limit"] = "Нижняя граница качества"
L["lower_quality_limit_desc"] = [=[Выберите нижний предел качества для автораспределения (это качество включается!).
Примечание: Это отменяет нормальный порог лута.]=]
L["Mainspec/Need"] = "Основной спек/Нужно"
L["Mass deletion of history entries."] = "Массовое удаление записей истории."
L["Master Looter"] = "Мастерлутер"
L["master_looter_desc"] = "Заметка: Данные настройки будут использоваться только если вы являетесь мастерлутером."
L["Message"] = "Сообщение"
--[[Translation missing --]]
--[[ L["Message for each item"] = ""--]] 
--[[Translation missing --]]
--[[ L["message_desc"] = ""--]] 
L["Minimize in combat"] = "Свернуть в бою"
L["Minor Upgrade"] = "Незначительное улучшение"
L["Missing votes from:"] = "Отсутствуют голоса от:"
L["ML sees voting"] = "МЛ видит голосование"
--[[Translation missing --]]
--[[ L["ML_ADD_INVALID_ITEM"] = ""--]] 
--[[Translation missing --]]
--[[ L["ML_ADD_ITEM_MAX_ATTEMPTS"] = ""--]] 
L["ml_sees_voting_desc"] = "Позволяет мастерлутеру видеть кто голосует за кого."
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
L["'n days' ago"] = "%s назад"
L["Never use RCLootCouncil"] = "Никогда не использовать RCLootCouncil"
--[[Translation missing --]]
--[[ L["new_ml_bagged_items_reminder"] = ""--]] 
L["No (dis)enchanters found"] = "Не найдено зачарователей"
L["No entries in the Loot History"] = "Нет доступной информации в истории лута"
--[[Translation missing --]]
--[[ L["No entry in the award later list is removed."] = ""--]] 
--[[Translation missing --]]
--[[ L["No items to award later registered"] = ""--]] 
--[[Translation missing --]]
--[[ L["No recipients available"] = ""--]] 
L["No session running"] = "Нет запущенных сессий"
L["No winners registered"] = "Победителей не зарегистрировано"
L["non_tradeable_reason_nil"] = "Неизвестно"
L["non_tradeable_reason_not_tradeable"] = "Не передается"
L["non_tradeable_reason_rejected_trade"] = "Хотел оставить предмет"
L["Non-tradeable reason:"] = "Не передается, причина:"
L["Not announced"] = "Не анонсированно"
--[[Translation missing --]]
--[[ L["Not cached, please reopen."] = ""--]] 
L["Not Found"] = "Не найдено"
L["Not in your guild"] = "Не в гильдии"
L["Not installed"] = "Не установлено"
L["Notes"] = "Заметки"
L["Now handles looting"] = "Сейчас занимается распределением лута"
L["Number of buttons"] = "Количество кнопок"
--[[Translation missing --]]
--[[ L["Number of raids received loot from:"] = ""--]] 
L["Number of reasons"] = "Количество причин"
L["Number of responses"] = "Количество ответов"
L["number_of_buttons_desc"] = "Двигай ползунок что бы изменить количество кнопок."
L["number_of_reasons_desc"] = "Двигай ползунок что бы изменить количество ответов."
L["Observe"] = "Наблюдение"
L["observe_desc"] = "Разрешить не членам консула наблюдать за голосованием. Они не смогут голосовать."
L["Offline or RCLootCouncil not installed"] = "Не в игре или RCLootCouncil не установлен"
L["Offspec/Greed"] = "Оффспек/Не откажусь"
L["Only use in raids"] = "Использовать только в рейдах"
L["onlyUseInRaids_desc"] = "Выбери что бы автоматически отключать RCLootCouncil в группах."
L["open"] = "открыть"
L["Open the Loot History"] = "Открыть историю лута"
L["open_the_loot_history_desc"] = "Нажми что бы открыть историю лута."
L["Opens the synchronizer"] = "Открыть синхронизатор"
--[[Translation missing --]]
--[[ L["opt_addButton_desc"] = ""--]] 
L["opt_autoAddBoEs_desc"] = "Автоматически добавлять все БоЕ в сессию."
L["opt_autoAddBoEs_name"] = "Автодобавление БоЕ"
--[[Translation missing --]]
--[[ L["opt_autoAddItems_desc"] = ""--]] 
L["opt_autoAddItems_name"] = "Автодобавление предметов"
--[[Translation missing --]]
--[[ L["opt_autoAddPets_desc"] = ""--]] 
L["opt_autoAddPets_name"] = "Добавить питомцев"
--[[Translation missing --]]
--[[ L["opt_autoAwardPrioList_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_autoTrade_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_award_later_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_buttonsGroup_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["opt_chatFrameName_desc"] = ""--]] 
L["opt_chatFrameName_name"] = "Окно чата"
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
L["opt_rejectTrade_Name"] = "Разрешить оставить"
--[[Translation missing --]]
--[[ L["opt_skipSessionFrame_desc"] = ""--]] 
L["opt_skipSessionFrame_name"] = "Пропустить окно сессии"
--[[Translation missing --]]
--[[ L["options_autoAwardBoE_desc"] = ""--]] 
L["options_autoAwardBoE_name"] = "Автонаграждение БоЕ"
--[[Translation missing --]]
--[[ L["options_ml_outOfRaid_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["options_ml_outOfRaid_name"] = ""--]] 
--[[Translation missing --]]
--[[ L["options_requireNotes_desc"] = ""--]] 
L["Original Owner"] = "Изначальный владелец"
L["Out of instance"] = "Вне подземелья"
L["Patch"] = "Патч"
L["Personal Loot - Non tradeable"] = "Персональный лут - Не передается"
L["Personal Loot - Rejected Trade"] = "Персональный лут - Отмененный трейд"
L["'player' can't receive 'type'"] = "%s не может получить %s - версии не совпадают?"
L["'player' declined your sync request"] = "%s отклонил ваш запрос на синхронизацию"
L["'player' has asked you to reroll"] = "%s попросил реролл"
L["'player' has ended the session"] = "%s завершил сессию"
--[[Translation missing --]]
--[[ L["'player' has rolled 'roll' for: 'item'"] = ""--]] 
--[[Translation missing --]]
--[[ L["'player' hasn't opened the sync window"] = ""--]] 
L["Player is ineligible for this item"] = "Игрок не может пользоваться этим предметом"
L["Player is not in the group"] = "Игрок не в группе"
L["Player is not in this instance"] = "Игрок не в инсте"
L["Player is offline"] = "Игрок не в сети"
L["Please wait a few seconds until all data has been synchronized."] = "Пожалуйста подождите пока вся информация синхронизируется."
L["Please wait before trying to sync again."] = "Пожалуйста подождите перед тем как синхронизировать еще раз."
L["Print Responses"] = "Вывести ответы"
--[[Translation missing --]]
--[[ L["print_response_desc"] = ""--]] 
L["Protector Token"] = "Токен защитника"
--[[Translation missing --]]
--[[ L["Raw lua output. Doesn't work well with date selection."] = ""--]] 
L["RCLootCouncil - Synchronizer"] = "RCLootCouncil - Синхронизатор"
L["RCLootCouncil Loot Frame"] = "Окно добычи RCLootCouncil"
L["RCLootCouncil Loot History"] = "История лута RCLootCouncil"
L["RCLootCouncil Session Setup"] = "Настройка сессии RCLootCouncil"
L["RCLootCouncil Version Checker"] = "Проверка версии RCLootCouncil"
L["RCLootCouncil Voting Frame"] = "Окно голосования RCLootCouncil"
--[[Translation missing --]]
--[[ L["rclootcouncil_trade_add_item_confirm"] = ""--]] 
--[[Translation missing --]]
--[[ L["Reannounce ..."] = ""--]] 
--[[Translation missing --]]
--[[ L["Reannounced 'item' to 'target'"] = ""--]] 
L["Reason"] = "Причина"
L["reason_desc"] = "Причина награждения в истории лута когда происходит автонаграждение."
L["Remove All"] = "Убрать всёх"
L["Remove from consideration"] = "Убрать с голосования"
L["remove_all_desc"] = "Убрать всех членов консула"
--[[Translation missing --]]
--[[ L["Requested rolls for 'item' from 'target'"] = ""--]] 
L["Require Notes"] = "Требовать заметки"
L["Reset Skin"] = "Сбросить скин"
L["Reset skins"] = "Сбросить скины"
L["reset_announce_to_default_desc"] = "Сбрасывает настройки сообщений по умолчанию"
L["reset_buttons_to_default_desc"] = "Сбрасывает все кнопки, цвета и ответы по умолчанию"
L["reset_skin_desc"] = "Сбросить все цвета и фон текущего скина."
L["reset_skins_desc"] = "Сбросить стандартные скины."
L["reset_to_default_desc"] = "Сбросить причины награждения к стандартным."
L["Response"] = "Ответ"
L["Response color"] = "Цвет ответа"
L["Response isn't available. Please upgrade RCLootCouncil."] = "Ответ не доступен. Пожалуйста обновите RCLootCouncil."
L["Response options"] = "Настройки ответов"
--[[Translation missing --]]
--[[ L["Response to 'item'"] = ""--]] 
--[[Translation missing --]]
--[[ L["Response to 'item' acknowledged as 'response'"] = ""--]] 
L["response_color_desc"] = "Установите цвет для ответа."
L["Responses"] = "Ответы"
L["Responses from Chat"] = "Ответы из чата"
--[[Translation missing --]]
--[[ L["responses_from_chat_desc"] = ""--]] 
L["Save Skin"] = "Сохранить скин"
L["save_skin_desc"] = "Введите название вашего скина и нажмите OK что бы сохранить его. Учтите, это может перезаписать любой не стандартный скин."
L["Self Vote"] = "Голос за себя"
L["self_vote_desc"] = "Разрешает голосовать за себя."
L["Send History"] = "Отправить историю"
L["Send to Guild"] = "Отправить в гильдию"
L["send_history_desc"] = "Отправить данные всем в рейде, несмотря на то пишите ли вы логи. Будет отправлено только если вы являетесь мастерлутером."
--[[Translation missing --]]
--[[ L["send_to_guild_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Sending 'type' to 'player'..."] = ""--]] 
--[[Translation missing --]]
--[[ L["Sent whisper help to 'player'"] = ""--]] 
L["session_error"] = "Что то пошло не так - перезапустите сессию"
L["session_help_from_bag"] = "После окончания сессии вы можете использовать' /rc winners'  что бы увидеть кому что должен передать."
L["session_help_not_direct"] = "Вещи в данной сессии не передаются автоматически и должны быть переданы вручную."
--[[Translation missing --]]
--[[ L["Set the text for button i's response."] = ""--]] 
--[[Translation missing --]]
--[[ L["Set the text on button 'number'"] = ""--]] 
--[[Translation missing --]]
--[[ L["Set the whisper keys for button i."] = ""--]] 
L["Show Spec Icon"] = "Показывать иконку спека"
--[[Translation missing --]]
--[[ L["show_spec_icon_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Silent Auto Pass"] = ""--]] 
--[[Translation missing --]]
--[[ L["silent_auto_pass_desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Simple BBCode output."] = ""--]] 
L["Skins"] = "Скины"
L["skins_description"] = "Выберите один из стандартных скинов или создадите свой. Это влияет только на внешний вид. Откройте проверку версии что бы увидеть результат ('/rc version')."
L["Slot"] = "Слот"
L["Socket"] = "Сокет"
L["Something went wrong :'("] = "Что-то пошло не так :'("
L["Something went wrong during syncing, please try again."] = "Что то пошло не так во время синхронизации, попробуйте еще раз."
L["Sort Items"] = "Сортировать"
L["sort_items_desc"] = "Сортировать сессии по слоту и илвлу."
--[[Translation missing --]]
--[[ L["Standard .csv output."] = ""--]] 
--[[Translation missing --]]
--[[ L["Standard JSON output."] = ""--]] 
L["Status texts"] = "Текст статуса"
L["Store in bag and award later"] = "Оставить в сумке и наградить позже"
--[[Translation missing --]]
--[[ L["Succesfully deleted %d entries"] = ""--]] 
--[[Translation missing --]]
--[[ L["Succesfully deleted %d entries from %s"] = ""--]] 
--[[Translation missing --]]
--[[ L["Successfully imported 'number' entries."] = ""--]] 
L["Successfully received 'type' from 'player'"] = "%s успешно получен от игрока %s."
L["Sync"] = "Синхронизировать"
--[[Translation missing --]]
--[[ L["sync_detailed_description"] = ""--]] 
L["test"] = "тест"
L["Test"] = "Проверка"
L["test_desc"] = "Нажмите что бы сымитировать окно мастерлута для себя и других участников рейда."
L["Text color"] = "Цвет текста"
L["Text for reason #i"] = "Текст причины #"
L["text_color_desc"] = "Цвет текста при отображении."
L["The award later list has been cleared."] = "Список предметов для награждения позже не был очищен."
L["The award later list is empty."] = "Список предметов для награждения пуст."
L["The following council members have voted"] = "Данные участники консула проголосовали"
--[[Translation missing --]]
--[[ L["The following entries are removed from the award later list:"] = ""--]] 
--[[Translation missing --]]
--[[ L["The following items are removed from the award later list and traded to 'player'"] = ""--]] 
--[[Translation missing --]]
--[[ L["The item can only be looted by you but it is not bind on pick up"] = ""--]] 
L["The item will be awarded later"] = "Предмет будет награжден позже"
L["The item would now be awarded to 'player'"] = "Предмет будет выдан игроку %s"
--[[Translation missing --]]
--[[ L["The loot is already on the list"] = ""--]] 
--[[Translation missing --]]
--[[ L["The loot master"] = ""--]] 
L["The Master Looter doesn't allow multiple votes."] = "Ответственный за добычу не разрешил голосование за нескольких."
L["The Master Looter doesn't allow votes for yourself."] = "Ответственный за добычу не разрешил голосовать за себя."
L["The session has ended."] = "Сессия окончена. "
L["This item"] = "Этот предмет"
L["This item has been awarded"] = "Этот предмет был вручен"
L["Tier 19"] = "Тир 19"
L["Tier 20"] = "Тир 20"
L["Tier 21"] = "Тир 21"
--[[Translation missing --]]
--[[ L["Tier Tokens ..."] = ""--]] 
--[[Translation missing --]]
--[[ L["Tier tokens received from here:"] = ""--]] 
L["tier_token_heroic"] = "Героический"
L["tier_token_mythic"] = "Эпохальный"
L["tier_token_normal"] = "Обычный"
L["Time"] = "Время"
--[[Translation missing --]]
--[[ L["time_remaining_warning"] = ""--]] 
L["Timeout"] = "Время вышло"
--[[Translation missing --]]
--[[ L["Timeout when giving 'item' to 'player'"] = ""--]] 
--[[Translation missing --]]
--[[ L["To target"] = ""--]] 
L["Tokens received"] = "Токен получен"
--[[Translation missing --]]
--[[ L["Total awards"] = ""--]] 
L["Total items received:"] = "Всего вещей получено:"
L["Total items won:"] = "Всего вещей выиграно:"
L["trade_complete_message"] = "%s передал %s игроку %s."
L["trade_item_to_trade_not_found"] = "ВНИМАНИЕ: Вещь на трейд: %s невозможно найти в твоем инвентаре!"
L["trade_wrongwinner_message"] = "ВНИМАНИЕ: %s отдал %s игроку %s вместо %s!"
L["tVersion_outdated_msg"] = "Новейшая тест версия RCLootCouncil: %s"
L["Unable to give 'item' to 'player'"] = "Невозможно дать %s для %s"
L["Unable to give 'item' to 'player' - (player offline, left group or instance?)"] = "Невозможно дать %s для %s - (игрок оффлайн, вышел из группы или подземелья?)"
--[[Translation missing --]]
--[[ L["Unable to give out loot without the loot window open."] = ""--]] 
--[[Translation missing --]]
--[[ L["Unawarded"] = ""--]] 
L["Unguilded"] = "Не в гильдии"
L["Unknown date"] = "Неизвестная дата"
L["Unknown/Chest"] = "Неизвестно/Сундук"
--[[Translation missing --]]
--[[ L["Unlooted"] = ""--]] 
L["Unvote"] = "Не голосовать"
L["Upper Quality Limit"] = "Лимит улучшения качества"
--[[Translation missing --]]
--[[ L["upper_quality_limit_desc"] = ""--]] 
L["Usage"] = "Использование"
L["Usage Options"] = "Настройки использования"
L["Vanquisher Token"] = "Токен покорителя"
L["version"] = "версия"
L["Version"] = "Версия"
L["Version Check"] = "Проверка версии"
L["version_check_desc"] = "Открытие модуля проверки версии аддона."
L["version_outdated_msg"] = "Ваша версия аддона %s устарела. Последняя версия %s , пожалуйста обновите RCLootCouncil."
L["Vote"] = "Голос"
L["Voters"] = "Голосующие"
L["Votes"] = "Голоса"
L["Voting options"] = "Настройки голосования"
L["Waiting for response"] = "Ожидание ответа"
--[[Translation missing --]]
--[[ L["whisper_guide"] = ""--]] 
L["whisper_guide2"] = "[RCLootCouncil]: Вы получите сообщение если вы были успешно добавлены."
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
L["You are not allowed to see the Voting Frame right now."] = "Вам не разрешено просматривать окно голосования в данный момент."
L["You are not in an instance"] = "Вы не в подземелье"
L["You can only auto award items with a quality lower than 'quality' to yourself due to Blizaard restrictions"] = "Вы можете автоматически передавать себе только те предметы, качество которых ниже, чем %s , из-за ограничений, установленных разработчиками игры"
L["You cannot start an empty session."] = "Вы не можете начать пустую сессию распределения лута."
L["You cannot use the menu when the session has ended."] = "Вы не можете использовать меню, если распределение лута завершено."
L["You cannot use this command without being the Master Looter"] = "Вы не можете использовать эту команду, не будучи мастерлутером"
L["You can't start a loot session while in combat."] = "Вы не можете запустить распределение лута находясь в бою."
L["You can't start a session before all items are loaded!"] = "Вы не можете начать распределение лута прежде чем будут загружены все предметы!"
--[[Translation missing --]]
--[[ L["You haven't selected an award reason to use for disenchanting!"] = ""--]] 
L["You haven't set a council! You can edit your council by typing '/rc council'"] = "Вы не выбрали членов консула! Вы можете изменить состав консула через команду '/rc council'"
L["You must select a target"] = "Вы должны выбрать цель"
L["Your note:"] = "Ваша заметка:"
L["You're already running a session."] = "Вы уже запустили сессию распределения лута."

