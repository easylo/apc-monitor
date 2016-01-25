<?php

require_once("include/template.class.php");

$Server = array();

////////// READ CONFIGURATION FILE ////////////
if (file_exists("apc.conf.php")) include("apc.conf.php");


$output = '' ;
$id=0;

foreach ($Server as $name => $dataUrl) {
    $id++;

  if(preg_match('#^http#', $dataUrl) === 1){
    $data_raw = file_get_contents($dataUrl);
    $data = json_decode($data_raw, true);

  }else{
    $data_raw = get_include_contents( $dataUrl);
    $data = json_decode($data_raw, true);

  }

//var_dump($data);
    $tpl = new Template("template/graph_row0.tpl");
    $tpl->set('id', $id);
    $tpl->set('name', $name);
    $tpl->set('expunges', $data['apc']['expunges']);
    $tpl->set('free_display', $data['apc']['free_display']);
    $tpl->set('free', $data['apc']['free']);
    $tpl->set('free_p', $data['apc']['free_p']);
    $tpl->set('used_display', $data['apc']['used_display']);
    $tpl->set('used', $data['apc']['used']);
    $tpl->set('used_p', $data['apc']['used_p']);
    $tpl->set('hits', $data['apc']['hits']);
    $tpl->set('hits_p', $data['apc']['hits_p']);
    $tpl->set('misses', $data['apc']['misses']);
    $tpl->set('misses_p', $data['apc']['misses_p']);

    $tpl->set('duration', $data['apc']['duration']);

    $tpl->set('graph1_lib1_color', '#5dd0fb'); //#e5e8eb // light
    $tpl->set('graph1_lib2_color', '#e5e8eb'); // 2bbfba // green
    $tpl->set('graph2_lib1_color', '#2bbfba'); // 5dd0fb// blue
    $tpl->set('graph2_lib2_color', '#e5e8eb');

    $tpl->set('graph1_title', 'Memory Usage');
    $tpl->set('graph2_title', 'Hits & Misses');
    //$tpl->set('', $data['']);


    $output .= $tpl->output();

}

$layout = new Template("template/layout.tpl");
$layout->set('title', 'APC Monitoring');
$layout->set('body', $output);
echo $layout->output();


function get_include_contents($filename) {
    if (is_file($filename)) {
        ob_start();
        include $filename;
        return ob_get_clean();
    }
    return false;
}
