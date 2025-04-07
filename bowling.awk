#!/usr/bin/env awk -f

{
  rolls=$0
  gsub(/ /, "", rolls)
  sum=0
  bonus_roll_count=0
  for (i=1; i<=length(rolls); i++) {
    roll=substr(rolls, i, 1)
    if (roll == "-") { continue }
    if (roll == "/") { roll=10-substr(rolls, i-1, 1) }
    if (roll == "X") { roll=10 }
    if (i>1 && substr(rolls, i-1, 1) == "/") { sum+=roll }
    if (i>1 && substr(rolls, i-1, 1) == "X") { sum+=roll }
    if (i>2 && substr(rolls, i-2, 1) == "X") { sum+=roll }
    sum+=roll

    # Prev
    # digit=substr(rolls, i, 1)
    # if (digit ~ /[0-9]/) {
    #   sum += digit
    #   if (bonus_roll_count > 0) {
    #     sum += digit
    #     bonus_roll_count--
    #   }
    # } else if (digit == "/") {
    #   pins=10-substr(rolls, i-1, 1)
    #   sum += pins
    #   if (bonus_roll_count > 0) {
    #     sum += pins
    #     bonus_roll_count--
    #   }
    #   bonus_roll_count=1
    # } else if (digit == "X") {
    #   sum += 10
    #   if (bonus_roll_count > 0) {
    #     sum += 10
    #     bonus_roll_count--
    #   }
    #   bonus_roll_count=2
    # }
  }
  print "Frames:", $0
  print "Score: ", sum
}
