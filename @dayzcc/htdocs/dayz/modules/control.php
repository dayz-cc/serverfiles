<?php

if (isset($_SESSION['user_id']) and (strpos($_SESSION['user_permissions'], "control") !== false))
{
	$pagetitle = "Server Control";
	$is_serverloop = false;
	$_SESSION['serverloop'] = "";
	if (isset($_GET['action'])) {
		switch($_GET['action']) {
			case 0:
			if (isset($_GET['serverloop'])&&is_numeric($_GET['serverloop'])) {
			
				$is_serverloop = true;
				$_SESSION['serverloop'] = $_GET['serverloop'];
				if (isset($_GET['autorestart'])&&is_numeric($_GET['autorestart'])) {
					exec('taskkill /IM "'.$exeserver.'"');
					mysql_query("INSERT INTO `log_tool` (`action`, `user`, `timestamp`) VALUES ('STOP SERVER', '{$_SESSION['login']}', NOW())");
					sleep(10);
					
					//delete all unused vehicles that have not been touched in 21 days.
					mysql_query("DELETE FROM `".$dbname."`.`instance_vehicle` WHERE DATE(`Last_Updated`) < CURDATE() - INTERVAL 30 DAY");
					mysql_query("INSERT INTO `log_tool` (`action`, `user`, `timestamp`) VALUES ('CLEAN UP VEHICLES', '{$_SESSION['login']}', NOW())");
					//delete all unused tents that have not been touched in 30 days.
					mysql_query("DELETE FROM `".$dbname."`.`instance_deployable` WHERE (deployable_id = 1 OR deployable_id= 19 ) and DATE(`Last_Updated`) < CURDATE() - INTERVAL 30 DAY");
					mysql_query("INSERT INTO `log_tool` (`action`, `user`, `timestamp`) VALUES ('CLEAN UP TENTS', '{$_SESSION['login']}', NOW())");
					//delete broken vehicles and spawn in new ones.
					mysql_query("INSERT INTO `log_tool` (`action`, `user`, `timestamp`) VALUES ('SPAWN VEHICLES', '{$_SESSION['login']}', NOW())");
					$worldid = 0;
					$res = mysql_query("SELECT `id` FROM `world` WHERE `name` = '$serverworld'");
					$worldid = intval(mysql_fetch_assoc($res)['id']);

					require_once('modules/lib/class.vehicles.php');
					$generation = new vehicle_generator(new mysqli($dbhost.':'.$dbport, $dbuser, $dbpass, $dbname));
					$generation->setDatabaseName($dbname);
					$generation->setInstanceID($serverinstance);
					$generation->setWorldID($worldid);
					$generation->execute();					
					sleep(5);
					
				}
				pclose(popen('start /REALTIME "" /d "'.$patharma.'" /b "'.$pathserver.'" -beta=Expansion\\beta;Expansion\\beta\\Expansion -mod='.$servermodlist.' -name=Server -config=@dayzcc_config\\'.$serverinstance.'\\config.cfg -cfg=@dayzcc_config\\'.$serverinstance.'\\basic.cfg -profiles=@dayzcc_config\\'.$serverinstance.' -port='.$serverport.' -cpuCount=2 -maxMem=2047 -noSound -exThreads=1 -noPause', 'r'));
				mysql_query("INSERT INTO `log_tool`(`action`, `user`, `timestamp`) VALUES ('START SERVER','{$_SESSION['login']}', NOW())");
				sleep(6);
				} else {
				pclose(popen('start /REALTIME "" /d "'.$patharma.'" /b "'.$pathserver.'" -beta=Expansion\\beta;Expansion\\beta\\Expansion -mod='.$servermodlist.' -name=Server -config=@dayzcc_config\\'.$serverinstance.'\\config.cfg -cfg=@dayzcc_config\\'.$serverinstance.'\\basic.cfg -profiles=@dayzcc_config\\'.$serverinstance.' -port='.$serverport.' -cpuCount=2 -maxMem=2047 -noSound -exThreads=1 -noPause', 'r'));
				mysql_query("INSERT INTO `log_tool`(`action`, `user`, `timestamp`) VALUES ('START SERVER','{$_SESSION['login']}', NOW())");
				sleep(6);				
				}
				break;
			case 1:
				exec('taskkill /IM "'.$exeserver.'"');
				mysql_query("INSERT INTO `log_tool` (`action`, `user`, `timestamp`) VALUES ('STOP SERVER', '{$_SESSION['login']}', NOW())");
				sleep(3);
				break;
			case 2:
				exec('taskkill /IM "'.$exeserver.'" /F 2>&1', $output);
				mysql_query("INSERT INTO `log_tool` (`action`, `user`, `timestamp`) VALUES ('KILLED SERVER', '{$_SESSION['login']}', NOW())");
				sleep(3);
				$outmessage = implode('&nbsp;', $output);
				break;
			case 3:
				rcon($serverip, $serverport, $rconpassword, "#restart");
				mysql_query("INSERT INTO `log_tool` (`action`, `user`, `timestamp`) VALUES ('RESTART SERVER', '{$_SESSION['login']}', NOW())");
				sleep(1);
				break;
			default:
				sleep(1);
		}
		
		echo '<script type="text/javascript">$.unblockUI</script>';
	}

	$tasklist = exec('tasklist /FI "IMAGENAME eq '.$exeserver.'" /FO CSV');
	$tasklist = explode(",", strtolower($tasklist));
	$tasklist = str_replace('"', "", $tasklist[0]);
	if ($tasklist == strtolower($exeserver)) {
		$serverrunning = true;
	} else {
		$serverrunning = false;
	}
	
	?>
	
	<script type="text/javascript">
	
	function countdown( elementName, minutes, seconds )
{
    var element, endTime, hours, mins, msLeft, time;

    function twoDigits( n )
    {
        return (n <= 9 ? "0" + n : n);
    }

    function updateTimer()
    {
        msLeft = endTime - (+new Date);
        if ( msLeft < 1000 ) {
            element.innerHTML = "<span style='color:red;'>Server restarting...</span>";
        } else {
            time = new Date( msLeft );
            hours = time.getUTCHours();
            mins = time.getUTCMinutes();
            element.innerHTML = (hours ? hours + ':' + twoDigits( mins ) : mins) + ':' + twoDigits( time.getUTCSeconds() );
            setTimeout( updateTimer, time.getUTCMilliseconds() + 500 );
        }
    }

    element = document.getElementById( elementName );
    endTime = (+new Date) + 1000 * (60*minutes + seconds) + 500;
    updateTimer();
}
	function parseToNum(val) {
		
		if(isNaN(val)||val==""){
			return "";
		} else if (val < 0.5){
			val = val;
		}
		return Number(Number(val).toFixed(2))+Number(0.006); //add about 20 seconds for server startup/restart
	}
		function cblockUI() { $.blockUI({ message: $('#blockMessage') }); }
		
		function restartServer() {
		window.location.href='index.php?view=control&action=0&autorestart=1&serverloop=<?= ($_GET['serverloop'])?>';
		
		}
		<?
		if($is_serverloop) {
			
			echo "setTimeout(restartServer, ".($_GET['serverloop']*3600000).");";
		
		}
		?>
	</script>
	
	<div id="blockMessage" style="display: none;">
		<h1><img src="images/forms/spinner.gif" alt="" /> Waiting ...</h1>
	</div>

	<div id="page-heading">
		<?php
			echo "<title>".$pagetitle." - ".$sitename."</title>";
			echo "<h1>".$pagetitle."</h1>";
		?>
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
					<?php if ($serverrunning) { ?>
						<div id="message-green">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td class="green-left">Server is running.<?= (isset($_GET['serverloop'])?" Restart every ".$_GET['serverloop']." hours. ":"")?>&nbsp;Next Restart In:<div id="countdown"></div></td>
							<td class="green-right"><a class="close-green"><img src="images/forms/icon_close_green.gif" alt="" /></a></td>
						</tr>
						</table>
						</div>
						<div id="step-holder">	
							<div class="step-no"><a href="index.php?view=control&action=3"><img src="images/icons/start.png" alt="Restart" /></a></div>
							<div class="step-dark-left"><a href="index.php?view=control&action=3">Restart</a></div>
							<div class="step-dark-right">&nbsp;</div>
							<div class="step-no"><a href="index.php?view=control&action=1" onclick="cblockUI();"><img src="images/icons/stop.png" alt="Stop" /></a></div>
							<div class="step-dark-left"><a href="index.php?view=control&action=1" onclick="cblockUI();">Stop</a></div>
							<div class="step-dark-right">&nbsp;</div>
							<div class="step-no"><a href="index.php?view=control&action=2" onclick="cblockUI();"><img src="images/icons/stop.png" alt="Kill" /></a></div>
							<div class="step-dark-left"><a href="index.php?view=control&action=2" onclick="cblockUI();">Kill Process</a></div>
							<div class="step-dark-round">&nbsp;</div>
							<div class="clear"></div>
						</div>
						
						<script>
						
					<?

					if($is_serverloop) {
						echo 'countdown( "countdown",'.($_GET['serverloop']*60).', 0 );';
					}
						?>		

						</script>
					<?php } else { ?>
						<div id="message-red">
							<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td class="red-left">Server is stopped.<?php if (isset($outmessage)) { echo " (".$outmessage.")"; } ?></td>
								<td class="red-right"><a class="close-red"><img src="images/forms/icon_close_red.gif" alt="" /></a></td>
							</tr>
							</table>
						</div>
						<div id="step-holder">	
							<div class="step-no"><a href="index.php?view=control&action=0&serverloop=" id="serverstart" onclick="cblockUI();"><img src="images/icons/start.png" alt="Start" /></a></div>
							<div class="step-dark-left"><a href="index.php?view=control&action=0" onclick="cblockUI();">Start</a></div>
							<div class="step-dark-right">&nbsp;</div>
							<div class="step-no-off"><img src="images/icons/stop.png" alt="Stop" /></div>
							<div class="step-light-left">Stop</div>
							<div class="step-light-round">&nbsp;</div>
							<div class="clear"></div>
							<b>Server Restart Loop: <input type="text" id="serverloop" onblur="document.getElementById('serverstart').href='index.php?view=control&action=0&serverloop='+parseToNum(this.value)" name="serverloop" value="<?=(isset($_SESSION['serverloop'])?$_SESSION['serverloop']:"") ?>" /> (hours)</b>
						</div>
						<script>
						//*need this*
						window.onload=document.getElementById('serverloop').focus();
						</script>
					<?php } ?>
				</div>
				<div class="clear"></div>
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