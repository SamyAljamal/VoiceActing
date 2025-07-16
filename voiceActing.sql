--this is a database that allows us to find voice actor overlaps between 2 franchises
--(e.g. what actors voiced characters in both 'Persona 5' and 'Genshin Impact'?
--and what are the characters' names?)

--we create and populate a bulk table first, then normalize it into smaller tables later

CREATE TABLE voiceActing
(ID INTEGER PRIMARY KEY AUTOINCREMENT,
 character varchar(255),
 Franchise varchar(255),
 VA_name varchar(255));

--populate the table with names of characters, their franchise of origin, and their VA
insert into voiceActing(character, franchise, va_name)
values
('Frieza', 'Dragon Ball', 'Daman Mills'),
('Blade','Honkai: Star Rail','Daman Mills'),
('Aogami','Shin Megami Tensei V','Daman Mills'),
('Lyney','Genshin Impact','Daman Mills'),
('Goro Akechi','Persona 5','Robbie Daymond'),
('Curious','RWBY','Robbie Daymond'),
('Ryuji Sakamoto','Persona 5','Max Mittelman'),
('Arataki Itto','Genshin Impact','Max Mittelman'),
('Citlali','Genshin Impact','Skyler Davenport'),
('March 7th','Honkai: Star Rail','Skyler Davenport'),
('Haru Okumura','Genshin Impact','Xanthe Huynh'),
('Pela','Honkai: Star Rail','Xanthe Huynh'),
('Changsheng','Genshin Impact','Xanthe Huynh'),
('Odin','Shin Megami Tensei V','Keith Silverstein'),
('Floki','Vinland Saga','Keith Silverstein'),
('Torbjorn','Overwatch','Keith Silverstein'),
('Zhongli','Genshin Impact','Keith Silverstein'),
('Masayoshi Shido','Persona 5','Keith Silverstein'),
('Hisoka','Hunter x Hunter','Keith Silverstein'),
('Vector','Sonic','Keith Silverstein'),
('Nazeem','TES V: Skyrim','Keith Silverstein'),
('Flynn','Shin Megami Tensei IV','Keith Silverstein'),
('Johan Liebert','Monster','Keith Silverstein'),
('Speedwagon','Jojo''s Bizzare Adventure','Keith Silverstein'),
('Yanfei','Genshin Impact','Lizzie Freeman'),
('Sparkle','Honkai: Star Rail','Lizzie Freeman'),
('Pomni','The Amazing Digital Circus','Lizzie Freeman'),
('Chizuru','Rent-A-Girlfriend','Lizzie Freeman'),
('Mujika','The Promised Neverland','Lizzie Freeman'),
('Vi','League of Legends','Cia Court'),
('Himeko','Honkai: Star Rail', 'Cia Court'),
('Arlan','Honkai: Star Rail','Dani Chambers'),
('Nilou','Genshin Impact','Dani Chambers'),
('Asta','Honkai: Star Rail','Felecia Angelle'),
('Hook','Honkai: Star Rail','Felecia Angelle'),
('Kohaku','Dr. Stone','Felecia Angelle'),
('Mona','Genshin Impact','Felecia Angelle'),
('Shinoa Hiragi','Seraph of the End','Felecia Angelle'),
('Emi Yusa','The Devil is a Part-Timer','Felecia Angelle'),  
('Silver Wolf','Honkai: Star Rail','Melissa Fahn'),
('Neptune','Neptunia','Melissa Fahn'),
('Serval','Honkai: Star Rail','Natalie Van Sistine'),
('Arnheid','Vinland Saga','Natalie Van Sistine'),
('Yor Forger','Spy x Family','Natalie Van Sistine'),
('Seele','Honkai: Star Rail','Molly Zhang'),
('Astra Yao','Zenless Zone Zero','Molly Zhang'),
('Natasha','Honkai: Star Rail','Elizabeth Maxwell'),
('Sae Niijima','Persona 5','Elizabeth Maxwell'),
('Rosaria','Genshin Impact','Elizabeth Maxwell'),
('Albedo','Overlord','Elizabeth Maxwell'),
('Winter Schnee','RWBY','Elizabeth Maxwell'),
('Evelyn Chevalier','Zenless Zone Zero','Elizabeth Maxwell'),
('Svarog','Honkai: Star Rail','DC Douglas'),
('Kamoshida','Persona 5','DC Douglas'),
('Lin','Xenoblade Chronicles','Cassandra Lee Morris'),
('Morgana','Persona 5','Cassandra Lee Morris'),
('Sothis','Fire Emblem','Cassandra Lee Morris'),
('Mualani','Genshin Impact','Cassandra Lee Morris'), 
('Yubel','Yugioh','Cassandra Lee Morris'),
('Kyubey','Madoka Magika','Cassandra Lee Morris'),
('Taiga ','Toradora!','Cassandra Lee Morris'),
('Leo','Yugioh','Cassandra Lee Morris'),
('Luna','Yugioh','Cassandra Lee Morris'),
('Anya Forger','Spy x Family','Bryn Apprill'),
('Qingque','Honkai: Star Rail','Bryn Apprill'),
('Anton','Zenless Zone Zero','Alejandro Saab'),
('Jing Yuan','Honkai: Star Rail','Alejandro Saab'),
('Cyno','Genshin Impact','Alejandro Saab'),
('Shallot','Dragon Ball','Alejandro Saab'),
('Yanqing','Honkai: Star Rail','Amber May'),
('Dehya','Genshin Impact','Amber May'),
('Fu Xuan','Honkai: Star Rail','Sarah Wiedenheft'),
('Suika','Dr. Stone','Sarah Wiedenheft'),
('Zeno','Dragon Ball','Sarah Wiedenheft'),
('Luka','Honkai: Star Rail','Howard Wang'),
('Whitley Schnee','RWBY','Howard Wang'),
('Summer Rose','RWBY','Morgan Lauré'),
('Guinaifen','Honkai: Star Rail','Morgan Lauré'),
('Aglaea','Honkai: Star Rail','Morgan Lauré'),
('Kaori Kanzaki','Certain Magical Index','Morgan Lauré'), 
('Anby Demara','Zenless Zone Zero','Sam Slade'),
('Topaz','Honkai: Star Rail','Sam Slade'),
('Burnice White','Zenless Zone Zero','Risa Mei'),
('Lynx','Honkai: Star Rail','Risa Mei'),
('Kokomi','Genshin Impact','Risa Mei'),
('Jingliu','Honkai: Star Rail','Amanda Lee'),
('Marin Kitagawa','My Dress-Up Darling','Amanda Lee'),
('Ai Hayasaka','Kaguya-sama: Love is War','Amanda Lee'),
('Invisible Woman','Marvel Rivals','Suzie Yeung'),
('Piper Wheel','Zenless Zone Zero','Suzie Yeung'),
('Fuuka','Persona 3 Reload','Suzie Yeung'),
('Hanya','Honkai: Star Rail','Suzie Yeung'),
('Eula','Genshin Impact','Suzie Yeung'),
('Ruan Mei','Honkai: Star Rail','Emi Lo'),
('Lucy','Cyberpunk: Edgerunners','Emi Lo'),
('Columbina','Genshin Impact','Emi Lo'),
('Maomao','Apothecary Diaries','Emi Lo'),
('Yoimiya','Genshin Impact','Jenny Yokobori'),
('Xueyi','Honkai: Star Rail','Jenny Yokobori'),
('Black Swan','Honkai: Star Rail','Arryn Zech'),
('Blake Belladonna','RWBY','Arryn Zech'),
('Gallagher','Honkai: Star Rail','Erik Braa'),
('Moon Knight','Marvel Rivals','Erik Braa'),
('Mitsuru Kirijo','Persona 3 Reload','Allegra Clark'),
('Acheron','Honkai: Star Rail','Allegra Clark'),
('Dorothea','Fire Emblem','Allegra Clark'),
('Ylva','Vinland Saga','Allegra Clark'),
('Beidou','Genshin Impact','Allegra Clark'),
('Clothar Alberich','Genshin Impact','Andrew Russell'),
('Boothill','Honkai: Star Rail','Andrew Russell'),
('Nekomiya Mana','Zenless Zone Zero','Alice Himora'),
('Robin','Honkai: Star Rail','Alice Himora'),
('Lynette','Genshin Impact','Anairis Quinones'),
('Feixiao','Honkai: Star Rail','Anairis Quinones'),
('Kazuha','Genshin Impact','Mark Whitten'),
('Jiaoqiu','Honkai: Star Rail','Mark Whitten'),
('Kaveh','Genshin Impact','Ben Balmaceda'),
('Moze','Honkai: Star Rail','Ben Balmaceda'),
('Navia','Genshin Impact','Brenna Larsen'),
('Yunli','Honkai: Star Rail','Brenna Larsen'),
('Sunday','Honkai: Star Rail','Griffin Puatu'),
('Saizo','Soul Hackers 2','Griffin Puatu'),
('Yukari Takeba','Persona 3 Reload','Heather Gonzalez'),
('Cocolia Rand','Honkai: Star Rail','Heather Gonzalez'),
('Diluc','Genshin Impact','Sean Chiplock'),
('Mishima','Persona 5','Sean Chiplock'),
('Alear (Female)','Fire Emblem','Laura Stahl'),
('Barbara','Genshin Impact','Laura Stahl'),
('Xinyan','Genshin Impact','Laura Stahl'),
('Ann Takamaki','Persona 5','Erika Harlacher'),
('Venti','Genshin Impact','Erika Harlacher'),
('Violet Evergarden','Violet Evergarden','Erika Harlacher'),
('Ami Kawashima','Toradora!','Erika Harlacher'),
('Hoshimi Miyabi','Zenless Zone Zero','Cristina Valenzuela'),
('Bennett','Genshin Impact','Cristina Valenzuela'),
('Xingqiu','Genshin Impact','Cristina Valenzuela'),
('Shantae','Shantae','Cristina Valenzuela'),
('Canute','Vinland Saga','Griffin Burns'),
('Tartaglia','Genshin Impact','Griffin Burns'),
('Roccia','Wuthering Waves','Holly Earl'),
('Hyacine','Honkai: Star Rail','Holly Earl'),
('Figue','Soul Hackers 2','Erica Mendez'),
('Ayaka','Genshin Impact','Erica Mendez'),
('Katheryne','Genshin Impact','Erica Mendez'),
('Android 21','Dragon Ball','Jeannie Tirado'),
('Kujou Sara','Genshin Impact','Jeannie Tirado'),
('Grace Howard','Zenless Zone Zero','Chelsea Kwoka'),
('Shenhe','Genshin Impact','Chelsea Kwoka'),
('Qingyi','Zenless Zone Zero','Kira Buckland'),
('Kuki Shinobu','Genshin Impact','Kira Buckland'),
('Yelan','Genshin Impact','Laura Post'),
('Emma Frost','Marvel Rivals','Laura Post'),
('Nuwa','Shin Megami Tensei V','Laura Post'),
('Kasumi Yoshizawa','Persona 5','Laura Post'),
('Yunaka','Fire Emblem','Laura Post'),
('Flamma','Soul Hackers 2','Laura Post'),
('Diana Cavendish','Little Witch Academia','Laura Post'),
('Seth Lowell','Zenless Zone Zero','Nazeeh Tarsha'),
('Alhaitham','Genshin Impact','Nazeeh Tarsha'),
('Jane Doe','Zenless Zone Zero','Kelsey Jaffer'),
('Yaoyao','Genshin Impact','Kelsey Jaffer'),
('Gendo Ikari','Neon Genesis Evangelion','Ray Chase'),
('Neuvillette','Genshin Impact','Ray Chase'),
('Futaba Sakura','Persona 5','Erica Lindbeck'),
('Chevreuse','Genshin Impact','Erica Lindbeck'),
('Milady','Soul Hackers 2','Erica Lindbeck'),
('Cheelai','Dragon Ball','Erica Lindbeck'),
('Ritsuko Akagi','Neon Genesis Evangelion','Erica Lindbeck'),
('Sigewinne','Genshin Impact','Sarah Williams'),
('Jinx','League of Legends','Sarah Williams'),
('Chihaya','Persona 5','Sarah Williams'),
('Lavenza','Persona 5','Carrie Keranen'),
('Ying''er','Genshin Impact','Carrie Keranen'),
('Caroline/Justine','Persona 5','Carrie Keranen'),
('Misato Katsuragi','Neon Genesis Evangelion','Carrie Keranen'),
('Gaming','Genshin Impact','Caleb Yen'),
('Caelus','Honkai: Star Rail','Caleb Yen'),
('Arlecchino','Genshin Impact','Erin Yvette'),
('Sophia','Shin Megami Tensei V','Erin Yvette'),
('Jinshi','Wuthering Waves','Anna Devlin'),
('Lan Yan','Genshin Impact','Anna Devlin'),
('Yinlin','Wuthering Waves','Naomi McDonald'),
('Yumemizuki Mizuki','Genshin Impact','Naomi McDonald'),
('Rover (Female)','Wuthering Waves','Jane Jackson'),
('Varesa','Genshin Impact','Jane Jackson'),
('Dainsleif','Genshin Impact','Yuri Lowenthal'),
('Makoto Yuki','Persona 3','Yuri Lowenthal'),
('Yosuke','Persona 4','Yuri Lowenthal'),
('Encore','Wuthering Waves','Carina Reeves'),
('Fiora','Xenoblade Chronicles','Carina Reeves'),
('The Shorekeeper','Wuthering Waves','Stephanie McKeon'),
('Asuka Langley Soryu','Neon Genesis Evangelion','Stephanie McKeon'),
('Phoebe','Wuthering Waves','Rebecca LaChance'),
('Sena','Xenoblade Chronicles','Rebecca LaChance'),
('Cammuravi','Xenoblade Chronicles','Shai Matheson'),
('Scar','Wuthering Waves','Shai Matheson'),
("Skirk","Genshin Impact","Cat Protano"),
("Misha","Honkai: Star Rail","Cat Protano");

UPDATE voiceActing            --replacing wrong Genshin Impact entry with Persona 5
SET franchise = 'Persona 5'
WHERE ID=11;

SELECT * FROM voiceActing      --sorting by franchise then VA name
ORDER BY franchise;

SELECT * FROM voiceActing
ORDER BY va_name;

SELECT character,franchise,va_name,COUNT(*) --checking for duplicate characters
FROM voiceActing
GROUP by character
HAVING COUNT(*) > 1;

SELECT franchise,COUNT(*) --displaying the most featured franchises 
FROM voiceActing
GROUP by franchise
ORDER BY COUNT(*) DESC;

--normalization begins
--starting with voice actors

CREATE TABLE VoiceActors (
    actor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    actor_name VARCHAR(255) UNIQUE NOT NULL  -- UNIQUE prevents duplicates
);

INSERT INTO VoiceActors (actor_name)
SELECT DISTINCT va_name FROM voiceActing;

--franchises are next

CREATE TABLE Franchises (
	franchise_id INTEGER PRIMARY KEY AUTOINCREMENT,
	franchise_name VARCHAR(255) UNIQUE NOT NULL
);

INSERT INTO Franchises (franchise_name)
SELECT DISTINCT Franchise from voiceActing;

--characters are next 

CREATE TABLE Characters (
	character_id INTEGER PRIMARY KEY AUTOINCREMENT,
	character_name VARCHAR(255) NOT NULL,
	franchise_id INTEGER,
	FOREIGN KEY (franchise_id) REFERENCES Franchises(franchise_id)
);

INSERT INTO Characters (character_name, franchise_id)
SELECT voiceActing.character, Franchises.franchise_id
FROM voiceActing
JOIN Franchises ON voiceActing.franchise = Franchises.franchise_name;

--linking characters to voice actors in a bridge table

CREATE TABLE CharacterVoiceActors (
	character_id INTEGER,
	actor_id INTEGER,
	PRIMARY KEY (character_id, actor_id), --composite primary key
	FOREIGN KEY (character_id) REFERENCES Characters(character_id),
	FOREIGN KEY (actor_id) REFERENCES VoiceActors(actor_id)
);

INSERT INTO CharacterVoiceActors (character_id, actor_id)
SELECT Characters.character_id, VoiceActors.actor_id
FROM voiceActing
JOIN Characters ON voiceActing.character = Characters.character_name
JOIN VoiceActors ON voiceActing.VA_name = VoiceActors.actor_name;

--making the final query

SELECT VoiceActors.actor_name,
GROUP_CONCAT(DISTINCT Franchises.franchise_name),
GROUP_CONCAT(Characters.character_name)
FROM VoiceActors
JOIN CharacterVoiceActors ON VoiceActors.actor_id = CharacterVoiceActors.actor_id
JOIN Characters ON CharacterVoiceActors.character_id = Characters.character_id
JOIN Franchises ON Characters.franchise_id = Franchises.franchise_id
WHERE Franchises.franchise_name IN ('Honkai: Star Rail', 'Genshin Impact')
GROUP BY VoiceActors.actor_id
HAVING COUNT(DISTINCT Franchises.franchise_id) = 2;