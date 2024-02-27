#include "phases.h"

char buf[80];

void explode() {
    printf("Bomb exploded! If this was a real assignment, you'd have lost 5%% of the assignment score now.\n");
    exit(-1);
}

char *read_line() {
    char * a = fgets(buf, 79, stdin);
    if (!a) 
        return NULL;
    while(*a++!='\n');
    *--a = 0;
    return buf;
}

int len(char *a) {
    int b;
    for(b=0;a[b];b++);
    return b;
}

int cmp(char*a, char*b) {
    int c;
    for(c=0;a[c]==b[c] && a[c];c++);
    return c;
}



void phase_1(void * in) {
    if(len(in) == len("custom string")) {
        int c = cmp(in, "custom string");
        if(c == len("custom string"))
            return;
    }
    explode();
}