#!/bin/bash
echo "[+] Escaneando puertos abiertos con Nmap..."
nmap -sV -O localhost | tee nmap_scan.txt
echo "[+] Informe guardado en nmap_scan.txt"
