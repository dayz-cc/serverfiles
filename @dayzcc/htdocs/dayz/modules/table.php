<?php

if (isset($_SESSION['user_id']) and (strpos($_SESSION['user_permissions'], "table") !== false))
{
	$pnumber = 0;
	$tableheader = '';
	$tablerows = '';
	$pageNum = 1;
	$maxPage = 1;
	$rowsPerPage = 30;
	$nav = '';
	$self = 'index.php?view=table&show='.$show;
	$paging = '';

	$formhead = "";
	$formfoot = "";
	
	if (isset($_GET["show"])) {
		$show = $_GET["show"];
	} else {
		$show = 0;
	}

	if (isset($_GET["sort"])) {
		$sort = $_GET["sort"];
	} else {
		$sort = 0;
	}
	
	if (isset($_GET['order'])) {
		$order = $_GET['order'];
	} else {
		$order = "ASC";
	}
	
	switch ($show) {
		case 0:
			$pagetitle = "Online players";
			break;
		case 1:
			$query = "SELECT `profile`.`name`, `survivor`.* FROM `profile`, `survivor` WHERE `profile`.`unique_id` = `survivor`.`unique_id` AND `survivor`.`is_dead` = '0'";
			
			switch ($sort) {
				case 1:
					$query .= " ORDER BY `profile`.`name` $order";
					break;
				case 2:
					$query .= " ORDER BY `survivor`.`unique_id` $order";
					break;
				case 3:
					$query .= " ORDER BY `survivor`.`worldspace` $order";
					break;
				case 4:
					$query .= " ORDER BY `survivor`.`medical` $order";
					break;
				case 5:
					$query .= " ORDER BY `survivor`.`inventory` $order";
					break;
				case 6:
					$query .= " ORDER BY `survivor`.`backpack` $order";
					break;
			};
			
			$pagetitle = "Alive players";		
			break;
		case 2:
			$query = "SELECT `profile`.`name`, `survivor`.* FROM `profile`, `survivor` WHERE `profile`.`unique_id` = `survivor`.`unique_id` AND `survivor`.`is_dead` = '1' AND `survivor`.`inventory` NOT LIKE '[[],[]]'";
			
			switch ($sort) {
				case 1:
					$query .= " ORDER BY `profile`.`name` $order";
					break;
				case 2:
					$query .= " ORDER BY `survivor`.`unique_id` $order";
					break;
				case 3:
					$query .= " ORDER BY `survivor`.`worldspace` $order";
					break;
				case 4:
					$query .= " ORDER BY `survivor`.`medical` $order";
					break;
				case 5:
					$query .= " ORDER BY `survivor`.`inventory` $order";
					break;
				case 6:
					$query .= " ORDER BY `survivor`.`backpack` $order";
					break;
			};
			
			$pagetitle = "Dead players";	
			break;
		case 3:
			$query = "SELECT `profile`.`name`, `survivor`.* FROM `profile`, `survivor` WHERE `profile`.`unique_id` = `survivor`.`unique_id`";
			
			switch ($sort) {
				case 1:
					$query .= " ORDER BY `profile`.`name` $order";
					break;
				case 2:
					$query .= " ORDER BY `survivor`.`unique_id` $order";
					break;
				case 3:
					$query .= " ORDER BY `survivor`.`worldspace` $order";
					break;
				case 4:
					$query .= " ORDER BY `survivor`.`medical` $order";
					break;
				case 5:
					$query .= " ORDER BY `survivor`.`inventory` $order";
					break;
				case 6:
					$query .= " ORDER BY `survivor`.`backpack` $order";
					break;
			};
			
			$pagetitle = "All players";	
			break;
		case 4:
			$query = "SELECT `world_vehicle`.`vehicle_id`, `vehicle`.`class_name`, `instance_vehicle`.* FROM `world_vehicle`, `vehicle`, `instance_vehicle` WHERE `vehicle`.`id` = `world_vehicle`.`vehicle_id` AND `instance_vehicle`.`world_vehicle_id` = `world_vehicle`.`id` AND `instance_vehicle`.`instance_id` = '".$serverinstance."' AND `instance_vehicle`.`damage` < '0.95'";
			
			switch ($sort) {
				case 1:
					$query .= " ORDER BY `id` $order";
					break;
				case 2:
					$query .= " ORDER BY `class_name` $order";
					break;
				case 3:
					$query .= " ORDER BY `damage` $order";
					break;
				case 4:
					$query .= " ORDER BY `worldspace` $order";
					break;
				case 5:
					$query .= " ORDER BY `inventory` $order";
					break;
				case 6:
					$query .= " ORDER BY `parts` $order";
					break;
			};
			
			$pagetitle = "Ingame vehicles";	
			break;
		case 5:
			$query = "SELECT `deployable`.`class_name`, `instance_deployable`.* FROM `deployable`, `instance_deployable` WHERE `deployable`.`id` = `instance_deployable`.`deployable_id` AND `instance_deployable`.`instance_id` = '".$serverinstance."'";
			
			switch ($sort) {
				case 1:
					$query .= " ORDER BY `instance_deployable`.`id` $order";
					break;
				case 2:
					$query .= " ORDER BY `unique_id` $order";
					break;
				case 3:
					$query .= " ORDER BY `class_name` $order";
					break;
				case 4:
					$query .= " ORDER BY `worldspace` $order";
					break;
				case 5:
					$query .= " ORDER BY `inventory` $order";
					break;
			};
			
			$pagetitle = "Ingame deployables";
			break;
		default:
			$pagetitle = "Online players";
	};
	
	echo '<div id="page-heading"><title>'.$pagetitle.' - '.$sitename.'</title><h1>'.$pagetitle.'</h1></div>';
	
	require_once('modules/tables/rows.php');
	include('modules/tables/'.$show.'.php');
	
	?>

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
						<div id="message-blue">
							<table border="0" width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td class="blue-left"><?php echo (isset($delresult) ? $delresult : $pagetitle.": ".$pnumber."."); ?></td>
									<td class="blue-right"><a class="close-blue"><img src="images/forms/icon_blue.gif" alt="" /></a></td>
								</tr>
							</table>
						</div>
						<?php echo $paging.'<br \><br \><br \>'.$formhead.'<table id="product-table" border="0" width="100%" cellpadding="0" cellspacing="0">'.$tableheader.$tablerows.'</table>'.$formfoot; ?>	
					</div>
					<?php echo $paging; ?>
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