#!/bin/bash
set -e
# Script simple para compilar vuln.c y lanzar afl-fuzz (requiere afl++)

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)/.."
cd "$ROOT_DIR"

# Compilar
if command -v afl-clang-fast >/dev/null 2>&1; then
  CC=afl-clang-fast
elif command -v afl-gcc >/dev/null 2>&1; then
  CC=afl-gcc
else
  CC=gcc
  echo "[!] No se detectó afl-clang-fast ni afl-gcc. Se usará gcc sin instrumentación (menor efectividad)."
fi

echo "[*] Compilando con $CC"
$CC -g -O2 -o vuln vuln.c || { echo "Compilación fallida"; exit 1; }

# Preparar seeds
IN_DIR=seeds
OUT_DIR=afl_out
mkdir -p "$IN_DIR"
echo "hello" > "$IN_DIR/seed1"

echo "[*] Lanzando afl-fuzz (input: $IN_DIR, output: $OUT_DIR)"
echo "Si no tienes afl-fuzz instalado, detén este script (CTRL+C) y instala AFL++."

afl-fuzz -i "$IN_DIR" -o "$OUT_DIR" -- ./vuln @@
