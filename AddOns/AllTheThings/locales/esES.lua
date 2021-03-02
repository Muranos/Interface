-- Localization for Spanish (Spain) Clients.
if GetLocale() ~= "esES" then return; end
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
	[31] = "Estatua de león antigua",
	[34] = "Vieja jarra",
	[55] = "Un cadáver medio comido",
	[56] = "Cadáver de Rolf",
	[61] = "Una tumba erosionada",
	[256] = "¡Se busca!",
	[259] = "Barrica semienterrada",
	[270] = "Barrica de Cerveza del Trueno sin vigilar",
	[2059] = "Un cadáver de enano",
	[2076] = "Caldera burbujeante",
	[2083] = "Correspondencia de los Velasangre",
	[2701] = "Fragmentos iridiscentes",
	[2702] = "Piedra de Vínculo Interior",
	[2713] = "Tablón de Se busca",
	[2908] = "Cajón de suministros sellado",
	[3972] = "SE BUSCA",
	[4141] = "Consola de control",
	[6751] = "Planta con extraños frutos",
	[6752] = "Planta con extrañas hojas",
	[7510] = "Fronda crecida",
	[19023] = "|cFFFFFFFFStep 7:|r Página 2351",
	[20985] = "Tierra esparcida",
	[20992] = "Escudo negro",
	[21042] = "Identificación de guardia de Theramore",
	[35251] = "Cofre de Karnitol",
	[112948] = "Caja fuerte de El Intrépido cerrada",
--	[113768] = GetSpellInfo(61820),
	[113768] = "Huevo de colores vivos",
	[123329] = "Cofre de Baelog",
	[131474] = "Los Discos de Norgannon",
	[131979] = "Cofre grande de Leñoscuro",
	[138492] = "Fragmentos de Myzrael",
	[141979] = "Tesoro antiguo",
	[142195] = "Mapa de batalla de los Zarpaleña",
	[142343] = "Pedestal de Uldum",
	[142487] = "El Destellamatic 5200",
	[144063] = "Monolito de Equinex",
	[148502] = "|cFFFFFFFFStep 1:|r Página 9",
	[148504] = "Una lápida llamativa",
	[156561] = "Cartel de Se busca",
	[160836] = "Arca de reliquias",
	[160845] = "Arca oscura",
	[161495] = "Caja fuerte secreta",
	[161504] = "Un paquetito",
	[161505] = "Una balsa estropeada",
	[161521] = "Equipo de investigación",
	[161526] = "Cajón de comestibles",
	[164820] = "Placa de Guarda oscuro",
	[164885] = "Dragón nocturno corrupto",
	[164886] = "Melodía corrupta",
	[164887] = "Flor del viento corrupta",
	[164888] = "Blancoria corrupta",
	[164955] = "Torre de cristal del Norte",
	[164956] = "Torre de cristal del Oeste",
	[164957] = "Torre de cristal del Este",
	[169243] = "Cofre de los Siete",
	[173232] = "Diseños de herrería",
	[174682] = "Cuidado con los pterrordáctilos",
	[175320] = "SE BUSCA: ¡Viscoso!",
	[175524] = "Cristal rojo misterioso",
	[175756] = "La Plaga de Lordaeron",
	[176090] = "Restos humanos",
	[176091] = "Caldera de Muertobosque",
	[176115] = "Cartel de Se busca: Arnak Tótem Siniestro",
	[176392] = "Caldera de la Plaga",
	[177787] = "Cuaderno de bitácora de Masatormento",
	[177904] = "Cartel de Se busca: Besseleth",
	[177964] = "Piedra de las profundidades",
	[179485] = "Trampa rota",
	[179501] = "Alijo de Knot Thimblejack",
	[179832] = "Almohada ornamentada de Pilaprieta",
	[179564] = "Tributo a Gordok",
	[179697] = "Arqueta de la arena",
	[180448] = "Cartel de Se busca: Pinzamorten",
	[180503] = "Libro de cocina de Sandy",
	[180690] = "Arca del escarabajo grande",
	[180691] = "Arca del escarabajo",
	[180794] = "Diario de Jandice Barov",
	[180918] = "Se busca: Thaelis el Hambriento",
	[181011] = "Diario del magister Ocaso Marchito",
