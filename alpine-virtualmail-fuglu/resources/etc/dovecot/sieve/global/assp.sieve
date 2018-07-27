# Include special functions
require ["relational", "comparator-i;ascii-numeric", "fileinto"];

# AntiSpam measure filtering
if anyof (
   header :value "ge" :comparator "i;ascii-numeric" "X-Assp-Message-Totalscore" "10",
   header :is ["X-Spam-Status"] "yes",
   header :contains ["X-Assp-Spam-Level"] "****"
)
{
  fileinto "ASSP.Spam";
  stop;
}
