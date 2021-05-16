const c = @cImport({
    // See https://github.com/ziglang/zig/issues/515
    @cDefine("_NO_CRT_STDIO_INLINE", "1");
    @cInclude("xkbcommon/xkbcommon.h");
});

pub const Key = enum(i32) {
    unknown,
    space,
    @"'",
    @",",
    @"-",
    @".",
    @"/",
    @"0",
    @"1",
    @"2",
    @"3",
    @"4",
    @"5",
    @"6",
    @"7",
    @"8",
    @"9",
    @";",
    @"=",
    a,
    b,
    c,
    d,
    e,
    f,
    g,
    h,
    i,
    j,
    k,
    l,
    m,
    n,
    o,
    p,
    q,
    r,
    s,
    t,
    u,
    v,
    w,
    x,
    y,
    z,
    @"[",
    @"\\",
    @"]",
    @"`",
    world_1,
    world_2,
    escape,
    enter,
    tab,
    backspace,
    insert,
    delete,
    right,
    left,
    down,
    up,
    page_up,
    page_down,
    home,
    end,
    caps_lock,
    scroll_lock,
    num_lock,
    print_screen,
    pause,
    f1,
    f2,
    f3,
    f4,
    f5,
    f6,
    f7,
    f8,
    f9,
    f10,
    f11,
    f12,
    f13,
    f14,
    f15,
    f16,
    f17,
    f18,
    f19,
    f20,
    f21,
    f22,
    f23,
    f24,
    f25,
    kp_0,
    kp_1,
    kp_2,
    kp_3,
    kp_4,
    kp_5,
    kp_6,
    kp_7,
    kp_8,
    kp_9,
    kp_decimal,
    kp_divide,
    kp_multiply,
    kp_subtract,
    kp_add,
    kp_enter,
    kp_equal,
    left_shift,
    left_control,
    left_alt,
    left_super,
    right_shift,
    right_control,
    right_alt,
    right_super,
    menu,
    count,
};

pub const KeyState = enum {
    pressed,
    released,
    repeat,
};

pub const KeyMods = struct {
    control: bool = false,
    shift: bool = false,
    alt: bool = false,
    super: bool = false,
    caps_lock: bool = false,
    num_lock: bool = false,
};

