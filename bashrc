alias cmake_ycm="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

#Note that if X cannot be run during startup, vim cannot be run. In that case 
#comment the following line or run /usr/bin/vim:
if [ -e /usr/bin/vimx ]
then
	alias vim="/usr/bin/vimx"
fi
