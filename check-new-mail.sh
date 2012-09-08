#!/bin/sh

getmail_log=`getmail -n 2>/dev/null`
echo $getmail_log
from_list=`echo $getmail_log | grep -Eo 'from <[[:alnum:]._-]+@[[:alnum:]._-]+>'`
msg_cnt=`echo $getmail_log | grep -Eo '[[:digit:]]+ messages \([[:digit:]]+ bytes\) retrieved, [[:digit:]]+ skipped' | grep -Eo '^[[:digit:]]+'`
echo
echo "from_list=$from_list"
echo "msg_cnt=$msg_cnt"
[ "$msg_cnt" -gt 0 ] && notify-send -u normal "$msg_cnt new messages.$from_list"












#0 messages (0 bytes) retrieved, 1 skipped
x_getmail_log='
getmail version 4.32.0
Copyright (C) 1998-2012 Charles Cazabon.  Licensed under the GNU GPL version 2.
SimpleIMAPRetriever:bob.zhao@ms.infomax.com.tw:143:
  msg  1/13 (130531 bytes) from <deming.li@infomax.com.tw> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg  2/13 (1405 bytes) from <unknown> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg  3/13 (35660 bytes) from <bolo.tsai@infomax.com.tw> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg  4/13 (35668 bytes) from <bolo.tsai@infomax.com.tw> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg  5/13 (35449 bytes) from <bolo.tsai@infomax.com.tw> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg  6/13 (156293 bytes) from <bolo.tsai@infomax.com.tw> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg  7/13 (6387 bytes) from <jason.wang@infomax.com.tw> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg  8/13 (32442 bytes) from <deming.li@infomax.com.tw> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg  9/13 (4570 bytes) from <deming.li@infomax.com.tw> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg 10/13 (7796 bytes) from <peter.gu@infomax.com.tw> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg 11/13 (2378 bytes) from <ybzhao1989@gmail.com> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg 12/13 (1876 bytes) from <bob.zhao@infomax.com.tw> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  msg 13/13 (23769 bytes) from <aabbccdd1373@163.com> delivered to Mboxrd /home/z7z8th/Mail/Infomax/Inbox
  13 messages (474224 bytes) retrieved, 0 skipped
Summary:
Retrieved 13 messages (474224 bytes) from SimpleIMAPRetriever:bob.zhao@ms.infomax.com.tw:143
'
