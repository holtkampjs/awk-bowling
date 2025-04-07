#!/usr/bin/env awk -f

{
  sum=0
  bonus_roll_count=0
  for (i=1; i<=length($0); i++) {
    digit=substr($0, i, 1)
    if (digit ~ /[0-9]/) {
      sum += digit
      if (bonus_roll_count > 0) {
        sum += digit
        bonus_roll_count--
      }
    } else if (digit == "/") {
      pins=10-substr($0, i-1, 1)
      sum += pins
      if (bonus_roll_count > 0) {
        sum += pins
        bonus_roll_count--
      }
      bonus_roll_count=1
    } else if (digit == "X") {
      sum += 10
      if (bonus_roll_count > 0) {
        sum += 10
        bonus_roll_count--
      }
      bonus_roll_count=2
    }
  }
  print "Frames:", $0
  print "Score: ", sum
}
