<?
echo "Average Survival Time:";
?>

<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

/*
V0.2.0 current
 
*V0.1.2: http://pastebin.com/dq8xJnns (does not work correctly (gives you average time played per player total and has some formatting issues));
 
*V0.1.1: http://pastebin.com/UvXen9dB (does not work correctly (gives you average time played per player total));
 
Made by Mikkel Jeppsen, a.k.a. smuttenDK a.k.a. dumle29.
 
Script to get the average survival time of the players on your bliss based dayz privatehived server,
and show it on your site.
 
 
To use this:
Option 1:
        Put this code in a file and name it NAME.php
        Then, the place you want it on your site, enter <?php include 'PATH/TO/FILE/NAME.php' ?>
 
Option 2:
        Paste this code in to your site, the place you want it to appear.
*/
 
/*---------------Start of config---------------*/
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
 
/*---------------End of config---------------*/
 
        $minutes = 0;
        $hours = 0;
        $average = 0;
 
        $con = mysql_connect($host,$user,$pass);
        if (!$con)
        {
                die('Could not connect: ' . mysql_error());
        }
       
        mysql_select_db($dataBase, $con) or die(mysql_error());
       
        $sql = "SELECT AVG(survival_time) FROM survivor WHERE survival_time >= ".$minLim." AND is_dead = 0";
       
        $resultRaw = mysql_query($sql);
               
        if(!$averageArr = mysql_fetch_row($resultRaw))
        {
                $minutes = 0;
        }
        else
        {      
                $minutes = round($averageArr[0],0);
        }
        if($minutes > 59)
        {
                $hours = floor($minutes / 60);
                $minutes = $minutes % 60;
        }
       
        if($hours > 1)
        {
                $hourStr = $hours . ' ' . $hourPlural;
        }
        else if($hours <= 1 && $hours > 0)
        {
                $hourStr = $hours. ' ' . $hourSingular;
        }
        else
        {
                $hourStr = ''; 
        }
       
        if($minutes > 1)
        {
                $minuteStr =$minutes. ' ' . $minutePlural;
        }
        else if($minutes <= 1 && $minutes > 0)
        {
                $minuteStr =$minutes. ' ' . $minuteSingular;
        }
        else if($minutes == 0 && !$hours)
        {
                $minuteStr =$minutes. ' ' . $minutePlural;
        }
        else
        {
                $minuteStr = '';       
        }
 
        if($hourStr != '' && $minutes != '')
        {
                $andStr =' '. $andStr .' ';
        }
        else
        {
                $andStr = '';  
        }
       
        echo $hourStr . $andStr . $minuteStr;
?>

<!--hi scores -->
<?

 function cmp($a, $b)
{
    if ($a[0] == $b[0]) {
        return 0;
    }
    return ($a[0] > $b[0]) ? -1 : 1;
}

$sql0 = "select profile.* FROM profile ORDER BY profile.total_survival_time DESC;";
$sql1 = "select profile.name, survivor.* FROM profile, survivor as survivor where profile.unique_id = survivor.unique_id ORDER BY survivor.survival_time DESC;";
$sql2 = "SELECT * FROM profile ORDER BY profile.total_zombie_kills DESC;";
$sql3 = "SELECT * FROM profile ORDER BY (total_survivor_kills+total_bandit_kills) DESC;";
$sql4 = "select profile.name, survivor.* FROM profile, survivor as survivor where profile.unique_id = survivor.unique_id ORDER BY survivor.survival_time DESC;";
$v1 = array();
$thelist0 = array();
$thelist1 = array();
$thelist2 = array();
$thelist3 = array();
$thelist4 = array();


$result = mysql_query($sql0);

$i=1;
echo "<h2>Top Survivors</h2>
<span>Score = 1pt per hour survived, 1pt per Zombie kill, 5pts per Bandit kill, 5pts per Bloodsucker kill, 1pt per headshot, -5 points per death</span>
<br  />
<table border=\"1\"><tr>
<th>#</th>
<th>Name</th>
<th>Total Actual Gametime played</th>
<th>Total Attempts</th>
<th>Overall Score</th>
<th>Overall Score per attempt</th>
</tr>";
while($row = mysql_fetch_array($result))
  {
  $st = $row['total_survival_time'];
  $st = sprintf("%02dh %02dm", floor($st/60), $st%60);
  $hours = sprintf("%d", floor($row['total_survival_time']/60));
  $name = $row['name'];
  $attempts = $row['survival_attempts'];
$dayzsd_score = ( $row['total_bandit_kills']*5) +( $row['total_zombie_kills'])+floor( $row['total_headshots'])+ $hours - ($attempts -1)*5;

  $mastlist0[] = array($dayzsd_score,"</td><td>" . $name . "</td><td>" . $st . "</td><td>" . $attempts . "</td><td>" . $dayzsd_score . "</td><td>" . round($dayzsd_score/$attempts,2) . "</td></tr>");
  $thelist0[] = "<tr><td>" . $i . "</td><td>" . $name . "</td><td>" . $st . "</td><td>" . $attempts . "</td><td>" . $dayzsd_score . "</td><td>" . round($dayzsd_score/$attempts,2) . "</td></tr>";
  
 // $i++;
  }
  
  uasort($mastlist0,"cmp");
  
  foreach ($mastlist0 as $key => $val) {
   echo "<tr><td>" . $i . $val[1];
    if($i==25){break;}
    $i++;
}
 
//echo implode($thelist4);
 echo "</table>";

$result = mysql_query($sql4);

