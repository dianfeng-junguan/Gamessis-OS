#pragma once
typedef unsigned char u8,byte,__u8;
typedef unsigned short u16,word,__le16,__u16;
typedef unsigned int u32,dword,__le32,__u32;
typedef unsigned long u64;
#define TRUE 1
#define FALSE 0
#define NULL (void*)0
typedef struct _list_{
    struct _list_* next;
    struct _list_* prev;
    void* data;
}list_t;
typedef struct {
    void* data;
    int head,tail;
    int size;
}queue_t;
#define QTAIL(QUEUE) (QUEUE.tail)
#define QHEAD(QUEUE) (QUEUE.head)
#define QSIZE(QUEUE) (QUEUE.size)
#define ENQUEUE(QUEUE,V) ((typeof(V)*)QUEUE.data)[QUEUE.tail]=V;QUEUE.tail=(QUEUE.tail+1)%QUEUE.size;