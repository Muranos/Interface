if not(GetLocale() == "ruRU") then
  return
end
local addonName, MDT = ...
local L = MDT.L
L = L or {}

-- MDT
L[" >Battle for Azeroth"] = ">Битва за Азерот"
L[" >Legion"] = ">Легион"
L["%s HP"] = "%s Здоровье"
L["%s is in sublevel: %s"] = "%s находится на подуровне: %s"
L["(G %d)"] = "(Г %d)"
L["*Live*"] = "*Live*"
L["+ Add pull"] = "Добавить пул"
L["Aberration"] = "Аберрация"
L["Abyss Dweller"] = "Обитатель глубин"
L["Abyssal Cultist"] = "Глубинный сектант"
L["Abyssal Eel"] = "Глубинный угорь"
L["Adderis"] = "Гюрзис"
L["Addled Thug"] = "Одурманенный вышибала"
L["Aerial Unit R-21/X"] = "Воздушное судно R-21/X"
L["Affected by:"] = "Подвержен:"
L["Affixes"] = "Аффиксы"
L["Agitated Nimbus"] = "Беспокойное облако"
L["Aka'ali the Conqueror"] = "Ака'али Завоевательница"
L["Alarm-o-Bot"] = "Тревогобот"
L["Animated Droplet"] = "Оживленная капля"
L["Animated Guardian"] = "Оживший страж"
L["Anodized Coilbearer"] = "Анодированный разрядниконосец"
L["Apply to preset"] = "Применить к шаблону;"
L["Aqu'sirr"] = "Аква'сирр"
L["Arcane Eye"] = "Чародейское око"
L["Ashvane Cannoneer"] = "Канонир дома Эшвейнов"
L["Ashvane Commander"] = "Командир из корпорации Эшвейнов"
L["Ashvane Deckhand"] = "Матрос корпорации Эшвейнов"
L["Ashvane Destroyer"] = "Разрушитель из дома Эшвейнов"
L["Ashvane Flamecaster"] = "Маг огня корпорации Эшвейнов"
L["Ashvane Invader"] = "Захватчик дома Эшвейнов"
L["Ashvane Jailer"] = "Тюремщик корпорации Эшвейнов"
L["Ashvane Marine"] = "Морпех корпорации Эшвейнов"
L["Ashvane Officer"] = "Офицер корпорации Эшвейнов"
L["Ashvane Priest"] = "Жрица корпорации Эшвейнов"
L["Ashvane Sniper"] = "Снайпер дома Эшвейнов"
L["Ashvane Spotter"] = "Наблюдатель корпорации Эшвейнов"
L["Ashvane Warden"] = "Стражник корпорации Эшвейнов"
L["Aspix"] = "Аспидис"
L["Asset Manager"] = "Управляющая активами"
L["Atal'Dazar"] = "Атал'Дазар"
L["Atal'Dazar Sublevel"] = "Атал'Дазар"
L["atalTeemingNote"] = "При модификаторе кишащий:%s%sГ29 не всегда присутствует.%sПротивники добавленные модификатором кишащий в Г2 не всегда присутствуют.%sГ27 не всегда присутствует"
L["Atrium of Sethraliss"] = "Атриум Сетралисс"
L["Automatic Coloring"] = "Автоматическое окрашивание"
L["Automatically color pulls"] = "Автоматически окрашивать пулы"
L["Avatar of Sethraliss"] = "Аватара Сетралисс"
L["Awakened"] = "Пробудившийся"
L["Awakened A"] = "Пробудившийся (А)"
L["Awakened B"] = "Пробудившийся (Б)"
L["Azerite Extractor"] = "Экстрактор азерита"
L["Azerokk"] = "Азерокк"
L["Banish"] = "Изгнание"
L["Banquet Steward"] = "Распорядитель банкета"
L["Beast"] = "Животное"
L["Befouled Spirit"] = "Оскверненный дух"
L["Beguiling"] = "Манящий"
L["Beguiling 1 Void"] = "Меченная Бездной посланница"
L["Beguiling 2 Tides"] = "Посланница глубин"
L["Beguiling 3 Ench."] = "Зачарованная посланница"
L["Bewitched Captain"] = "Заколдованный капитан"
L["Big Money Crab"] = "Краб-магнат"
L["Bilge Rat Brinescale"] = "Саурок из клана Соленой Чешуи"
L["Bilge Rat Buccaneer"] = "Буканьер из братства Трюмных Крыс"
L["Bilge Rat Cutthroat"] = "Головорез из братства Трюмных Крыс"
L["Bilge Rat Demolisher"] = "Крушитель из братства Трюмных Крыс"
L["Bilge Rat Looter"] = "Мародер из братства Трюмных Крыс"
L["Bilge Rat Padfoot"] = "Тихолап из братства Трюмных Крыс"
L["Bilge Rat Pillager"] = "Разоритель из братства Трюмных Крыс"
L["Bilge Rat Seaspeaker"] = "Морской колдун из братства Трюмных Крыс"
L["Bilge Rat Swabby"] = "Морячок из братства Трюмных Крыс"
L["Bilge Rat Tempest"] = "Воин бури из братства Трюмных Крыс"
L["Bilge Rats"] = "Трюмные крысы"
L["Black and Yellow"] = "Черное и Желтое"
L["Black Rook Hold"] = "Крепость Черной Ладьи"
L["Blacktar Bomber"] = "Метатель черной смолы"
L["Blacktooth"] = "Братство Чернозубых"
L["Blacktooth Arsonist"] = "Поджигатель из братства Чернозубых"
L["Blacktooth Brute"] = "Громила из братства Чернозубых"
L["Blacktooth Knuckleduster"] = "Кастетник из братства Чернозубых"
L["Blacktooth Scrapper"] = "Задира из братства Чернозубых"
L["Blastatron X-80"] = ""
L["Blight Toad"] = "Чумная жаба"
L["Block Warden"] = "Надзиратель блока"
L["Blood of the Corruptor"] = "Кровь Заразителя"
L["Bloodsworn Agent"] = "Одержимый кровью шпион"
L["Bloodsworn Defiler"] = "Кровавый осквернитель"
L["Bolstering"] = "Усиливающий"
L["Bomb Tonk"] = "Бомботанк"
L["Bottom Feeder"] = "Донный краб"
L["Brother Ironhull"] = "Брат Айронхалл"
L["Brush Size"] = "Размер кисти"
L["Brutal Spire of Ny'alotha"] = "Жестокий шпиль Ни'алоты"
L["Bursting"] = "Взрывной"
L["Cancel"] = "Отменить"
L["CannonNote"] = "Тяжелое орудие%sИспользуется игроками%sНаносит урон как врагам так и союзникам"
L["Cannot create preset '%s'"] = "Невозможно создать маршрут '%s'"
L["Cannot rename preset to '%s'"] = "Невозможно переименовать маршрут в '%s'"
L["Captain Eudora"] = "Капитан Юдора"
L["Captain Jolly"] = "Капитан Джолли"
L["Captain Raoul"] = "Капитан Рауль"
L["Catacombs"] = "Катакомбы"
L["Cathedral of Eternal Night"] = "Собор Вечной Ночи"
L["Charged Dust Devil"] = "Заряженная песчаная дьяволица"
L["Choose Enemy Forces Format"] = "Выберите Формат для отображения Сил врага"
L["Choose Enemy Style. Requires Reload"] = "Выберите стиль для сил врага. Потребуется перезагрузка"
L["Choose NPC tooltip position"] = "Расположение подсказки для НИП"
L["Choose number of colors"] = "Выберите количество цветов"
L["Choose preferred color palette"] = "Выберите цветовую палитру"
L["Chopper Redhook"] = "Головорез Краснокрюк"
L["Chosen Blood Matron"] = "Избранная кровавая матрона"
L["Click the fullscreen button for a maximized view of MDT."] = "Вы можете перевести MDT в полноэкраный режим нажав красную стрелочку в правом верхнем углу"
L["Click to adjust color settings"] = "Нажмите чтобы изменить настройки цвета"
L["Click to go to %s"] = "Нажмите чтобы перейти к %s"
L["Click to set dungeon level to 10"] = "Нажмите чтобы установить уровень подземелья на 10"
L["Click to switch to current week"] = "Нажмите чтобы выбрать текущую неделю"
L["Click to toggle AddOn Window"] = "Нажмите чтобы переключить отображение окна дополнения"
L["Clicking this button will attempt to join the ongoing Live Session of your group or create a new one if none is found"] = "При нажатии этой кнопки будет произведена попытка присоединиться к совместному сеансу вашей группы или таковой будет создан если сеанс не будет найден"
L["Coin-Operated Crowd Pummeler"] = "Платный разгонятель толпы"
L["Color Blind Friendly"] = "Режим для людей с дальтонизмом"
L["Colorpicker"] = "Палитра цветов"
L["Colossal Tentacle"] = "Огромное щупальце"
L["Control Undead"] = "Порабощение нежити"
L["Copy"] = "Копировать"
L["Court of Stars"] = "Квартал Звезд"
L["Court of Stars Sublevel"] = "Квартал Звезд"
L["Coven Diviner"] = "Прорицательница из ковена"
L["Coven Thornshaper"] = "Заклинательница шипов из ковена"
L["Cragmaw the Infested"] = "Кроглот Зараженный"
L["Crawler Mine"] = "Ползучая мина"
L["Crazed Incubator"] = "Бешеная наседка"
L["Crazed Marksman"] = "Обезумевший стрелок"
L["Create"] = "Создать"
L["Create a new preset"] = "Создать новый шаблон"
L["Critter"] = "Зверек"
L["Cursed Spire of Ny'alotha"] = "Проклятый шпиль Ни'алоты"
L["Custom"] = "Пользовательский"
L["Custom Color Palette"] = "Пользовательская цветовая схема"
L["Cutwater"] = "Братство Волнорезов"
L["Cutwater Duelist"] = "Дуэлянт из братства Волнорезов"
L["Cutwater Harpooner"] = "Гарпунщик из братства Волнорезов"
L["Cutwater Knife Juggler"] = "Метатель ножей из братства Волнорезов"
L["Cutwater Striker"] = "Боец из братства Волнорезов"
L["Darkheart Thicket"] = "Чаща Темного Сердца"
L["Darkheart Thicket Sublevel"] = "Чаща Темного Сердца"
L["Dazar'ai Augur"] = "Дазар'айский авгур"
L["Dazar'ai Colossus"] = "Дазар'айский колосс"
L["Dazar'ai Confessor"] = "Дазар'айский духовник"
L["Dazar'ai Honor Guard"] = "Дазар'айский почетный страж"
L["Dazar'ai Juggernaut"] = "Дазар'айский сокрушитель"
L["Decrease Brush Size"] = "Уменьшить размер кисти"
L["Deepsea Ritualist"] = "Глубоководный ритуалист"
--[[Translation missing --]]
--[[ L["defaultPresetName"] = ""--]] 
L["Defense Bot Mk I"] = ""
L["Defense Bot Mk III"] = ""
L["Defiled Spire of Ny'alotha"] = "Оскверненный шпиль Ни'алоты"
L["Delete"] = "Удалить"
L["Delete %s?"] = "Удалить %s?"
--[[Translation missing --]]
--[[ L["Delete ALL drawings"] = ""--]] 
L["Delete ALL presets"] = "Удалить ВСЕ маршруты"
L["Delete Preset"] = "Удалить шаблон"
L["Delete this preset"] = "Удалить этот шаблон"
--[[Translation missing --]]
--[[ L["deleteAllDrawingsPrompt"] = ""--]] 
L["deleteAllWarning"] = "!!Внимание!!%sВы действительно хотите удалить ВСЕ маршруты для этого подземелья?%sВы собираетесь удалить %s маршрут(а/ов)%sПосле удаления их нельзя будет восстановить"
L["Demolishing Terror"] = "Крушащий ужас"
L["Demon"] = "Демон"
L["Despondent Scallywag"] = "Отчаявшийся негодяй"
L["Detention Block"] = "Тюремный блок"
L["Devouring Maggot"] = "Прожорливая личинка"
L["Devout Blood Priest"] = "Преданная жрица крови"
L["Dinomancer Kish'o"] = "Диномант Киш'о"
L["Diseased Lasher"] = "Больной плеточник"
L["Diseased Mastiff"] = "Зараженный мастиф"
L["Disorient"] = "Дизориентация"
L["Dockhound Packmaster"] = "Портовый заводчик"
L["Does not delete your drawings"] = "Не удаляет ваши рисунки"
L["Drag the bottom right edge to resize MDT."] = "Потяните за нижний правый угол, чтобы изменить размер MDT"
L["Dragonkin"] = "Драконид"
--[[Translation missing --]]
--[[ L["Drawing: Arrow"] = ""--]] 
--[[Translation missing --]]
--[[ L["Drawing: Eraser"] = ""--]] 
--[[Translation missing --]]
--[[ L["Drawing: Freehand"] = ""--]] 
--[[Translation missing --]]
--[[ L["Drawing: Line"] = ""--]] 
L["Dread Captain Lockwood"] = "Жуткий капитан Локвуд"
L["Dreadwing Raven"] = "Грознокрылый ворон"
L["Dredged Sailor"] = "Утопший матрос"
L["Drowned Depthbringer"] = "Утонувший вестник глубин"
L["Dungeon Level"] = "Уровень подземелья"
L["Earlier Version"] = "У вас уже есть маршрут с таким названием '%s'\\nХотите внести изменения в него или создать новый?\\n\\n\\n"
L["Earthrager"] = "Земляной яростень"
L["Edit"] = "Изменить"
L["Elder Leaxa"] = "Старейшина Ликса"
L["Elemental"] = "Элементаль"
L["Embalming Fluid"] = "Бальзамировочный состав"
L["Emissary of the Tides"] = "Посланница глубин"
L["Enable Minimap Button"] = "Включить отображение на мини-карте"
L["Enchanted Emissary"] = "Зачарованная посланница"
L["Enemies related to seasonal affixes are currently hidden"] = "Враги связанные с сезонными модификаторами не отображены"
L["Enemy Info"] = "Информация о противнике"
L["Enemy Info NPC Creature Type"] = "Тип существа"
L["Enemy Info NPC Enemy Forces"] = "Силы врага"
L["Enemy Info NPC Enemy Forces (Teeming)"] = "Силы врага (Кишащий)"
L["Enemy Info NPC Health"] = "Здоровье (+%d %s)"
L["Enemy Info NPC Id"] = "Идентификатор НИП"
L["Enemy Info NPC Level"] = "Уровень"
L["Enemy Info NPC Name"] = "Имя"
L["Enemy Info NPC Stealth"] = "Незаметность"
L["Enemy Info NPC Stealth Detect"] = "Обнаружение незаметности"
L["Enslave Demon"] = "Порабощение демона"
L["Enthralled Guard"] = "Порабощенный стражник"
L["Entropic Spire of Ny'alotha"] = "Энтропический шпиль Ни'алоты"
L["Expand the top toolbar to gain access to drawing and note features."] = "Расширьте верхнюю строку чтобы получить доступ к функциям рисования и заметок"
L["Expert Technician"] = "Техник-эксперт"
L["Explosive"] = "Взрывоопасный"
L["Export"] = "Экспорт"
L["Export the preset as a text string"] = "Экспорт текущего шаблона в виде текстовой строки"
L["Eye of Azshara"] = "Око Азшары"
L["Eye of Azshara Sublevel"] = "Око Азшары"
L["Faceless Corruptor"] = "Безликий осквернитель"
L["Faceless Maiden"] = "Безликая дева"
L["Faithless Tender"] = "Отступник - хранитель яиц"
L["Fallen Deathspeaker"] = "Падший вестник смерти"
L["Fanatical Headhunter"] = "Фанатичный охотник за головами"
L["Fear"] = "Страх"
L["Feasting Skyscreamer"] = "Ненасытный небесный крикун"
L["Feckless Assistant"] = "Ленивый лаборант"
L["Feral Bloodswarmer"] = "Дикий кровавый роевик"
L["Fetid Maggot"] = "Смрадная личинка"
L["Field of the Eternal Hunt"] = "Поля вечной охоты"
L["Footbomb Hooligan"] = "Футбомбный хулиган"
L["Forces"] = "Силы врага"
L["Forces only: 5/200"] = "Силы врага: 5/200"
L["Forces+%: 5/200 (2.5%)"] = "Силы врага+%: 5/200 (2.5%)"
L["Forgotten Denizen"] = "Забытый обитатель глубин"
L["Fortified"] = "Укрепленный"
L["frackingNote"] = "Фрекинговый тотем%sИспользуется игроками%sПарализует Земляного яростня на 1 минуту - рассеивается при получении урона"
L["Freehold"] = "Вольная Гавань"
L["Freehold Barhand"] = "Официантка из Вольной Гавани"
L["Freehold Deckhand"] = "Палубный матрос из Вольной Гавани"
L["Freehold Pack Mule"] = "Вьючный мул из Вольной Гавани"
L["Freehold Shipmate"] = "Моряк из Вольной Гавани"
L["Freehold Sublevel"] = "Вольная Гавань"
--[[Translation missing --]]
--[[ L["freeholdBeguilingPatrolNote"] = ""--]] 
--[[Translation missing --]]
--[[ L["freeholdGraveyardDescription1"] = ""--]] 
--[[Translation missing --]]
--[[ L["freeholdGraveyardDescription2"] = ""--]] 
L["G.U.A.R.D."] = "СТРАЖ"
L["Galecaller Apprentice"] = "Ученик призывательницы штормов"
L["Galecaller Faye"] = "Призывательница штормов Фэй"
L["Galvazzt"] = "Гальваззт"
L["Gamesman's Hall"] = "Игровой зал"
L["Giant"] = "Великан"
L["Gilded Priestess"] = "Позолоченная жрица"
L["Gloom Horror"] = "Сумрачный ужас"
L["Gnome-Eating Slime"] = "Слизнюк-гномоед"
L["Gnomercy 4.U."] = ""
L["Gorak Tul"] = "Горак Тул"
L["Gorestained Piglet"] = "Запачканный кровью поросенок"
L["Graveyard"] = "Кладбище"
L["Grease Bot"] = "Смазочный бот"
L["Grievous"] = "Мучительный"
L["Grip"] = "Хватка смерти"
L["Gripping Terror"] = "Цепкий ужас"
L["Grotesque Horror"] = "Искаженный ужас"
L["Guard Captain Atu"] = "Капитан стражи Ату"
L["Guardian Elemental"] = "Сторожевой элементаль"
L["Guardian's Library"] = "Библиотека хранителя"
L["Gunker"] = "Токсикоид"
L["Hadal Darkfathom"] = "Хадал Черная Бездна"
L["Hall of the Moon"] = "Зал Луны"
L["Halls of Valor"] = "Чертоги Доблести"
L["Halls of Valor Sublevel"] = "Чертоги Доблести"
L["Harlan Sweete"] = "Красавчик Харлан"
L["Head Machinist Sparkflux"] = "Главный машинист Искроточец"
L["Heart Guardian"] = "Хранитель Сердца"
L["Heartsbane Runeweaver"] = "Плетельщица рун из ковена Мертвых Сердец"
L["Heartsbane Soulcharmer"] = "Исказительница душ из ковена Мертвых Сердец"
L["Heartsbane Vinetwister"] = "Прядильщица лоз из ковена Мертвых Сердец"
L["Heavy Scrapbot"] = "Тяжелый хламобот"
L["Helmouth Cliffs"] = "Утесы Адской Пасти"
L["helpPlateDungeon"] = "Пользовательская настройка опций подземелья"
L["helpPlateDungeonSelect"] = "Выберите подземелье и последуйте в другие подуровни "
L["helpPlateNPC"] = "Нажмите левой кнопкой мыши, чтобы выбрать врагов\\nПри помощи CTRL+левая кнопка мыши можно выбрать противников по одному\\nПри помощи SHIFT+левая кнопка мыши можно сразу создавать раздельные пулы"
L["helpPlatePresets"] = "Управляйте, делитесь и разрабатывайте шаблоны"
L["helpPlatePulls"] = "Создавайте и настраивайте свои пулы\\пкм для больших опций"
L["High Contrast"] = "Высокая контрастность"
L["Hired Assassin"] = "Наемный убийца"
L["HK-8 Aerial Oppression Unit"] = "Воздушный подавитель ОУ-8"
L["Hold CTRL to single-select enemies."] = "Зажмите CTRL, чтобы выбирать противников по одному"
L["Hold SHIFT to create a new pull while selecting enemies."] = "Зажмите SHIFT, чтобы создавать отельные пулы при выборе врагов"
L["Hold SHIFT to delete all presets with the delete preset button."] = "Зажмите SHIFT, чтобы удалить все шаблоны при помощи кнопки \"удалить шаблон\""
L["Honored Raptor"] = "Почитаемый ящер"
L["Hoodoo Hexer"] = "Проклинатель худу"
L["Humanoid"] = "Гуманоид"
L["If the Minimap Button is enabled"] = "Если кнопка мини-карты включена"
L["Imbued Stormcaller"] = "Усиленный призыватель шторма"
L["Import"] = "Импортировать"
L["Import a preset from a text string"] = "Импортировать шаблон из текстовой строки"
L["Import Preset"] = "Импорт шаблона"
L["Imprison"] = "Пленение"
L["In the bottom right corner"] = "В правом нижнем углу"
L["Incapacitate"] = "Паралич"
L["Increase Brush Size"] = "Увеличить размер кисти"
L["Infected Peasant"] = "Зараженный крестьянин"
L["Infested"] = "Зараженный"
L["Insert Note"] = "Добавить записку"
L["Interment Construct"] = "Погребальный голем"
L["Invalid import string"] = "Неправильная строка импорта"
L["Ironhull Apprentice"] = "Ученик Айронхалла"
L["Irontide Bonesaw"] = "Мясник из братства Стальных Волн"
L["Irontide Buccaneer"] = "Буканьер из братства Стальных Волн"
L["Irontide Cleaver"] = "Рассекатель из братства Стальных Волн"
L["Irontide Corsair"] = "Корсар из братства Стальных Волн"
L["Irontide Crackshot"] = "Стрелок из братства Стальных Волн"
L["Irontide Crusher"] = "Сокрушитель из братства Стальных Волн"
L["Irontide Enforcer"] = "Головорез из братства Стальных Волн"
L["Irontide Marauder"] = "Мародер из братства Стальных Волн"
L["Irontide Mastiff"] = "Мастиф братства Стальных Волн"
L["Irontide Oarsman"] = "Боец на веслах из братства Стальных Волн"
L["Irontide Officer"] = "Офицер из братства Стальных Волн"
L["Irontide Powdershot"] = "Фузилер из братства Стальных Волн"
L["Irontide Raider"] = "Налетчик из братства Стальных Волн"
L["Irontide Ravager"] = "Опустошитель из братства Стальных Волн"
L["Irontide Stormcaller"] = "Призыватель шторма из братства Стальных Волн"
L["Irontide Thug"] = "Громила из братства Стальных Волн"
L["Irontide Waveshaper"] = "Заклинатель моря из братства Стальных Волн"
L["Jagged Hound"] = "Шипастая гончая"
L["Jes Howlis"] = "Джес Хаулис"
L["Join"] = "Присоединиться"
L["Join Crew"] = "Присоединиться к экипажу"
L["Join Live Session"] = "Присоединиться к совместной сессии: \\n%s: %s- %s"
L["Junkyard D.0.G."] = "Сторожевой бот модели "
L["K.U.-J.0."] = "КУ-ДЖ0"
L["King A'akul"] = "Король А'акул"
L["King Dazar"] = "Король Дазар"
L["King Gobbamak"] = "Король Гоббамак"
L["King Rahu'ai"] = "Король Рау'ай"
L["King Timalji"] = "Король Тималджи"
L["Kings' Rest"] = "Гробница королей"
L["Kings' Rest Sublevel"] = "Гробница королей (нижний уровень)"
L["Knight Captain Valyri"] = "Рыцарь-капитан Валири"
L["Knock"] = "Сбивание с ног"
--[[Translation missing --]]
--[[ L["krBrutePatrolNote"] = ""--]] 
--[[Translation missing --]]
--[[ L["krGraveyardNote1"] = ""--]] 
L["Krolusk Hatchling"] = "Детеныш кролуска"
L["Krolusk Pup"] = "Подрастающий кролуск"
L["krSkipNote"] = "Непорочный дух - проводник%sДоступен после убийства Голема-чистильщика 1"
L["Kul Tiran Footman"] = "Кул-тирасский пехотинец"
L["Kul Tiran Halberd"] = "Кул-тирасский стражник"
L["Kul Tiran Marksman"] = "Кул-тирасский стрелок"
L["Kul Tiran Vanguard"] = "Кул-тирасский боец авангарда"
L["Kul Tiran Wavetender"] = "Кул-тирасский смотритель приливов"
L["Kula the Butcher"] = "Кула Живодерка"
L["Lady Waycrest"] = "Леди Уэйкрест"
L["Language"] = "Язык"
L["LargePresetWarning"] = "Вы пытаетесь поделиться очень большим шаблоном (%d characters)\\nВам рекомендуется использовать функцию экспорта и делиться крупными шаблонами используя wago.io \\nВы уверены, что хотите поделиться этим шаблоном?\\n"
L["Level %d %s"] = "Уровень %d %s"
L["Levels below 10 will hide enemies related to seasonal affixes"] = "В подземельях ниже 10-го уровня враги, относящиеся к сезонному аффиксу, будут скрыты"
L["Library Floor"] = "Библиотека Хранителя"
L["Link Spells"] = "Поделиться заклинаниями"
L["Live"] = "Совместный сеанс"
L["Live Session"] = "Совместный сеанс"
L["Living Current"] = "Живой поток"
L["Living Rot"] = "Живая гниль"
L["Living Waste"] = "Живые отходы"
L["Local color blind mode"] = "Частичный режим для дальтоников"
L["Locked"] = "Заперто"
L["Lord Ravencrest's Chamber"] = "Комната лорда Гребня Ворона"
L["Lord Stormsong"] = "Лорд Штормсонг"
L["Lord Waycrest"] = "Лорд Уэйкрест"
L["Lost Soul"] = "Заблудшая душа"
L["Lower Broken Stair"] = "Низ разрушенной лестницы"
L["Ludwig Von Tortollan"] = "Людвиг фон Тортоллен"
L["Maddened Survivalist"] = "Обезумевший мастер выживания"
--[[Translation missing --]]
--[[ L["MaggotNote"] = ""--]] 
L["Make this preset the live preset"] = "Сделать маршрутом совместного сеанса"
L["Malfunctioning Scrapbot"] = "Неисправный хламобот"
L["Marked Sister"] = "Меченая сестра"
L["Master's Terrace"] = "Терраса Медива"
L["Matron Alma"] = "Матрона Альма"
L["Matron Bryndle"] = "Матрона Бриндл"
L["Mature Krolusk"] = "Взрослый кролуск"
L["Maw of Souls"] = "Утесы Адской Пасти"
L["Mchimba the Embalmer"] = "Мчимба Бальзамировщик"
L["MDI Mode"] = "Режим MDI"
L["MDT: Error importing preset"] = "MDT: Ошибка импорта шаблона"
L["MDT: Spells for %s:"] = "MDT: Заклинания для %s:"
L["Mech Jockey"] = "Механожокей"
L["Mechagon - Junkyard"] = "Операция \"Мехагон\" - свалка"
L["Mechagon - Workshop"] = "Операция \"Мехагон\" - мастерская"
L["Mechagon Cavalry"] = "Мехагонский кавалерист"
L["Mechagon Citizen"] = "Житель Мехагона"
L["Mechagon City"] = "Мехагон"
L["Mechagon Island"] = "Остров Мехагон"
L["Mechagon Island (Tunnels)"] = "Остров Мехагон (тоннели)"
L["Mechagon Mechanic"] = "Мехагонский механик"
L["Mechagon Prowler"] = "Мехагонский хищник"
L["Mechagon Renormalizer"] = "Мехагонский нормализатор"
L["Mechagon Tinkerer"] = "Мехагонский боевой механик"
L["Mechagon Trooper"] = "Мехагонский солдат"
L["Mechanical"] = "Механизм"
L["Mechanized Peacekeeper"] = "Механомиротворец"
L["Merektha"] = "Меректа"
L["Mind Control"] = "Контроль над разумом"
L["Mine Rat"] = "Кобольд-рудокоп"
L["minecartNote"] = "Вагонетка%sМожет быть использована игроками"
L["Minion of Zul"] = "Прислужник Зула"
--[[Translation missing --]]
--[[ L["mlGraveyardNote1"] = ""--]] 
--[[Translation missing --]]
--[[ L["mlGraveyardNote2"] = ""--]] 
--[[Translation missing --]]
--[[ L["mlGraveyardNote3"] = ""--]] 
--[[Translation missing --]]
--[[ L["mlJockeyNote"] = ""--]] 
L["Mogul Razdunk"] = "Шеф Разданк"
L["Monzumi"] = "Монзуми"
L["Mouseover a patrolling enemy with a blue border to view the patrol path."] = "Наведите мышкой поверх патрульного с синей рамкой чтобы увидеть его путь"
L["Mouseover the Live button while in a group to learn more about Live mode."] = "Наведите мышкой поверх кнопки Совместный сеанс во время нахождения в группе чтобы узнать больше о Совместном сеансе"
--[[Translation missing --]]
--[[ L["Move Object"] = ""--]] 
L["Naeno Megacrash"] = "Нано Мегабум"
L["Necrotic"] = "Некротический"
L["Neltharion's Lair"] = "Логово Нелтариона"
L["Neltharion's Lair Sublevel"] = "Логово Нелтариона"
L["Netherspace"] = "Пустомарь"
L["New"] = "Новый"
L["New NPC at Cursor Position"] = "Новый NPC на позиции курсора"
L["New Patrol Waypoint at Cursor Position"] = "Новая точка направления патруля на позиции курсора"
L["New Preset"] = "Новый шаблон"
L["Next to the NPC"] = "Рядом с НИП"
--[[Translation missing --]]
--[[ L["Not specified"] = ""--]] 
--[[Translation missing --]]
--[[ L["Note Text:"] = ""--]] 
L["Off-Duty Laborer"] = "Отдыхающий работник"
L["Officer Quarters"] = "Офицерская"
L["Omega Buster"] = ""
L["Open MDI override options"] = "Открыть опции MDI поверх"
L["Opera Hall Balcony"] = "Балкон в опере"
L["Ordnance Specialist"] = "Артиллерист"
L["Overflowing"] = "Переполняющий"
L["Overseer Korgus"] = "Надзиратель Корги"
L["Overseer's Redoubt"] = "Цитадель надзирателя"
L["Overseer's Summit"] = "Терраса надзирателя"
L["Pallid Gorger"] = "Бледный пожиратель"
L["Path of Illumination"] = "Путь Озарения"
L["Pistonhead Blaster"] = "Стрелок из банды Поршнеголовых"
L["Pistonhead Mechanic"] = "Механик из банды Поршнеголовых"
L["Pistonhead Scrapper"] = "Демонтажница из банды Поршнеголовых"
L["Plague Doctor"] = "Чумная знахарка"
L["Plain Texture"] = "Чистая текстура "
L["Players can join the live session by either clicking this button or the Live Session chat link"] = "Игроки могут присоединиться к совместному сеансу нажав на эту кнопку или на ссылку совместного сеанса в чате"
L["Please report any bugs on https://github.com/Nnoggie/MythicDungeonTools/issues"] = [=[Пожалуйста сообщайте об ошибках здесь
https://github.com/Nnoggie/MythicDungeonTools/issues]=]
L["Polymorph"] = "Превращение"
L["Portrait"] = "Портрет"
L["Posh Vacationer"] = "Пафосная курортница"
L["Preset '%s' already exists"] = "Шаблон '%s' уже существует"
L["Preset Export"] = "Экспорт шаблона"
L["Preset Name"] = "Имя шаблона"
L["Priestess Alun'za"] = "Жрица Алун'за"
--[[Translation missing --]]
--[[ L["Prison Bars"] = ""--]] 
--[[Translation missing --]]
--[[ L["Prison Gate"] = ""--]] 
L["Pull Drop Clear Pull"] = "Очистить группу"
L["Pull Drop Close"] = "Закрыть"
L["Pull Drop Color"] = "Цвет"
L["Pull Drop Color Settings"] = "Настройки цвета"
L["Pull Drop Colorize Preset"] = "Окрасить шаблон"
L["Pull Drop Delete"] = "Удалить"
L["Pull Drop Insert after"] = "Добавить после"
L["Pull Drop Insert before"] = "Добавить перед"
L["Pull Drop Merge"] = "Объединить"
L["Pull Drop Merge down"] = "Сдвинуть вниз"
L["Pull Drop Merge up"] = "Сдвинуть вверх"
L["Pull Drop Move down"] = "Движение вниз"
L["Pull Drop Move up"] = "Движение вверх"
L["Pull Drop Reset Color"] = "Сбросить цвет"
L["Pull Drop Reset Preset"] = "Сбросить шаблон"
L["Purification Construct"] = "Голем-чистильщик"
L["Quaking"] = "Сотрясающий"
L["Queen Patlaa"] = "Королева Патлаа"
L["Queen Wasi"] = "Королева Уаси"
L["Raal the Gluttonous"] = "Раал Прожорливый"
L["Raging"] = "Разъяренный"
L["Rainbow"] = "Радуга"
L["Ravenshold"] = "Обитель Воронов"
L["Reanimated Guardian"] = "Оживленный страж"
L["Reanimated Honor Guard"] = "Оживленный почетный страж"
L["Reanimation Totem"] = "Тотем воскрешения"
L["Reaping"] = "Пожинающий"
--[[Translation missing --]]
--[[ L["receiveErrorUpdate"] = ""--]] 
L["Receiving: ..."] = "Загрузка: ..."
L["Red, Green and Blue"] = "Красный, Зелёный и Синий"
--[[Translation missing --]]
--[[ L["Redo"] = ""--]] 
L["Refreshment Vendor"] = "Продавщица закусок"
L["Relentless"] = "Непреклонный"
L["Rename"] = "Переименовать"
L["Rename Preset"] = "Изменение названия шаблона"
L["Rename the preset"] = "Переименовать шаблон"
L["Repentance"] = "Покаяние"
L["Reset"] = "Сбросить"
L["Reset %s?"] = "Сбросить шаблон %s?"
L["Reset Preset"] = "Сброс настроек шаблона"
L["Reset the preset to the default state"] = "Сбросить все настройки шаблона"
L["Return to Karazhan Lower"] = "Возвращение в Каражан - нижний ярус"
L["Return to Karazhan Upper"] = "Возвращение в Каражан - верхний ярус"
L["Return to the live preset"] = "Вернуться к маршруту совместному сеансу"
L["Rezan"] = "Резан"
L["Right click a pull for more options."] = "Нажмите правой кнопкой мыши на группу для больших опций"
L["Right click an enemy to open the enemy info window."] = "Нажмите правой кнопкой мыши на противника чтобы открыть окно информации"
--[[Translation missing --]]
--[[ L["Right click for more info"] = ""--]] 
L["Right-click to lock Minimap Button"] = "Нажмите правой кнопкой мыши чтобы зафиксировать Кнопку Мини-карты"
--[[Translation missing --]]
--[[ L["Right-Click to reset NPC position"] = ""--]] 
L["Riptide Shredder"] = "Мастер клинков прилива"
L["Risen Soul"] = "Восставшая душа"
L["Rixxa Fluxflame"] = "Рикса Огневерт"
L["Rocket Tonk"] = "Ракетный танк"
L["Root"] = "Обездвиженность"
L["Rotation"] = "(Ротация"
L["Rowdy Reveler"] = "Буйная гуляка"
L["Ruin's Descent"] = "Спуск скорби"
L["Runecarver Sorn"] = "Резчик рун Сорн"
L["Runic Disciple"] = "Руническая послушница"
L["Sacrificial Pits"] = "Жертвенная яма"
L["Sacristy of Elune"] = "Ризница Элуны"
L["Safety Shark"] = "Сторожевая акула"
L["Saltwater Snapper"] = "Морская черепаха"
L["Samh'rek, Beckoner of Chaos"] = "Сам'рек Призыватель Хаоса"
L["Sand-Crusted Striker"] = "Песочная змея"
L["Sandfury Stonefist"] = "Крушитель из племени Песчаной Бури"
L["Sandswept Marksman"] = "Песчаный стрелок"
L["Sanguine"] = "Кровавый"
L["Sap"] = "Ошеломление"
L["Saurolisk Bonenipper"] = "Завролиск-костеглод"
L["Scaled Krolusk Rider"] = "Чешуйчатый наездник на кролуске"
L["Scaled Krolusk Tamer"] = "Бронированный укротитель кролусков"
L["Scrapbone Bully"] = "Бугай из племени Хламоедов"
L["Scrapbone Grinder"] = "Перемалыватель из племени Хламоедов"
L["Scrapbone Grunter"] = "Ворчун из племени Хламоедов"
L["Scrapbone Shaman"] = "Шаман из племени Хламоедов"
L["Scrapbone Trashtosser"] = "Хламометатель из племени Хламоедов"
L["Scraphound"] = "Утильхаунд"
L["Scrimshaw Enforcer"] = "Вышибала из банды Резчиков"
L["Scrimshaw Gutter"] = "Кишкодер из банды Резчиков"
L["Seasonal Affix:"] = "Сезонный модификатор:"
L["Seat of the Triumvirate"] = "Престол Триумвирата"
L["Seat of the Triumvirate Sublevel"] = "Престол Триумвирата"
L["Select the dungeon level"] = "Выбрать уровень подземелья"
--[[Translation missing --]]
--[[ L["Sending: %.1f"] = ""--]] 
L["Seneschal M'bara"] = "Сенешаль М'бара"
L["Sergeant Bainbridge"] = "Сержант Бейнбридж"
--[[Translation missing --]]
--[[ L["Settings"] = ""--]] 
--[[Translation missing --]]
--[[ L["Sewer Gate"] = ""--]] 
L["Sewer Vicejaw"] = "Сточный злобнокус"
L["Shackle Undead"] = "Сковывание нежити"
L["Shadow of Zul"] = "Тень Зула"
L["Shadowblade Stalker"] = "Крадущийся теневой клинок"
L["Shadow-Borne Champion"] = "Тенеликий защитник"
L["Shadow-Borne Warrior"] = "Тенеликий воин"
L["Shadow-Borne Witch Doctor"] = "Тенеликий колдун"
L["Shalebiter"] = "Сланцеед"
L["Share"] = "Поделиться"
L["Share the preset with your party members"] = "Поделиться маршрутом с членами группы"
L["Shieldbearer of Zul"] = "Щитоносец из армии Зула"
L["Shift-Click to delete all presets for this dungeon"] = "Shift-Клик чтобы удалить все шаблоны для этого подземелья"
L["Shiprat"] = "Корабельная крыса"
L["Shock Bot"] = "Шоковый бот"
L["Shortcut"] = "Короткий путь"
L["Shrine of the Storm"] = "Святилище Штормов"
L["Shrine of the Storm Sublevel"] = "Святилище Штормов (нижний уровень)"
L["Shrine Templar"] = "Храмовник из Святилища Штормов"
--[[Translation missing --]]
--[[ L["shrineGraveyardNote1"] = ""--]] 
L["Shrouded Fang"] = "Скрытный убийца"
L["Siege of Boralus"] = "Осада Боралуса"
L["Siege of Boralus (Upstairs)"] = "Осада Боралуса (верхний уровень)"
L["Siege of Boralus Sublevel"] = "Осада Боралуса"
--[[Translation missing --]]
--[[ L["siegeDuplicateNote"] = ""--]] 
--[[Translation missing --]]
--[[ L["siegeGraveyardNote1"] = ""--]] 
--[[Translation missing --]]
--[[ L["siegeGraveyardNote2"] = ""--]] 
--[[Translation missing --]]
--[[ L["siegeGraveyardNote3"] = ""--]] 
--[[Translation missing --]]
--[[ L["siegeGutterNote2"] = ""--]] 
L["siegeGuttersNote"] = "Заметка про Кишкодеров:%sПехотинцы моментально убивают Кишкодеров как только игрок приближается к ним. Если они умирают не получая урона от группы они не дают очков сил врага"
L["Silence"] = "Немота"
L["Silt Crab"] = "Ильный краб"
L["Sister Briar"] = "Сестра Брайар"
L["Sister Malady"] = "Сестра Маладия"
L["Sister Solena"] = "Сестра Солена"
L["Skeletal Hunting Raptor"] = "Охотничий ящер"
L["Skittish"] = "Упрямый"
L["Skycap'n Kragg"] = "Небесный капитан Крагг"
L["Slime Elemental"] = "Жижементаль"
L["Slow"] = "Замедление"
L["Snarling Dockhound"] = "Злобный портовый пес"
L["Soggy Shiprat"] = "Мокрая корабельная крыса"
L["Soul Essence"] = "Субстанция души"
L["Soulbound Goliath"] = "Оживленный голиаф"
L["Spark Channeler"] = "Искротворец"
L["Spectral Beastmaster"] = "Призрачная повелительница животных"
L["Spectral Berserker"] = "Призрачный берсерк"
L["Spectral Brute"] = "Призрачный громила"
L["Spectral Headhunter"] = "Призрачный охотник за головами"
L["Spectral Hex Priest"] = "Призрачный жрец-проклинатель"
L["Spectral Witch Doctor"] = "Призрачная знахарка"
L["Spider Tank"] = "Танк-паук"
L["Sporecaller Zancha"] = "Заклинатель спор Занча"
L["Start or join the current |cFF00FF00Live Session|r"] = "Создайте или присоединитесь к текущему |cFF00FF00Совместному сеансу|r"
L["Static-charged Dervish"] = "Наэлектризованный дервиш"
L["Stinging Parasite"] = "Жалящий паразит"
L["Stonefury"] = "Каменный яростень"
L["Storm's End"] = "Предел шторма"
L["Strider Tonk"] = "Танк-долгоног"
L["Stun"] = "Оглушение"
L["Sunken Denizen"] = "Утонувший обитатель глубин"
L["Tank Buster MK1"] = ""
L["Taskmaster Askari"] = "Надсмотрщик Аскари"
L["Taunt"] = "Провокация"
--[[Translation missing --]]
--[[ L["tdBuffGateNote"] = ""--]] 
--[[Translation missing --]]
--[[ L["tdGraveyardNote1"] = ""--]] 
--[[Translation missing --]]
--[[ L["tdGraveyardNote2"] = ""--]] 
--[[Translation missing --]]
--[[ L["tdGraveyardNote3"] = ""--]] 
--[[Translation missing --]]
--[[ L["tdHowlisNote"] = ""--]] 
L["TDPrisonKeyText"] = "Выброшенный ключ от клетки%sВозможное место появления Выброшенного ключа от клетки%sОткрывает одну тюремную клетку"
--[[Translation missing --]]
--[[ L["tdWardenFightingNote"] = ""--]] 
L["Teeming"] = "Кишащий"
L["Temple Attendant"] = "Служитель храма"
L["Temple of Sethraliss"] = "Храм Сетралисс"
L["Temple of Sethraliss Sublevel"] = "Храм Сетралисс"
L["templeEyeNote"] = "Глаз Сетралисс%sПринесите оба глаза к Чрепу Сетралисс%sКаждый глаз который был вставлен в череп дает 12 очков Сил Врага"
--[[Translation missing --]]
--[[ L["templeGraveyardNote1"] = ""--]] 
--[[Translation missing --]]
--[[ L["templeGraveyardNote2"] = ""--]] 
L["Test Subject"] = "Подопытная крыса"
L["The Arcway"] = "Катакомбы Сурамара"
L["The Arcway Sublevel"] = "Катакомбы Сурамара"
L["The Balconies"] = "Балконы"
L["The Banquet Hall"] = "Пиршественный зал"
L["The Brig"] = "Гауптвахта"
L["The Cellar"] = "Погреб"
L["The Drain"] = "Стоки"
L["The Emerald Archives"] = "Изумрудные архивы"
L["The Golden Serpent"] = "Золотой Змей"
L["The Grand Foyer"] = "Главный вестибюль"
L["The Grand Hall"] = "Главный зал"
L["The Guest Chambers"] = "Гостевые комнаты"
L["The High Gate"] = "Высокие врата"
L["The Hold"] = "Трюм"
L["The Jeweled Estate"] = "Самоцветный дворец"
L["The Menagerie"] = "Зверинец"
L["The MOTHERLODE!!"] = "ЗОЛОТАЯ ЖИЛА!!!"
L["The MOTHERLODE!! Sublevel"] = "ЗОЛОТАЯ ЖИЛА!!!"
L["The Naglfar"] = "\"Нагльфар\""
L["The Platinum Pummeler"] = ""
L["The preset will continuously synchronize between all party members participating in the Live Session"] = "Этот шаблон будет постоянно синхронизироваться между всеми членами группы, которые участвуют в Совместном Сеансе"
L["The Raven's Crown"] = "Корона Ворона"
L["The Ravenscrypt"] = "Крипта Воронов"
L["The Robodrome"] = "Рободром"
L["The Rook's Host"] = "Гнездовье Черной Ладьи"
L["The Rupture"] = "Разлом"
L["The Sand Queen"] = "Королева песков"
L["The selected affixes are not the ones of the current week"] = "Выбранные аффиксы не соответствуют текущей недели"
L["The selected dungeon level is below 10"] = "Выбранный уровень подземелья ниже 10"
L["The selected level will affect displayed npc health"] = "Выбранный уровень повлияет на количество здоровья NPC"
L["The Servant's Quarters"] = "Комнаты слуг"
L["The Under Junk"] = "Барахлимб"
L["The Underrot"] = "Подгнилье"
L["The Underrot Sublevel"] = "Подгнилье"
L["The Warden's Court"] = "Суд Стражей"
L["Thistle Acolyte"] = "Ведьма-послушница"
L["Thornguard"] = "Шипастый страж"
L["Tidesage Enforcer"] = "Жрец моря - каратель"
L["Tidesage Initiate"] = "Ученик жрецов моря"
L["Tidesage Spiritualist"] = "Жрица моря - спиритуалистка"
L["T'lonja"] = "Т'лонджа"
L["To share a different preset while the live session is active simply navigate to the preferred preset and click the new 'Set to Live' Button next to the preset-dropdown"] = "Чтобы поделиться другим шаблоном во время работы совместного сеанса просто откройте нужный шаблон и нажмите на кнопку \"Совместный сеанс\""
--[[Translation missing --]]
--[[ L["tocNotes"] = ""--]] 
L["Toggle Window"] = "Активировать Окно"
L["Tol Dagor"] = "Тол Дагор"
L["Tol Dagor Sublevel1"] = "Тол Дагор"
L["Tormented Soul"] = "Замученная душа"
L["Total"] = "Всего"
L["Toxic Lurker"] = "Токсичный скрытень"
L["Toxic Monstrosity"] = "Токсичное чудище"
L["Toxic Saurid"] = "Ядовитый саурид"
L["Trixie Tazer"] = "Трикси Искрожгучка"
L["Trothak"] = "Тротак"
L["Twilight Grove"] = "Сумеречная роща"
L["Tyrannical"] = "Тиранический"
L["Unbound Abomination"] = "Освобожденное чудовище"
L["Undead"] = "Нежить"
L["Underrot Tick"] = "Клещ из Подгнилья"
--[[Translation missing --]]
--[[ L["underrotMatronNote"] = ""--]] 
L["underrotSkipNote"] = "Короткий путь%sДоступен после убийства Заклинателя спор Занча"
--[[Translation missing --]]
--[[ L["underrotVoidNote"] = ""--]] 
L["Undo"] = "Отменить"
L["Update"] = "Обновить"
L["Upper Broken Stair"] = "Верх разрушенной лестницы"
L["Upper Library"] = "Верхний ярус библиотеки"
L["Upper Livery Stables"] = "Стойла"
L["Upstairs"] = "Верхний уровень"
L["Urg'roth, Breaker of Heroes"] = "Ург'рот Сокрушитель Героев"
L["Use /mdt reset to restore the default position and scale of MDT."] = "Используйте команду /mdt, чтобы вернуть расположение и размер окна по умолчанию"
L["Use as a starting point:"] = "Использовать как начальную точку:"
L["Vault of the Betrayer"] = "Каземат Предателя"
L["Vault of the Wardens"] = "Казематы Стражей"
L["Vault of the Wardens Sublevel"] = "Казематы Стражей"
L["Venomous Ophidian"] = "Ядовитый змей"
L["Venture Co. Alchemist"] = "Алхимик Торговой компании"
L["Venture Co. Earthshaper"] = "Геомант Торговой компании"
L["Venture Co. Longshoreman"] = "Докер Торговой компании"
L["Venture Co. Mastermind"] = "Гений Торговой компании"
L["Venture Co. Skyscorcher"] = "Огнелетчица Торговой компании"
L["Venture Co. War Machine"] = "Боевая машина Торговой компании"
L["Vermin Trapper"] = "Крысолов"
L["Viq'Goth"] = "Вик'Гот"
L["Void-Touched Emissary"] = "Меченная Бездной посланница"
L["Voidweaver Mal'thir"] = "Мал'тир - маг Бездны"
L["Volcanic"] = "Вулканический"
L["Vol'kaal"] = "Вол'каал"
L["Vol'zith the Whisperer"] = "Вол'зит Шепчущая"
L["Wanton Sapper"] = "Бесшабашная подрывница"
L["Waste Pipes"] = "Барахлопровод"
L["Waste Processing Unit"] = "Переработчик отходов"
L["Waycrest Manor"] = "Усадьба Уэйкрестов"
L["Waycrest Reveler"] = "Гуляка из дома Уэйкрестов"
--[[Translation missing --]]
--[[ L["wcmWorldquestNote"] = ""--]] 
L["Weaponized Crawler"] = "Вооруженный робопаук"
L["Weapons Tester"] = "Испытатель экспериментального оружия"
L["Welding Bot"] = "Сварочный робот"
L["Windspeaker Heldis"] = "Говорящая с ветрами Хелдис"
L["Workshop Defender"] = "Защитник мастерской"
L["Yazma"] = "Язма"
L["You are using MDT. You rock!"] = "Вы используете MDT. Вы крут!"
L["You can always return to the current Live Session preset by clicking the 'Return to Live' button next to the preset-dropdown"] = "Вы всегда можете вернуться к шаблону Совместного Сеанса нажав на кнопку \"Вернуться к Совместному Сеансу\" "
L["You can choose from different color palettes in the automatic pull coloring settings menu."] = "Вы можете выбрать из различных цветовых палеток в меню автоматического окрашивания"
L["You can cycle through different floors by holding CTRL and using the mousewheel."] = "Вы можете переключаться между этажами при помощи CTRL+колесо мыши"
L["You can cycle through dungeons by holding ALT and using the mousewheel."] = "Вы можете переключаться между подземельями зажав ALT+Колесо мышки"
L["You can find MDT exports from other users on the wago.io website"] = "Вы можете найти маршруты для MDT, созданные другими пользователями на сайте wago.io"
L["You can share MDT exports on the wago.io website"] = "Вы можете поделиться своими маршрутами на сайта wago.io"
L["Zanazal the Wise"] = "Заназал Мудрый"
L["Zanchuli Witch-Doctor"] = "Занчульская знахарка"

