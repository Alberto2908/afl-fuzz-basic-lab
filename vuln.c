#include <stdio.h>
#include <string.h>

void vulnfunc(char *input) {
    char buf[64];
    strcpy(buf, input); // vulnerabilidad: sin límites
    if (strstr(buf, "MAGIC")) {
        puts("Has activado la ruta secreta!");
    } else {
        puts("OK");
    }
}

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Usage: %s <input>\n", argv[0]);
        return 1;
    }
    vulnfunc(argv[1]);
    return 0;
}
