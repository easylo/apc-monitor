<?php

$time = time();

//defaults('DATE_FORMAT', "d.m.Y H:i:s");	// German
defaults('DATE_FORMAT', 'Y/m/d H:i:s'); 	// US

defaults('GRAPH_SIZE',200);					// Image size

// default cache mode
$cache_mode='opcode';


if(!function_exists('apc_cache_info') || !($cache=@apc_cache_info($cache_mode))) {
	echo "No cache info available.  APC does not appear to be running.";
  exit;
}

$cache_user = apc_cache_info('user', 1);
$mem=apc_sma_info();

//var_dump($mem);
//var_dump($cache);

if( isset($cache['nhits']) ){
	$cache['num_hits'] = $cache['nhits'];
}

if( isset($cache['nmisses']) ){
	$cache['num_misses'] = $cache['nmisses'];
}

if( isset($cache['stime']) ){
	$cache['start_time'] = $cache['stime'];
}
if( isset($cache['nexpunges']) ){
	$cache['expunges'] = $cache['nexpunges'];
}

if( !isset($cache['num_hits']) || !$cache['num_hits']) {
	// Avoid division by 0 errors on a cache clear
	$cache['num_hits']=1; $time++;
}



$apcversion = phpversion('apc');
$phpversion = phpversion();
$apc_duration = duration($cache['start_time']) ;

$mem_size = $mem['num_seg']*$mem['seg_size'];
$mem_avail= $mem['avail_mem'];
$mem_used = $mem_size-$mem_avail;


	$free  = $mem_avail;
	$free_display  = bsize($mem_avail);
	$free_p = sprintf("%.1f%%",$mem_avail*100/$mem_size) ;

	$used = $mem_used;
	$used_display = bsize($mem_used );
	$used_p = sprintf("%.1f%%",$mem_used *100/$mem_size) ;

	$expunges = $cache['expunges'];
	$hits = $cache['num_hits'];
	$hits_p = sprintf("%.1f%%",$cache['num_hits']*100/($cache['num_hits']+$cache['num_misses'])) ;

	$misses = $cache['num_misses'];
	$misses_p = sprintf("%.1f%%",$cache['num_misses']*100/($cache['num_hits']+$cache['num_misses'])) ;

$data['apc'] = array(
 	'version' => $apcversion,

 	'expunges' => $expunges,

 	'mem_used' => $mem_used,
 	'mem_avail' => $mem_avail,
 	'mem_size' => $mem_size,

	'free' => $free,
	'free_display' => $free_display,
	'free_p' => $free_p,

	'used' => $used,
	'used_display' => $used_display,
	'used_p' => $used_p,

	'hits' => $hits,
	'hits_p' => $hits_p,

	'misses' => $misses,
	'misses_p' => $misses_p,

	'duration' => $apc_duration,
) ;

$data['php'] = array(
 'version' => $phpversion,
) ;


echo json_encode($data);


function duration($ts) {
    global $time;
    $years = (int)((($time - $ts)/(7*86400))/52.177457);
    $rem = (int)(($time-$ts)-($years * 52.177457 * 7 * 86400));
    $weeks = (int)(($rem)/(7*86400));
    $days = (int)(($rem)/86400) - $weeks*7;
    $hours = (int)(($rem)/3600) - $days*24 - $weeks*7*24;
    $mins = (int)(($rem)/60) - $hours*60 - $days*24*60 - $weeks*7*24*60;
    $str = '';
    if($years==1) $str .= "$years year, ";
    if($years>1) $str .= "$years years, ";
    if($weeks==1) $str .= "$weeks week, ";
    if($weeks>1) $str .= "$weeks weeks, ";
    if($days==1) $str .= "$days day,";
    if($days>1) $str .= "$days days,";
    if($hours == 1) $str .= " $hours hour and";
    if($hours>1) $str .= " $hours hours and";
    if($mins == 1) $str .= " 1 minute";
    else $str .= " $mins minutes";
    return $str;
}

// "define if not defined"
function defaults($d,$v) {
	if (!defined($d)) define($d,$v); // or just @define(...)
}

// pretty printer for byte values
//
function bsize($s) {
	foreach (array('','K','M','G') as $i => $k) {
		if ($s < 1024) break;
		$s/=1024;
	}
	return sprintf("%5.1f %sBytes",$s,$k);
}
