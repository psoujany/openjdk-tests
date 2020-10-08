#!/usr/bin/env bash
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
######
case `uname` in
  AIX | *BSD )
    MAKE=gmake
    ;;
  *)
    MAKE=make
    ;;
esac

if [ "$#" -eq 1 ];then
	cd $1/TKG
	$MAKE compile
else
	cd $1/TKG
	shift
	$MAKE $@
fi

if [ $EXTRA_OPTIONS =~ "openjceplus"];then
	export LIBPATH = $TEST_JDK_HOME/lib/icc:$TEST_JDK_HOME/lib/compressedrefs:$TEST_JDK_HOME/lib:$LIBPATH
	print $LIBPATH
fi
	
