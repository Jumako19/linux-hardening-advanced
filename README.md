🛡 Linux Hardening Project – Bastionado Avanzado de Linux
Proyecto de ciberseguridad (Máster) – Seguridad en Sistemas Linux

📌 Descripción general del proyecto
Este repositorio contiene un proyecto completo de bastionado (hardening) de un sistema Linux, implementado y probado en Kali Linux.
Incluye:

Script principal de bastionado automatizado
Script de reversión de cambios
Conjunto de herramientas (tools) de auditoría y análisis
Informes reales generados durante las pruebas
Auditoría de integridad con AIDE
Escaneo de rootkits con rkhunter
Evidencias guardadas en la carpeta informes/
El objetivo es demostrar la capacidad de reducir la superficie de ataque, mejorar la seguridad del sistema y generar informes objetivos del estado final del equipo.

📁 Estructura del repositorio
linux-hardening-advanced/
 ├── scripts/
 │    ├── hardening.sh
 │    └── revert.sh
 ├── tools/
 │    ├── sysinfo.sh
 │    ├── audit_ssh.sh
 │    ├── scan_nmap.sh
 │    ├── integrity_check.sh
 │    └── run_rootkit_scan.sh
 ├── informes/
 │    ├── sysinfo.txt
 │    ├── audit_ssh.txt
 │    ├── nmap_scan.txt
 │    ├── integrity_check.txt
 │    └── rkhunter.txt
 ├── configs/
 ├── LICENSE
 └── README.md
🟦 1. Script principal: hardening.sh
El script automatiza las principales medidas de bastionado para un sistema Linux:

🔐 Incluye:
Actualización del sistema
Configuración del firewall (UFW)
Activación y configuración de Fail2ban
Endurecimiento de SSH:
sin contraseñas
sin root
banner legal
limitación de intentos
Activación de ASLR
Permisos seguros
Instalación y activación de AIDE
Escaneo con rkhunter
Deshabilitación de servicios innecesarios
▶️ Ejecución:
sudo ./scripts/hardening.sh
🟧 2. Script de reversión: revert.sh
Permite deshacer cambios críticos aplicados por el hardening.

▶️ Ejecución:
sudo ./scripts/revert.sh
Incluye revertir:

Configuración de SSH
Firewall
Fail2ban
Banner legal
🟩 3. Tools (Herramientas de auditoría)
Todas las herramientas están en tools/ y listas para usar.

📌 sysinfo.sh
Muestra:

Kernel
Usuarios
Servicios activos
Puertos en escucha
Procesos sospechosos
▶️ Ejecutar:

./tools/sysinfo.sh
📌 audit_ssh.sh
Comprueba el estado real de SSH tras el bastionado.

Valida:

PasswordAuthentication no
PermitRootLogin no
MaxAuthTries 3
Banner legal activo
▶️ Ejecutar:

./tools/audit_ssh.sh
📌 scan_nmap.sh
Escanea solo localhost (127.0.0.1).

▶️ Ejecutar:

./tools/scan_nmap.sh
Resultado en:

informes/nmap_scan.txt
📌 integrity_check.sh
No depende de AIDE.
Calcula hashes de archivos críticos:

/etc/passwd
/etc/shadow
/etc/ssh/sshd_config
▶️ Ejecutar:

./tools/integrity_check.sh
📌 run_rootkit_scan.sh
Escaneo con rkhunter para detectar rootkits conocidos.

▶️ Ejecutar:

sudo ./tools/run_rootkit_scan.sh
Resultado en:

informes/rkhunter.txt
🟪 4. Evidencias y auditorías
Todas las salidas se guardan en informes/.

Incluyen:

sysinfo
auditoría SSH
escaneo Nmap
integridad
rootkits
auditorías de AIDE
resultados del bastionado
Estas evidencias permiten demostrar que:

✔ El sistema fue bastionado correctamente
✔ Los scripts funcionan
✔ Las medidas de seguridad están activas
✔ El sistema quedó protegido frente a ataques comunes

🔥 5. Demostración del Hardening
🔒 Firewall UFW:
sudo ufw status
🔐 SSH endurecido:
grep -E "PasswordAuthentication|PermitRootLogin|MaxAuthTries" /etc/ssh/sshd_config
🛡 Fail2ban:
sudo systemctl status fail2ban
🧱 ASLR:
cat /proc/sys/kernel/randomize_va_space
🛡 6. AIDE – Auditoría de integridad
AIDE fue inicializado y configurado como IDS de integridad para detectar:

cambios no autorizados
manipulación de archivos críticos
alteraciones del sistema
Base generada en:

/var/lib/aide/aide.db
Evidencia guardada en:

informes/aide_check.txt
📤 7. Cómo ejecutar todo el proyecto
Ejecutar hardening:
sudo ./scripts/hardening.sh
Ejecutar todas las tools:
./tools/sysinfo.sh
./tools/audit_ssh.sh
./tools/scan_nmap.sh
./tools/integrity_check.sh
sudo ./tools/run_rootkit_scan.sh
Ejecutar revert:
sudo ./scripts/revert.sh
🚀 8. Conclusiones
Este proyecto demuestra:

Dominio de técnicas de bastionado Linux
Automatización completa mediante scripts
Análisis del estado del sistema mediante herramientas personalizadas
Auditorías reales con evidencias verificables
Uso de IDS básicos como AIDE y rkhunter
Reducción de superficie de ataque y mejora de la seguridad
Este repositorio está listo para ser evaluado en un entorno académico.

📬 Autor
Estudiante del Máster en Ciberseguridad
Año académico 2026
