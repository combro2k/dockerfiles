require ["fileinto"];
# rule:[SPAM]
if header :contains "X-Spam-Flag" "YES" {
        fileinto "Spam";
}
# rule:[SPAM2]
elsif header :matches "Subject" ["*money*","*Viagra*","Cialis"] {
        fileinto "Spam";
}
