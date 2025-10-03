###############
#  _path      #
###############

export PYTHONSTARTUP=~/startup.py

# not needed since 1.11?
# cf. https://stackoverflow.com/questions/24306183/can-someone-explain-why-gopath-is-convenient-and-how-it-should-be-used-in-genera/24306485#24306485
export GOPATH=~/Developer/go

PATH=$(xcode-select -print-path)/usr/bin:$PATH
PATH=/Users/fd/opt/miniconda3/bin:$PATH
PATH="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:$PATH"
PATH=/Users/fd/.local/bin:$PATH
PATH=/usr/local/go/bin:$PATH
PATH="/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH"
export PATH

# C_INCLUDE_PATH=$(xcrun --sdk macosx --show-sdk-path)/usr/include
# export C_INCLUDE_PATH

# CPATH=/usr/local/Cellar/qt/6.6.2_2/include:$CPATH
CPATH=$(xcrun --sdk macosx --show-sdk-path)/System/Library/Frameworks/PCSC.framework/Headers:$CPATH
CPATH=$(xcrun --sdk macosx --show-sdk-path)/System/Library/Frameworks/CoreFoundation.framework/Headers:$CPATH
# CPATH=$(xcrun --sdk macosx --show-sdk-path)/System/Library/Frameworks/Carbon.framework/Headers:$CPATH
# CPATH=/usr/local/Cellar/llvm/17.0.6_1/include/c++/v1:$CPATH
CPATH=$(xcrun --sdk macosx --show-sdk-path)/usr/include/c++/v1:$CPATH # C++
CPATH=$(xcrun --sdk macosx --show-sdk-path)/usr/include:$CPATH  # C
export CPATH

# export CMAKE_PREFIX_PATH=/usr/local/Cellar/qt/6.6.2_2:$CMAKE_PREFIX_PATH


export LIBRARY_PATH=$(xcrun --sdk macosx --show-sdk-path)/usr/lib
# export LD_PATH=$LIBRARY_PATH

CFLAGS="-I$(xcrun --sdk macosx --show-sdk-path)/System/Library/Frameworks/PCSC.framework/Headers"
# CFLAGS="-I$(xcrun --sdk macosx --show-sdk-path)/System/Library/Frameworks/Carbon.framework/Headers $CFLAGS"
# CFLAGS="-I$(xcrun --sdk macosx --show-sdk-path)/System/Library/Frameworks/CoreFoundation.framework/Headers $CFLAGS"
export CFLAGS
export CPPFLAGS="-I$(xcrun --sdk macosx --show-sdk-path)/System/Library/Frameworks/PCSC.framework/Headers"
# export LDFLAGS="-F$(xcrun --sdk macosx --show-sdk-path)/System/Library/Frameworks"
