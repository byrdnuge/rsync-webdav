#bash

#mount drive (-e expects a statement in the form 'statement "something"'
# this script also expects that the username/pass is already stored in keychain on your mac

osascript -e 'mount volume "http://fqdn.com/webdav-dir"'

#make log directory if it doesn't exist already

mkdir ~/logs

#sync and log in ~/logs/ using filename rsync_day-time.txt just because logs are awesome!
#-i turns on the itemized format, which shows more information than the default format
#-b makes rsync backup files that exist in both folders, appending ~ to the old file. You can control this suffix with --suffix .suf
#-u makes rsync transfer skip files which are newer in dest than in src
#-z turns on compression, which is useful when transferring easily-compressible files over slow links
#-P turns on --partial and --progress
#--partial makes rsync keep partially transferred files if the transfer is interrupted
#--progress shows a progress bar for each transfer, useful if you transfer big files

rsync -abviuzP /path/to/dir/to/rsync* /Volumes/webdav-dir/ >> ~/logs/rsync_$(date +%Y%m%d-%H%M%S).txt