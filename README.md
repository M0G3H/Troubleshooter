#  Troubleshooter

A comprehensive diagnostic tool that performs automated health checks on all system components.

## Features

- 🔒 **Secure Boot Validation** - Checks and warns if Secure Boot is enabled
- 📦 **Kernel Module Verification** - Validates KO file loading status
- ⚙️ **Service Health Check** - Monitors all  services:
  - -test1.service
  - -test2.service
  - -test3.service
- 🔧 **Binary Integrity** - Verifies existence of required binaries
- 🌐 **Server Status** - Checks -server configuration

## Color-Coded Output

- 🟢 Green = Everything is working correctly
- 🔴 Red = Issue detected requiring attention

## Requirements

- Root/sudo privileges
- Systemd-based Linux distribution

## Usage

```bash
sudo ./troubleshoot.sh
