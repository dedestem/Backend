cd "$(dirname "$0")"

mkdir -p Bootlogs

current_date=$(date +"%Y-%m-%d_%H-%M-%S")
log_file="Bootlogs/${current_date}.log"

# Log the boot process
{
    echo "Hello booting up!"
    echo "Current directory: $(pwd)"

    echo "Waiting 10 seconds for network startup!"
    sleep 10
    echo "Waited for network done!"

    echo "Booting StateAPI"
    cd StateAPI || { echo "Failed to enter StateAPI"; exit 1; }
    bash Deploy.sh
    cd ..

    echo "Boot complete"
} >> "$log_file" 2>&1