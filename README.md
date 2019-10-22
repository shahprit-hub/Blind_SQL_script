# Blind_SQL_script

This is BASH script that can help an ethical hacker or pentester. 
It will help to retrieve database infromation after finding Blind SQLi in the application.
SQLMAP is a good tool but sometimes testers are not allowed to use this tool. During such test this script will be handy.


Example:

URL to be added like: www.images.com/cats.php?id=1 (injection point 1 should be present) OR
Replace the URL with user-agent string or any injection parameter 
E.g:"wget --user-agent="' OR SUBSTRING(("$query"),"$nthchar",1)='$i" "$URL" -q -O -`"
Consider the wget as tampered URL and manipulate accordingly.
Edit the URL and the truestring before you use it!
Command Line Usage: ./blind.sh max-length "query"
Example: ./blind.sh 20 "Select database()"
