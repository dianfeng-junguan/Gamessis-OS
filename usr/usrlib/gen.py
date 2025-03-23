import os
inp=open('usr/usrlib/syscalls.list','r')
asmo=open('usr/usrlib/syscalls.asm','w')
# co=open('res/syscalls.c','w')
templates=open('usr/usrlib/template.s','r')
templc=open('usr/usrlib/c_template.txt','r')
template_asm=templates.read()
ctemp=templc.read()
templates.close()
txt=inp.readlines()
inp.close()
templc.close()
for line in txt:
    args=line.split(' ')
    p=0
    name=''
    num=0
    argnum=0
    for a in args:
        if len(a)==0:
            continue
        if p==0:
            name=a.lower()
            p+=1
        elif p==1:
            num=int(a)
            p+=1
        elif p==2:
            argnum=int(a)
            break
    #template 实例.s
    nameslash=name
    sub=template_asm%(nameslash,nameslash,num)
    # subc=templc%(name,)
    asmo.write(sub)
    # co.write("int _%s("%(name))
    # for i in range()
asmo.close()