--	[181074] = "Arena Spoils",								-- No translation
--	[181083] = "Sothos and Jarien's Heirlooms",				-- No Translation
	[181147] = "Cartel de Se busca",
	[181150] = "Diario polvoriento",
	[181153] = "Cartel de Se busca: Kel'gash el Malvado",
	[181333] = "Llama de Forjaz",
	[181334] = "Llama de Darnassus",
	[181335] = "Llama de Entrañas",
	[181336] = "Llama de Orgrimmar",
	[181337] = "Llama de Cima del Trueno",
	[181748] = "Cristal de sangre",
	[181756] = "Libro antiguo maltrecho",
	[181889] = "Cartel de Se busca",
	[182032] = "Diario de Galaen",
	[182115] = "Cartel de Se busca",
	[182165] = "Cartel de Se busca",
	[182549] = "Planos de orcos viles",
	[182587] = "Cartel de Se busca",
	[182588] = "Cartel de Se busca",
	[182392] = "Tablón de anuncios de Garadar",
	[182393] = "Tablón de anuncios de Telaar",
	[182947] = "El Códice de Sangre",
	[182952] = "Restos flotantes de bomba de vapor",
	[183284] = "Cartel de Se busca",
	[183770] = "Consola de control B'naar",
	[183811] = "Cartel de Se busca",
	[184300] = "Foco nigromántico",
	[184465] = "Alijo de la Legión",
	[184660] = "Cartel de Se busca",
	[184825] = "Escrito Lashh'an",
	[184945] = "Cartel de Se busca",
	[184946] = "Cartel de Se busca",
	[185035] = "Cartel de Se busca",
	[185126] = "Prisión de cristal",
	[185165] = "Comunicador de la Legión",
	[185168] = "Cofre de hierro vil reforzado",
	[185927] = "Prisma cristalino vil",
	[186426] = "Cartel de Se busca",
	[186648] = "Baúl de Hazlek",
	[186667] = "Paquete de Norkani",
	[186672] = "Bolsa de Kasha",
	[186887] = "Calabaza iluminada",
	[187021] = "Cartera de Bakkalzu",
	[187273] = "Huella de casco sospechosa",
	[187559] = "Fogata de la Horda",
	[187564] = "Fogata de la Alianza",
	[187565] = "Ancestro Atkanok",
	[187674] = "Caparazón endurecido de Ith'rix",
	[187851] = "Santuario de cultor",
	[187905] = "Huevo gigante resplandeciente",
	[187916] = "Fogata de la Alianza",
	[187917] = "Fogata de la Alianza",
	[187921] = "Fogata de la Alianza",
	[187923] = "Fogata de la Alianza",
	[187924] = "Fogata de la Alianza",
	[187927] = "Fogata de la Alianza",
	[187947] = "Fogata de la Horda",
	[187948] = "Fogata de la Horda",
	[187957] = "Fogata de la Horda",
	[187958] = "Fogata de la Horda",
	[187959] = "Fogata de la Horda",
	[188085] = "Grano apestado",
	[188128] = "Llama de El Exodar",
	[188129] = "Llama de Lunargenta",
	[188261] = "Diario maltrecho",
	[188364] = "Trampa para cangrejos destrozada",
	[188365] = "Corazón de los ancestros",
	[188419] = "Ancestro Mana'loa",
	[188667] = "Grano ámbar",
	[189311] = "Escrito encuadernado en carne",
	[189989] = "Restos de la máquina topo Hierro Negro",
	[189990] = "Restos de la máquina topo Hierro Negro",
	[190020] = "¡Se busca!",
	[190035] = "Cubo de caramelos",
	[190037] = "Cubo de caramelos",
	[190038] = "Cubo de caramelos",
	[190045] = "Cubo de caramelos",
	[190051] = "Cubo de caramelos",
	[190052] = "Cubo de caramelos",
	[190064] = "Cubo de caramelos",
	[190079] = "Cubo de caramelos",
	[190083] = "Cubo de caramelos",
	[190085] = "Cubo de caramelos",
	[190104] = "Cubo de caramelos",
	[190917] = "Correo abandonado",
	[190936] = "Caldera de peste",
	[191728] = "¡Se busca!",
	[191760] = "Consola de la Biblioteca del Inventor",
	[191761] = "Consola prototipo",
	[192049] = "Banco de arenques colmillo",
	[192060] = "Yunque de Fjorn",
	[192072] = "Cajón de arpones",
	[194105] = "Caja mecánica 413",
	[194122] = "Caja mecánica 723",
	[194378] = "Documento de la Liga de Expedicionarios robado",
	[194387] = "Documento de la Liga de Expedicionarios robado",
	[194388] = "Documento de la Liga de Expedicionarios robado",
	[194389] = "Documento de la Liga de Expedicionarios robado",
	[194390] = "Documento de la Liga de Expedicionarios robado",
	[194391] = "Documento de la Liga de Expedicionarios robado",
	[194714] = "Banco de trabajo desagradable",
	[195134] = "La Bomba",
	[195431] = "Radio de puesto de mando",
	[195433] = "Tablillas antiguas",
	[195435] = "Armario de armas",
	[195438] = "Copa de Elune",
	[195445] = "Piedra rúnica del vórtice antigua",
	[195497] = "Blandón de Elune",
	[195517] = "Fámulas de Elune",
	[195600] = "Piedra ardiente",
	[195642] = "Piedra de energía naga",
	[195676] = "Graznófono del Laboratorio Secreto",
	[196393] = "Reliquia rota",
	[196832] = "Piedra de visión alta",
	[196833] = "Piedra de visión baja",
	[201578] = "Póster de reclutamiento de manijeros",
	[202080] = "Nido de Dardo",
	[202081] = "Nido de Takk",
	[202082] = "Nido de matriarca ravasaurio",
	[202083] = "Nido de matriarca Tajobuche",
	[202135] = "Tumba de Dadanga",
	[202407] = "Cofre de Rascadunas",
	[202474] = "Cofre antediluviano",
	[202598] = "Desatascador asqueroso grande",
	[202697] = "Ojo del Crepúsculo",
	[202701] = "Letrina escondrijo",
	[202706] = "Caldero Crepuscular",
	[202712] = "El Apócrifo Crepuscular",
	[202741] = "Filón rico en elementium",
	[202776] = "Banco de truchas de montaña",
	[202777] = "Banco de lebistes de las Tierras Altas",
	[202778] = "Banco de cavernosos albinos",
	[202779] = "Banco de pezfangos panzanegra",
	[202780] = "Banco de anguilas de las profundidades",
	[202871] = "Cajón hundido",
	[202975] = "Letrina sumergida",
	[203128] = "Botella rota",
	[203134] = "Pedestal vacío",
	[203140] = "Punta rota",
	[203186] = "¡FUERA!",
	[203207] = "Códice de las Sombras",
	[203733] = "Tablón de recompensas",
	[203734] = "Escrituras de los Páramos de Poniente",
	[203755] = "Póster de reclutamiento de manijeros",
	[204050] = "Planos del Rasgadversarios",
	[204274] = "Diario del Capitán",
	[204344] = "¡Se busca!",
	[204351] = "Orbe de control de ettin",
	[204406] = "Botella semienterrada",
	[204450] = "Cartas del capitán Aguasmansas",
	[204578] = "Barril de ron doble",
	[204817] = "Vara forjada con luz",
	[204824] = "Arco forjado con luz",
	[204825] = "Blasón forjado con luz",
	[204959] = "Racimo de painita gigante",
	[205134] = "Cuaderno del maestro de forja",
	[205143] = "Letrina abandonada",
	[205198] = "Pila de explosivos",
	[205207] = "Diario de Maziel",
	[205258] = "Cajón de armas roto",
	[205266] = "Disco elaborado",
	[205332] = "Cartel de Se busca",
	[205350] = "Panel de comunicación de la Horda",
	[205540] = "Esqueleto decrépito",
	[205874] = "Jeroglíficos cubiertos de arena",
	[205875] = "Bengala de cruzado",
	[206109] = "Tablón de mando del Jefe de Guerra",
	[206116] = "Tablón de mando del Jefe de Guerra",
	[206293] = "Terminal A.I.D.A.",
	[206335] = "Losa de piedra",
	[206336] = "Losa de mármol",
	[206374] = "Tesoro de los Vigías",
	[206569] = "Ojo del Crepúsculo",
	[206585] = "Tótem de Ruumbo",
	[206944] = "Pala",
	[207104] = "Bomba de control maestro",
	[207179] = "Caldera de Nevada",
	[207279] = "Tablón de mando del Jefe de Guerra",
	[207303] = "Tablón de aventuras",
	[207304] = "Tablón de aventuras",
	[207320] = "Tablero de ¡Se busca héroe!",
	[207321] = "Tablero de ¡Se busca héroe!",
	[207322] = "Tablero de ¡Se busca héroe!",
	[207323] = "Tablón de mando del Jefe de Guerra",
	[207359] = "Huevo Crepuscular puro",
	[207472] = "Arqueta reforzada con plata",
	[207484] = "Arqueta robusta",
	[207496] = "Arqueta Hierro Negro",
	[207512] = "Arqueta de seda",
	[207520] = "Arqueta de madera de arce",
	[207533] = "Arqueta de piedras rúnicas",
	[207724] = "Restos de naufragio",
	[207982] = "Fogata de la Alianza",
	[207983] = "Fogata de la Horda",
	[207991] = "Fogata de la Horda",
	[208115] = "Cubo de caramelos",
	[208117] = "Cubo de caramelos",
	[208118] = "Cubo de caramelos",
	[208119] = "Cubo de caramelos",
	[208140] = "Cubo de caramelos",
	[208157] = "Cubo de caramelos",
	[208158] = "Cubo de caramelos",
	[208159] = "Cubo de caramelos",
	[208311] = "Banco de peces sabiola marfunda",
	[208365] = "Montón de barro removido recientemente",
	[208535] = "Bellota seca",
	[209072] = "Cajón robado",
	[209076] = "Cajón de Anson",
	[209094] = "Cajón robado",
	[209095] = "Cajón de Edgar",
	[209270] = "|cFFFFFFFFStep 2:|r Página 78",
	[209620] = "Arqueta de la Luna Negra",
	[211424] = "Pergamino de alquimia",
	[212389] = "Pergamino de auspicios",
	[213362] = "Baúl del barco",
	[213363] = "Faca mántide de Wodin",
	[213364] = "Pico de minero pandaren antiguo",
	[213366] = "Tetera pandaren antigua",
	[213368] = "Moneda pandaren de la suerte",
	[213649] = "Alijo de bienes trincados",
	[213650] = "Alijo del tesoro mur",
	[213651] = "Armario de equipo",
	[213653] = "Lanza de pescar pandaren",
	[213741] = "Bastón jinyu antiguo",
	[213742] = "Martillo de los Diez Truenos",
