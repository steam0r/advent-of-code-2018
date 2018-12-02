<?php
$lines = file('input', FILE_IGNORE_NEW_LINES);
$allChars = [];
foreach ($lines as $line) {
  $allChars[] = str_split($line);
}
$diffs = [];
foreach ($allChars as $chars) {
  foreach ($allChars as $compare) {
    $diff = array_diff_assoc($chars, $compare);
    if(count($diff) == 1) {
      print "found different letter in " . implode("",$chars) . ": " .
      implode(",", $diff) .
        " at position " .
        implode(",", array_keys($diff)) .
        "\n";
      print "  common letters are: " . implode("", array_intersect_assoc($chars, $compare)) . "\n";
    }
  }
}