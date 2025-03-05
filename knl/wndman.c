#include "wndman.h"
#include "typename.h"
#include "memman.h"
#include "framebuffer.h"
#include "str.h"
#ifdef DEBUG
#    include <stdio.h>
#    include <stdlib.h>
#    include <string.h>
#    define KMALLOC(size) malloc(size)
#    define KFREE(ptr) free(ptr)
#else
#    define KMALLOC(size) kmalloc(size, NO_ALIGN)
#    define KFREE(ptr) kfree(ptr)
#endif
#ifdef DEBUG
#    include <windows.h>
extern HDC     hdc;
extern HDC     hMemDC;
extern HBITMAP hBitmap;
extern HWND    hWnd;
#endif
static int listener_id_gen        = 0;
int        need_to_update_display = 0;
#define LISTENER_ID (listener_id_gen++)
window_t*                g_windows;
window_event_listener_t* g_event_listeners                        = NULL;
window_event_t*          g_event_queue                            = NULL;
window_event_handler_t   g_default_event_handlers[WNDEVENT_COUNT] = {
    [WND_EVENT_MOUSE_MOVE]         = default_mouse_move_event_handler,
    [WND_EVENT_MOUSE_DOWN]         = default_mouse_down_event_handler,
    [WND_EVENT_MOUSE_UP]           = default_mouse_up_event_handler,
    [WND_EVENT_MOUSE_DOUBLE_CLICK] = default_mouse_double_click_event_handler,
    [WND_EVENT_MOUSE_WHEEL]        = default_mouse_wheel_event_handler,
    [WND_EVENT_KEY_DOWN]           = default_key_down_event_handler,
    [WND_EVENT_KEY_UP]             = default_key_up_event_handler,
    [WND_EVENT_KEY_PRESS]          = default_key_press_event_handler,
    [WND_EVENT_WINDOW_RESIZE]      = default_window_resize_event_handler,
    [WND_EVENT_WINDOW_MOVE]        = default_window_move_event_handler,
    [WND_EVENT_WINDOW_CLOSE]       = default_window_close_event_handler,
    [WND_EVENT_WINDOW_FOCUS]       = default_window_focus_event_handler,
    [WND_EVENT_WINDOW_LOST_FOCUS]  = default_window_lost_focus_event_handler,
};
void _wnd_list_add(window_t** list, window_t* wnd)
{
    window_t* p = *list;
    if (!p) {
        *list              = wnd;
        wnd->next_as_child = NULL;
        wnd->prev_as_child = NULL;
        return;
    }
    while (p->next_as_child) {
        p = p->next_as_child;
    }
    p->next_as_child   = wnd;
    wnd->prev_as_child = p;
    wnd->next_as_child = NULL;
}
void _wnd_list_remove(window_t** list, window_t* wnd)
{
    if (!*list) {
        return;
    }
    if (*list == wnd) {
        *list = wnd->next_as_child;
        if (*list) {
            (*list)->prev_as_child = NULL;
        }
        wnd->next_as_child = NULL;
        wnd->prev_as_child = NULL;
        return;
    }
    window_t* p = *list;
    while (p->next_as_child) {
        if (p->next_as_child == wnd) {
            p->next_as_child = wnd->next_as_child;
            if (p->next_as_child) {
                p->next_as_child->prev_as_child = p;
            }
            wnd->next_as_child = NULL;
            wnd->prev_as_child = NULL;
            return;
        }
        p = p->next_as_child;
    }
}
void default_mouse_move_event_handler(windowptr_t wndptr, int event_type, window_event_t* event)
{
#ifdef DEBUG
    // printf("default_mouse_move_event_handler: wndptr=%d, x=%d, y=%d\n", wndptr, event->x,
    // event->y);
#endif
}
void default_mouse_down_event_handler(windowptr_t wndptr, int event_type, window_event_t* event)
{
    switch (wndptr->type) {
    case WNDTYPE_BUTTON:
    {
        button_data_t* data = (button_data_t*)wndptr->specific_data;
        data->pressed       = 1;
        break;
    }
    }
#ifdef DEBUG
    printf("default_mouse_down_event_handler: wndptr=%p, x=%d, y=%d, button=%d\n",
           wndptr,
           event->x,
           event->y,
           event->mouse_button);
    RedrawWindow(hWnd, NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW);
#endif
}
void default_mouse_up_event_handler(windowptr_t wndptr, int event_type, window_event_t* event)
{
    switch (wndptr->type) {
    case WNDTYPE_BUTTON:
    {
        button_data_t* data = (button_data_t*)wndptr->specific_data;
        data->pressed       = 0;
        break;
    }
    }
#ifdef DEBUG
    RedrawWindow(hWnd, NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW);
#endif
}
void default_mouse_double_click_event_handler(windowptr_t wndptr, int event_type,
                                              window_event_t* event)
{}
void default_mouse_wheel_event_handler(windowptr_t wndptr, int event_type, window_event_t* event) {}
void default_key_down_event_handler(windowptr_t wndptr, int event_type, window_event_t* event)
{
    //如果wndptr是编辑框，则将按下的键码添加到文本缓冲区
    if (wndptr->type == WNDTYPE_EDITBOX) {
        editbox_data_t* data = (editbox_data_t*)wndptr->specific_data;
        char            c    = event->key_code;
        long long       len  = strlenk(data->text);
        if (c == '\b') {   //退格键
            if (len > 0) {
                len--;
                data->text[len] = '\0';
            }
        }
        else {
            //回车键
            // TODO 发送窗口事件
            if (len == data->text_buf_len - 1) {
                char* new_text =
                    KMALLOC(data->text_buf_len * 2 > len + 1 ? data->text_buf_len * 2 : len + 1);
                strcpyk(new_text, data->text);
                KFREE(data->text);
                data->text = new_text;
                data->text_buf_len *= 2;
            }
            data->text[len] = c;
            len++;
            data->text[len] = '\0';
        }
    }
#ifdef DEBUG
    printf("default_key_down_event_handler: wndptr=%p, key_code=%d\n", wndptr, event->key_code);
    RedrawWindow(hWnd, NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW);
#endif
}
void default_key_up_event_handler(windowptr_t wndptr, int event_type, window_event_t* event) {}
void default_key_press_event_handler(windowptr_t wndptr, int event_type, window_event_t* event) {}
void default_window_resize_event_handler(windowptr_t wndptr, int event_type, window_event_t* event)
{}
void default_window_move_event_handler(windowptr_t wndptr, int event_type, window_event_t* event)
{
    _offset_window(wndptr, event->dx, event->dy);
#ifdef DEBUG
    RedrawWindow(hWnd, NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW);
#endif
}
void default_window_close_event_handler(windowptr_t wndptr, int event_type, window_event_t* event)
{
    while (wndptr->parent) {
        wndptr = wndptr->parent;
    }
    destroy_window(wndptr);
#ifdef DEBUG
    RedrawWindow(hWnd, NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW);
#endif
}
void default_window_focus_event_handler(windowptr_t wndptr, int event_type, window_event_t* event)
{}
void default_window_lost_focus_event_handler(windowptr_t wndptr, int event_type,
                                             window_event_t* event)
{}
void default_timer_event_handler(windowptr_t wndptr, int event_type, window_event_t* event) {}
int  init_wndman()
{
    g_windows = NULL;   //(int)KMALLOC(sizeof(window_t) * MAX_WINDOWS);s
    // TODO 向时钟中断注册处理消息的函数

    return 0;
}
windowptr_t create_window(char* title, int wnd_type)
{
    if (wnd_type < 0 || wnd_type > WNDTYPE_TREEVIEW) {
        return NULL;
    }
    if (wnd_type == WNDTYPE_WINDOW) {
        windowptr_t btn  = _create_control("X", WNDTYPE_BUTTON);
        windowptr_t wndp = _create_control(title, WNDTYPE_WINDOW);
        wndp->width      = DEFAULT_WINDOW_WIDTH;
        wndp->height     = DEFAULT_WINDOW_HEIGHT;
        wndp->x          = 100;
        wndp->y          = 100;
        _wnd_list_add(&g_windows, wndp);
        btn->width  = 20;
        btn->height = 20;
        btn->x      = wndp->width - 20 - 2;
        btn->y      = 3;
        show_window(btn);

        attach_window(btn, wndp);
        set_window_event_handler(btn, WND_EVENT_MOUSE_UP, _wndpresethandler_closebutton_clicked);
        return wndp;
    }
    else {
        return _create_control(title, wnd_type);
    }
}
windowptr_t _create_control(char* title, int wnd_type)
{
    // 初始化窗口的基本信息
    window_t* wndp      = KMALLOC(sizeof(window_t));
    wndp->state         = WNDSTATE_PRESENT;
    wndp->x             = 0;
    wndp->y             = 0;
    wndp->width         = 100;
    wndp->height        = 100;
    wndp->type          = wnd_type;
    wndp->parent        = NULL;
    wndp->children      = NULL;
    wndp->next_as_child = NULL;
    wndp->prev_as_child = NULL;
    wndp->destructor    = NULL;
    wndp->specific_data = NULL;
    // 复制窗口标题
    strncpyk(wndp->title, title, sizeof(wndp->title) - 1);
    wndp->title[sizeof(wndp->title) - 1] = '\0';
    memcpy(wndp->event_handlers, g_default_event_handlers, sizeof(g_default_event_handlers));

    switch (wnd_type) {
    case WNDTYPE_BUTTON:
    {
        button_data_t* data = KMALLOC(sizeof(button_data_t));
        data->pressed       = 0;
        wndp->specific_data = data;
        break;
    }
    case WNDTYPE_EDITBOX:
    {
        editbox_data_t* data = KMALLOC(sizeof(editbox_data_t));
        data->text_buf_len   = 1024;
        data->text           = KMALLOC(data->text_buf_len);
        memset(data->text, 0, 1024);
        wndp->destructor    = _editbox_dtor;
        wndp->specific_data = data;
        break;
    }
    }
    return wndp;
}

