import getopt,sys
opts,arg=getopt.getopt(sys.argv[1:],"i:o:t:")
for a, arg in opts:
    if a=='-i':
        global inp
        inp=arg
    elif a=='-o':
        global op
        op=arg
    elif a=='-t':
        global template
        template=arg
templatetxt=''
ints=''
with open(template,'r') as tmplf:
    templatetxt=tmplf.read()
with open(inp,'r') as inf:
    ints=inf.readlines()
with open(op,'w') as of:
    of.write('extern common_int_handler\n')
    for line in ints:
        args=line.split(' ')
        args[1]=('_'+args[1]).strip()
        sub=templatetxt%(args[1],args[1],int(args[0]))
        of.write(sub)
