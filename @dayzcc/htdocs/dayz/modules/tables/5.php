<?php

if (isset($_POST["deployable"])) {
	$del = $_POST["deployable"];
	$delresult = "Deployable ";
	
	for ($i = 0; $i < count($del); $i++)
	{
		mysql_query("INSERT INTO `log_tool`(`action`, `user`, `timestamp`) VALUES ('DELETE DEPLOYABLE ".$del[$i]."', '{$_SESSION['login']}', NOW())");
		mysql_query("DELETE FROM `instance_deployable` WHERE unique_id = '".$del[$i]."'") or die(mysql_error());
		$delresult .= $del[$i].", ";
	}
	
	$delresult = substr($delresult, 0, -2)." successfully removed!";
}

$status = exec('tasklist /FI "IMAGENAME eq '.$exeserver.'" /FO CSV');
$status = explode(",", strtolower($status));
$status = str_replace('"', "", $status[0]);
$serverrunning = false; if ($status == strtolower($exeserver)) { $serverrunning = true; }

$res = mysql_query($query) or die(mysql_error());
$pnumber = mysql_num_rows($res);

if (isset($_GET['page'])) {
	$pageNum = $_GET['page'];
}

$offset = ($pageNum - 1) * $rowsPerPage;
$maxPage = ceil($pnumber / $rowsPerPage);			

for ($page = 1; $page <= $maxPage; $page++) {
	if ($page == $pageNum) {
		$nav .= " $page ";
	} else  {
		$nav .= "$self&page=$page";
	}
}

$query = $query." LIMIT ".$offset.",".$rowsPerPage.";";
$res = mysql_query($query) or die(mysql_error());
$number = mysql_num_rows($res);
$chbox = '';

if (!$serverrunning){
	$chbox = '<th class="product-table-header"><a>Delete</a></th>';
	$formhead = '<form action="index.php?view=table&show=5" method="post">';
	$formfoot = '<input type="submit" class="submit" /></form>';
}

$tableheader = header_deployable($show, $chbox, $order);

while ($row = mysql_fetch_array($res)) {
	if (!$serverrunning) {
		$chbox = '<td align="center" class="gear_preview" style="vertical-align: middle;"><input name="deployable[]" value="'.$row['unique_id'].'" type="checkbox" /></td>';
	} else {
		$chbox = '';
	}

	$tablerows .= row_deployable($row, $chbox, $serverworld);
}

include('paging.php');

?>