/**
    @brief 销毁窗口
    @param wndptr 要销毁的窗口
    @return 0 成功，-1 失败
*/
int destroy_window(windowptr_t wndptr)
{
    if (!wndptr) {
        return -1;
    }
    wndptr->state |= WNDSTATE_DESTROYED;
    wndptr->state = 0;
    if (wndptr->destructor) {
        wndptr->destructor(wndptr);
    }
    if (wndptr->specific_data) {
        KFREE(wndptr->specific_data);
        wndptr->specific_data = NULL;
    }
    if (wndptr->children) {
        window_t* p = wndptr->children;
        while (p) {
            window_t* q = p->next_as_child;
            destroy_window(p);
            p = q;
        }
    }
    if (!wndptr->parent) {
        //是顶层窗口，需要从窗口列表中移除
        _wnd_list_remove(&g_windows, wndptr);
    }
    KFREE(wndptr);

    return 0;
}

/**
    @brief 将窗口附加到父窗口上
    @param wndptr 要附加的窗口
    @param parent 父窗口
    @return 0 成功，-1 失败
*/
int attach_window(windowptr_t wndptr, windowptr_t parent_wndptr)
{
    if (!wndptr || !parent_wndptr) {
        return -1;
    }
    if (!parent_wndptr->children) {
        parent_wndptr->children = wndptr;
    }
    _wnd_list_add(&parent_wndptr->children, wndptr);
    wndptr->parent = parent_wndptr;
    // for (window_t* p = parent_wndptr->children; p; p = p->next_as_child) {
    //     if (!p->next_as_child) {
    //         p->next_as_child = wndptr;
    //         wndptr->prev_as_child = p;
    //         wndptr->next_as_child = NULL;
    //         wndptr->parent = parent_wndptr;
    //         return 0;
    //     }
    // }

    return 0;
}

