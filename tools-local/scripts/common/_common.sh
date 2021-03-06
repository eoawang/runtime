#
# Licensed to the .NET Foundation under one or more agreements.
# The .NET Foundation licenses this file to you under the MIT license.
#

COMMONSOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  COMMONDIR="$( cd -P "$( dirname "$COMMONSOURCE" )" && pwd )"
  COMMONSOURCE="$(readlink "$COMMONSOURCE")"
  [[ $COMMONSOURCE != /* ]] && COMMONSOURCE="$COMMONDIR/$COMMONSOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
COMMONDIR="$( cd -P "$( dirname "$COMMONSOURCE" )" && pwd )"

source "$COMMONDIR/_prettyprint.sh"

[ -z "$DOTNET_INSTALL_DIR" ] && export DOTNET_INSTALL_DIR=$REPOROOT/.dotnet_stage0/$RID
[ -z "$DOTNET_CLI_VERSION" ] && export DOTNET_CLI_VERSION=0.1.0.0
[ -z "$DOTNET_ON_PATH" ] && export DOTNET_ON_PATH=$STAGE2_DIR && export PATH=$STAGE2_DIR/bin:$PATH
[ -z "$CONFIGURATION" ] && export CONFIGURATION=Debug

#TODO this is a workaround for a nuget bug on ubuntu. Remove
export DISABLE_PARALLEL=""
[[ "$RID" =~ "ubuntu" -o "$RID" =~ "ubuntu.16.04" ]] && export DISABLE_PARALLEL=""

unset COMMONSOURCE
unset COMMONDIR