$i=1;
echo "<h2>Top Survivor Lives</h2>
<span>Score = 1pt per hour survived, 1pt per Zombie kill, 5pts per Bandit kill, 5pts per Bloodsucker kill, 1pt per headshot</span>
<br  />
<table border=\"1\"><tr>
<th>#</th>
<th>Name</th>
<th>Actual Gametime played</th>
<th>Alive</th>
<th>Dayz Days Survived</th>
<th>Score</th>
</tr>";
while($row = mysql_fetch_array($result))
  {
  $st = $row['survival_time'];
  $st = sprintf("%02dh %02dm", floor($st/60), $st%60);
  $hours = sprintf("%d", floor($row['survival_time']/60));
  $name = $row['name'];
  $alive = $row['is_dead'];
  $to_time = strtotime( $row['last_updated']);
$from_time = strtotime( $row['start_time']);
	$days_alive = round(abs($to_time - $from_time) / 86400,0). " days";
	$dayzsd_score = ( $row['bandit_kills']*5) +( $row['zombie_kills'])+floor( $row['headshots'])+ $hours;
  if($alive==0) {
	$alive = "Yes";
  }
  if($alive==1) {
	$alive = "No";
	}
  $mastlist4[] = array($dayzsd_score,"</td><td>" . $name . "</td><td>" . $st . "</td><td>" . $alive . "</td><td>" . $days_alive . " (" . date("M j, Y", $from_time) . " to " . date("M j, Y",$to_time ) . ") </td><td>" . $dayzsd_score . "</td></tr>");
  $thelist4[] = "<tr><td>" . $i . "</td><td>" . $name . "</td><td>" . $st . "</td><td>" . $alive . "</td><td>" . $days_alive . "</td><td>" . $dayzsd_score . "</td></tr>";
  
 // $i++;
  }
  
  uasort($mastlist4,"cmp");
  
  foreach ($mastlist4 as $key => $val) {
   echo "<tr><td>" . $i . $val[1];
   
   if($i==25){break;}
    $i++;
}
 
//echo implode($thelist4);
 echo "</table>";
 
 

$result = mysql_query($sql1);

$i=1;
echo "<h2>Longest lives</h2>
<br  />
<table border=\"1\"><tr>
<th>#</th>
<th>Name</th>
<th>Time alive</th>
<th>Alive</th>
</tr>";
while($row = mysql_fetch_array($result))
  {
  $st = $row['survival_time'];
  $st = sprintf("%02dh %02dm", floor($st/60), $st%60);
  $name = $row['name'];
  $alive = $row['is_dead'];
  if($alive==0) {
	$alive = "Yes";
  }
  if($alive==1) {
	$alive = "No";
	}
  $thelist1[] = "<tr><td>" . $i . "</td><td>" . $name . "</td><td>" . $st . "</td><td>" . $alive . "</td></tr>";
   if($i==25){break;}
  $i++;
  }

echo implode($thelist1);
 echo "</table>";
  
 
 $result = mysql_query($sql3);
 $i=1;
 echo "<h2>Most player kills</h2>
 <br  />
<table border=\"1\"><tr>
<th>#</th>
<th>Name</th>
<th>Survivor kills</th>
<th>Bandit kills</th>
<th>Total kills</th>
</tr>";
while($row = mysql_fetch_array($result))
  {
  $sk = $row['total_survivor_kills'];
  $bk = $row['total_bandit_kills'];
  $tk = $bk+$sk;
  $name = $row['name'];
  $thelist3[] = "<tr><td>" . $i . "</td><td>" . $name . "</td><td>" . $sk . "</td><td>" . $bk . "</td><td>" . $tk . "</td></tr>";
  $i++;
  }

echo implode($thelist3);
 echo "</table>";
 
 $result = mysql_query($sql2);
 $i=1;
 echo "<h2>Most zombie kills</h2>
 <br  />
<table border=\"1\"><tr>
<th>#</th>
<th>Name</th>
<th>Zombie kills</th>
<th>Headshots</th>
</tr>";
while($row = mysql_fetch_array($result))
  {
  $zk = $row['total_zombie_kills'];
  $hs = $row['total_headshots'];
  $name = $row['name'];
  $thelist2[] = "<tr><td>" . $i . "</td><td>" . $name . "</td><td>" . $zk . "</td><td>" . $hs . "</td></tr>";
  $i++;
  }

  
echo implode($thelist2);
 echo "</table>";
 
?>

<!-- Deadliest players -->
<?
$sql = "select profile.name, survivor.* from profile, survivor as survivor where profile.unique_id = survivor.unique_id and survivor.is_dead = '0' AND DATE(survivor.last_updated) > CURDATE() - INTERVAL 7 DAY;";
$v1 = array();
$thelist = array();
$result = mysql_query($sql);
echo "
<h2>Deadliest Player Alive</h2>
 <br  />
<table border=\"1\">
<tr>
<th align=\"center\">Score</th>
<th align=\"center\">Name</th>
<th align=\"center\">Time alive</th>
</tr>
";
while($row = mysql_fetch_array($result))
  {
  $sk = $row['survivor_kills'];
  $bk = $row['bandit_kills'];
  $zk = $row['zombie_kills'];
  $st = $row['survival_time'];
  $st = sprintf("%02dh %02dm", floor($st/60), $st%60);
  $uqid = $row['unique_id'];
  $kscore = ($zk*.1)+($sk*5)+($bk*10);
  $kscore = sprintf('%0.1f', $kscore);
  $name = $row['name'];
  if($kscore!=0) {
  $thelist[] = "
<tr>
<td>" . $kscore . "</td>
<td>" . $name . "</td>
<td>" . $st . "</td>
</tr>
";
  }
  }
 natsort($thelist);
$thelist=array_reverse($thelist);

echo implode($thelist);
 echo "</table>
";
?>