# Include special functions
require ["relational", "comparator-i;ascii-numeric", "fileinto"];

# AntiSpam measure filtering
if allof (
   header :value "ge" :comparator "i;ascii-numeric" "X-Assp-Message-Totalscore" "10" )
{
  fileinto "ASSP.Spam";
  stop;
}
