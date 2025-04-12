#!/usr/bin/env -S awk -f

function countpins(roll, prev) {
  if (roll == "X") {
    return 10
  }
  if (roll == "/") {
    return 10-countpins(prev)
  }
  if (roll ~ "[1-9]") {
    return roll
  }
  return 0
}

function scoreframe(rolls) {
  extra=0
  first=substr(rolls, 1, 1)
  second=substr(rolls, 2, 1)
  if (substr(rolls, 1, 1) == "X") {
    second=0
    extra+=countpins(substr(rolls, 2, 1))
    extra+=countpins(substr(rolls, 3, 1), substr(rolls, 2, 1))
  }
  else if (substr(rolls, 2, 1) == "/") {
    extra+=countpins(substr(rolls, 3, 1))
  }

  return countpins(first)+countpins(second, first)+extra
}

/^([1-9\-\/X][1-9\-\/ ] ){9}[1-9\-X][1-9\-\/X]{2}$/ {
  score=0
  split($0, frames)
  for (i=1; i<=10; i++) {
    score+=scoreframe(frames[i] frames[i+1] frames[i+2])
  }

  print score
}