--	[213743] = "Jade Infused Blade",	-- No translation
	[213748] = "Piedra de ritual pandaren",
	[213749] = "Bastón del maestro oculto",
	[213750] = "Tablilla de piedra de saurok",
	[213751] = "Cofre de tela de duende",
	[213765] = "Tablilla de Ren Yun",
	[213767] = "Tesoro escondido",
	[213768] = "Lanza de guerrero hozen",
	[213769] = "Alijo de tesoro hozen",
	[213770] = "Tesoro de duende robado",
	[213771] = "Estatua de Xuen",
	[213774] = "Pertenencias del aventurero perdido",
	[213782] = "Cabeza de terracota",
	[213793] = "Cofre diminuto de Rikktik",
	[213842] = "Alijo de armas yaungol",
	[213844] = "Polilla atrapada en ámbar",
	[213845] = "El martillo del disparate",
	[213956] = "Fragmento de pavor",
	[213959] = "Savia de Kri'vess endurecida",
	[213960] = "Portafuego yaungol",
	[213961] = "Cajón de bienes abandonado",
	[213962] = "Daga de golpes rápidos del Atracavientos",
	[213964] = "Lanza de adepto de Malik",
	[213966] = "Collar atrapado en ámbar",
	[213967] = "Hoja del Perfecto",
	[213968] = "Cuchilla de enjambre de Ka'roz",
	[213969] = "Bastón de mutación del Disector",
	[213970] = "Fragmento de quitina empapado de sangre",
	[213971] = "Medallón del Guardaenjambres",
	[213972] = "Hoja de la Mente Envenenada",
	[213973] = "Repetidor sónico Klaxxi",
	[214062] = "Ámbar resplandeciente",
	[214325] = "Arcón olvidado",
	[214337] = "Alijo de gemas",
	[214338] = "Ofrenda de recuerdo",
	[214339] = "Cofre de suministros",
	[214340] = "Instrucciones para astilleros",
	[214403] = "Montón de papeles",
	[214407] = "Cofre del tesoro de Mo-Mo",
	[214438] = "Tablilla mogu antigua",
	[214439] = "Barril de ron con plátano",
	[214562] = "Cristal embrujado por el sha",
	[215705] = "Santuario de labradores",
	[218750] = "Pedidos",
	[220641] = "Alijo de Señor del Trueno",
	[220820] = "|cFFFFFFFFStep 6:|r Página 1127",
	[220821] = "|cFFFFFFFFStep 5:|r Página 845",
	[220832] = "Tesoro hundido",
	[221376] = "Fragmento de cartel viejo",
	[221413] = "Pergamino de la familia Lin",
	[222685] = "Nido de grulla",
	[223533] = "Ofrenda pacífica",
	[224228] = "Caldera burbujeante",
	[224306] = "Cadenas rotas",
	[224392] = "Alijo de esclavo",
	[224613] = "Cofre de espectador",
	[224616] = "Petroglifo de obsidiana",
	[224623] = "Huevo inquieto",
	[224633] = "Suministros de la Horda de Hierro",
--	[224686] = "Devourer's Gutstone",	-- No Translation
	[224713] = "Alijo de Destruyerriscos",
	[224750] = "Cartera colgante",
	[224753] = "Huevo de rylak escamoso",
	[224754] = "Cofre anegado",
	[224755] = "Tributo de la Horda de Hierro",
	[224756] = "Cartera del alquimista",
	[224770] = "Tesoro de exilio de Sombraluna",
	[224780] = "Daga de sacrificios de Sombraluna",
	[224781] = "Cesta podrida",
	[224783] = "Jarra con fondo falso",
	[224784] = "Alijo de vindicador",
	[224785] = "Alijo demoniaco",
	[225501] = "Ofrenda pacífica",
	[225502] = "Ofrenda pacífica",
	[225503] = "Ofrenda pacífica",
