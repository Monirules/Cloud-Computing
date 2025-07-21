# setup_firewall.ps1

# Correct variable assignment in PowerShell
$VM_NAME = "cloud-computing-2025"
$ZONE = "us-central1-c"

# Create firewall rule (will fail if already exists — that's okay)
gcloud compute firewall-rules create allow-flask-5000 `
  --allow=tcp:5000 `
  --target-tags=http-server `
  --description="Allow TCP traffic on port 5000 for Flask app" `
  --direction=INGRESS `
  --priority=1000 `
  --network=default

# Add tag to VM (this actually applies the firewall rule to your VM)
gcloud compute instances add-tags $VM_NAME `
  --tags=http-server `
  --zone=$ZONE