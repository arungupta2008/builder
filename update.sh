#! /usr/bin/bash
#
# Archbuild - Buildbot configuration for Papyros
#
# Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

BUILDBOT_MASTER=~/master
BUILDBOT_SLAVE=~/slave1

cd ~/archbuild

git fetch && git reset --hard origin/master
cp -f master.cfg $BUILDBOT_MASTER/
rsync -az --delete helpers $BUILDBOT_MASTER/ || exit $?
export PYTHONPATH=~/archbuild/lib
buildbot restart $BUILDBOT_MASTER
buildslave restart $BUILDBOT_SLAVE