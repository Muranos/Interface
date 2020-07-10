-- Localization for Portuguese (Brazil) Clients.
if GetLocale() ~= "ptBR" then return; end
local app = select(2, ...);
local L = app.L;

-- TODO

local a = L.NPC_ID_NAMES;
for key,value in pairs({
	-- Enter translated NPCID's here
})
do a[key] = value; end

local a = L.OBJECT_ID_NAMES;
for key,value in pairs({
	-- Enter translated OBJECTID's here
	[31] = "Estátua de Leão Antiga",
	[34] = "Velho Garrafão",
	[55] = "Corpo semi-devorado",
	[56] = "Cadáver de Rodolfo",
	[61] = "A Velha Lápide",
	[256] = "Procura-se!",
	[259] = "Barril Semienterrado",
--	[270] = "Unguarded Thunder Ale Barrel",						-- No translation
	[2059] = "Cadáver Enânico",
	[2076] = "Caldeirão Borbulhante",
	[2083] = "Correspondência dos Vela Sangrenta",
	[2701] = "Fragmentos Iridescentes",
	[2702] = "Pedra da União Interna",
	[2713] = "Quadro de Procurados",
	[2908] = "Caixote de Suprimentos Lacrado",
	[3972] = "PROCURA-SE",
	[4141] = "Painel de Controle",
	[6751] = "Planta Frutífera Estranha",
	[6752] = "Planta Frondosa Estranha",
	[7510] = "Fronde Desenvolvida",
	[19023] = "|cFFFFFFFFStep 7:|r Página 2351",
	[20985] = "Terra Solta",
	[20992] = "Escudo Negro",
	[21042] = "Insígnia da Guarda de Theramore",
	[35251] = "Baú de Karnitol",
	[112948] = "Cofre Trancado do Intrépido",
	[113768] = "Ovo Colorido Brilhante",
	[123329] = "Baú de Baelog",
	[131474] = "Os Discos de Norgannon",
	[131979] = "Baú de Lenhanegra Grande",
	[138492] = "Estilhaços de Myzrael",
	[141979] = "Tesouro Antigo",
	[142195] = "Mapa de Batalha de Patábua",
	[142343] = "Pedestal de Uldum",
	[142487] = "A Brastematic 5200",
	[144063] = "Monolito de Equinex",
	[148502] = "|cFFFFFFFFStep 1:|r Página 9",
	[148504] = "Lápide Evidente",
	[156561] = "Pôster de Procura-se",
	[160836] = "Arca de Relíquia",
	[160845] = "Cofre Sombrio",
	[161495] = "Cofre Secreto",
--	[161504] = "A Small Pack",								-- No translation
	[161505] = "Bote Naufragado",
	[161521] = "Equipamento de Pesquisa",
	[161526] = "Caixote de Comestíveis",
	[164820] = "Placa de Identificação do Guardião Sombrio",
--	[164885] = "Corrupted Night Dragon",					-- No translation
--	[164886] = "Corrupted Songflower",						-- No translation
--	[164887] = "Corrupted Windblossom",						-- No translation
--	[164888] = "Corrupted Whipper Root",					-- No translation
	[164955] = "Torre de Cristal Norte",
	[164956] = "Torre de Cristal Oeste",
	[164957] = "Torre de Cristal Oriental",
	[169243] = "Baú dos Sete",
	[173232] = "Instruções de Ferraria",
	[174682] = "Cuidado com o Pterrordax",
--	[175320] = "WANTED: Murkdeep!",							-- No translation
--	[175524] = "Mysterious Red Crystal",					-- No translation
	[175756] = "O Flagelo de Lordaeron",
	[176090] = "Restos Humanos",
	[176091] = "Caldeirão de Lenha Morta",
--	[176115] = "Wanted Poster - Arnak Grimtotem",			-- No translation
	[176392] = "Caldeirão do Flagelo",
	[177787] = "Diário de Rodovalho",
--	[177904] = "Wanted Poster: Besseleth",					-- No translation
	[177964] = "Pedra das Profundezas",
	[179485] = "Armadilha Quebrada",
--	[179501] = "Knot Thimblejack's Cache",					-- No translation
	[179832] = "Travesseiro Ornado da Alma Fada",
	[179564] = "Homenagem a Gordok",
	[179697] = "Baú do Tesouro da Arena",
	[180448] = "Cartaz de Procura-se: Agarramata",
	[180503] = "Livro de Receitas da Sandy",
	[180690] = "Grande Arca do Escaravelho",
	[180691] = "Arca do Escaravelho",
	[180794] = "Diário de Janice Barov",
	[180918] = "Procura-se: Thaelis, o Famélico",
	[181011] = "Diário do Magíster Ocaso",
--	[181074] = "Arena Spoils",								-- No translation
--	[181083] = "Sothos and Jarien's Heirlooms",				-- No Translation
	[181147] = "Cartaz de Procura-se",
	[181150] = "Diário Empoeirado",
	[181153] = "Cartaz de Procura-se: Kel'gash, o Perverso",
	[181333] = "Chama de Altaforja",
	[181334] = "Chama de Darnassus",
	[181335] = "Chama da Cidade Baixa",
	[181336] = "Chama de Orgrimmar",
	[181337] = "Chama do Penhasco do Trovão",
	[181748] = "Cristal de Sangue",
	[181756] = "Livro Antigo e Surrado",
	[181889] = "Cartaz de Procura-se",
	[182032] = "Diário de Galaen",
	[182115] = "Cartaz de Procura-se",
	[182165] = "Cartaz de Procura-se",
	[182549] = "Planos dos Orcs Vis",
	[182587] = "Cartaz de Procura-se",
	[182588] = "Cartaz de Procura-se",
	[182392] = "Quadro de Avisos de Garadar",
	[182393] = "Quadro de Avisos de Telaar",
	[182947] = "O Códice de Sangue",
	[182952] = "Destroços da Bomba de Vapor",
	[183284] = "Cartaz de Procura-se",
	[183770] = "Painel de Controle de B'naar",
	[183811] = "Cartaz de Procura-se",
	[184300] = "Foco Necromântico",
	[184465] = "Baú da Legião",
	[184660] = "Cartaz de Procura-se",
	[184825] = "Tomo de Lashh'an",
	[184945] = "Cartaz de Procura-se",
	[184946] = "Cartaz de Procura-se",
	[185035] = "Cartaz de Procura-se",
	[185126] = "Prisão de Cristal",
	[185165] = "Comunicador da Legião",
	[185168] = "Baú Reforçado de Ferrovil",
	[185927] = "Prisma de Cristal Vil",
	[186426] = "Cartaz de Procura-se",
	[186648] = "Baú do Hazlek",
	[186667] = "Pacote da Norkani",
	[186672] = "Sacola da Kasha",
	[186887] = "Lanterna de Abóbora Grande",
	[187021] = "Algibeira do Bakkalzu",
	[187273] = "Pegada Suspeita",
	[187559] = "Fogueira da Horda",
	[187564] = "Fogueira da Aliança",
	[187565] = "Ancião Atkanok",
	[187674] = "Carapaça Endurecida de Ith'rix",
	[187851] = "Altar dos Sectários",
	[187905] = "Ovo Reluzente Gigante",
	[187916] = "Fogueira da Aliança",
	[187917] = "Fogueira da Aliança",
	[187921] = "Fogueira da Aliança",
	[187923] = "Fogueira da Aliança",
	[187924] = "Fogueira da Aliança",
	[187927] = "Fogueira da Aliança",
	[187947] = "Fogueira da Horda",
	[187948] = "Fogueira da Horda",
	[187957] = "Fogueira da Horda",
	[187958] = "Fogueira da Horda",
	[187959] = "Fogueira da Horda",
	[188085] = "Grão Pestilento",
	[188128] = "Chama da Exodar",
	[188129] = "Chama de Luaprata",
	[188261] = "Diário Surrado",
	[188364] = "Armadilha para Caranguejo Destruída",
	[188365] = "Coração dos Antigos",
	[188419] = "Ancião Mana'loa",
	[188667] = "Semente Âmbar",
	[189311] = "Tomo Encadernado com Carne",
	[189989] = "Destroços da Máquina Toupeira dos Ferro Negro",
	[189990] = "Destroços da Máquina Toupeira dos Ferro Negro",
	[190020] = "Procura-se!",
	[190035] = "Balde de Balas",
	[190037] = "Balde de Balas",
	[190038] = "Balde de Balas",
	[190045] = "Balde de Balas",
	[190051] = "Balde de Balas",
	[190052] = "Balde de Balas",
	[190064] = "Balde de Balas",
	[190079] = "Balde de Balas",
	[190083] = "Balde de Balas",
	[190085] = "Balde de Balas",
	[190104] = "Balde de Balas",
	[190917] = "Cartas Abandonadas",
	[190936] = "Caldeirão da Praga",
	[191728] = "Procura-se!",
	[191760] = "Console da Biblioteca do Inventor",
	[191761] = "Console de Protótipo",
	[192049] = "Cardume de Arenques Presadentes",
	[192060] = "Bigorna de Fjorn",
	[192072] = "Caixote de Arpões",
	[194105] = "Caixazorra 413",
	[194122] = "Caixazorra 723",
	[194378] = "Documento Roubado da Liga dos Exploradores",
	[194387] = "Documento Roubado da Liga dos Exploradores",
	[194388] = "Documento Roubado da Liga dos Exploradores",
	[194389] = "Documento Roubado da Liga dos Exploradores",
	[194390] = "Documento Roubado da Liga dos Exploradores",
	[194391] = "Documento Roubado da Liga dos Exploradores",
	[194714] = "Bancada de Trabalho Nojenta",
	[195134] = "A Bomba",
	[195431] = "Rádio do Centro de Operações",
	[195433] = "Tabuletas Ancestrais",
	[195435] = "Cabine de Armas",
	[195438] = "Taça de Eluna",
	[195445] = "Pedra Rúnica do Vórtice Ancestral",
	[195497] = "Braseiro de Eluna",
	[195517] = "Criada de Eluna",
	[195600] = "Pedra Fumegante",
	[195642] = "Pedra do Poder Naga",
	[195676] = "Tagarela do Laboratório Secreto",
	[196393] = "Relíquia Quebrada",
	[196832] = "Pedra Divinatória Superior",
	[196833] = "Pedra Divinatória Inferior",
	[201578] = "Cartaz de Recrutamento de Operários",
	[202080] = "Ninho da Saltadora",
	[202081] = "Ninho de Takk",
	[202082] = "Ninho da Matriarca Ravassauro",
	[202083] = "Ninho da Matriarca Rasgaqueixo",
	[202135] = "Túmulo de Dadanga",
	[202407] = "Baú do Ranhareias",
	[202474] = "Baú Antediluviano",
	[202598] = "Detonadorzão Sinistro",
	[202697] = "Olho do Crepúsculo",
	[202701] = "Casinha de Esconderijo",
	[202706] = "Caldeirão do Crepúsculo",
	[202712] = "O Apócrifo Crepuscular",
	[202741] = "Veio de Elemêntio Abundante",
	[202776] = "Cardume de Truta da Montanha",
	[202777] = "Cardume de Lebiste das Terras Altas",
	[202778] = "Cardume de Bagres-cegos Albinos",
	[202779] = "Cardume de Muçuns-de-barriga-preta",
	[202780] = "Grande Cardume de Enguias de Profundeza",
	[202871] = "Caixote Submerso",
	[202975] = "Banheiro Submerso",
	[203128] = "Garrafa Quebrada",
	[203134] = "Pedestal Vazio",
	[203140] = "Ponta Quebrada",
	[203186] = "NÃO ENTRE!!!",
	[203207] = "Códice das Sombras",
	[203733] = "Quadro de Recompensas",
	[203734] = "Escritura de Cerro Oeste",
	[203755] = "Cartaz de Recrutamento de Operários",
	[204050] = "Diagramas do Devastador",
	[204274] = "Diário de Bordo",
	[204344] = "Procura-se!",
	[204351] = "Orbe de Controle de Gorjala",
	[204406] = "Garrafa Semi-enterrada",
	[204450] = "Mapas do Capitão Tranquiláguas",
	[204578] = "Barril de Rumdumal",
	[204817] = "Bastão Forjado a Luz",
	[204824] = "Arco Forjado a Luz",
	[204825] = "Cimeira Forjada a Luz",
	[204959] = "Drusa Gigante de Dolorita",
	[205134] = "Diário do Mestre Forjador",
	[205143] = "Banheiro Abandonado",
	[205198] = "Pilha de Explosivos",
	[205207] = "Diário de Maziel",
	[205258] = "Caixote de Armas Quebrado",
	[205266] = "Disco Sofisticado",
	[205332] = "Cartaz de Procura-se",
	[205350] = "Painel de Comunicação da Horda",
	[205540] = "Esqueleto Decrépito",
	[205874] = "Hieróglifos Cobertos de Areia",
	[205875] = "Clarão do Cruzado",
	[206109] = "Mural de Ordens do Chefe Guerreiro",
	[206116] = "Mural de Ordens do Chefe Guerreiro",
	[206293] = "Terminal A.I.D.A.",
	[206335] = "Pedaço de Pedra",
	[206336] = "Pedaço de Mármore",
	[206374] = "Tesouro dos Observadores",
	[206569] = "Olho do Crepúsculo",
	[206585] = "Totem de Ruumbo",
	[206944] = "Pá",
	[207104] = "Controle de Bombeamento Automático",
	[207179] = "Caldeirão Invernoso",
	[207279] = "Mural de Ordens do Chefe Guerreiro",
	[207303] = "Mural de Aventuras",
	[207304] = "Mural de Aventuras",
	[207320] = "Mural do Chamado ao Heroísmo",
	[207321] = "Mural do Chamado ao Heroísmo",
	[207322] = "Quadro do Chamado ao Heroísmo",
	[207323] = "Mural de Ordens do Chefe Guerreiro",
	[207359] = "Ovo Puro do Crepúsculo",
	[207472] = "Baú do Tesouro Reforçado com Prata",
	[207484] = "Baú do Tesouro Resistente",
	[207496] = "Baú do Tesouro de Ferro Negro",
	[207512] = "Baú do Tesouro de Seda",
	[207520] = "Baú do Tesouro de Bordo",
	[207533] = "Baú do Tesouro de Pedra Rúnica",
	[207724] = "Destroços do Naufrágio",
	[207982] = "Fogueira da Aliança",
	[207983] = "Fogueira da Horda",
	[207991] = "Fogueira da Horda",
	[208115] = "Balde de Doces",
	[208117] = "Balde de Doces",
	[208118] = "Balde de Doces",
	[208119] = "Balde de Doces",
	[208140] = "Balde de Doces",
	[208157] = "Balde de Doces",
	[208158] = "Balde de Doces",
	[208159] = "Balde de Doces",
	[208311] = "Cardume de Sabichões Abissais",
	[208365] = "Monturo de Terra Remexido Recentemente",
	[208535] = "Semente Seca",
	[209072] = "Caixote Roubado",
	[209076] = "Caixote de Anselmo",
	[209094] = "Caixote Roubado",
	[209095] = "Caixote de Edgar",
	[209270] = "|cFFFFFFFFStep 2:|r Página 78",
	[209620] = "Baú do Tesouro de Negraluna",
	[211424] = "Pergaminho de Alquimia",
	[212389] = "Pergaminho do Auspício",
	[213362] = "Armário do Navio",
	[213363] = "Estoque Mantídeo de Wodin",
	[213364] = "Picareta de Mineração Pandarênica Antiga",
	[213366] = "Chaleira Pandarênica Antiga",
	[213368] = "Moeda da Sorte Pandarênica",
	[213649] = "Baú de Mercadorias Pilhadas",
	[213650] = "Baú do Tesouro Vermingue",
	[213651] = "Baú de Equipamento",
	[213653] = "Lança de Pesca Pandarênica",
	[213741] = "Cajado Jinyu Antigo",
	[213742] = "Martelo dos Dez Trovões",
--	[213743] = "Jade Infused Blade",						-- No translation
	[213748] = "Pedra Ritual Pandarênica",
	[213749] = "Cajado do Mestre Oculto",
	[213750] = "Tabuleta de Pedra de Saurok",
	[213751] = "Peitoral de Tecido de Duende",
	[213765] = "Tabuleta de Ren Yun",
	[213767] = "Tesouro Escondido",
	[213768] = "Lança do Guerreiro Hozen",
	[213769] = "Baú do Tesouro Hozen",
	[213770] = "Tesouro de Duende Roubado",
	[213771] = "Estátua de Xuen",
	[213774] = "Pertences Perdidos do Aventureiro",
	[213782] = "Cabeça de Terracota",
	[213793] = "Pequenino Baú de Rikktik",
	[213842] = "Baú de Armas Yaungóis",
	[213844] = "Mariposa Encerrada em Âmbar",
	[213845] = "O Martelo dos Loucos",
	[213956] = "Fragmento de Medo",
	[213959] = "Bordão Resistente de Kri'vess",
	[213960] = "Carregador de Fogo Yaungol",
	[213961] = "Caixote de Mercadorias Abandonado",
	[213962] = "Adaga de Golpes Rápidos do Aniquilador dos Ventos",
	[213964] = "Lança Impávida de Malik",
	[213966] = "Colar Encerrado em Âmbar",
	[213967] = "Lâmina do Primogênito",
	[213968] = "Cutelo Enxameante de Ka'roz",
	[213969] = "Cajado da Mutação da Dissecadora",
	[213970] = "Fragmento de Quitina Ensanguentado",
	[213971] = "Medalhão do Guardião do Enxame",
	[213972] = "Lâmina da Mente Envenenada",
	[213973] = "Relé Sônico Klaxxi",
	[214062] = "Âmbar Chamejante",
	[214325] = "Cofre Esquecido",
	[214337] = "Baú de Gemas",
	[214338] = "Oferenda de Lembrança",
	[214339] = "Baú de Suprimentos",
	[214340] = "Instruções para Construir Barco",
	[214403] = "Pilha de Papéis",
	[214407] = "Baú do Tesouro de Mo-Mo",
	[214438] = "Tabuleta Mogu Antiga",
	[214439] = "Barril de Rum com Essência de Banana",
	[214562] = "Cristal Assombrado pelo Sha",
	[215705] = "Templo dos Lavradores",
	[218750] = "Ordens de Serviço",
	[220641] = "Tesouro do Senhor do Trovão",
	[220820] = "|cFFFFFFFFStep 6:|r Página 1127",
	[220821] = "|cFFFFFFFFStep 5:|r Página 845",
	[220832] = "Tesouro afundado",
	[221376] = "Fragmento de Letreiro Velho",
	[221413] = "Pergaminho da Família Lin",
	[222685] = "Ninho de Garça",
	[223533] = "Oferta de Paz",
	[224228] = "Caldeirão Borbulhante",
	[224306] = "Correntes Partidas",
	[224392] = "Tesouro do Escravo",
	[224613] = "Baú de Espectador",
	[224616] = "Petroglifo de Obsidiana",
	[224623] = "Ovo Agitado",
	[224633] = "Suprimentos da Horda de Ferro",
	[224686] = "Destripadora do Devorador",
	[224713] = "Depósito do Malho Escarpado",
	[224750] = "Bolsa Pendurada",
	[224753] = "Ovo de Rylak Escamoso",
	[224754] = "Baú Encharcado",
	[224755] = "Tributo da Horda de Ferro",
	[224756] = "Algibeira do Alquimista",
	[224770] = "Tesouro do Exilado da Lua Negra",
	[224780] = "Adaga Sacrifical da Lua Negra",
	[224781] = "Cesta Apodrecida",
	[224783] = "Jarra com Fundo Falso",
	[224784] = "Baú do Vindicante",
	[224785] = "Baú Demoníaco",
	[225501] = "Oferta de Paz",
	[225502] = "Oferta de Paz",
	[225503] = "Oferta de Paz",
--	[226468] = GetSpellInfo(155344),		-- Buffeting Galefury
--	[226469] = GetSpellInfo(154259),		-- Spirit of the Wolf
	[226831] = "Caixa do Astrólogo",
	[226854] = "Presa de Elekk Blindado",
	[226861] = "Pertences de Ronokk",
	[226862] = "Cone de Salgueiro-da-lua Gigante",
	[226865] = "Carga da Rainha dos Corvos",
	[226955] = "Trompa de Guerra do Mestre da Arena",
	[226956] = "Pilha de Frutas Misteriosas",
	[226961] = "Quadro de Recompensas",
	[226967] = "Cardume da Lagoa",
	[226976] = "Botas Fumegantes de Engânia",
	[226983] = "Baú do Salta-pedra",
	[226990] = "Lixo dos Suprimentos",
	[226993] = "Esconderijo do Sobrevivencialista",
	[226994] = "Tesouro Calafrio",
	[226996] = "Sobras de Goren",
	[227134] = "Suprimentos da Horda de Ferro",
	[227504] = "Lança Farpada do Senhor do Trovão",
	[227527] = "Portaluz",
	[227587] = "Presente de Yuuri",
	[227654] = "Lança Mascaosso",
	[227743] = "Peixe Fantástico",
	[227793] = "Tesouro da Família Aarko",
	[227806] = "Estandarte Gasto dos Lobo do Gelo",
	[227859] = "Esperança",
	[227868] = "Poça Brilhante",
	[227951] = "Caixa de Pesca de Rook",
	[227953] = "Jarra de Ferrovinho Envelhecido",
	[227954] = "Concha Luminosa",
	[227955] = "Cristal de Ametil",
	[227956] = "Lancheira do Encarregado",
	[227996] = "Ovo de Teia Mortal Curioso",
	[227998] = "Mochila de Ockbar",
	[228012] = "Espada Chamuscada",
	[228013] = "Recompensa da Fazendeira",
	[228014] = "Relíquia de Aruuna",
	[228015] = "Caixa de Ferro",
	[228016] = "Barril de Peixes",
	[228017] = "Armas Draeneicas",
	[228018] = "Relicário do Atalmas",
	[228019] = "Saco de Teia",
	[228020] = "Relíquia de Telmor",
	[228021] = "Tesouro de Ango'rosh",
	[228022] = "Luz do Mar",
	[228023] = "Restos dos Mascaosso",
	[228024] = "Vagonete de Mineração de Aruuna",
	[228025] = "Pertences de Keluu",
	[228026] = "Pó de Cristal Puro",
	[228483] = "Cofre Enferrujado",
	[228570] = "Tesouro de Ketya",
	[229328] = "Bolsa do Enviado",
	[229330] = "Anel Misterioso",
	[229333] = "Botas Misteriosas",
	[229354] = "Moeda Brilhante",
	[229367] = "Esqueleto de Orc Congelado",
	[229640] = "Machado Congelado do Lobo do Gelo",
	[230252] = "Pérola Incandescente",
	[230401] = "Jarra Lacrada",
	[230402] = "Moeda da Sorte",
	[230424] = "Caixa-forte Coberta de Neve",
	[230425] = "Osso Roído",
--	[230544] = GetSpellInfo(155334),		-- Touched By Ice
	[230611] = "Saco de Tesouro Desbotado",
	[230643] = "Ninho de Terogarra",
	[230664] = "A Lâmina de Cristal de Torvath",
	[230909] = "Suprimentos Esquecidos",
	[231064] = "Esconderijo de Outros Materiais da Lady Sena",
	[231069] = "Adaga de Aparência Estranha",
	[231100] = "Vinhálgida",
	[231103] = "Roubo do Saque",
	[231644] = "Crânio Cornífero",
	[231903] = "Relatório de Barbadelho",
	[232066] = "Tesouro Afundado",
	[232067] = "Tesouro Roubado",
	[232406] = "Kit do Aventureiro",
	[232416] = "Quadro de Comando",
	[232492] = "Destrutiro",
	[232494] = "Baú Coberto de Cogumelos",
	[232579] = "Ovo de Kaliri",
	[232582] = "Cinzas de A'kumbo",
	[232583] = "Copo de Chifre Entalhado",
	[232586] = "Adaga de Rovo",
	[232587] = "Quinquilharias de Uzko",
	[232588] = "Urna de Greka",
	[232589] = "Bolsa de Herborismo de Veema",
	[232590] = "Cristal Infuso de Caos",
	[232591] = "Oferenda ao Amado",
	[232596] = "Machadão do Ancestral",
	[232621] = "Esporo Estranho",
	[232624] = "Baú de Mikkal",
	[233101] = "Barco de Pesca Afundado",
	[233126] = "Tesouro da Lua Negra",
	[233137] = "Baú da Lâmina Ardente",
	[233139] = "Baú Titânico Antigo",
	[233149] = "Tesouro Gargaveira",
	[233206] = "Carga Abandonada",
	[233218] = "Kit do Aventureiro",
	[233241] = "Cogumelo da Caverna Brilhante",
--	[233263] = GetSpellInfo(154253),		-- Blessing of the Wolf
	[233391] = "Ordens de Armamento",
	[233455] = "Recipiente de Pedra Antigo",
	[233457] = "Cajado do Aventureiro",
	[233499] = "Mochila do Aventureiro",
	[233501] = "Vagem Petrificada Misteriosa",
	[233504] = "Restos de Grimnir Cinzafura",
	[233505] = "Ovo Petrificado Desconhecido",
	[233507] = "Depósito Ôgrico Esquecido",
	[233511] = "Kit do Aventureiro",
	[233513] = "Depósito da Caveira Esquecido",
	[233524] = "Ovo Petrificado Desconhecido",
	[233525] = "Semente da Essência de Botani",
	[233532] = "Adaga Esculpida em Osso",
	[233522] = "Formação de Cristais de Obsidiana",
	[233523] = "Vagem Petrificada Misteriosa",
	[233526] = "Baú Titânico Antigo",
	[233550] = "Ovo Petrificado Desconhecido",
	[233552] = "Recipiente de Pedra Antigo",
	[233558] = "Vagem Petrificada Misteriosa",
	[233559] = "Depósito da Caveira Esquecido",
	[233560] = "Fragmento de Oshu'gun",
	[233561] = "Décimo Terceiro Machado de Pokkar",
	[233593] = "Crânio de Saberon Polido",
	[233598] = "Grilhões Elementais",
	[233611] = "Marreta do Malho Imponente",
	[233613] = "Escudo do Defensor Telaar",
	[233618] = "Miçangas Ôgricas",
	[233623] = "Bolsa do Aventureiro",
	[233645] = "Elmo do Brado Guerreiro",
	[233650] = "Maça do Aventureiro",
	[233651] = "Pingente Perdido",
	[233658] = "Bolsa do Aventureiro",
	[233697] = "Esconderijo Saberon",
	[233792] = "Pilha de Destroços",
	[233917] = "Fêmur da Improbabilidade",
	[233975] = "Buu do Scruby",
	[234054] = "Ovo de Goren Tépido",
	[234147] = "Pertences do Proscrito",
	[234456] = "Baú da Mão Despedaçada",
	[234474] = "Esconderijo Saberon",
	[234618] = "Dádiva de Anzu",
	[234740] = "Trompa Sinalizadora Órquica",
	[235091] = "Anel Perdido",
	[235097] = "Grimório Negro de Ephial",
	[235127] = "Vagem Petrificada Misteriosa",
	[235129] = "Sementes Enriquecidas",
	[235143] = "Lança do Assassino",
	[235168] = "Algibeira do Proscrito",
	[235172] = "Pertences do Proscrito",
	[235289] = "Martelo do Operário da Guarnição",
	[235307] = "Capanga Encharcada",
	[235313] = "Picareta Abandonada",
	[235859] = "Sacola de Brokor",
	[235860] = "Esqueleto de Orc",
	[235869] = "Baú de Armas",
	[235881] = "Ovo de Rylak Petrificado",
	[236092] = "Mochilão de Emergência Escondido",
	[236096] = "Restos Mortais de Balldir Rochafunda",
	[236099] = "Lança Tocada Pelo Sol",
	[236139] = "Lata do Explorador",
	[236138] = "Baú de Suprimentos de Ferro",
	[236140] = "Túnel Goren",
	[236141] = "Pacote Descartado",
	[236147] = "Martelo do Vindicante",
	[236149] = "Tesouro Secreto de Sasha",
	[236158] = "Besta do Franco-atirador",
	[236169] = "Cristal Precioso Coletável",
	[236170] = "Restos Mortais de Balik Tritu",
	[236178] = "Depósito de Suprimentos Perenalba",
	[236206] = "Mapa de Planejamento Bélico",
	[236257] = "Baú Titânico Antigo",
	[236258] = "Ovo Petrificado Desconhecido",
	[236259] = "Vagem Petrificada Misteriosa",
	[236260] = "Vagem Petrificada Misteriosa",
	[236264] = "Depósito da Caveira Esquecido",
	[236265] = "Recipiente de Pedra Antigo",
	[236266] = "Ovo Petrificado Desconhecido",
	[236267] = "Baú Titânico Antigo",
	[236269] = "Formação de Cristais de Obsidiana",
	[236270] = "Recipiente de Pedra Antigo",
	[236271] = "Recipiente de Pedra Antigo",
	[236274] = "Recipiente de Pedra Antigo",
	[236275] = "Baú Titânico Antigo",
	[236276] = "Formação de Cristais de Obsidiana",
	[236278] = "Formação de Cristais de Obsidiana",
	[236279] = "Recipiente de Pedra Antigo",
	[236280] = "Baú Titânico Antigo",
	[236284] = "Tesouro Ôgrico Ancestral",
	[236285] = "Recipiente de Pedra Antigo",
	[236288] = "Baú Titânico Antigo",
	[236289] = "Recipiente de Pedra Antigo",
	[236348] = "Tesouro Ôgrico Ancestral",
	[236349] = "Baú Titânico Antigo",
	[236350] = "Recipiente de Pedra Antigo",
	[236351] = "Tesouro Ôgrico Ancestral",
	[236399] = "Recipiente de Pedra Antigo",
	[236400] = "Tesouro Ôgrico Ancestral",
	[236402] = "Baú Titânico Antigo",
	[236404] = "Recipiente de Pedra Antigo",
	[236406] = "Tesouro Ôgrico Ancestral",
	[236407] = "Tesouro Ôgrico Ancestral",
	[236483] = "Dádiva dos Ancestrais",
	[236693] = "Munições da Horda de Ferro",
	[236715] = "Caveira Estranha",
	[236755] = "Cofre Empoeirado",
	[236935] = "Baú da Lâmina Ardente",
	[237511] = "Esporo Estranho",
	[237821] = "Ordens da Furiagume",
	[239143] = "Copo de Leite Morno",
	[239171] = "Copo de Leite Morno",
	[239194] = "Baú de Norana",
	[239198] = "Baú de Isaari",
	[239828] = "Gume da Realidade",
	[239901] = "Ovo de Rasga-caos",
--	[239925] = GetSpellInfo(155346),	-- Ogrish Fortitude
--	[239926] = GetSpellInfo(155315),	-- Touched By Fire
	[240003] = "Safira Estranha",
	[240289] = "Machado Desgastado",
	[240317] = "Tomo das Sombras de Iskar",
	[240577] = "A Lâmina de Kra'nak",
	[240580] = "Joia do Fogo do Inferno",
	[240616] = "Suprimentos Congelados",
	[240617] = "Bolsa da Sentinela Perdida",
	[240622] = "Estojo de Pergaminhos do Guardião",
	[240623] = "Caixa-forte de Sylvana",
	[240624] = "Ninho de Dragoleta",
	[240625] = "Relicário da Alta-sacerdotisa",
	[240855] = "Tomo dos Segredos",
	[241128] = "Tesouro Folhacardo Desprotegido",
	[241434] = "Lança de Caça Alojada",
	[241450] = "Espeto Vil Cristalizado",
	[241521] = "Flauta do Encantador de Serpentes",
	[241522] = "A Flor Perfeita",
	[241533] = "Lâmina do Campeão Esquecido",
	[241563] = "Turíbulo da Tormenta",
	[241565] = "Tesouro dos Olhos Sangrentos Saqueado",
	[241566] = "Fêmur com Runa Gravada",
	[241599] = "Fruta Estranha",
	[241600] = "Elmo Descartado",
	[241601] = "Pertences do Batedor",
	[241605] = "Essência dos Elementos Cristalizada",
	[241656] = "Relíquia Gigante",
	[241664] = "Luneta Encantada \"Emprestada\"",
	[241671] = "Fragmento da Cifra Esquecido",
	[241674] = "Crânio do Chefe Louco",
	[241692] = "Machado do Lobo Lastimoso",
	[241713] = "O Olho de Grannok",
	[241726] = "Depósito de Espinho do Meridiano",
	[241742] = "Livro de Zyzzix",
	[241743] = "Depósito de Vilardósia",
	[241745] = "Bolsa Envolta em Vilania",
	[241760] = "Lâmina de Sacrifício",
	[241835] = "Esconderijo de Cogumelos dos Olhos Sangrentos",
	[241841] = "Cajado Místico Saqueado",
	[241847] = "O Escudo do Comandante",
	[241848] = "Bastão Ofuscante",
	[243334] = "Planta Murcha",
	[243911] = "Monte de Neve",
	[244473] = "Itens Roubados dos Totem do Trovão",
	[244628] = "Prêmio de Taurson",
	[244678] = "|cFFFFFFFFStep 8:|r Página 5555",
	[244689] = "Baú do Tesouro Pequeno",
	[244691] = "Baú do Tesouro Pequeno",
	[244692] = "Baú do Tesouro Pequeno",
	[244694] = "Baú do Tesouro Pequeno",
	[244698] = "Baú do Tesouro Pequeno",
	[244699] = "Baú do Tesouro Pequeno",
	[244700] = "Baú do Tesouro Pequeno",
	[244701] = "Baú do Tesouro Pequeno",
	[245345] = "Baú do Tesouro Pequeno",
	[246269] = "Baú do Tesouro Pequeno",
	[246353] = "Baú do Tesouro Pequeno",
	[246555] = "Baú do Tesouro Pequeno",
	[246556] = "Baú do Tesouro Pequeno",
	[246557] = "Baú do Tesouro Pequeno",
	[246558] = "Baú do Tesouro Pequeno",
	[246559] = "Baú do Tesouro Pequeno",
	[246560] = "Baú do Tesouro Pequeno",
	[246561] = "Baú do Tesouro Pequeno",
	[246562] = "Baú do Tesouro Pequeno",
	[244965] = "Baú de Sheddle",
	[244983] = "Relógio de Bolso Sujo",
	[245216] = "|cFFFFFFFFStep 3:|r Página 161",
	[245316] = "Baú do Tesouro Pequeno",
	[245479] = "Baú Desgastado",
	[245793] = "Diário Surrado",
	[246147] = "Baú do Tesouro Pequeno",
	[246249] = "Baú do Tesouro Pequeno",
	[246309] = "Baú do Tesouro Pequeno",
	[246438] = "Modelo de Circuito de Blingtron",
	[247797] = "Correspondência Extraviada",
	[248398] = "Dispositivo de Comunicação Etérea",
	[248534] = "Lágrimas de Eluna",
	[250548] = "Martelo de Khaz'goroth",
	[251168] = "Cristal Efêmero",
	[251564] = "|cFFFFFFFFStep 4:|r Página 655",
	[251666] = "Baú do Tesouro",
	[251991] = "A Égide de Aggramar",
	[252267] = "Saco de Saque Grande",
	[252269] = "Pacote de Poções de Batalha",
	[252270] = "Caixote Misterioso",
	[252272] = "Botas Fuliginosas",
	[252273] = "Caixa de Adagas de Arremesso",
	[252277] = "Chá de Cardo",
	[252279] = "Tomo de Histórias de Artefatos Roubado",
	[252282] = "Molho de Chaves Reluzente",
	[252284] = "Pilha de Bombas Grudentas",
	[252289] = "Pó de Sumiço",
	[252318] = "O Olho de Aman'Thul",
	[252412] = "|cFFFFFFFFStep 2:|r Monte de Terra",
	[252434] = "|cFFFFFFFFStep 12:|r Orbe Faminto X",
	[252557] = "|cFFFFFFFFStep 3:|r Orbe Faminto I",
	[252558] = "|cFFFFFFFFStep 4:|r Orbe Faminto II",
	[252559] = "|cFFFFFFFFStep 5:|r Orbe Faminto III",
	[252560] = "|cFFFFFFFFStep 6:|r Orbe Faminto IV",
	[252561] = "|cFFFFFFFFStep 7:|r Orbe Faminto V",
	[252562] = "|cFFFFFFFFStep 8:|r Orbe Faminto VI",
	[252563] = "|cFFFFFFFFStep 9:|r Orbe Faminto VII",
	[252564] = "|cFFFFFFFFStep 10:|r Orbe Faminto VIII",
	[252565] = "|cFFFFFFFFStep 11:|r Orbe Faminto IX",
	[252570] = "Baú de Riquezas da Fortaleza Celeste",
	[253118] = "Flores do Bosque Onírico",
	[253157] = "Frutinhas Espirituais",
	[253161] = "Vinha do Bosque",
	[253176] = "Flores de G'Hanir",
	[253179] = "Helianto",
	[253181] = "Caulespinho",
	[253280] = "Estrato de Pedra de Meridiano",
	[254007] = "Altar do Carrasco",
	[254087] = "Os Alfanjes do Terror",
	[255344] = "Estrato de Vilardósia",
	[257392] = "Placa Incandescente do Quebramundo",
	[257999] = "Técnica: Tomo da Mente Tranquila",
	[258978] = "Tomo Encharcado",
	[258980] = "Tomo amaldiçoado",
--	[266289] = "Time Lost Chest",							-- No translation
	[266851] = "Varinha da Vida Simulada",
	[268551] = "Baú de Língua de Serpe Singular",
	[269830] = "|cFFFFFFFFStep 9:|r Dádiva dos Caçadores de Mentes",
	[270855] = "|cFFFFFFFFStep 1:|r Nota Discreta",
	[270917] = "Registros de Arroio do Vale",
	[271849] = "Suprimentos de Guerra Eredares",
	[271850] = "Suprimentos de Guerra Eredares",
	[272039] = "|cFFFFFFFFStep 2:|r Nota Discreta",
	[272046] = "|cFFFFFFFFStep 3:|r Larva da Mente",
	[272061] = "|cFFFFFFFFStep 4:|r Nota Discreta",
	[272163] = "|cFFFFFFFFStep 5:|r Caveira Estranha",
	[272165] = "|cFFFFFFFFStep 6:|r Nota Discreta",
	[272172] = "|cFFFFFFFFStep 7:|r Nota Discreta",
	[272179] = "Mural do Prefeito",
	[272181] = "|cFFFFFFFFStep 8:|r Nota Discreta",
	[272220] = "|cFFFFFFFFStep 9:|r Nota Discreta",
	[272270] = "|cFFFFFFFFStep 10:|r Sonho do Charadista",
	[272422] = "Grimório do Gentil",
	[272455] = "Suprimentos de Guerra Eredares",
	[272456] = "Suprimentos de Guerra Eredares",
	[272487] = "Ovo de Coloração Excêntrica",
	[272768] = "Depósito de Empirita",
	[272770] = "Suprimentos de Guerra Eredares",
	[272771] = "Suprimentos de Guerra Eredares",
	[272780] = "Camada de Empirita",
	[273222] = "Suprimentos de Guerra Eredares",
	[273301] = "Baú Eredar Antigo",
	[273407] = "Baú Eredar Antigo",
	[273412] = "Baú Eredar Antigo",
	[273414] = "Baú Eredar Antigo",
	[273415] = "Baú Eredar Antigo",
	[273439] = "Baú Eredar Antigo",
	[273519] = "Suprimentos de Guerra da Legião",
	[273521] = "Suprimentos de Guerra da Legião",
	[273523] = "Suprimentos de Guerra da Legião",
	[273524] = "Suprimentos de Guerra da Legião",
	[273527] = "Suprimentos de Guerra da Legião",
	[273528] = "Suprimentos de Guerra da Legião",
	[273533] = "Suprimentos de Guerra da Legião",
	[273535] = "Suprimentos de Guerra da Legião",
	[273538] = "Suprimentos de Guerra da Legião",
	[273814] = "Amuleto Laminado",
	[273854] = "Mochila",
	[273900] = "Baú do Tesouro Pequeno",
	[273902] = "Baú do Tesouro Pequeno",
	[273903] = "Baú do Tesouro Pequeno",
	[273905] = "Baú do Tesouro Pequeno",
	[273910] = "Baú do Tesouro Pequeno",
	[273917] = "Baú do Tesouro Pequeno",
	[273918] = "Baú do Tesouro Pequeno",
	[273919] = "Baú do Tesouro Pequeno",
	[275070] = "Baú do Tesouro Pequeno",
	[275071] = "Baú do Tesouro Pequeno",
	[275074] = "Baú do Tesouro Pequeno",
	[275076] = "Baú do Tesouro Pequeno",
	[276187] = "Junji",
	[276224] = "Baú dos Ganhos Desonestos",
	[276225] = "Excedente Extraordinário do Estudante",
	[276226] = "Baú Manchado de Caos",
	[276227] = "Tesouro Escondido Augari",
	[276228] = "Baú de Eredar Desesperado",
	[276230] = "Tesouro do Busca-ruína",
	[276251] = "Inventário de Escavação",
	[276488] = "Bala de Canhão de Azerita",
	[276490] = "Baú de Emergência Krokul",
	[276515] = "Vara de Pescar",
	[276513] = "Muçum Intacto",
	[276735] = "Oferendas dos Escolhidos",
	[277207] = "Grande Tesouro da Legião",
	[277205] = "Baú de Guerra da Legião Antigo",
	[277327] = "Baú Augari Rúnico",
	[277333] = "Sarcófago Ancestral",
	[277340] = "Baú Augari Secreto",
	[277342] = "Mercadorias Augari",
	[277343] = "Tesouro Augari Perdido Há Tempos",
	[277344] = "Lembranças Augari Preciosas",
	[277346] = "Baú Augari Perdido",
	[277373] = "Algas Marinhas Luzentes",
	[277459] = "Efígie do Porco",
	[277561] = "Baú do Senhor da Guerra",
	[277715] = "Baú Nazmani Amaldiçoado",
	[277885] = "Tesouro de Wunja",
	[277897] = "Baú Fervilhante",
	[278313] = "Carta de Palavras Severas",
	[278368] = "Nota Esfarrapada",
	[278436] = "Baú Naufragado",
	[278437] = "Oferenda a Bwonsamdi",
	[278447] = "Lança de Coureador Ímpio",
	[278669] = "Livro de Registros de Refúgio Outonal",
	[278675] = "Efígie Amaldiçoada",
	[279042] = "Estoque do Contrabandista",
	[279253] = "Baú da Sorte de Horácio Sortudo",
	[279260] = "Baú \"Inteligentemente\" Disfarçado",
	[279299] = "Selo Venenoso",
	[279337] = "Grimório Sangra-coração",
	[279609] = "Espólios de Pandária",
	[279689] = "Tesouro Nazmani Perdido",
	[279750] = "Baú Coberto de Feno",
	[280504] = "Baú Engolido",
	[280522] = "Tesouro Parcialmente Digerido",
	[280619] = "Baú Férreo Antigo",
	[280727] = "Bilhete Chamuscado",
	[280751] = "Baú do Tesouro Pequeno",
--	[280755] = "Quintin's Satchel",						-- No translation
	[280951] = "Espólios de Grimpagris",
--	[280957] = "Zukashi's Satchel",						-- No translation
	[281092] = "Tesouro do Mandingueiro",
	[281230] = "Convite Formal",
	[281397] = "Baú do Tesouro dos Corta-água",
	[281494] = "Baú do Tesouro Revestido de Gelo",
	[281551] = "Cartaz de Oferta de Serviço",
	[281583] = "Relicário Antigo",
	[281639] = "Estátua Desmoronante",
	[281646] = "Barril de Mel",
	[281647] = "Divulgação",
	[281655] = "Dádiva do Coração Partido",
	[281673] = "Diário de Cidadão de Corlain",
	[281898] = "Baú Esquecido de Dazar",
	[282153] = "Caixa-forte Submersa",
	[282448] = "Cartaz de Procura-se",
	[282457] = "Totem de Guarda Espinhoso",
	[282478] = "Caixote Vazio",
	[282498] = "Flauta do Deserto",
	[282628] = "Pilha de Areia",
	[282666] = "Urna de Agussu",
	[284426] = "Máquina de Mineração Enterrada",
	[284448] = "Baú Escondido do Erudito",
	[284454] = "Recompensa do Tubarão Branco",
	[284455] = "O Lamento do Exílio",
	[287239] = "Última Oferenda de Grayal",
	[287304] = "Tesouro do Explorador Perdido",
	[287318] = "Reserva Zangareia",
	[287320] = "Reserva Encalhada",
	[287324] = "Ganância do Escavador",
	[287326] = "Tesouro Enterrado de Zem'lan",
	[287398] = "Procura-se: Za'roco",
	[287440] = "Procura-se: Taz'raka",
	[287441] = "Procura-se: Batedor de Areia Vesarik",
	[287442] = "Procura-se: participantes para a excursão da naja",
	[287531] = "Baú do Tesouro Pequeno",
	[288157] = "Procura-se: Yarsel'ghun",
	[288214] = "Cartaz de Procura-se",
	[288596] = "Baú de Segredos",
	[288622] = "Cartaz de Procura-se",
	[288641] = "PROCURA-SE: Sequestradores de Grifos",
	[289365] = "Cartaz de Procura-se",
	[289647] = "Baú do Tesouro Desgastado",
	[289728] = "Mapa do Tesouro do Capitão Gulnaku",
	[290419] = "Cartaz de Procura-se",
	[290765] = "Grande Pilha de Ouro",
	[290537] = "Precisa-se",
	[290725] = "Riqueza de Tor'nowa",
	[290993] = "Saque dos Maré-férrea",
	[291143] = "Chave de Boca de Ranah",
	[291201] = "Baú do Tesouro Pequeno",
	[291204] = "Baú do Tesouro Pequeno",
	[291211] = "Baú do Tesouro Pequeno",
	[291213] = "Baú do Tesouro Pequeno",
	[291217] = "Baú do Tesouro Pequeno",
	[291222] = "Baú do Tesouro Pequeno",
	[291223] = "Baú do Tesouro Pequeno",
	[291224] = "Baú do Tesouro Pequeno",
	[291225] = "Baú do Tesouro Pequeno",
	[291226] = "Baú do Tesouro Pequeno",
	[291227] = "Baú do Tesouro Pequeno",
	[291228] = "Baú do Tesouro Pequeno",
	[291229] = "Baú do Tesouro Pequeno",
	[291230] = "Baú do Tesouro Pequeno",
	[291244] = "Baú do Tesouro Pequeno",
	[291246] = "Baú do Tesouro Pequeno",
	[291254] = "Baú do Tesouro Pequeno",
	[291255] = "Baú do Tesouro Pequeno",
	[291257] = "Baú do Tesouro Pequeno",
	[291258] = "Baú do Tesouro Pequeno",
	[291259] = "Baú do Tesouro Pequeno",
	[291263] = "Baú do Tesouro Pequeno",
	[291264] = "Baú do Tesouro Pequeno",
	[291265] = "Baú do Tesouro Pequeno",
	[291266] = "Baú do Tesouro Pequeno",
	[291267] = "Baú do Tesouro Pequeno",
	[292523] = "Cartaz de Procura-se",
	[292673] = "Pergaminho Empapado",
	[292674] = "Pergaminho Empapado",
	[292675] = "Pergaminho Empapado",
	[292676] = "Pergaminho Empapado",
	[292677] = "Pergaminho Empapado",
	[293349] = "Marmita Descartada",
	[293350] = "Baú de Madeira Entalhado",
	[293837] = "|cFFFFFFFFStep 2:|r Cascalho Comum I",
	[293838] = "|cFFFFFFFFStep 3:|r Cascalho Comum II",
	[293839] = "|cFFFFFFFFStep 4:|r Cascalho Comum III",
	[293840] = "|cFFFFFFFFStep 5:|r Cascalho Comum IV",
	[293841] = "|cFFFFFFFFStep 6:|r Cascalho Comum V",
	[293842] = "|cFFFFFFFFStep 7:|r Cascalho Comum VI",
	[293843] = "|cFFFFFFFFStep 8:|r Cascalho Comum VII",
	[293844] = "|cFFFFFFFFStep 9:|r Cascalho Comum VIII",
	[293845] = "|cFFFFFFFFStep 10:|r Cascalho Comum IX",
	[293846] = "|cFFFFFFFFStep 11:|r Cascalho Comum X",
	[293849] = "|cFFFFFFFFStep 1:|r Bilhete Suspeito",
	[293852] = "Baú do Tesouro Enterrado",
	[293880] = "Baú do Tesouro Enterrado",
	[293881] = "Baú do Tesouro Enterrado",
	[293884] = "Baú do Tesouro Enterrado",
	[293962] = "Baú Nobre Precário",
	[293964] = "Estoque Esquecido do Contrabandista",
	[293965] = "Baú do Osso Talhado",
	[294173] = "Baú de Suprimentos da Empreendimentos S.A",
	[294174] = "Baú Esquecido",
	[294311] = "Baú do Tesouro Pequeno",
	[294316] = "Oferendas Perdidas de Kimbul",
	[294317] = "Baú de Lenha Morta",
	[294319] = "Tesouro Soterrado por Areia",
--	[294703] = "Grimmy's Rusty Lockbox",						-- No Translation
	[296536] = "Glaive da Sentinela Ensanguentada",
	[297825] = "Baú Coberto de Teia",
	[297828] = "Baú do Mercador",
	[297878] = "Baú Bagateado",
	[297879] = "Baú Enfeitiçado",
	[297880] = "Baú Embruxado",
	[297881] = "Baú Encantado",
	[297891] = "Caixa Rúnica",
	[297892] = "Baú Rúnico",
	[297893] = "Cofre Rúnico",
	[298920] = "Baú da Voz-dos-espinhos Roubado",
	[298858] = "Cartaz de Procura-se",
	[298849] = "Cartaz de Procura-se",
	[298921] = "Tabuleta Nazmani Ancestral",
	[298963] = "Tabuleta Nazmani Gasta",
	[298965] = "Tabuleta Rachada",
	[299073] = "Tabuleta Fraturada",
	[303016] = "|cFFFFFFFFStep 14:|r Cascalho Comum XIII",
	[303017] = "|cFFFFFFFFStep 13:|r Cascalho Comum XII",
	[303018] = "|cFFFFFFFFStep 12:|r Cascalho Comum XI",
	[307265] = "Cartaz de Procura-se",
--	[307748] = "Venture Co. Letter",							-- No Translation
	[310709] = "Baú Encharcado",
	[311218] = "Xal'atath, a Lâmina do Império Negro",
	[311902] = "Peças Soltas",
	[311903] = "Peças Soltas",
	[322413] = "Baú Brilhante",
	[322533] = "Tomo do Elementos de Mardivas",
	[324407] = "Raízes Caóticas",
	[325659] = "Baú Mecanizado",
	[325660] = "Baú Mecanizado",
	[325661] = "Baú Mecanizado",
	[325662] = "Baú Mecanizado",
	[325663] = "Baú Mecanizado",
	[325664] = "Baú Mecanizado",
	[325665] = "Baú Mecanizado",
	[325666] = "Baú Mecanizado",
	[325667] = "Baú Mecanizado",
	[325668] = "Baú Mecanizado",
	[325853] = "Estante de Livros Vazia",
	[325869] = "Barril Vazio",
	[326027] = "Reciclarizador DX-82",
	[326140] = "Quadro de Recompensas",
	[326394] = "Baú Arcano",
	[326395] = "Arca Arcana Brilhante",
	[326396] = "Arca Arcana Brilhante",
	[326397] = "Arca Arcana Brilhante",
	[326398] = "Arca Arcana Brilhante",
	[326399] = "Arca Arcana Brilhante",
	[326400] = "Arca Arcana Brilhante",
	[326401] = "Baú Arcano",
	[326402] = "Baú Arcano",
	[326403] = "Baú Arcano",
	[326404] = "Baú Arcano",
	[326405] = "Baú Arcano",
	[326406] = "Baú Arcano",
	[326407] = "Baú Arcano",
	[326408] = "Baú Arcano",
	[326409] = "Baú Arcano",
	[326410] = "Baú Arcano",
	[326411] = "Baú Arcano",
	[326412] = "Baú Arcano",
	[326413] = "Baú Arcano",
	[326414] = "Baú Arcano",
	[326415] = "Baú Arcano",
	[326416] = "Baú Arcano",
	[326417] = "Baú Arcano",
	[326418] = "Baú Arcano",
	[326419] = "Baú Arcano",
	[326588] = "Depósito de Armas de Azerita",
	[327170] = "Cavalete de Armas",
	[327548] = "Projetos de Bateria Externa",
	[327585] = "Quadro de Recompensas",
	[327591] = "Diário Preservado",
	[327592] = "Fechadura Encantada",
	[327596] = "Foco Abissal Partido",
})
do a[key] = value; end
