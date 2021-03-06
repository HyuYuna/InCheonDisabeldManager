<?php
	header("Content-type: text/xml; charset=utf-8");
	
	$requestAllData = $_GET['requestAllData'];
	date_default_timezone_set('US/Eastern');
	$dateFmt = date('Y/m/d H:i', time());
	$data1 = 0;
		
	echo "<items>\n";
	echo "<infoMsg>\n";

	echo "<index>" . $dateFmt . "</index>\n";
	echo "<timeNow>" . $dateFmt . "</timeNow>\n";

	$yesterday = date('Y/m/d H:i', strtotime($dateFmt) - 24*60*60);
	$twodaysago = date('Y/m/d H:i', strtotime($dateFmt) - 2*24*60*60);
	
	$startDateTime = substr($twodaysago, 0, 11) . "23:00";
	$endDateTime = substr($yesterday, 0, 11) . "23:59";
	$nextInitDate = substr($dateFmt, 0, 11) . "23:59";
	
	$gap = strtotime($endDateTime) - strtotime($startDateTime);
	
	echo "<isInitData>true</isInitData>\n";
	echo "<nextInitDate>" . $nextInitDate . "</nextInitDate>\n";
	echo "<startDate>" . $startDateTime . "</startDate>\n";

	echo "<endDate>" . $endDateTime . "</endDate>\n";
	echo "</infoMsg>\n";

	for($i = 0; $i <= $gap; $i += 60*3)
	{
		$data1 = 100 + round(rand(1, 500)/2);

		$nextTime = strtotime($startDateTime) + $i;
		$baseDate = date("Y/m/d H:i", $nextTime);
		
		echo "<item>\n";
		echo "<date>" . $baseDate . "</date>\n";
		echo "<yesTotalData>" . $data1 . "</yesTotalData>\n";
		echo "</item>\n";
	}
	
    echo "</items>\n";
?>	