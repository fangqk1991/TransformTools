<?php

$content = file_get_contents(__DIR__ . '/modules.json');
$items = json_decode($content, TRUE);


$count = count($items);
$hints = [];
$cases = [];
$functions = [];

for($i = 0; $i < $count; ++$i)
{
    $item = $items[$i];
    $fileName = $item['file_name'];
    $description = $item['description'];

    $index = $i + 1;
    array_push($hints, sprintf('echo "%d. %s"', $index, $description));

    $code = sprintf('
    %d)
        func="%s"
        ;;', $index, $fileName);
    array_push($cases, $code);

    $shellFile = sprintf('%s/../modules/%s.sh', __DIR__, $fileName);
    $func = sprintf('
function %s() {
%s | pbcopy
pbpaste
}', $fileName, trim(file_get_contents($shellFile)));
    array_push($functions, $func);
}

$tmpl = file_get_contents(__DIR__ . '/transform-tools.tpl');
$dic = array(
    'hints' => implode("\n", $hints),
    'cases' => implode('', $cases),
    'functions' => implode("\n", $functions),
);

$content = preg_replace_callback(
    '#\{\{\$(\w+)\}\}#',
    function ($matches) use ($dic) {
        $key = $matches[1];
        return $dic[$key];
    },
    $tmpl
);

echo $content;

