### Setting up UFW (Uncomplicated Firewall) with Cloudflare IPs for Cloudflare Argo Tunnel

STEP-1:
Save this script to a file, such as script.sh, and make it executable using chmod +x script.sh.
STEP-2:
Then, you can run the script to set up UFW with Cloudflare IPs by executing:

```bash
./script.sh
```

This script does the following:

Retrieves Cloudflare's IPv4 address ranges using the curl command.
Clears existing UFW rules (if any).
Sets the default UFW policy to deny all incoming and outgoing traffic.
Allows SSH (replace 22 with your preferred SSH port).
Iterates through the Cloudflare IP ranges obtained in step 1 and adds rules to allow traffic from these IP ranges.
Enables UFW with the --force flag to avoid user confirmation.
Displays the UFW status.
Please note that this script only configures UFW to allow incoming traffic from Cloudflare IP ranges. Outgoing traffic is allowed by default unless explicitly denied.

Make sure to periodically update the script with Cloudflare's latest IP ranges, as they may change over time. You can fetch the updated IPv4 and IPv6 ranges from Cloudflare's official documentation or API. Additionally, be cautious when using scripts to modify firewall rules, and make sure the script is securely stored and executed.
