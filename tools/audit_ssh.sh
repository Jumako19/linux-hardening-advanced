#!/bin/bash

echo "=== Auditoría SSH ==="

echo "[+] PasswordAuthentication:"
grep "^PasswordAuthentication" /etc/ssh/sshd_config

echo "[+] PermitRootLogin:"
grep "^PermitRootLogin" /etc/ssh/sshd_config

echo "[+] MaxAuthTries:"
grep "^MaxAuthTries" /etc/ssh/sshd_config

echo "[+] Banner:"
grep "^Banner" /etc/ssh/sshd_config

echo "[+] Puertos SSH en escucha:"
ss -tulnp | grep ssh

echo "=== Auditoría completada ==="