/**
    @brief 将窗口从父窗口上分离
    @param wndptr 要分离的窗口
    @return 0 成功，-1 失败
*/
int detach_window(windowptr_t wnd)
{
    wnd->parent = NULL;
    if (wnd->prev_as_child)
        wnd->prev_as_child->next_as_child = wnd->next_as_child;
    if (wnd->next_as_child)
        wnd->next_as_child->prev_as_child = wnd->prev_as_child;
    wnd->next_as_child = NULL;
    wnd->prev_as_child = NULL;
    return 0;
}

/**
    @brief 根据标题获取窗口
    @param title 窗口标题
    @param wndptr 用于存储找到的窗口
    @return 0 成功，-1 失败
*/
windowptr_t get_window_by_title(char* title)
{
    //链表查找
    for (windowptr_t p; p; p = p->next_as_child) {
        if (strcmpk(p->title, title) == 0) {
            return p;
        }
    }
    return NULL;
}
windowptr_t _get_collided_window(windowptr_t wnd, int x, int y)
{
    // TODO 子控件发送消息
    if (wnd && wnd->state & WNDSTATE_PRESENT && !(wnd->state & WNDSTATE_DESTROYED) &&
        wnd->state & WNDSTATE_VISIBLE) {
        //在范围内
        if (wnd->children) {
            for (windowptr_t child = wnd->children; child; child = child->next_as_child) {
                windowptr_t collided = _get_collided_window(child, x - wnd->x, y - wnd->y);
                if (collided) {
                    return collided;
                }
            }
        }
        if (x >= wnd->x && x < wnd->x + wnd->width && y >= wnd->y && y < wnd->y + wnd->height) {
            return wnd;
        }
    }
    return NULL;
}
windowptr_t get_window_by_pos(int x, int y, int layer)
{
    window_t* wnd = g_windows;
    if (!wnd) {
        return NULL;
    }
    //先到结尾，结尾的窗口在最前面
    for (; wnd->next_as_child; wnd = wnd->next_as_child) {}
    for (; wnd; wnd = wnd->prev_as_child) {
        windowptr_t collided = _get_collided_window(wnd, x, y);
        if (collided) {
            return collided;
        }
    }
    return NULL;
}
int _offset_window(windowptr_t wnd, int dx, int dy)
{
    wnd->x += dx;
    wnd->y += dy;
    return 0;
}
/**
    @brief 移动窗口
    @param wndptr 要移动的窗口
    @param x 新的x坐标
    @param y 新的y坐标
    @return 0 成功，-1 失败
*/
int move_window(windowptr_t wndptr, int x, int y)
{
    int dx = x - wndptr->x;
    int dy = y - wndptr->y;
    _offset_window(wndptr, dx, dy);
    return 0;
}

