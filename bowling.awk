#!/usr/bin/env awk -f

{
  rolls=$0
  gsub(/ /, "", rolls)
  sum=0
  bonus_roll_count=0
  for (i=1; i<length(rolls); i++) {
    roll=substr(rolls, i, 1)
    if (roll == "-") { roll=0 }
    if (roll == "/") { roll=10-substr(rolls, i-1, 1) }
    if (roll == "X") { roll=10 }
    if (i>1 && substr(rolls, i-1, 1) == "/") { sum+=roll }
    if (i>1 && substr(rolls, i-1, 1) == "X") { sum+=roll }
    if (i>2 && substr(rolls, i-2, 1) == "X") { sum+=roll }
    sum+=roll
  }
  print "Frames:", $0
  print "Score: ", sum
}