--	[226468] = GetSpellInfo(155344),		-- Buffeting Galefury
--	[226469] = GetSpellInfo(154259),		-- Spirit of the Wolf
	[226831] = "Caja de astrólogo",
	[226854] = "Colmillo de elekk acorazado",
	[226861] = "Pertenencias de Ronokk",
	[226862] = "Cono de Sauce Lunar gigante",
	[226865] = "Cargamento de la reina de los cuervos",
	[226955] = "Cuerno de guerra de maestro de arena",
	[226956] = "Montón de fruta misteriosa",
	[226961] = "Tablón de recompensas",
	[226967] = "Poza de laguna",
	[226976] = "Botas humeantes de Deceptia",
	[226983] = "Alijo de saltador de peñascos",
	[226990] = "Vertedero de suministros",
	[226993] = "Alijo del superviviente",
	[226994] = "Tesoro de Siniescarcha",
	[226996] = "Restos de goren",
	[227134] = "Envío de cargamento de la Horda de Hierro",
	[227504] = "Lanza dentada Señor del Trueno",
	[227527] = "Portador de la luz",
	[227587] = "Regalo de Yuuri",
	[227654] = "Lanza Mascahuesos",
	[227743] = "Pez fantástico",
	[227793] = "Tesoro familiar de Aarko",
	[227806] = "Estandarte Lobo Gélido desgastado por la batalla",
	[227859] = "Esperanza",
	[227868] = "Charco brillante",
	[227951] = "Caja de pesca de Rook",
	[227953] = "Tinaja de vino férreo de crianza",
	[227954] = "Concha luminosa",
	[227955] = "Cristal de amatista",
	[227956] = "Lonchera del capataz",
	[227996] = "Huevo de redmortal raro",
	[227998] = "Bolsa de Ockbar",
	[228012] = "Espada chamuscada",
	[228013] = "Botín de granjero",
	[228014] = "Reliquia de Aruuna",
	[228015] = "Caja de hierro",
	[228016] = "Barrica de pescado",
	[228017] = "Armas draenei",
	[228018] = "Relicario de vinculador de almas",
	[228019] = "Saco con tela de araña",
	[228020] = "Reliquia de Telmor",
	[228021] = "Tesoro de Ango'rosh",
	[228022] = "Luz del mar",
	[228023] = "Restos de Mascahuesos",
	[228024] = "Carro de minería de Aruuna",
	[228025] = "Pertenencias de Keluu",
	[228026] = "Polvo de cristal puro",
	[228483] = "Arcón oxidado",
	[228570] = "Alijo de Ketya",
	[229328] = "Cartera del enviado",
	[229330] = "Anillo misterioso",
	[229333] = "Botas misteriosas",
	[229354] = "Moneda brillante",
	[229367] = "Esqueleto de orco congelado",
	[229640] = "Hacha Lobo Gélido congelada",
	[230252] = "Perla ardiente",
	[230401] = "Jarro sellado",
	[230402] = "Moneda de la suerte",
	[230424] = "Caja fuerte cubierta de nieve",
	[230425] = "Hueso mordisqueado",
--	[230544] = GetSpellInfo(155334),		-- Touched By Ice
	[230611] = "Saco de botín mediocre",
	[230643] = "Nido de garráptero",
	[230664] = "La espada de cristal de Torvath",
	[230909] = "Suministros olvidados",
	[231064] = "Alijo de otros materiales de lady Sena",
	[231069] = "Daga de apariencia rara",
	[231100] = "Ramafría",
	[231103] = "Botín asaltado",
	[231644] = "Cráneo cornudo",
	[231903] = "Informe de Barbajuerga",
	[232066] = "Tesoro hundido",
	[232067] = "Tesoro robado",
	[232406] = "Paquete de aventurero",
	[232416] = "Tablón de mando",
	[232492] = "Tiro maldito",
	[232494] = "Cofre cubierto de hongos",
	[232579] = "Huevo de Kaliri",
	[232582] = "Cenizas de A'kumbo",
	[232583] = "Cuerno de beber tallado",
	[232586] = "Daga de Rovo",
	[232587] = "Chucherías de Uzko",
	[232588] = "Urna de Greka",
	[232589] = "Bolsa de hierbas de Veema",
	[232590] = "Cristal infundido por el Vacío",
	[232591] = "Ofrenda del Bienamado",
	[232596] = "Gran hacha ancestral",
	[232621] = "Espora extraña",
	[232624] = "Cofre de Mikkal",
	[233101] = "Barco de pesca hundido",
	[233126] = "Tesoro Sombraluna",
	[233137] = "Alijo de Filo Ardiente",
	[233139] = "Cofre titánico antiguo",
	[233149] = "Alijo Riecráneos",
	[233206] = "Cargamento abandonado",
	[233218] = "Paquete de aventurero",
	[233241] = "Champiñón de cueva resplandeciente",