/**
    @brief 调整窗口大小
    @param wndptr 要调整大小的窗口
    @param width 新的宽度
    @param height 新的高度
    @return 0 成功，-1 失败
*/
int resize_window(windowptr_t wndptr, int width, int height)
{
    wndptr->width  = width;
    wndptr->height = height;
    return 0;
}

/**
    @brief 设置窗口标题
    @param wndptr 要设置标题的窗口
    @param title 新的窗口标题
    @return 0 成功，-1 失败
*/
int set_window_title(windowptr_t wndptr, char* title)
{
    strncpyk(wndptr->title, title, sizeof(wndptr->title) - 1);
    wndptr->title[sizeof(wndptr->title) - 1] = '\0';
    return 0;
}

/**
    @brief 获取窗口标题
    @param wndptr 要获取标题的窗口
    @param title 用于存储窗口标题的缓冲区
    @return 0 成功，-1 失败
*/
int get_window_title(windowptr_t wndptr, char* title)
{

    window_t* wnd = wndptr;
    strncpyk(title, wnd->title, sizeof(wnd->title));
    return 0;
}

/**
    @brief 设置窗口状态
    @param wndptr 要设置状态的窗口
    @param state 新的窗口状态
    @return 0 成功，-1 失败
*/
int set_window_state(windowptr_t wndptr, int state)
{

    window_t* wnd = wndptr;
    wnd->state    = state;
    return 0;
}
/**
    @brief 获取窗口状态
    @param wndptr 要获取状态的窗口
    @param state 用于存储窗口状态的指针
    @return 0 成功，-1 失败
*/
int get_window_state(windowptr_t wndptr, int* state)
{

    window_t* wnd = wndptr;
    *state        = wnd->state;
    return 0;
}

/**
    @brief 显示窗口
    @param wndptr 要显示的窗口
    @return 0 成功，-1 失败
*/
int show_window(windowptr_t wndptr)
{

    // 这里可以添加显示窗口的具体逻辑
    wndptr->state |= WNDSTATE_VISIBLE;
    return 0;
}

/**
    @brief 隐藏窗口
    @param wndptr 要隐藏的窗口
    @return 0 成功，-1 失败
*/
int hide_window(windowptr_t wndptr)
{

    // 这里可以添加隐藏窗口的具体逻辑
    wndptr->state &= ~WNDSTATE_VISIBLE;
    return 0;
}

/**
    @brief 设置窗口事件处理函数
    @param wndptr 要设置的窗口
    @param handler 事件处理函数
    @return 0 成功，-1 失败
*/
int set_window_event_handler(windowptr_t wndptr, int event_type, window_event_handler_t handler)
{

    if (event_type < 0 || event_type >= WNDEVENT_COUNT) {
        return -1;
    }
    wndptr->event_handlers[event_type] = handler;
    return 1;
}

/**
    @brief 发送窗口事件
    @param wndptr 要发送事件的窗口
    @param event 要发送的事件
    @return 0 成功，-1 失败
*/
int send_window_event(windowptr_t wndptr, window_event_t* event)
{

    if (event->event_type < 0 || event->event_type >= WNDEVENT_COUNT) {
        return -1;
    }
    window_event_t* new_event = (window_event_t*)KMALLOC(sizeof(window_event_t));
    if (new_event == NULL) {
        return -1;
    }
    memcpy(new_event, event, sizeof(window_event_t));
    if (!g_event_queue) {
        g_event_queue = new_event;
    }
    else {
        window_event_t* tail = g_event_queue;
        for (; tail->next; tail = tail->next) {}
        tail->next      = new_event;
        new_event->next = NULL;
    }
    return 0;
}

