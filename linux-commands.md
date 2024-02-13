# Linux Commands Cheat Sheet - Advanced

## Table of Contents
1. [System Information](#system-information)
2. [System Monitoring and Performance](#system-monitoring-and-performance)
3. [File and Directory Operations](#file-and-directory-operations)
4. [Network Operations](#network-operations)
5. [User and Group Management](#user-and-group-management)
6. [Permissions and Ownership](#permissions-and-ownership)
7. [Package Management](#package-management)
8. [Disk Management](#disk-management)
9. [System Services](#system-services)
10. [Backup and Transfer](#backup-and-transfer)
11. [Text Processing](#text-processing)
12. [Process Management](#process-management)
13. [System Security](#system-security)
14. [Logs and Auditing](#logs-and-auditing)
15. [Kernel and Boot Management](#kernel-and-boot-management)
16. [Miscellaneous Commands](#miscellaneous-commands)

## System Information
- `lscpu`: View CPU information.
- `free -m`: Display memory information.
- `df -h`: Check disk usage.
- `lspci`: List PCI devices.
- `lsusb`: List USB devices.
- `uname -a`: Display system information.

## System Monitoring and Performance
- `top`: Task manager.
- `htop`: Enhanced real-time system monitoring.
- `vmstat`: Report virtual memory statistics.
- `iostat`: Monitor system input/output device loading.
- `netstat -tuln`: Check open ports.

## File and Directory Operations
- `find / -name filename.txt`: Find files by name.
- `grep 'text' filename`: Search for text within files.
- `du -sh *`: Display directory sizes in the current directory.
- `tar -czvf archive.tar.gz /folder`: Compress a directory.
- `rsync -av source/ destination/`: Synchronize files/directories between two locations.

## Network Operations
- `ifconfig`: Display or configure a network interface.
- `ping host`: Check the network connection to a host.
- `traceroute host`: Trace the route packets take to a network host.
- `ssh user@host`: Connect to a host via SSH.
- `scp file user@host:/path`: Securely copy files between hosts.

## User and Group Management
- `useradd -m username`: Create a new user.
- `passwd username`: Set or change a user's password.
- `groupadd groupname`: Create a new group.
- `usermod -aG groupname username`: Add a user to a group.
- `id username`: Display user and group IDs.

## Permissions and Ownership
- `chmod 755 file`: Change file permissions.
- `chown user:group file`: Change file owner and group.
- `umask 022`: Set the default creation permissions.

## Package Management
- `apt-get update && apt-get upgrade`: Update and upgrade packages (Debian-based).
- `yum update && yum upgrade`: Update and upgrade packages (RPM-based).
- `pip install package`: Install a Python package.

## Disk Management
- `fdisk -l`: List disk partitions.
- `mkfs.ext4 /dev/sdx1`: Format a partition with the ext4 filesystem.
- `mount /dev/sdx1 /mnt`: Mount a filesystem.

## System Services
- `systemctl start service`: Start a service.
- `systemctl stop service`: Stop a service.
- `systemctl enable service`: Enable a service to start at boot.
- `systemctl status service`: Check the status of a service.

## Backup and Transfer
- `tar -czvf backup.tar.gz /directory`: Create a compressed backup.
- `rsync -avz source/ destination/`: Efficiently transfer files remotely.

## Text Processing
- `awk '{print $1}' file`: Process text (print first column).
- `sed 's/find/replace/g' file`: Replace text in a file.
- `sort file`: Sort lines in a text file.
- `uniq file`: Report or omit repeated lines.

## Process Management
- `ps -ef`: Display currently active processes.
- `kill pid`: Kill a process by PID.
- `pkill processname`: Kill processes by name.
- `nohup command &`: Run a command immune to hangups.

## System Security
- `iptables -L`: List firewall rules.
- `fail2ban-client status`: Check Fail2Ban status.
- `chmod 700 /directory`: Restrict access to a directory.

## Logs and Auditing
- `journalctl -u service`: View logs for a service.
- `logrotate`: Rotate, compress, and mail system logs.

## Kernel and Boot Management (Continued)
- `update-grub`: Update the GRUB bootloader configuration.
- `dmesg`: Display kernel-related messages and diagnostics.
- `sysctl -p`: Reload the kernel parameters from `/etc/sysctl.conf`.

## Miscellaneous Commands (Continued)
- `watch command`: Execute a program periodically, showing output fullscreen.
- `alias newcommand='command sequence'`: Create an alias for a command or sequence of commands.
- `lsof -i`: List open files and their corresponding network connections.
- `crontab -e`: Edit crontab to schedule scripts.
- `uptime`: Show how long the system has been running, along with load average.