--	[233263] = GetSpellInfo(154253),		-- Blessing of the Wolf
	[233391] = "Órdenes de armamentización",
	[233455] = "Contenedor de piedra envejecida",
	[233457] = "Bastón del aventurero",
	[233499] = "Bolsa del aventurero",
	[233501] = "Vaina petrificada misteriosa",
	[233504] = "Restos de Grimnir Ashpick",
	[233505] = "Huevo petrificado desconocido",
	[233507] = "Alijo olvidado de ogro",
	[233511] = "Mochila de aventurero",
	[233513] = "Alijo de calavera olvidada",
	[233524] = "Huevo petrificado desconocido",
	[233525] = "Semilla de esencia botani",
	[233532] = "Daga tallada con hueso",
	[233522] = "Formación de cristal de obsidiana",
	[233523] = "Vaina petrificada misteriosa",
	[233526] = "Cofre titánico antiguo",
	[233550] = "Huevo petrificado desconocido",
	[233552] = "Contenedor de piedra envejecida",
	[233558] = "Vaina petrificada misteriosa",
	[233559] = "Alijo de calavera olvidada",
	[233560] = "Fragmento de Oshu'gun",
	[233561] = "Treceava hacha de Pokkar",
	[233593] = "Calavera de saberon pulida",
	[233598] = "Grilletes elementales",
	[233611] = "Almádena Gran Magullador",
	[233613] = "Escudo defensor de Telaar",
	[233618] = "Abalorios ogros",
	[233623] = "Faltriquera de aventurero",
	[233645] = "Yelmo Grito de Guerra",
	[233650] = "Maza de aventurero",
	[233651] = "Pendiente perdido",
	[233658] = "Faltriquera de aventurero",
	[233697] = "Alijo de sablerón",
	[233792] = "Montón de escombros",
	[233917] = "Fémur de improbabilidad",
	[233975] = "Roró de Rooby",
	[234054] = "Huevo de goren caliente",
	[234147] = "Pertenencias del marginado",
	[234456] = "Arcón Mano Destrozada",
	[234474] = "Alijo de Saberon",
	[234618] = "Obsequio de Anzu",
	[234740] = "Cuerno de señales orco",
	[235091] = "Anillo extraviado",
	[235097] = "Grimorio oscuro de Ephial",
	[235127] = "Vaina petrificada misteriosa",
	[235129] = "Semillas enriquecidas",
	[235143] = "Lanza del asesino",
	[235168] = "Bolsa del marginado",
	[235172] = "Pertenencias del marginado",
	[235289] = "Martillo del obrero de la fortaleza",
	[235307] = "Bolsa encharcada",
	[235313] = "Pico de minero abandonado",
	[235859] = "Saco de Brokor",
	[235860] = "Esqueleto orco",
	[235869] = "Alijo de armas",
	[235881] = "Huevo de rylak petrificado",
	[236092] = "Mochila de emergencia oculta",
	[236096] = "Restos de Balldir Rocaprofunda",
	[236099] = "Lanza Toquesol",
	[236138] = "Cofre de suministros de hierro",
	[236139] = "Bote del explorador",
	[236140] = "Túnel de goren",
	[236141] = "Paquete abandonado",
	[236147] = "Martillo del Vindicador",
	[236149] = "Alijo secreto de Sasha",
	[236158] = "Ballesta del francotirador",
	[236169] = "Cristal precioso recolectable",
	[236170] = "Restos de Balik Rompemena",
	[236178] = "Alijo de suministros Siempredía",
	[236206] = "Mapa de planes de guerra",
	[236257] = "Cofre titánico antiguo",
	[236258] = "Huevo petrificado desconocido",
	[236259] = "Vaina petrificada misteriosa",
	[236260] = "Vaina petrificada misteriosa",
	[236264] = "Alijo de calavera olvidada",
	[236265] = "Contenedor de piedra avejentado",
	[236266] = "Huevo petrificado desconocido",
	[236267] = "Antiguo cofre titán",
	[236269] = "Formación de cristal de obsidiana",
	[236270] = "Contenedor de piedra envejecida",
	[236271] = "Contenedor de piedra envejecida",
	[236274] = "Contenedor de piedra avejentado",
	[236275] = "Antiguo cofre titán",
	[236276] = "Formación de cristal de obsidiana",
	[236278] = "Formación de cristal de obsidiana",
	[236279] = "Contenedor de piedra avejentado",
	[236280] = "Antiguo cofre titán",
	[236284] = "Alijo de ogro antiguo",
	[236285] = "Contenedor de piedra avejentado",
	[236288] = "Cofre titánico antiguo",
	[236289] = "Contenedor de piedra avejentado",
	[236348] = "Alijo de ogro antiguo",
	[236349] = "Antiguo cofre titán",
	[236350] = "Contenedor de piedra avejentado",
	[236351] = "Alijo de ogro ancestral",
	[236399] = "Contenedor de piedra avejentado",
	[236400] = "Alijo de ogro ancestral",
	[236402] = "Antiguo cofre titán",
	[236404] = "Contenedor de piedra envejecida",
	[236406] = "Alijo de ogro antiguo",
	[236407] = "Alijo de ogro ancestral",
	[236483] = "Obsequio de los ancestros",
	[236693] = "Munición de la Horda de Hierro",
	[236715] = "Calavera extraña",
	[236755] = "Arcón sucio",
	[236935] = "Alijo del clan Filo Ardiente",
	[237511] = "Espora extraña",
	[237821] = "Órdenes de Furiafilo",
	[239143] = "Vaso de leche tibia",
	[239171] = "Vaso de leche tibia",
	[239194] = "Alijo de Norana",
	[239198] = "Alijo de Isaari",
	[239828] = "Acantilado de la Realidad",