/**
    @brief 添加窗口事件监听器
    @param wndptr 要添加监听器的窗口
    @param event_type 要监听的事件类型
    @param listener 监听器函数
    @return 返回监听器ID，用于移除监听器
*/
int add_window_event_listener(windowptr_t wndptr, int event_type,
                              window_event_handler_t listenerfunc)
{

    if (event_type < 0 || event_type >= WNDEVENT_COUNT) {
        return -1;
    }
    window_event_listener_t* listener =
        (window_event_listener_t*)KMALLOC(sizeof(window_event_listener_t));
    if (listener == NULL) {
        return -1;
    }
    listener->wndptr             = wndptr;
    listener->event_type         = event_type;
    listener->listener           = listenerfunc;
    listener->next               = g_event_listeners;
    g_event_listeners            = listener;
    return listener->listener_id = LISTENER_ID;
}

/**
    @brief 移除窗口事件监听器
    @param wndptr 要移除监听器的窗口
    @param event_type 要移除的事件类型
    @param listener_id 要移除的监听器ID
    @return 0 成功，-1 失败
*/
int remove_window_event_listener(windowptr_t wndptr, int event_type, int listener_id)
{

    if (event_type < 0 || event_type >= WNDEVENT_COUNT) {
        return -1;
    }
    for (window_event_listener_t *p = g_event_listeners, *prev = p; p; prev = p, p = p->next) {
        if (p->wndptr == wndptr && p->event_type == event_type && p->listener_id == listener_id) {
            prev->next    = p->next;
            p->event_type = -1;
            KFREE(p);
            if (p == g_event_listeners) {
                g_event_listeners = p->next;
            }
            return 0;
        }
    }
    return -1;
}
void deal_events()
{
    window_event_t* event = g_event_queue;
    while (event) {
        //执行handler
        window_t* wnd = event->sender;
        if (!event->sender) {

            goto next;
        }
        if (wnd->event_handlers[event->event_type]) {
            wnd->event_handlers[event->event_type](event->sender, event->event_type, event);
        }
        //执行listener
        for (window_event_listener_t* listener = g_event_listeners; listener;
             listener                          = listener->next) {
            if (listener->wndptr == event->sender && listener->event_type == event->event_type) {
                listener->listener(event->sender, event->event_type, event);
            }
        }
    next:;
        window_event_t* next = event->next;
        KFREE(event);
        event = next;
    }
    g_event_queue = NULL;
}
static int  clicked_times = 0;
int         mouse_down_x, mouse_down_y, mouse_down_button;
int         last_mouse_move_x, last_mouse_move_y;
int         g_setted_mouse_consecutive_click_max_time = 20;
static int  mouse_click_timer                         = 0;
windowptr_t last_mouse_down_wndptr                    = NULL;
int         last_mouse_down_button                    = -1;
windowptr_t g_focused_wndptr                          = NULL;
static int  last_key_code_down                        = -1;
static int  mouse_down_flags[3]                       = {0, 0, 0};
void        _on_clock_int()
{
    if (++mouse_click_timer >= g_setted_mouse_consecutive_click_max_time) {
        mouse_click_timer = 0;
        clicked_times     = 0;
    }
    deal_events();
#ifndef DEBUG
    _render_windows();
#endif
}
void _on_mouse_down(int x, int y, int button)
{
    mouse_down_x             = last_mouse_move_x;   // x;
    mouse_down_y             = last_mouse_move_y;   // y;
    mouse_down_button        = button;
    mouse_down_flags[button] = 1;
    last_mouse_down_button   = button;
    windowptr_t wndptr = last_mouse_down_wndptr = get_window_by_pos(mouse_down_x, mouse_down_y, 0);
    g_focused_wndptr                            = wndptr;
    if (wndptr) {
        need_to_update_display = 1;
        window_event_t event   = {
            .event_type   = WND_EVENT_MOUSE_DOWN,
            .sender       = wndptr,
            .mouse_button = button,
            .x            = x,
            .y            = y,
        };
        send_window_event(wndptr, &event);

        //调整窗口在g_windows中的位置，让获得焦点的窗口位于最前面
        window_t* wnd = wndptr;
        while (wnd->type != WNDTYPE_WINDOW && wnd->parent) {
            wnd = wnd->parent;
        }
        _wnd_list_remove(&g_windows, wnd);
        _wnd_list_add(&g_windows, wnd);

        g_focused_wndptr = wndptr;
    }
}
void _on_mouse_up(int x, int y, int button)
{
    mouse_down_flags[button] = 0;
    windowptr_t wndptr       = get_window_by_pos(last_mouse_move_x, last_mouse_move_y, 0);
    if (wndptr) {
        need_to_update_display = 1;
        window_event_t event   = {
            .event_type   = WND_EVENT_MOUSE_UP,
            .sender       = wndptr,
            .mouse_button = button,
            .x            = x,
            .y            = y,
        };
        send_window_event(wndptr, &event);
    }
    if (wndptr == last_mouse_down_wndptr && button == last_mouse_down_button) {
        _on_mouse_click(wndptr, x, y, button);
    }
    if (mouse_click_timer < g_setted_mouse_consecutive_click_max_time) {
        clicked_times++;
    }
    else {
        clicked_times = 0;
    }
}
void _redraw_area(int x, int y, int w, int h) {}
void _on_mouse_move(int x, int y)
{
    windowptr_t wndptr = get_window_by_pos(x, y, 0);
    if (wndptr) {
        window_event_t event = {
            .event_type = WND_EVENT_MOUSE_MOVE,
            .sender     = wndptr,
            .x          = x,
            .y          = y,
        };
        send_window_event(wndptr, &event);
        if (mouse_down_flags[0] && wndptr->type == WNDTYPE_WINDOW) {
            window_event_t window_move_event = {
                .event_type = WND_EVENT_WINDOW_MOVE,
                .sender     = wndptr,
                .x          = x - mouse_down_x,
                .y          = y - mouse_down_y,
                .dx         = x - last_mouse_move_x,
                .dy         = y - last_mouse_move_y,
            };
            send_window_event(wndptr, &window_move_event);
        }
    }
    last_mouse_move_x      = x;
    last_mouse_move_y      = y;
    need_to_update_display = 1;
    fill_rect(last_mouse_move_x, last_mouse_move_y, 10, 10, COLOR_GREY);
    extern bitmap_buffer* backstage_buffer;
    //局部重绘
    copy_to_display(backstage_buffer, x, y, 10, 10, x, y);
}
void _on_mouse_click(windowptr_t wndptr, int x, int y, int button)
{
    window_event_t clicked_event = {
        .event_type   = WND_EVENT_MOUSE_CLICK,
        .sender       = wndptr,
        .mouse_button = button,
        .x            = x,
        .y            = y,
    };
    send_window_event(wndptr, &clicked_event);
}
void _on_key_down(int key_code)
{
    last_key_code_down   = key_code;
    window_event_t event = {
        .event_type = WND_EVENT_KEY_DOWN,
        .sender     = g_focused_wndptr,
        .key_code   = key_code,
    };
    send_window_event(g_focused_wndptr, &event);
}
void _on_key_up(int key_code)
{
    window_event_t event = {
        .event_type = WND_EVENT_KEY_UP,
        .sender     = g_focused_wndptr,
        .key_code   = key_code,
    };
    send_window_event(g_focused_wndptr, &event);
    if (last_key_code_down == key_code) {
        _on_key_press(key_code);
    }
}
void _on_key_press(int key_code)
{
    window_event_t event = {
        .event_type = WND_EVENT_KEY_PRESS,
        .sender     = g_focused_wndptr,
        .key_code   = key_code,
    };
    send_window_event(g_focused_wndptr, &event);
}
//绘制窗口和子窗口
void _render_window(window_t* wndi)
{
    window_t* wnd = wndi;
    int       x, y, w, h;
    x = wnd->x + (wnd->parent ? wnd->parent->x : 0);
    y = wnd->y + (wnd->parent ? wnd->parent->y : 0);
    w = wnd->width;
    h = wnd->height;
    if (wnd && wnd->state & WNDSTATE_PRESENT && !(wnd->state & WNDSTATE_DESTROYED) &&
        wnd->state & WNDSTATE_VISIBLE) {
        switch (wnd->type) {
        case WNDTYPE_WINDOW:
        {
            _draw_window(wnd);
            break;
        }
        case WNDTYPE_BUTTON:
        {
            _draw_button(wnd);
            break;
        }
        case WNDTYPE_EDITBOX:
        {
            _draw_editbox(wnd);
            break;
        }
        }
    }
    if (wnd->children) {
        for (window_t* child = wnd->children; child; child = child->next_as_child) {
            _render_window(child);
        }
    }
}
void _render_windows()
{
    if (!need_to_update_display) {
        return;
    }
    extern bitmap_buffer* backstage_buffer;
    clear_framebuffer(backstage_buffer, COLOR_BLACK);
    window_t* wnd = g_windows;
    for (; wnd; wnd = wnd->next_as_child) {
        _render_window(wnd);
    }
    fill_rect(last_mouse_move_x, last_mouse_move_y, 10, 10, COLOR_GREY);
    update_display();
    need_to_update_display = 0;
}
void _wndpresethandler_closebutton_clicked(windowptr_t wndptr, int event_type,
                                           window_event_t* event)
{
#ifdef DEBUG
    printf("close button clicked\n");
#endif
    window_t*      wnd         = wndptr;
    windowptr_t    parent_wndp = wnd->parent;
    window_event_t close_event = {
        .event_type = WND_EVENT_WINDOW_CLOSE,
        .sender     = wndptr,
    };
    send_window_event(parent_wndp, &close_event);
}

