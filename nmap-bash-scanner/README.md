# Automated Network Reconnaissance Tool

## Features
- Ping scan, port scan, OS detection.
- Input single target or batch via file.
- Saves scans to timestamped logs in `results/`.

## Usage
```bash
chmod +x scan.sh
./scan.sh
```

Enter a single IP/domain or provide a text file (`targets.txt`) with one target per line.

## Requirements
- Linux with Bash
- Nmap installed (`sudo apt install nmap`)

## Folder Structure
```
nmap-bash-scanner/
├── scan.sh
├── targets.txt
├── results/
│   └── [target]_[timestamp].txt
├── README.md
└── LICENSE
```

## License
MIT License
