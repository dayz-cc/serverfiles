/*
 _markerarray = ["DZAI_Kamenka","DZAI_Komarovo","DZAI_Balota","DZAI_BalotaAirstrip","DZAI_Cherno1","DZAI_Cherno2","DZAI_Cherno3","DZAI_Cherno4","DZAI_Elektro1","DZAI_Elektro2","DZAI_Elektro3","DZAI_Kamyshovo","DZAI_Tulga","DZAI_Pusta","DZAI_ThreeValleys","DZAI_Solnichniy","DZAI_SolnichniyFactory","DZAI_Nizhnoye","DZAI_Orlovets","DZAI_Berezino","DZAI_Berezino2","DZAI_Berezino3","DZAI_Berezino4","DZAI_Khelm","DZAI_Olsha","DZAI_NEAF","DZAI_Krasnostav","DZAI_Gvozdno","DZAI_Pavlovo","DZAI_Bor","DZAI_Msta","DZAI_Staroye","DZAI_Dolina","DZAI_OrlovetsFactory","DZAI_DubrovkaNW","DZAI_Dubrovka","DZAI_Polana","DZAI_Mogilevka","DZAI_Rog","DZAI_Nadezhdino","DZAI_Zub","DZAI_Kozlovka","DZAI_Drozhino","DZAI_Zelenogorsk","DZAI_GreenMountain","DZAI_Shakhovka","DZAI_Guglovo","DZAI_Vyshnoye","DZAI_Pulkovo","DZAI_Sosnovka","DZAI_Myshkino","DZAI_Pustoshka","DZAI_Vybor","DZAI_Pogorevka","DZAI_Rogovo","DZAI_Gorka","DZAI_NovySobor","DZAI_StarySobor","DZAI_Kabanino","DZAI_Lopatino","DZAI_DevilsCastle","DZAI_Grishino","DZAI_NWAF2","ghknwbase1","DZAI_NWAF7","wkamenka2"];
 */
 private ["_markerarray"];
 _markerarray = [[1867.8379, 2290.2583],
 [3633.8445, 2392.9741],
 [4482.1094, 2424.5408, 4.1991434],
 [4787.6616, 2551.0151],
 [6560.6025, 2419.9658],
 [6504.7559, 2773.7056, 6.6184349],
 [6674.2568, 2583.6072],
 [6975.0464, 2645.3413],
 [10168.299, 1954.9338],
 [10454.194, 2245.2053, 9.1402712],
 [10469.834, 2467.689],
 [12067.335, 3621.5562],
 [12866.335, 4463.1636],
 [9162.2178, 3838.3701],
 [13256.896, 5440.0186],
 [13334.822, 6261.1094],
 [13090.676, 7070.6646],
 [12889.117, 8149.4814],
 [12163.348, 7298.52],
 [12031.008, 9118.2402],
 [12249.986, 9588.9346],
 [12734.031, 9623.2559],
 [12870.814, 10054.313],
 [12313.479, 10851.807, 4.392067],
 [13367.774, 12848.616],
 [12076.522, 12637.961, 0.056991577], 
 [11128.36, 12342.763],
 [8717.3887, 11794.308],
 [1700.5154, 3838.8384],
 [3338.4927, 3923.6582, 3.5301208],
 [11345.774, 5475.9185],
 [10126.361, 5483.3281],
 [11281.19, 6607.8843],
 [11457.82, 7483.894, 5.1239624],
 [10007.422, 10392.041, 4.4281769],
 [10467.023, 9791.6279],
 [10713.679, 8045.3086],
 [7599.5488, 5169.6831],
 [11254.334, 4278.8921],
 [5850.4556, 4746.9932],
 [6548.4966, 5590.0073],
 [4432.9712, 4648.2036],
 [3415.1025, 4941.2129],
 [2743.4209, 5304.1323],
 [3720.9399, 6005.7715],
 [9659.7217, 6564.8687],
 [8462.3857, 6697.4175],
 [6538.7881, 6129.7109, 5.9794617],
 [4943.1729, 5617.7466, 5.722168],
 [2530.4241, 6358.1699, 0],
 [1994.825, 7389.6553],
 [3057.0288, 7854.3584],
 [3860.8384, 8891.998],
 [4523.5366, 6417.9312],
 [4743.606, 6770.0415, 2.3750305], 
 [9615.8896, 8845.5264],
 [7039.3799, 7689.1279],
 [6158.9712, 7749.9517],
 [5380.0811, 8599.0205],
 [2769.7209, 9947.7793],
 [6894.8286, 11444.771],
 [6018.1162, 10304.021],
 [4762.6807, 10202.887],
 [4569.4458, 9848.5254, -3.0517578e-005],
 [5227.6763, 9775.2021],
 [1140.0343, 2297.9626, -6.8664551e-005]
 //,
 //[round(random 11000)+2000,round(random 11000)+2000,0.0],
 //[round(random 11000)+2000,round(random 11000)+2000,0.0],
// [round(random 11000)+2000,round(random 11000)+2000,0.0]
 ];
 
  {
			//if(floor(random(68))<1) then {
				//[_x,1000,floor(random(1999)),["TentStorage"]] call bis_fnc_destroyCity;
				[_x,1000,floor(random(1999)),[]] call fnc_destroyBuildings;
				//diag_log ("GHK: Generated Destruction at: " + str(_x));
				//sleep 0.5;
			//};
		
	} forEach _markerarray;
 