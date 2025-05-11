#!/bin/bash

echo "=== Automated Nmap Bash Scanner ==="

read -p "Enter a single IP/domain or path to a list file: " input

mkdir -p results

# Function to perform scan
scan_target() {
    target=$1
    timestamp=$(date +"%Y%m%d_%H%M%S")
    filename="results/${target//./_}_$timestamp.txt"

    echo -e "\nScanning $target..."
    echo "Output will be saved to $filename"

    {
        echo "=== Scan Report for $target ==="
        echo "Date: $(date)"
        echo "----------------------------------"
        echo -e "\n[Ping Scan]"
        nmap -sn $target
        echo -e "\n[Port Scan - All Ports]"
        nmap -p- $target
        echo -e "\n[OS and Service Version Detection]"
        nmap -A $target
    } | tee "$filename"

    echo -e "\nScan of $target completed."
}

# Check if input is a file
if [[ -f "$input" ]]; then
    echo "Reading targets from file: $input"
    while read -r line; do
        [[ -z "$line" || "$line" =~ ^# ]] && continue
        scan_target "$line"
    done < "$input"
else
    scan_target "$input"
fi

echo -e "\nAll scans completed."
