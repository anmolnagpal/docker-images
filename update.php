
<?php
$path_0     = glob(__DIR__ . '/*/build.sh');
$path_1     = glob(__DIR__ . '/*/*/build.sh');
$globalPath = array_merge($path_0, $path_1);
foreach ($globalPath as $filename) {
    if (strstr($filename, 'build.sh')) {
        $path    = dirname($filename);
        $command = file_get_contents($filename);
        while (@ ob_end_flush()) ;
        $proc = popen('cd ' . $path . ' && ' . $command, 'r');
        while (!feof($proc)) {
            echo fread($proc, 4096);
            @ flush();
        }
    }
}