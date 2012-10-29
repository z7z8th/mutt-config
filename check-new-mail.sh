#!/bin/sh

dbus_session_file=~/.dbus/session-bus/$(cat /var/lib/dbus/machine-id)-0
if [ -e "$dbus_session_file" ]; then
  . "$dbus_session_file"
  export DBUS_SESSION_BUS_ADDRESS DBUS_SESSION_BUS_PID
fi

prog_name=getmail

getmail_ps_usr=`ps aux | grep "$prog_name" | grep -v "grep $prog_name" | head -n 1 | cut -d ' ' -f 1`
[ "`whoami`" = "$getmail_ps_usr" ] && { notify-send -u normal "Another getmail is already in progress!"; exit 1; }


getmail_log=`getmail -n 2>/dev/null`
echo $getmail_log
from_list=`echo $getmail_log | grep -Eo 'from <[[:alnum:]._-]+@[[:alnum:]._-]+>'`
msg_cnt=`echo $getmail_log | grep -Eo '[[:digit:]]+ messages \([[:digit:]]+ bytes\) retrieved, [[:digit:]]+ skipped' | grep -Eo '^[[:digit:]]+'`
echo
echo "from_list=$from_list"
echo "msg_cnt=$msg_cnt"
[ "${msg_cnt:-0}" -gt 0 ] && notify-send -u normal "$msg_cnt new messages.$from_list"












#0 messages (0 bytes) retrieved, 1 skipped
x_getmail_log='
getmail version 4.32.0
Copyright (C) 1998-2012 Charles Cazabon.  Licensed under the GNU GPL version 2.
SimpleIMAPRetriever:xxxxx@ms.xxxx.com:143:
  msg  1/13 (130531 bytes) from <xxxxx@xxxx.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg  2/13 (1405 bytes) from <unknown> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg  3/13 (35660 bytes) from <xxxxx@xxxx.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg  4/13 (35668 bytes) from <xxxxx@xxxx.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg  5/13 (35449 bytes) from <xxxxx@xxxx.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg  6/13 (156293 bytes) from <xxxxx@xxxx.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg  7/13 (6387 bytes) from <xxxxx@xxxx.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg  8/13 (32442 bytes) from <xxxxx@xxxx.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg  9/13 (4570 bytes) from <xxxxx@xxxx.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg 10/13 (7796 bytes) from <xxxxx@xxxx.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg 11/13 (2378 bytes) from <xxxxx@gmail.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg 12/13 (1876 bytes) from <xxxxx@xxxx.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  msg 13/13 (23769 bytes) from <bc33@163.com> delivered to Mboxrd /home/username/Mail/SomeDir/Inbox
  13 messages (474224 bytes) retrieved, 0 skipped
Summary:
Retrieved 13 messages (474224 bytes) from SimpleIMAPRetriever:xxxxx@ms.xxxx.com:143
'
