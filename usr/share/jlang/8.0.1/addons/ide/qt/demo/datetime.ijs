NB. datetime demo
NB.
NB. cc date dateedit [numeric options]
NB.
NB. numeric options are:
NB. minimum
NB. maximum
NB. value   (yyyyMMdd)
NB.
NB. cc time timeedit [numeric options]
NB.
NB. numeric options are:
NB. minimum
NB. maximum
NB. value   (hhmmss.zzz)

NB. display format:

NB. These expressions may be used for the date:
NB. 
NB. Expression                                           Output
NB. d          the day as number without a leading zero (1 to 31)
NB. dd         the day as number with a leading zero (01 to 31)
NB. ddd        the abbreviated localized day name (e.g. 'Mon' to 'Sun'). Uses QDate::shortDayName().
NB. dddd       the long localized day name (e.g. 'Monday' to 'Qt::Sunday'). Uses QDate::longDayName().
NB. M          the month as number without a leading zero (1-12)
NB. MM         the month as number with a leading zero (01-12)
NB. MMM        the abbreviated localized month name (e.g. 'Jan' to 'Dec'). Uses QDate::shortMonthName().
NB. MMMM       the long localized month name (e.g. 'January' to 'December'). Uses QDate::longMonthName().
NB. yy         the year as two digit number (00-99)
NB. yyyy       the year as four digit number
NB. 
NB. These expressions may be used for the time:
NB. 
NB. Expression                                 Output
NB. h          the hour without a leading zero (0 to 23 or 1 to 12 if AM/PM display)
NB. hh         the hour with a leading zero (00 to 23 or 01 to 12 if AM/PM display)
NB. m          the minute without a leading zero (0 to 59)
NB. mm         the minute with a leading zero (00 to 59)
NB. s          the second without a leading zero (0 to 59)
NB. ss         the second with a leading zero (00 to 59)
NB. z          the milliseconds without leading zeroes (0 to 999)
NB. zzz        the milliseconds with leading zeroes (000 to 999)
NB. AP         use AM/PM display. AP will be replaced by either "AM" or "PM".
NB. ap         use am/pm display. ap will be replaced by either "am" or "pm".
NB. 
NB. All other input characters will be ignored. Any sequence of characters that are enclosed in singlequotes will be treated as text and not be
NB. used as an expression. Two consecutive singlequotes ("''") are replaced by a singlequote in the output.
NB. 
NB. Example format strings (assumed that the QDateTime is 21 May 2001 14:13:09):
NB. 
NB.     Format         Result
NB. dd.MM.yyyy     21.05.2001
NB. ddd MMMM d yy  Tue May 21 01
NB. hh:mm:ss.zzz   14:13:09.042
NB. h:m:s ap       2:13:9 pm

coclass 'qtdemo'

NB. =========================================================
DTdemo=: 0 : 0
pc datetimedemo;
cc date dateedit;
cc time timeedit;
)

NB. =========================================================
datetimedemo_close=: 3 : 0
wd 'pclose'
showevents_jqtide_ 0
)

NB. =========================================================
datetimedemo_run=: 3 : 0
P=. jpath '~addons/ide/qt/images/'
wd DTdemo
wd 'set date value 20120331'
wd 'set time value 142358'
wd 'pmove 700 10 400 200'
wd 'pshow'
)

NB. =========================================================
showevents_jqtide_ 2
datetimedemo_run''
smoutput 0 : 0
Try:
  wd 'set date value 20120410'
  wd 'set date format "ddd.MMM.yyyy"'
  wd 'set time value 140002.123'
  wd 'set time format "hh:mm:ss ap"'
)
