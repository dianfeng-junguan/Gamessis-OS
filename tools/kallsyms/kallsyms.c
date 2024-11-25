#include <stdio.h>
#include <string.h>
#include <int.h>
int main(int argc,char **argv){
    if(argc==1)
    {
        printf("err: no input file.\n");
        return -1;
    }
    FILE *f=fopen(argv[1],"r");
    FILE *w=fopen("bin/kallsyms.bin","wb");
    ksym sym;
    while (1)
    {
        char string[512];
        int r=fscanf(f,"%llx %c %s\n",&sym.addr,&sym.type,string);
        if(r!=3&&r==EOF)break;
        sym.namelen=strlen(string);
        fwrite(&sym,sizeof(sym),1,w);
        fputs(string,w);
    }
    memset(&sym,0,sizeof(sym));
    fclose(f);
    fclose(w);
    return 0;
}