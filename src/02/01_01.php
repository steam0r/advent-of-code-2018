<?php
$lines = file('input', FILE_IGNORE_NEW_LINES);
$twos = 0;
$threes = 0;
foreach ($lines as $line) {
  $chars = str_split($line);
  $counts = array_count_values($chars);
  if(in_array(2, $counts)) {
    $twos++;
  }
  if(in_array(3, $counts)) {
    $threes++;
  }
}
print "caclulating $twos * $threes = " . ($threes * $twos) . "\n";