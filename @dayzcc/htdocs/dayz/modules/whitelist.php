<?php

if (isset($_SESSION['user_id']) and (strpos($_SESSION['user_permissions'], "whitelist") !== false))
{
	$pagetitle = "Whitelist";
	$message = '';

	// Thanks to deadfred666 for parts of his code!
	if (ISSET($_POST['action']))
	{
		// Add new Whitelisted User
		if ($_POST['action'] == "Add") {
			$totalFields = 0;

			if (isset($_POST['name'])) { $name = $_POST['name']; $totalFields++; }
			if (isset($_POST['guid'])) { $guid = $_POST['guid']; $totalFields++; }

			if ($totalFields == 2) {
				if (strlen($name) < 2 || strlen($guid) != 32) {
					$message = '<div id="message-red">
						<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr>
						<td class="red-left">Error: Entered GUID is too short!</td>
						<td class="red-right"><a class="close-red"><img src="images/forms/icon_close_red.gif" alt="" /></a></td>
						</tr></table></div>';
				} else {
					mysql_query("INSERT INTO whitelist (`name`, `guid`, `is_whitelisted`) VALUES ('".$name."', '".$guid."', '1')") or die(mysql_error());
					$message = '<div id="message-green">
						<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr>
						<td class="green-left">Player '.$name.' ('.$guid.') was added to the whitelist!</td>
						<td class="green-right"><a class="close-green"><img src="images/forms/icon_close_green.gif" alt="" /></a></td>
						</tr></table></div>';
				}
			} else {
				$message = '<div id="message-red">
					<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr>
					<td class="red-left">Error: Required field is missing!</td>
					<td class="red-right"><a class="close-red"><img src="images/forms/icon_close_red.gif" alt="" /></a></td>
					</tr></table></div>';
			}
		}
	
		// Change status of Whitelist User
		if ($_POST['action'] == "On" || $_POST['action'] == "Off") {
			if (isset($_POST['id'])) {
				$id = $_POST['id'];
				if ($_POST['status'] == 0) { $status = 1; } else { $status = 0; }
				mysql_query("UPDATE `whitelist` SET `is_whitelisted` = '".$status."' WHERE `id` = '".$id."'") or die(mysql_error());
			}
		}
	}

	$tablerows = '';
	$res = mysql_query("SELECT * FROM `whitelist`") or die(mysql_error());
	while ($row = mysql_fetch_array($res)) {
		if ($row['is_whitelisted'] == 1) {
			$button = "Off";
			$icon = "status_green.png";
		} else {
			$button = "On";
			$icon = "status_red.png";
		}
		
		$tablerows .= '<form method="post"><tr>
			<td align="center" class="gear_preview"><input type="hidden" name="id" value="'.$row['id'].'"><input type="submit" name="action" value="'.$button.'" style="width: 60px"></td>
			<td align="center" class="gear_preview"><input type="hidden" name="status" value="'.$row['is_whitelisted'].'"><img src="images/icons/'.$icon.'" alt="" /></td>
			<td align="center" class="gear_preview">'.$row['name'].'</td>
			<td align="center" class="gear_preview">'.$row['guid'].'</td>
			</tr></form>';
	}
	
	?>

	<div id="page-heading">
		<title><?php echo $pagetitle." - ".$sitename; ?></title>
		<h1><?php echo "<h1>".$pagetitle; ?></h1>
	</div>
	
	<table id="content-table" border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<th rowspan="3"><img src="images/forms/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
			<th class="corner-topleft"></th>
			<td class="border-top">&nbsp;</td>
			<th class="corner-topright"></th>
			<th rowspan="3"><img src="images/forms/side_shadowright.jpg" width="20" height="300" alt="" /></th>
		</tr>
		<tr>
			<td class="border-left"></td>
			<td>
			<div id="content-table-inner">
				<div id="table-content">
					<?php echo $message; ?>
					<table id="product-table" border="0" width="100%" cellpadding="0" cellspacing="0">
						<thead>
							<tr>
								<th class="product-table-header"><a>Action</a></th>
								<th class="product-table-header"><a>Enabled</a></th>
								<th class="product-table-header"><a>Name</a></th>
								<th class="product-table-header"><a>GUID</a></th>
							</tr>
						</thead>
						<tbody>
							<form method="post">
								<tr>
									<td align="center" class="gear_preview"><input type="submit" name="action" value="Add" style="width: 60px"></td>
									<td align="center" class="gear_preview"></td>
									<td align="center" class="gear_preview"><input type="text" name="name" style="width: 300px"></td>
									<td align="center" class="gear_preview"><input type="text" name="guid" style="width: 300px"></td>
								</tr>
							</form>
							<?php echo $tablerows; ?>
						</tbody>
					</table>
				</div>
			</div>
			</td>
			<td class="border-right"></td>
		</tr>
		<tr>
			<th class="corner-bottomleft"></th>
			<td class="border-bottom">&nbsp;</td>
			<th class="corner-bottomright"></th>
		</tr>
	</table>

<?php
}
else
{
	header('Location: index.php');
}

?>