pub fn xkbKeysymToKey(keysym: c.xkb_keysym_t) Key {
    return switch (keysym) {
        c.XKB_KEY_BackSpace => .backspace,
        c.XKB_KEY_Tab => .tab,
        c.XKB_KEY_Return => .enter,
        c.XKB_KEY_Scroll_Lock => .scroll_lock,
        c.XKB_KEY_Escape => .escape,
        c.XKB_KEY_KP_Delete, c.XKB_KEY_Delete => .delete,
        c.XKB_KEY_KP_Home, c.XKB_KEY_Home => .home,
        c.XKB_KEY_KP_Left, c.XKB_KEY_Left => .left,
        c.XKB_KEY_KP_Up, c.XKB_KEY_Up => .up,
        c.XKB_KEY_KP_Right, c.XKB_KEY_Right => .right,
        c.XKB_KEY_KP_Down, c.XKB_KEY_Down => .down,
        c.XKB_KEY_KP_Page_Up, c.XKB_KEY_Page_Up => .page_up,
        c.XKB_KEY_KP_Page_Down, c.XKB_KEY_Page_Down => .page_down,
        c.XKB_KEY_KP_End, c.XKB_KEY_End => .end,
        c.XKB_KEY_Print => .print_screen,
        c.XKB_KEY_KP_Insert, c.XKB_KEY_Insert => .insert,
        c.XKB_KEY_Num_Lock => .num_lock,
        c.XKB_KEY_KP_Enter => .kp_enter,
        c.XKB_KEY_KP_Equal => .kp_equal,
        c.XKB_KEY_KP_Multiply => .kp_multiply,
        c.XKB_KEY_KP_Add => .kp_add,
        c.XKB_KEY_KP_Subtract => .kp_subtract,
        c.XKB_KEY_KP_Divide => .kp_divide,
        c.XKB_KEY_KP_Decimal => .kp_decimal,
        c.XKB_KEY_KP_0 => .kp_0,
        c.XKB_KEY_KP_1 => .kp_1,
        c.XKB_KEY_KP_2 => .kp_2,
        c.XKB_KEY_KP_3 => .kp_3,
        c.XKB_KEY_KP_4 => .kp_4,
        c.XKB_KEY_KP_5 => .kp_5,
        c.XKB_KEY_KP_6 => .kp_6,
        c.XKB_KEY_KP_7 => .kp_7,
        c.XKB_KEY_KP_8 => .kp_8,
        c.XKB_KEY_KP_9 => .kp_9,

        c.XKB_KEY_F1 => .f1,
        c.XKB_KEY_F2 => .f2,
        c.XKB_KEY_F3 => .f3,
        c.XKB_KEY_F4 => .f4,
        c.XKB_KEY_F5 => .f5,
        c.XKB_KEY_F6 => .f6,
        c.XKB_KEY_F7 => .f7,
        c.XKB_KEY_F8 => .f8,
        c.XKB_KEY_F9 => .f9,
        c.XKB_KEY_F10 => .f10,
        c.XKB_KEY_F11 => .f11,
        c.XKB_KEY_F12 => .f12,
        c.XKB_KEY_F13 => .f13,
        c.XKB_KEY_F14 => .f14,
        c.XKB_KEY_F15 => .f15,
        c.XKB_KEY_F16 => .f16,
        c.XKB_KEY_F17 => .f17,
        c.XKB_KEY_F18 => .f18,
        c.XKB_KEY_F19 => .f19,
        c.XKB_KEY_F20 => .f20,
        c.XKB_KEY_F21 => .f21,
        c.XKB_KEY_F22 => .f22,
        c.XKB_KEY_F23 => .f23,
        c.XKB_KEY_F24 => .f24,
        c.XKB_KEY_F25 => .f25,

        c.XKB_KEY_Shift_L => .left_shift,
        c.XKB_KEY_Shift_R => .right_shift,
        c.XKB_KEY_Control_L => .left_control,
        c.XKB_KEY_Control_R => .right_control,
        c.XKB_KEY_Caps_Lock => .caps_lock,
        c.XKB_KEY_Alt_L => .left_alt,
        c.XKB_KEY_Alt_R => .right_alt,
        c.XKB_KEY_Super_L => .left_super,
        c.XKB_KEY_Super_R => .right_super,

        c.XKB_KEY_space => .space,
        c.XKB_KEY_apostrophe => .@"'",
        c.XKB_KEY_comma => .@",",
        c.XKB_KEY_period => .@".",
        c.XKB_KEY_slash => .@"/",
        c.XKB_KEY_minus => .@"-",
        c.XKB_KEY_equal => .@"=",
        c.XKB_KEY_semicolon => .@";",

        c.XKB_KEY_0 => .@"0",
        c.XKB_KEY_1 => .@"1",
        c.XKB_KEY_2 => .@"2",
        c.XKB_KEY_3 => .@"3",
        c.XKB_KEY_4 => .@"4",
        c.XKB_KEY_5 => .@"5",
        c.XKB_KEY_6 => .@"6",
        c.XKB_KEY_7 => .@"7",
        c.XKB_KEY_8 => .@"8",
        c.XKB_KEY_9 => .@"9",

        c.XKB_KEY_A, c.XKB_KEY_a => .a,
        c.XKB_KEY_B, c.XKB_KEY_b => .b,
        c.XKB_KEY_C, c.XKB_KEY_c => .c,
        c.XKB_KEY_D, c.XKB_KEY_d => .d,
        c.XKB_KEY_E, c.XKB_KEY_e => .e,
        c.XKB_KEY_F, c.XKB_KEY_f => .f,
        c.XKB_KEY_G, c.XKB_KEY_g => .g,
        c.XKB_KEY_H, c.XKB_KEY_h => .h,
        c.XKB_KEY_I, c.XKB_KEY_i => .i,
        c.XKB_KEY_J, c.XKB_KEY_j => .j,
        c.XKB_KEY_K, c.XKB_KEY_k => .k,
        c.XKB_KEY_L, c.XKB_KEY_l => .l,
        c.XKB_KEY_M, c.XKB_KEY_m => .m,
        c.XKB_KEY_N, c.XKB_KEY_n => .n,
        c.XKB_KEY_O, c.XKB_KEY_o => .o,
        c.XKB_KEY_P, c.XKB_KEY_p => .p,
        c.XKB_KEY_Q, c.XKB_KEY_q => .q,
        c.XKB_KEY_R, c.XKB_KEY_r => .r,
        c.XKB_KEY_S, c.XKB_KEY_s => .s,
        c.XKB_KEY_T, c.XKB_KEY_t => .t,
        c.XKB_KEY_U, c.XKB_KEY_u => .u,
        c.XKB_KEY_V, c.XKB_KEY_v => .v,
        c.XKB_KEY_W, c.XKB_KEY_w => .w,
        c.XKB_KEY_X, c.XKB_KEY_x => .x,
        c.XKB_KEY_Y, c.XKB_KEY_y => .y,
        c.XKB_KEY_Z, c.XKB_KEY_z => .z,

        c.XKB_KEY_bracketleft => .@"[",
        c.XKB_KEY_bracketright => .@"]",
        c.XKB_KEY_backslash => .@"\\",
        c.XKB_KEY_grave => .@"`",

        else => .unknown,
    };
}

comptime {
    _ = xkbKeysymToKey;
}