int set_window_text(windowptr_t wndptr, char* text)
{
    if (wndptr->type == WNDTYPE_EDITBOX) {
        editbox_data_t* data = (editbox_data_t*)wndptr->specific_data;
        if (data->text_buf_len < strlenk(text)) {
            KFREE(data->text);
            data->text         = KMALLOC(strlenk(text) + 1);
            data->text_buf_len = strlenk(text) + 1;
        }
        strcpyk(data->text, text);
    }
    else {
        strncpyk(wndptr->title, text, sizeof(wndptr->title));
    }
    return 0;
}
int get_window_text(windowptr_t wndptr, char* text, int max_len)
{
    if (wndptr->type == WNDTYPE_EDITBOX) {
        editbox_data_t* data = (editbox_data_t*)wndptr->specific_data;
        strncpyk(text, data->text, max_len);
    }
    else {
        strncpyk(text, wndptr->title, max_len);
    }
    return 0;
}
void _editbox_dtor(windowptr_t wndptr)
{
    editbox_data_t* data = (editbox_data_t*)wndptr->specific_data;
    if (data->text) {
        KFREE(data->text);
        data->text = NULL;
    }
}

// 绘制仿 Win2000 风格正常状态按钮的函数
void _draw_button_normal(int x, int y, int width, int height, const char* text)
{
    // 定义 Win2000 风格正常状态按钮的颜色
    unsigned int borderColor      = 0x000080;   // RGB(0, 0, 128)
    unsigned int lightBorderColor = 0xFFFFFF;   // RGB(255, 255, 255)
    unsigned int darkBorderColor  = 0x000000;   // RGB(0, 0, 0)
    unsigned int backgroundColor  = 0xD4D0C8;   // RGB(212, 208, 200)
    unsigned int textColor        = 0x000000;   // RGB(0, 0, 0)

    // 绘制按钮的外边框
    draw_line(x, y, x + width, y, 1, borderColor);
    draw_line(x + width, y, x + width, y + height, 1, borderColor);
    draw_line(x + width, y + height, x, y + height, 1, borderColor);
    draw_line(x, y + height, x, y, 1, borderColor);

    // 绘制按钮的内边框（高光和阴影）
    draw_line(x + 1, y + 1, x + width - 2, y + 1, 1, lightBorderColor);
    draw_line(x + width - 2, y + 1, x + width - 2, y + height - 2, 1, lightBorderColor);
    draw_line(x + 1, y + height - 2, x + width - 2, y + height - 2, 1, darkBorderColor);
    draw_line(x + 1, y + 1, x + 1, y + height - 2, 1, lightBorderColor);

    // 填充按钮的背景
    fill_rect(x + 2, y + 2, width - 4, height - 4, backgroundColor);

    // 绘制按钮上的文本
    int textX = x + 5;
    int textY = y + 2;   // 假设字体大小为 1
    draw_text(textX, textY, 1, (char*)(text), COLOR_BLACK, TEXT_BG_TRANSPARENT);
}
// 绘制仿 Win2000 风格按下状态按钮的函数
void _draw_button_pressed(int x, int y, int width, int height, const char* text)
{
    // 定义 Win2000 风格按下状态按钮的颜色
    unsigned int borderColor      = 0x000080;   // RGB(0, 0, 128)
    unsigned int lightBorderColor = 0x000000;   // RGB(0, 0, 0)
    unsigned int darkBorderColor  = 0xFFFFFF;   // RGB(255, 255, 255)
    unsigned int backgroundColor  = 0xA0A0A0;   // RGB(160, 160, 160)
    unsigned int textColor        = 0x000000;   // RGB(0, 0, 0)

    // 绘制按钮的外边框
    draw_line(x, y, x + width, y, 1, borderColor);
    draw_line(x + width, y, x + width, y + height, 1, borderColor);
    draw_line(x + width, y + height, x, y + height, 1, borderColor);
    draw_line(x, y + height, x, y, 1, borderColor);

    // 绘制按钮的内边框（高光和阴影）
    draw_line(x + width - 2, y + 1, x + width - 2, y + height - 2, 1, lightBorderColor);
    draw_line(x + 1, y + height - 2, x + width - 2, y + height - 2, 1, lightBorderColor);
    draw_line(x + 1, y + 1, x + width - 2, y + 1, 1, darkBorderColor);
    draw_line(x + 1, y + 1, x + 1, y + height - 2, 1, darkBorderColor);

    // 填充按钮的背景
    fill_rect(x + 2, y + 2, width - 4, height - 4, backgroundColor);

    // 绘制按钮上的文本
    int textX = x + 7;
    int textY = y + 8;   // 假设字体大小为 12，增加下沉效果
    draw_text(textX, textY, 1, (char*)(text), COLOR_BLACK, TEXT_BG_TRANSPARENT);
}
void _draw_button(window_t* wnd)
{
    button_data_t* data = (button_data_t*)wnd->specific_data;
    int            x, y, width, height;
    x      = wnd->x + (wnd->parent ? wnd->parent->x : 0);
    y      = wnd->y + (wnd->parent ? wnd->parent->y : 0);
    width  = wnd->width;
    height = wnd->height;
    if (data->pressed) {
        _draw_button_normal(x, y, width, height, wnd->title);
    }
    else {
        _draw_button_pressed(x, y, width, height, wnd->title);
    }
}

