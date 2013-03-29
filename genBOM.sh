#!/bin/bash
# This file is part of Mirage335BiosignalAmp.

# Mirage335BiosignalAmp is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Mirage335BiosignalAmp is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Mirage335BiosignalAmp.  If not, see <http://www.gnu.org/licenses/>.

. ubiquitous_bash.sh

#Takes no parameters, only the variables sourceFile and basicName .
genSingleBOM() {
	echo '<table border=1>' > "$basicName".html
	gnetlist -g bom2 "$sourceFile" -o - | sed 's/^/<tr><td>/g' | sed 's/:/<\/td><td>/g' | sed 's/$/<\/tr>/g' | sed 's/unknown/<font color=red>unknown<\/font>/g' | sed 's/\?/<font color=red>?<\/font>/g' | sed 's/\$/<font color=green>\$<\/font>/g' | sed 's/>X\ /><font color=red>X\ <\/font>/g'>> "$basicName".html
	echo '</table>' >> "$basicName".html
}

sourceFile=$(getScriptAbsoluteFolder)/Amplifier.sch
basicName=$(basename "$sourceFile" .sch)

genSingleBOM

sourceFile=$(getScriptAbsoluteFolder)/ActiveElectrode.sch
basicName=$(basename "$sourceFile" .sch)

genSingleBOM

sourceFile=$(getScriptAbsoluteFolder)/Host.sch
basicName=$(basename "$sourceFile" .sch)

genSingleBOM