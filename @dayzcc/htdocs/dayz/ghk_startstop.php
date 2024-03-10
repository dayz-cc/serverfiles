<?php
        $host = "127.0.0.1"; //Put the hostname or the ip of your database server here.
        $user = "dayz"; //Put your username here.
        $pass = "dayz"; //Enter your password to the database here.
        $dataBase = "dayz_chernarus"; //Enter the name of your database here.
       
        $minLim = 50;   //Minimum amount of minutes to have lived before it is included in the average
       
        $hourSingular = "hour";    //Allows you to change the word used for the singularium of hour.
        $hourPlural = "hours";    //Allows you to change the word used for the plural of hour.
       
        $andStr = "and";    //Allows you to change the word used to combine the hours and minutes string.
       
        $minuteSingular = "minute";    //Allows you to change the word used for the singularium of minute.
        $minutePlural = "minutes";    //Allows you to change the word used for the plural of minute.
		
	$pagetitle = "Server Control";

	if (isset($_GET['action'])) {
		switch($_GET['action']) {
			case 0:
				pclose(popen('start /REALTIME "" /d "'.$patharma.'" /b "'.$pathserver.'" -beta=Expansion\\beta;Expansion\\beta\\Expansion -mod='.$servermodlist.' -name=Server -config=@dayzcc_config\\'.$serverinstance.'\\config.cfg -cfg=@dayzcc_config\\'.$serverinstance.'\\basic.cfg -profiles=@dayzcc_config\\'.$serverinstance.' -port='.$serverport.' -cpuCount=2 -maxMem=2047 -noSound -exThreads=1 -noPause', 'r'));
				mysql_query("INSERT INTO `log_tool`(`action`, `user`, `timestamp`) VALUES ('START SERVER','{$_SESSION['login']}', NOW())");
				sleep(6);
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