// 绘制仿 Win2000 风格文本框的函数
void _draw_editbox(windowptr_t wndptr)
{
    int         x, y, width, height;
    const char* text;
    x                    = wndptr->x + (wndptr->parent ? wndptr->parent->x : 0);
    y                    = wndptr->y + (wndptr->parent ? wndptr->parent->y : 0);
    width                = wndptr->width;
    height               = wndptr->height;
    editbox_data_t* data = (editbox_data_t*)wndptr->specific_data;
    text                 = data->text;
    // 定义 Win2000 风格文本框的颜色
    unsigned int borderColor     = 0x000080;   // RGB(0, 0, 128)
    unsigned int backgroundColor = 0xFFFFFF;   // RGB(255, 255, 255)
    unsigned int textColor       = 0x000000;   // RGB(0, 0, 0)

    // 绘制文本框的外边框
    draw_line(x, y, x + width, y, 1, borderColor);
    draw_line(x + width, y, x + width, y + height, 1, borderColor);
    draw_line(x + width, y + height, x, y + height, 1, borderColor);
    draw_line(x, y + height, x, y, 1, borderColor);

    // 填充文本框的背景
    fill_rect(x + 1, y + 1, width - 2, height - 2, backgroundColor);

    // 绘制文本框内的文字
    int textX = x + 5;
    int textY = y;   // 假设字体大小为 1
    draw_text(textX, textY, 1, (char*)(text), COLOR_BLACK, TEXT_BG_TRANSPARENT);
}

