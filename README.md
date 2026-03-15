# AFL++ Simple Lab (versión ligera)

Repositorio para la tarea colaborativa del Módulo 6.
Incluye 4 archivos: README.md, AFL_cheatsheet.md, vuln.c y run_fuzz.sh.

## Objetivo
Enseñar de forma sencilla el flujo básico de fuzzing con AFL++ sobre un programa vulnerable.

## Contenido
- `vuln.c`: programa C deliberadamente vulnerable (uso de strcpy).
- `run_fuzz.sh`: script simple para compilar y lanzar `afl-fuzz` (requiere afl++ instalado).
- `AFL_cheatsheet.md`: comandos y pasos rápidos.

## Cómo usar (rápido)
1. Copia el repositorio en tu máquina Linux.
2. Asegúrate de tener `afl-fuzz` (AFL++) instalado o `afl-clang-fast`.
3. Compila y lanza el fuzz con el script:
   ```bash
   chmod +x run_fuzz.sh
   ./run_fuzz.sh
   ```
4. El script compila `vuln.c`, crea un directorio `seeds` con un fichero inicial y arranca `afl-fuzz`.
