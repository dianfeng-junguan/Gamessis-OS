#define MAX_SYMTABS 32
static int dl_init(void* load_offset);
void       set_symtab(void* symtab, int modid);
static int reg_module();

static void dl_runtime_resolve();

void fill_reloc(void* rel, int modid, void* symtab, int rela);

static unsigned long long get_sym_addr(unsigned long modid, unsigned long symi);

int         dlstrcmp(char* src, char* dst);
int         load_elfso(int fildes);
static void init_fill_reloc(void* relp, unsigned long long load_base, void* symtab, int rela,
                            unsigned long long igot);

static char* lookup_strtab(char* strtab, int index);