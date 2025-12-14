#!/bin/bash

pass_count=0
fail_count=0

assign_grade() {
  percent=$1
  if [ "$percent" -ge 80 ]; then echo "A+"
  elif [ "$percent" -ge 75 ]; then echo "A"
  elif [ "$percent" -ge 70 ]; then echo "A-"
  elif [ "$percent" -ge 65 ]; then echo "B+"
  elif [ "$percent" -ge 60 ]; then echo "B"
  elif [ "$percent" -ge 55 ]; then echo "B-"
  elif [ "$percent" -ge 50 ]; then echo "C+"
  elif [ "$percent" -ge 45 ]; then echo "C"
  elif [ "$percent" -ge 40 ]; then echo "D"
  else echo "F"
  fi
}

while true; do
  read -p "Enter Student ID (or type 'exit' to finish): " id
  if [ "$id" == "exit" ]; then break; fi

  read -p "Enter marks for Subject 1: " m1
  read -p "Enter marks for Subject 2: " m2
  read -p "Enter marks for Subject 3: " m3

  total=$((m1 + m2 + m3))
  percent=$((total * 100 / 300))

  echo "Student ID: $id"
  echo "Total Marks: $total"
  echo "Percentage: $percent%"

  grade=$(assign_grade "$percent")
  echo "Grade: $grade"

  if [ "$percent" -ge 40 ]; then
    pass_count=$((pass_count + 1))
  else
    fail_count=$((fail_count + 1))
  fi

  echo "-----------------------------"
done

echo "Final Summary:"
echo "Total Passed Students: $pass_count"
echo "Total Failed Students: $fail_count"
