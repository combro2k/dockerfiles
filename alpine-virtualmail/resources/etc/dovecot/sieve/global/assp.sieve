# Include special functions
require ["relational", "comparator-i;ascii-numeric", "fileinto"];

# AntiSpam measure filtering
if allof (
   not header :matches "X-Assp-Message-Score" "-*",
   header :value "ge" :comparator "i;ascii-numeric" "X-Assp-Message-Score" "10" )
{
  fileinto "ASSP.Spam";
  stop;
}
