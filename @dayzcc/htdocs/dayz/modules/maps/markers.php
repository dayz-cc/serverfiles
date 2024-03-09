<?php

function markers_player($res, $world) {
	$markers = array();

	while ($row = mysql_fetch_array($res)) {
		$Worldspace = str_replace("[", "", $row['worldspace']);
		$Worldspace = str_replace("]", "", $Worldspace);
		$Worldspace = explode(",", $Worldspace);
		$x = 0; if (array_key_exists(1, $Worldspace)) { $x = $Worldspace[1]; }
		$y = 0; if (array_key_exists(2, $Worldspace)) { $y = $Worldspace[2]; }

		require_once('modules/calc.php');
		$description = '<h2><a href="index.php?view=info&show=1&uid='.$row['unique_id'].'&id='.$row['id'].'">'.htmlspecialchars($row['name'], ENT_QUOTES).'</a></h2><table><tr><td><img src="images/models/'.str_replace('"', '', $row['model']).'.png" alt="" style="width: 100px;" /></td><td>&nbsp;&nbsp;&nbsp;</td><td style="vertical-align: top;"><h2>Unique ID:</h2>'.$row['unique_id'].'<br /><br /><h2>Position:</h2>Left: '.round(world_x($x, $world)).'<br />Top: '.round(world_y($y, $world)).'</td></tr></table>';
		
		$tmp = array();
		$tmp["lat"] = (world_y($y, $world) / 10);
		$tmp["lng"] = (world_x($x, $world) / 10);
		$tmp["icon"] = "Player".($row['is_dead'] ? "Dead" : "");
		$tmp["title"] = htmlspecialchars($row['name'], ENT_QUOTES)." (".$row['unique_id'].")";
		$tmp["description"] = $description;
		$tmp["uid"] = $row['unique_id'];
		
		$markers[] = $tmp;
	}

	return $markers;
}

function markers_vehicle($res, $world) {
	$markers = array();

	$xml = file_get_contents('vehicles.xml', true);
	require_once('modules/lib/class.xml2array.php');
	$vehicles_xml = XML2Array::createArray($xml);

	while ($row = mysql_fetch_array($res)) {
		$Worldspace = str_replace("[", "", $row['worldspace']);
		$Worldspace = str_replace("]", "", $Worldspace);
		$Worldspace = explode(",", $Worldspace);
		$x = 0; if (array_key_exists(1, $Worldspace)) { $x = $Worldspace[1]; }
		$y = 0; if (array_key_exists(2, $Worldspace)) { $y = $Worldspace[2]; }

		$type = $row['class_name'];
		$ltype = strtolower($type);
		if (array_key_exists('s'.$ltype, $vehicles_xml['vehicles'])) { $class = $vehicles_xml['vehicles']['s'.$ltype]['Type']; } else { $class = "Car"; }

		require_once('modules/calc.php');
		$description = '<h2><a href="index.php?view=info&show=4&id='.$row['id'].'">'.$type.'</a></h2><table><tr><td><img src="images/vehicles/'.$ltype.'.png" alt="" style="width: 100px;" /></td><td>&nbsp;&nbsp;&nbsp;</td><td style="vertical-align: top;"><h2>Position:</h2>Left: '.round(world_x($x, $world)).'<br />Top: '.round(world_y($y, $world)).'</td></tr></table>';
		
		$tmp = array();
		$tmp["lat"] = (world_y($y, $world) / 10);
		$tmp["lng"] = (world_x($x, $world) / 10);
		$tmp["icon"] = $class;
		$tmp["title"] = $type." (".$row['id'].")";
		$tmp["description"] = $description;
		
		$markers[] = $tmp;
	};
	
	return $markers;
}