--	[239901] = "Voidtalon Egg",								-- No Translation
--	[239925] = GetSpellInfo(155346),	-- Ogrish Fortitude
--	[239926] = GetSpellInfo(155315),	-- Touched By Fire
	[240003] = "Zafiro extraño",
	[240289] = "Hacha desgastada",
	[240317] = "Escrito de las Sombras de Iskar",
	[240577] = "La Espada de Kra'nak",
	[240580] = "Joya de Fuego infernal",
	[240616] = "Suministros congelados",
	[240617] = "Faltriquera perdida del centinela",
	[240622] = "Tubo de pergamino del celador",
	[240623] = "Caja fuerte de Sylvanas",
	[240624] = "Nido de dragón feérico",
	[240625] = "Relicario de la suma sacerdotisa",
	[240855] = "Tomo de secretos",
	[241128] = "Tesoro Hojacardo sin vigilancia",
	[241434] = "Lanza de caza atascada",
	[241450] = "Pincho vil cristalizado",
	[241521] = "Flauta del encantador de serpientes",
	[241522] = "La flor perfecta",
	[241533] = "Hoja del campeón olvidado",
	[241563] = "Incensario de tormento",
	[241565] = "Tesoro Foso Sangrante saqueado",
	[241566] = "Fémur con grabados de runas",
	[241599] = "Fruta extraña",
	[241600] = "Yelmo desechado",
	[241601] = "Pertenencias del explorador",
	[241605] = "Esencia de los elementos cristalizada",
	[241656] = "Reliquia envuelta en raíces",
	[241664] = "Catalejo encantado \"prestado\"",
	[241671] = "Fragmento de la clave olvidado",
	[241674] = "Calavera del Jefe loco",
	[241692] = "Hacha del Lobo sollozante",
	[241713] = "El ojo de Grannok",
	[241726] = "Depósito de piedra Ley",
	[241742] = "Libro de Zyzzix",
	[241743] = "Depósito de pizarra vil",
	[241745] = "Cartera empapada de vileza",
	[241760] = "Hoja de sacrificio",
	[241835] = "Alijo de hongos Foso Sangrante",
	[241841] = "Bastón místico despojado",
	[241847] = "El escudo del Comandante",
	[241848] = "Vara deslumbrante",
	[243334] = "Hierba marchita",
	[243911] = "Montículo de nieve",
	[244473] = "Bienes robados de los Tótem del Trueno",
	[244628] = "Premio de Taurson",
	[244678] = "|cFFFFFFFFStep 8:|r Página 5555",
	[244689] = "Cofre del tesoro pequeño",
	[244691] = "Cofre del tesoro pequeño",
	[244692] = "Cofre del tesoro pequeño",
	[244694] = "Cofre del tesoro pequeño",
	[244698] = "Arqueta pequeña",
	[244699] = "Cofre del tesoro pequeño",
	[244700] = "Cofre del tesoro pequeño",
	[244701] = "Cofre del tesoro pequeño",
	[245345] = "Cofre del tesoro pequeño",
	[246269] = "Arqueta pequeña",
	[246353] = "Arqueta pequeña",
	[246555] = "Cofre del tesoro pequeño",
	[246556] = "Cofre del tesoro pequeño",
	[246557] = "Cofre del tesoro pequeño",
	[246558] = "Cofre del tesoro pequeño",
	[246559] = "Cofre del tesoro pequeño",
	[246560] = "Cofre del tesoro pequeño",
	[246561] = "Cofre del tesoro pequeño",
	[246562] = "Cofre del tesoro pequeño",
	[244965] = "Cofre de Sheddle",
	[244983] = "Reloj de bolsillo sucio",
	[245216] = "|cFFFFFFFFStep 3:|r Página 161",
	[245316] = "Cofre del tesoro pequeño",
	[245479] = "Cofre maltrecho",
	[245793] = "Diario maltrecho",
	[246147] = "Cofre del tesoro pequeño",
	[246249] = "Cofre del tesoro pequeño",
	[246309] = "Cofre del tesoro pequeño",
	[246438] = "Diseño de circuitos de joyatrón",
	[247797] = "Correo perdido",
	[248398] = "Dispositivo de comunicación etéreo",
	[248534] = "Lágrimas de Elune",
	[250548] = "Martillo de Khaz'goroth",
	[251168] = "Cristal efímero",
	[251564] = "|cFFFFFFFFStep 4:|r Página 655",
	[251666] = "Cofre del tesoro",
	[251991] = "Égida de Aggramar",
	[252267] = "Saco desvalijado grande",
	[252269] = "Paquete de pociones de batalla",
	[252270] = "Cajón misterioso",
	[252272] = "Botas humeantes",
	[252273] = "Caja de dagas arrojadizas",
	[252277] = "Té de cardo",
	[252279] = "Tomo robado de conocimiento sobre artefactos",
	[252282] = "Juego de llaves chispeante",
	[252284] = "Montón de bombas pegajosas",
	[252289] = "Polvo desvanecedor",
	[252318] = "Ojo de Aman'thul",
	[252412] = "|cFFFFFFFFStep 2:|r Túmulo de barro",
	[252434] = "|cFFFFFFFFStep 12:|r Orbe hambriento",
	[252557] = "|cFFFFFFFFStep 3:|r Orbe hambriento",
	[252558] = "|cFFFFFFFFStep 4:|r Orbe hambriento",
	[252559] = "|cFFFFFFFFStep 5:|r Orbe hambriento",
	[252560] = "|cFFFFFFFFStep 6:|r Orbe hambriento",
	[252561] = "|cFFFFFFFFStep 7:|r Orbe hambriento",
	[252562] = "|cFFFFFFFFStep 8:|r Orbe hambriento",
	[252563] = "|cFFFFFFFFStep 9:|r Orbe hambriento",
	[252564] = "|cFFFFFFFFStep 10:|r Orbe hambriento",
	[252565] = "|cFFFFFFFFStep 11:|r Orbe hambriento",
	[252570] = "Cofre de riquezas del Bastión Celestial",
	[253118] = "Flores de la Arboleda de los Sueños",
	[253157] = "Bayas espirituales",
	[253161] = "Vid de la Arboleda",
	[253176] = "Flores de G'Hanir",
	[253179] = "Flor de Sol",
	[253181] = "Tallospino",
	[253280] = "Veta de piedra Ley",
	[254007] = "Altar del Verdugo",
	[254087] = "Hojas Pérfidas",
	[255344] = "Veta de pizarra vil",
	[257392] = "Placa ardiente del Rompemundos",
	[257999] = "Técnica: Escrito de la mente tranquila",
	[258978] = "Tomo empapado",
	[258980] = "Tomo maldito",
	[266289] = "Cofre perdido en el tiempo",
	[266851] = "Varita de vida simulada",
	[268551] = "Alijo Lenguavermis curioso",
	[269830] = "|cFFFFFFFFStep 9:|r Obsequio de los buscamentes",
	[270855] = "|cFFFFFFFFStep 1:|r Nota discreta",
	[270917] = "Registro de Valarroyo",
	[271849] = "Suministros bélicos eredar",
	[271850] = "Suministros bélicos eredar",
	[272039] = "|cFFFFFFFFStep 2:|r Nota discreta",
	[272046] = "|cFFFFFFFFStep 3:|r Larva mental",
	[272061] = "|cFFFFFFFFStep 4:|r Nota discreta",
	[272163] = "|cFFFFFFFFStep 5:|r Calavera extraña",
	[272165] = "|cFFFFFFFFStep 6:|r Nota discreta",
	[272172] = "|cFFFFFFFFStep 7:|r Nota discreta",
	[272179] = "Comunicado del alcalde",
	[272181] = "|cFFFFFFFFStep 8:|r Nota discreta",
	[272220] = "|cFFFFFFFFStep 9:|r Nota discreta",
	[272270] = "|cFFFFFFFFStep 10:|r Deseo del misterio",
	[272422] = "Libro de hechizos de Gentle",
	[272455] = "Suministros bélicos eredar",
	[272456] = "Suministros bélicos eredar",
	[272487] = "Huevo de color raro",
	[272768] = "Depósito de empirium",
	[272770] = "Suministros bélicos eredar",
	[272771] = "Suministros bélicos eredar",
	[272780] = "Veta de empirium",
	[273222] = "Suministros bélicos eredar",
	[273301] = "Alijo eredar antiguo",
	[273407] = "Alijo eredar antiguo",
	[273412] = "Alijo eredar antiguo",
	[273414] = "Alijo eredar antiguo",
	[273415] = "Alijo eredar antiguo",
	[273439] = "Alijo eredar antiguo",
	[273519] = "Suministros bélicos de la Legión",
	[273521] = "Suministros bélicos de la Legión",
	[273523] = "Suministros bélicos de la Legión",
	[273524] = "Suministros bélicos de la Legión",
	[273527] = "Suministros bélicos de la Legión",
	[273528] = "Suministros bélicos de la Legión",
	[273533] = "Suministros bélicos de la Legión",
	[273535] = "Suministros bélicos de la Legión",
	[273538] = "Suministros bélicos de la Legión",
	[273814] = "Talismán afilado",
	[273854] = "Mochila",
	[273900] = "Arqueta pequeña",
	[273902] = "Arqueta pequeña",
	[273903] = "Arqueta pequeña",
	[273905] = "Arqueta pequeña",
	[273910] = "Arqueta pequeña",
	[273917] = "Arqueta pequeña",
	[273918] = "Arqueta pequeña",
	[273919] = "Arqueta pequeña",
	[275070] = "Arqueta pequeña",
	[275071] = "Arqueta pequeña",
	[275074] = "Arqueta pequeña",
	[275076] = "Arqueta pequeña",
	[276187] = "Junji",
	[276224] = "Cofre de ganancias obtenidas con malas artes",
	[276225] = "Sorprendente excedente de estudiante",
	[276226] = "Cofre teñido de Vacío",
	[276227] = "Alijo secreto Augari",
	[276228] = "Alijo de eredar desesperado",
	[276230] = "Tesoro del buscador de fatalidad",
	[276251] = "Inventario de excavación",
	[276488] = "Bala de cañón de azerita",
	[276490] = "Alijo krokul de emergencia",
	[276515] = "Caña de pescar",
	[276513] = "Pezfango intacto",
	[276735] = "Ofrenda de los elegidos",
	[277207] = "Tesoro acumulado de la Legión",
	[277205] = "Alijo bélico de la Legión antiguo",
	[277327] = "Cofre con runas Augari",
	[277333] = "Sarcófago antiguo",
	[277340] = "Cofre Augari secreto",
	[277342] = "Bienes Augari",
	[277343] = "Tesoro Augari olvidado",
	[277344] = "Recuerdos Augari preciados",
	[277346] = "Cofre Augari desaparecido",
	[277373] = "Algas de luz trémula",
	[277459] = "Efigie de cerdo",
	[277561] = "Alijo del señor de la guerra",
	[277715] = "Cofre Nazmani maldito",
	[277885] = "Tesoro de Wunja",
	[277897] = "Alijo hirviente",
	[278313] = "Carta seria",
	[278368] = "Nota ajada",
	[278436] = "Cofre naufragado",
	[278437] = "Ofrenda para Bwonsamdi",
	[278447] = "Lanza de trampero infiel",
	[278669] = "Libro de contabilidad de Albergue del Ocaso",
	[278675] = "Efigie maldita",
	[279042] = "Alijo de contrabandista",
	[279253] = "Cofre de la suerte de Horace el Afortunado",
	[279260] = "Cofre \"astutamente\" camuflado",
	[279299] = "Sello venenoso",
	[279337] = "Grimorio Aterracorazón",
	[279609] = "Botín de Pandaria",
	[279689] = "Tesoro Nazmani perdido",
	[279750] = "Cofre cubierto de heno",
	[280504] = "Tesoro tragado",
	[280522] = "Tesoro parcialmente digerido",
	[280619] = "Cofre antiguo reforzado con hierro",
	[280727] = "Nota carbonizada",
	[280751] = "Arqueta pequeña",
	[280755] = "Bolsa de Quintin",
	[280951] = "Botín de Aspafresno",
