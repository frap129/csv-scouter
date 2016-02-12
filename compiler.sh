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
teamnums="placeholder, placeholder1, placeholder2,"
teamstatheader="place, holder, csv, values"
oerformula="placeholder"

# Create prereqs
echo "$infile" > tmp.csv
rm -rf Teams && mkdir Teams

# Create team stat files
for num in teamnums; do
  echo $teamstatheader Teams/${num}.csv
  grep "${num}" tmp.csv | cut "-d " -f2- >> Teams/${num}.csv
  sed -i 's/*, ${num}//g' Teams/${num}.csv
  echo $oerformula > Teams/${num}.csvm
done;

# Clean up.
rm -f tmp.csv