// 绘制仿 Win2000 风格窗口的函数
void _draw_window(windowptr_t wndptr)
{
    int         x, y, width, height;
    const char* title;
    x      = wndptr->x;
    y      = wndptr->y;
    width  = wndptr->width;
    height = wndptr->height;
    title  = wndptr->title;
    // 定义 Win2000 风格窗口的颜色
    unsigned int borderColor           = 0x000080;   // RGB(0, 0, 128)
    unsigned int titleBarColor         = 0x8080FF;   // RGB(128, 128, 255)
    unsigned int titleTextColor        = 0xFFFFFF;   // RGB(255, 255, 255)
    unsigned int windowBackgroundColor = 0xFFFFFF;   // RGB(255, 255, 255)

    // 绘制窗口的外边框
    draw_line(x, y, x + width, y, 8, borderColor);
    draw_line(x + width, y, x + width, y + height, 8, borderColor);
    draw_line(x + width, y + height, x, y + height, 8, borderColor);
    draw_line(x, y + height, x, y, 8, borderColor);

    // 绘制标题栏
    fill_rect(x, y, width, 28, titleBarColor);

    // 填充窗口的背景
    fill_rect(x + 2, y + 29, width - 4, height - 28 - 2, windowBackgroundColor);
    // 绘制标题栏上的文本
    int titleX = x + 5;
    int titleY = y;   // 假设字体大小为 1
    draw_text(titleX, titleY, 1, (char*)(title), COLOR_BLACK, TEXT_BG_TRANSPARENT);
}