function markers_deployable($res, $world) {
	$markers = array();

	$xml = file_get_contents('vehicles.xml', true);
	require_once('modules/lib/class.xml2array.php');
	$vehicles_xml = XML2Array::createArray($xml);

	while ($row = mysql_fetch_array($res)) {
		$Worldspace = str_replace("[", "", $row['worldspace']);
		$Worldspace = str_replace("]", "", $Worldspace);
		$Worldspace = explode(",", $Worldspace);
		$x = 0; if (array_key_exists(1, $Worldspace)) { $x = $Worldspace[1]; }
		$y = 0; if (array_key_exists(2, $Worldspace)) { $y = $Worldspace[2]; }

		$type = $row['class_name'];
		$ltype = strtolower($type);
		if (array_key_exists('s'.$ltype, $vehicles_xml['vehicles'])) { $class = $vehicles_xml['vehicles']['s'.$ltype]['Type']; } else { $class = "Car"; }

		require_once('modules/calc.php');
		$description = '<h2><a href="index.php?view=info&show=5&id='.$row['id'].'">'.$type.'</a></h2><table><tr><td><img src="images/vehicles/'.$ltype.'.png" alt="" style="width: 100px;" /></td><td>&nbsp;&nbsp;&nbsp;</td><td style="vertical-align: top;"><h2>Position:</h2>Left: '.round(world_x($x, $world)).'<br />Top: '.round(world_y($y, $world)).'</td></tr></table>';
		
		$tmp = array();
		$tmp["lat"] = (world_y($y, $world) / 10);
		$tmp["lng"] = (world_x($x, $world) / 10);
		$tmp["icon"] = $class;
		$tmp["title"] = $type." (".$row['id'].")";
		$tmp["description"] = $description;
		
		$markers[] = $tmp;
	};
	
	return $markers;
}

function markers_wreck($lines, $world) {
	$markers = array();

	foreach ($lines as $line) {
		$matches = array();
		$sectionpattern = "/((?<=\sat\s\[)[0-9]{0,20}+\.+[0-9]{0,10}+\,+[0-9]{0,20}+\.+[0-9]{0,10})/x"; // Only helicopter crashsites: "/((?<=[a-z]{10}\s[a-z]{2}\s\[)[0-9]{0,20}+\.+[0-9]{0,10}+\,+[0-9]{0,20}+\.+[0-9]{0,10})/x"

		if (preg_match($sectionpattern, $line, $matches)) {
			$Worldspace = explode(",", $matches[1]);
			$x = 0; if (array_key_exists(0, $Worldspace)) { $x = $Worldspace[0]; }
			$y = 0; if (array_key_exists(1, $Worldspace)) { $y = $Worldspace[1]; }
			$tmp = array();

			require_once('modules/calc.php');
			if (strpos($line, "Misc_cargo_cont_net") !== false) {
				$description = '<h2>Care</h2><table><tr><td><img style="width: 100px;" src="images/vehicles/care.png"></td><td>&nbsp;&nbsp;&nbsp;</td><td style="vertical-align: top;"><h2>Position:</h2>Left: '.round(world_x($x, $world)).'<br />Top: '.round(world_y($y, $world)).'</td></tr></table>';
				$tmp["icon"] = "Care";
				$tmp["title"] = "Care";
			} else {
				// Edits by SilveShot to differ between helicopter crashsites and other wrecks
				if (strpos($line, "Spawning a crashed helicopter") !== false) {
					$description = '<h2>Crashed Helicopter</h2><table><tr><td><img src="images/vehicles/crashsite.png" alt="" style="width: 100px;" /></td><td>&nbsp;&nbsp;&nbsp;</td><td style="vertical-align: top;"><h2>Position:</h2>Left: '.round(world_x($x, $world)).'<br />Top: '.round(world_y($y, $world)).'</td></tr></table>';
					$tmp["icon"] = "Crashsite";
					$tmp["title"] = "Crashed Helicopter";
				} else {
					$description = '<h2>Wreck</h2><table><tr><td><img src="images/vehicles/wreck.png" alt="" style="width: 100px;" /></td><td>&nbsp;&nbsp;&nbsp;</td><td style="vertical-align: top;"><h2>Position:</h2>Left: '.round(world_x($x, $world)).'<br />Top: '.round(world_y($y, $world)).'</td></tr></table>';
					$tmp["icon"] = "Wreck";
					$tmp["title"] = "Wreck";
				}
			}

			$tmp["lat"] = (world_y($y, $world) / 10);
			$tmp["lng"] = (world_x($x, $world) / 10);
			$tmp["description"] = $description;
				
			$markers[] = $tmp;
		}
	};
	
	return $markers;
}

?>