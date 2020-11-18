txt=$(synclient -l | grep TouchpadOff  | cut -d "=" -f2)
val=${txt:1}
if test $val -eq "0"
then
    synclient TouchpadOff=1
else
    synclient TouchpadOff=0
fi
