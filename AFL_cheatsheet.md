# AFL++ Cheatsheet

## Preparar semillas (seeds)
- Crea un directorio `in_dir` con al menos un fichero de entrada. Ejemplo: `echo "hello" > in_dir/seed1`

## Comandos básicos
- Fuzzear un programa que usa el argumento `@@`:
  ```bash
  afl-fuzz -i in_dir -o out_dir -- ./vuln @@
  ```
- Si el programa lee desde stdin:
  ```bash
  afl-fuzz -i in_dir -o out_dir -- ./vuln < @@
  ```

## Minimizar y probar crashes
- Minimizar un testcase:
  ```bash
  afl-tmin -i crash.orig -o crash.min -- ./vuln @@
  ```
- Reproducir crash:
  ```bash
  ./vuln crash.min
  gdb --args ./vuln crash.min
  ```

## Consejos rápidos
- Usa `afl-clang-fast` si está disponible para mejor rendimiento.
- Si el binario no instrumenta: usa `afl-qemu`.
- Para debugging, compila con `-g` y/o usa ASAN (`-fsanitize=address`) para más detalles.