--	[280957] = "Zukashi's Satchel",						-- No translation
	[281092] = "Tesoro de médico brujo",
	[281230] = "Invitación formal",
	[281397] = "Arqueta Aguacortada",
	[281494] = "Arqueta congelada",
	[281551] = "Póster de Se busca ayudante",
	[281583] = "Relicario antiguo",
	[281639] = "Estatua desmoronada",
	[281646] = "Cuba de miel",
	[281647] = "Aviso colgado",
	[281655] = "Favor de corazón roto",
	[281673] = "Diario de ciudadano de Corlain",
	[281898] = "Cofre olvidado de Dazar",
	[282153] = "Caja fuerte hundida",
	[282448] = "Cartel de Se busca",
	[282457] = "Tótem guardazarza",
	[282478] = "Cajón vacío",
	[282498] = "Flauta del desierto",
	[282628] = "Montón de arena",
	[282666] = "Urna de Agussu",
	[284426] = "Máquina minera enterrada",
	[284448] = "Cofre de erudito oculto",
	[284454] = "Recompensa del Tiburón Blanco",
	[284455] = "Lamento del Exiliado",
	[287239] = "Última ofrenda de Grayal",
	[287304] = "Recompensa de explorador perdido",
	[287318] = "Reserva Furiarena",
	[287320] = "Alijo varado",
	[287324] = "Codicia del excavador",
	[287326] = "Tesoro enterrado de Zem'lan",
	[287398] = "Se busca: Za'roco",
	[287440] = "Se busca: Taz'raka",
	[287441] = "Se busca: exploraarena Vesarik",
	[287442] = "Se buscan: participantes de la expedición Cobra",
	[287531] = "Arqueta pequeña",
	[288157] = "Se busca: Yarsel'ghun",
	[288214] = "Cartel \"Se busca\"",
	[288596] = "Alijo de secretos",
	[288622] = "Cartel de Se busca",
	[288641] = "SE BUSCAN: ladrones de grifos",
	[289365] = "Cartel de Se busca",
	[289647] = "Arqueta deteriorada",
	[289728] = "Mapa del tesoro del capitán Gulnaku",
	[290419] = "Cartel de Se busca",
	[290765] = "Gran montón de oro",
	[290537] = "Se busca ayudante",
	[290725] = "Riquezas de Tor'nowa",
	[290993] = "Botín de Marea de Hierro",
	[291143] = "Llave de Rinah",
	[291201] = "Arqueta pequeña",
	[291204] = "Arqueta pequeña",
	[291211] = "Arqueta pequeña",
	[291213] = "Arqueta pequeña",
	[291217] = "Arqueta pequeña",
	[291222] = "Arqueta pequeña",
	[291223] = "Arqueta pequeña",
	[291224] = "Arqueta pequeña",
	[291225] = "Arqueta pequeña",
	[291226] = "Arqueta pequeña",
	[291227] = "Cofre del tesoro pequeño",
	[291228] = "Arqueta pequeña",
	[291229] = "Arqueta pequeña",
	[291230] = "Arqueta pequeña",
	[291244] = "Arqueta pequeña",
	[291246] = "Arqueta pequeña",
	[291254] = "Arqueta pequeña",
	[291255] = "Arqueta pequeña",
	[291257] = "Arqueta pequeña",
	[291258] = "Arqueta pequeña",
	[291259] = "Arqueta pequeña",
	[291263] = "Arqueta pequeña",
	[291264] = "Arqueta pequeña",
	[291265] = "Arqueta pequeña",
	[291266] = "Arqueta pequeña",
	[291267] = "Arqueta pequeña",
	[292523] = "Cartel de Se busca",
	[292673] = "Un pergamino húmedo",
	[292674] = "Un pergamino húmedo",
	[292675] = "Un pergamino húmedo",
	[292676] = "Un pergamino húmedo",
	[292677] = "Un pergamino húmedo",
	[293349] = "Fiambrera desechada",
	[293350] = "Cofre de madera tallado",
	[293837] = "|cFFFFFFFFStep 2:|r Piedra corriente I",
	[293838] = "|cFFFFFFFFStep 3:|r Piedra corriente II",
	[293839] = "|cFFFFFFFFStep 4:|r Piedra corriente III",
	[293840] = "|cFFFFFFFFStep 5:|r Piedra corriente IV",
	[293841] = "|cFFFFFFFFStep 6:|r Piedra corriente V",
	[293842] = "|cFFFFFFFFStep 7:|r Piedra corriente VI",
	[293843] = "|cFFFFFFFFStep 8:|r Piedra corriente VII",
	[293844] = "|cFFFFFFFFStep 9:|r Piedra corriente VIII",
	[293845] = "|cFFFFFFFFStep 10:|r Piedra corriente IX",
	[293846] = "|cFFFFFFFFStep 11:|r Piedra corriente X",
	[293849] = "|cFFFFFFFFStep 1:|r Nota llamativa",
	[293852] = "Arqueta enterrada",
	[293880] = "Cofre del tesoro enterrado",
	[293881] = "Arqueta enterrada",
	[293884] = "Arqueta enterrada",
	[293962] = "Alijo de noble precario",
	[293964] = "Alijo de contrabandista olvidado",
	[293965] = "Alijo de los Tallamarfil",
	[294173] = "Alijo de suministros de Ventura y Cía.",
	[294174] = "Cofre olvidado",
	[294311] = "Arqueta pequeña",
	[294316] = "Ofrendas perdidas de Kimbul",
	[294317] = "Cofre de Muertobosque",
	[294319] = "Tesoro hundido en la arena",
	[294703] = "Arcón oxidado de Huesardo",
	[296536] = "Guja de centinela ensangrentada",
	[297825] = "Cofre cubierto de telarañas",
	[297828] = "Cofre de mercader",
	[297878] = "Cofre maldito",
	[297879] = "Cofre embrujado",
	[297880] = "Cofre hechizado",
	[297881] = "Cofre encantado",
	[297891] = "Alijo vincularrunas",
	[297892] = "Cofre con vínculo rúnico",
	[297893] = "Arca vincularrunas",
	[298920] = "Alijo de Hablaespinas robado",
	[298858] = "Cartel \"Se busca\"",
	[298849] = "Cartel de Se busca",
	[298921] = "Antigua tablilla nazmani",
	[298963] = "Tablilla Nazmani deteriorada",
	[298965] = "Tablilla agrietada",
	[299073] = "Tablilla fracturada",
	[303016] = "|cFFFFFFFFStep 14:|r Piedra corriente XIII",
	[303017] = "|cFFFFFFFFStep 13:|r Piedra corriente XII",
	[303018] = "|cFFFFFFFFStep 12:|r Piedra corriente XI",
	[307265] = "Cartel de Se busca",
	[307748] = "Carta de Ventura y Cía.",
	[310709] = "Cofre empapado",
	[311218] = "Xal'atath, Daga del Imperio Negro",
	[311902] = "Piezas sueltas",
	[311903] = "Piezas sueltas",
	[322413] = "Cofre brillante",
	[322533] = "Escrito de los elementos de Mardivas",
	[324407] = "Raíces del Vacío",
	[325659] = "Cofre mecanizado",
	[325660] = "Cofre mecanizado",
	[325661] = "Cofre mecanizado",
	[325662] = "Cofre mecanizado",
	[325663] = "Cofre mecanizado",
	[325664] = "Cofre mecanizado",
	[325665] = "Cofre mecanizado",
	[325666] = "Cofre mecanizado",
	[325667] = "Cofre mecanizado",
	[325668] = "Cofre mecanizado",
	[325853] = "Estantería vacía",
	[325869] = "Tonel vacío",
	[326027] = "Reciclarizador DX-82",
	[326140] = "Tablón de recompensas",
	[326394] = "Cofre Arcano",
	[326395] = "Valija Arcana resplandeciente",
	[326396] = "Valija Arcana resplandeciente",
	[326397] = "Valija Arcana resplandeciente",
	[326398] = "Valija Arcana resplandeciente",
	[326399] = "Valija Arcana resplandeciente",
	[326400] = "Valija Arcana resplandeciente",
	[326401] = "Cofre Arcano",
	[326402] = "Cofre Arcano",
	[326403] = "Cofre Arcano",
	[326404] = "Cofre Arcano",
	[326405] = "Cofre Arcano",
	[326406] = "Cofre Arcano",
	[326407] = "Cofre Arcano",
	[326408] = "Cofre Arcano",
	[326409] = "Cofre Arcano",
	[326410] = "Cofre Arcano",
	[326411] = "Cofre Arcano",
	[326412] = "Cofre Arcano",
	[326413] = "Cofre Arcano",
	[326414] = "Cofre Arcano",
	[326415] = "Cofre Arcano",
	[326416] = "Cofre Arcano",
	[326417] = "Cofre Arcano",
	[326418] = "Cofre Arcano",
	[326419] = "Cofre Arcano",
	[326588] = "Alijo de armas de azerita",
	[327170] = "Expositor de armas",
	[327548] = "Planos del cargador",
	[327585] = "Tablón de recompensas",
	[327591] = "Diario conservado",
	[327592] = "Cerrojo encantado",
	[327596] = "Enfoque abisal roto",
})
do a[key] = value; end
