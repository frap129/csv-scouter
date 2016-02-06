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
outfile="$2"
teamnums="placeholder, placeholder1, placeholder2,"

# Create outfile
touch $outfile

# Move team numbers to outfile
for nums in teamnums; do
  echo $num >> $outfile;
done;

# Combine Stats
