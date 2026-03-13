<p align="center">
  <img src="https://img.shields.io/badge/Linux-Hardening%20Project-Security%20%F0%9F%94%92-blue?style=for-the-badge">
</p>

<h1 align="center">🛡️ Proyecto de Bastionado de Linux</h1>

<p align="center">
  <b>Automatización completa de hardening, auditoría y análisis de seguridad en sistemas Linux</b>
</p>

---

<p align="center">
  <img src="https://img.shields.io/badge/Estado-Completado-brightgreen?style=flat-square">
  <img src="https://img.shields.io/badge/Plataforma-Linux-blue?style=flat-square">
  <img src="https://img.shields.io/badge/Seguridad-Hardening-red?style=flat-square">
  <img src="https://img.shields.io/badge/Licencia-MIT-lightgrey?style=flat-square">
</p>


## 📑 Índice

- [Descripción general](#-descripción-general)
- [Estructura del proyecto](#-estructura-del-proyecto)
- [Scripts](#-scripts-principales)
- [Tools](#-herramientas-de-auditoría)
- [Evidencias reales](#-evidencias-reales)
- [Resultados del hardening](#-resultados-del-hardening)
- [Conclusiones](#-conclusiones)
- [Autor](#-autor)


## 📝 Descripción general

Este proyecto implementa un **bastionado avanzado de un sistema Linux**, incluyendo:

- 🔐 Hardening completo automatizado  
- 🛡️ Firewall UFW  
- 🚫 Bloqueo de root y contraseñas SSH  
- 🧱 ASLR y protecciones del kernel  
- 🪤 Fail2ban  
- 📁 Auditorías con herramientas personalizadas  
- 🧬 Verificación de integridad  
- 🔍 Escaneo de rootkits  

Todo ello acompañado de **informes reales generados en la carpeta `/informes/`**.


## 🧾 Scripts principales

### 🔥 `hardening.sh`
Automatiza el bastionado completo:

- Configura firewall  
- Activa Fail2ban  
- Protege SSH  
- Aplica ASLR  
- Instala AIDE  
- Deshabilita servicios inseguros

**Ejecución:**
```bash
sudo ./scripts/hardening.sh


## ♻️ Script de Reversión — `revert.sh`

Este script deshace los cambios aplicados por el proceso de bastionado y devuelve el sistema a un estado anterior más permisivo.

### 🔄 Cambios que revierte:

- 🔐 Restaura las opciones originales de SSH  
- 🚫 Elimina el banner legal  
- 🛑 Detiene y deshabilita Fail2ban  
- 🔥 Desactiva el firewall UFW  
- 🧹 Elimina la configuración de `umask 027`  
- ♻️ Revierte parámetros añadidos por el hardening  

---

### 🔧 Código del script:
```bash
#!/bin/bash

echo "[+] Revirtiendo configuración del sistema..."

echo "[+] Restaurando configuración SSH..."
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin no/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
sed -i '/MaxAuthTries 3/d' /etc/ssh/sshd_config
sed -i '/ClientAliveInterval 300/d' /etc/ssh/sshd_config
sed -i '/ClientAliveCountMax 2/d' /etc/ssh/sshd_config

echo "[+] Eliminando banner legal..."
sed -i '/Banner \/etc\/issue.net/d' /etc/ssh/sshd_config
rm -f /etc/issue.net

echo "[+] Reiniciando SSH..."
systemctl restart ssh

echo "[+] Desactivando Fail2ban..."
systemctl disable --now fail2ban 2>/dev/null

echo "[+] Desactivando firewall UFW..."
ufw disable 2>/dev/null

echo "[+] Restaurando umask por defecto..."
sed -i '/umask 027/d' /etc/profile

echo "[+] Restauración completada."




