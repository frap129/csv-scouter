#!/bin/bash
# Copyright (C) 2016 Joe Maples <joe@frap129.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
#   You may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
# A simple script for maniplutaing CSV files for IAMRobot Scouting

# Define variables
infile="$(cat $1)"
teamnums="33, 51, 67, 201, 245, 308, 313, 1023, 1189, 1250, 1718, 2075, 2137, 2676, 3098, 3302, 3655, 3667, 3773, 4003, 4737, 4779, 4810, 5048, 5066, 5090, 5166, 5193, 5263, 5282, 5436, 5467, 5650, 5662, 5688, 5708, 5711, 5860, 6117, 6152,"
teamstatheader="Auton Reach or Traverse (R or T),Auton High Goals,Auton Low Goals,Defense/Offense/Spy,Pick up,High Goals,Low Goals, SP,DB,RT,R,LB,M,P,RW,CF,Challenge,Scale"
oerformula="OER=, =placeholder,"

# Create prereqs
echo "$infile" > tmp.csv
rm -rf Teams && mkdir Teams
cp csv-xlsx.py Teams/

# Create team stat files
for num in teamnums; do
  echo $teamstatheader Teams/${num}.csv
  grep "${num}" tmp.csv | cut "-d " -f2- >> Teams/${num}.csv
  sed -i 's/*, ${num}//g' Teams/${num}.csv
  echo $oerformula > Teams/${num}.csv
done;

# Convert CSV files to xlsx files to use formulas
python Teams/csv-xlsx.py

# Clean up.
rm -f tmp.csv Teams/csv-xlsx.py
