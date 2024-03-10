pathtonewspawn = "newspawn\locations\";
EXECscript1 = 'player execVM "'+pathtonewspawn+'%1"';

if ((getPlayerUID player) in ["0","0","0"]) then {
	newspawn =
	[
		["",false],
		["Select Spawn Point", [2], "#USER:Donator", -5, [["expression", ""]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
	];
} else {
	newspawn =
	[
		["",false],
		["Change your Drop Location", [2], "#USER:Peasant", -5, [["expression", ""]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
		["Drop Here", [3], "", -5, [["expression", format[EXECscript1,"exit.sqf"]]], "1", "1"]
	];
};

Donator =
[
	["",false],
	["Donor Base", [2], "", -5, [["expression", format[EXECscript1,"donor.sqf"]]], "1", "1"],
	["Balota", [3], "", -5, [["expression", format[EXECscript1,"balota.sqf"]]], "1", "1"],
	["Berezino", [4], "", -5, [["expression", format[EXECscript1,"berezino.sqf"]]], "1", "1"],
	["Cherno", [5], "", -5, [["expression", format[EXECscript1,"cherno.sqf"]]], "1", "1"],
	["Elektro", [6], "", -5, [["expression", format[EXECscript1,"elektro.sqf"]]], "1", "1"],
	["Kamenka", [7], "", -5, [["expression", format[EXECscript1,"kamenka.sqf"]]], "1", "1"],
	["Gorka", [8], "", -5, [["expression", format[EXECscript1,"gorka.sqf"]]], "1", "1"],
	["Grishino", [9], "", -5, [["expression", format[EXECscript1,"grishino.sqf"]]], "1", "1"],
	["Kabanino", [10], "", -5, [["expression", format[EXECscript1,"kabanino.sqf"]]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Next page", [12], "#USER:Page4", -5, [["expression", ""]], "1", "1"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

Peasant =
[
	["",false],
	["Balota", [2], "", -5, [["expression", format[EXECscript1,"balota.sqf"]]], "1", "1"],
	["Berezino", [3], "", -5, [["expression", format[EXECscript1,"berezino.sqf"]]], "1", "1"],
	["Chernogorsk", [4], "", -5, [["expression", format[EXECscript1,"cherno.sqf"]]], "1", "1"],
	["Elektrozavodsk", [5], "", -5, [["expression", format[EXECscript1,"elektro.sqf"]]], "1", "1"],
	["Kamenka", [6], "", -5, [["expression", format[EXECscript1,"kamenka.sqf"]]], "1", "1"],
	["Gorka", [7], "", -5, [["expression", format[EXECscript1,"gorka.sqf"]]], "1", "1"],
	["Grishino", [8], "", -5, [["expression", format[EXECscript1,"grishino.sqf"]]], "1", "1"],
	["Kabanino", [9], "", -5, [["expression", format[EXECscript1,"kabanino.sqf"]]], "1", "1"],
	["Kamyshovo", [10], "", -5, [["expression", format[EXECscript1,"kamyshovo.sqf"]]], "1", "1"],
	["Komarovo", [11], "", -5, [["expression", format[EXECscript1,"komarovo.sqf"]]], "1", "1"],
	["Krasnostav", [16], "", -5, [["expression", format[EXECscript1,"krasnostav.sqf"]]], "1", "1"],
	["Pogorevka", [17], "", -5, [["expression", format[EXECscript1,"pogorevka.sqf"]]], "1", "1"],
	["Prigorodki", [18], "", -5, [["expression", format[EXECscript1,"prigor.sqf"]]], "1", "1"],
	["Pusta", [19], "", -5, [["expression", format[EXECscript1,"pusta.sqf"]]], "1", "1"],
	["Solnichniy", [20], "", -5, [["expression", format[EXECscript1,"solnichniy.sqf"]]], "1", "1"],
	["Vybor", [21], "", -5, [["expression", format[EXECscript1,"vybor.sqf"]]], "1", "1"],
	["Drop Here", [22], "", -5, [["expression", format[EXECscript1,"exit.sqf"]]], "1", "1"]
];

/*
Peasant =
[
	["",false],
	["Balota", [2], "", -5, [["expression", format[EXECscript1,"balota.sqf"]]], "1", "1"],
	["Berezino", [3], "", -5, [["expression", format[EXECscript1,"berezino.sqf"]]], "1", "1"],
	["Cherno", [4], "", -5, [["expression", format[EXECscript1,"cherno.sqf"]]], "1", "1"],
	["Elektro", [5], "", -5, [["expression", format[EXECscript1,"elektro.sqf"]]], "1", "1"],
	["Kamenka", [6], "", -5, [["expression", format[EXECscript1,"kamenka.sqf"]]], "1", "1"],
	["Gorka", [7], "", -5, [["expression", format[EXECscript1,"gorka.sqf"]]], "1", "1"],
	["Grishino", [8], "", -5, [["expression", format[EXECscript1,"grishino.sqf"]]], "1", "1"],
	["Kabanino", [9], "", -5, [["expression", format[EXECscript1,"kabanino.sqf"]]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Next page", [12], "#USER:Page4", -5, [["expression", ""]], "1", "1"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
*/

Page4 =
[
	["",false],
	["Kamyshovo", [2], "", -5, [["expression", format[EXECscript1,"kamyshovo.sqf"]]], "1", "1"],
	["Komarovo", [3], "", -5, [["expression", format[EXECscript1,"komarovo.sqf"]]], "1", "1"],
	["Krasnostav", [4], "", -5, [["expression", format[EXECscript1,"krasnostav.sqf"]]], "1", "1"],
	["Pogorevka", [5], "", -5, [["expression", format[EXECscript1,"pogorevka.sqf"]]], "1", "1"],
	["Prigor", [6], "", -5, [["expression", format[EXECscript1,"prigor.sqf"]]], "1", "1"],
	["Pusta", [7], "", -5, [["expression", format[EXECscript1,"pusta.sqf"]]], "1", "1"],
	["Solnichniy", [8], "", -5, [["expression", format[EXECscript1,"solnichniy.sqf"]]], "1", "1"],
	["Vybor", [9], "", -5, [["expression", format[EXECscript1,"vybor.sqf"]]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Previous Page", [12], "", -4, [["expression", ""]], "1", "1"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:newspawn";