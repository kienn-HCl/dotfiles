{
  pkgs,
}:
pkgs.stdenv.mkDerivation {
  pname = "nfwidth";
  version = "0.1.0";
  src = pkgs.writeTextDir "nfwidth.c" ''
    #define _GNU_SOURCE
    #include <dlfcn.h>
    #include <stdint.h>
    #include <wchar.h>

    /* Nerd Font PUA ranges (same as wcwidth-icons) */
    static int is_nerd_font_icon(int32_t ucs) {
        return (ucs >= 0x23fb && ucs <= 0x23fe) ||   /* IEC Power Symbols */
               ucs == 0x2665 ||                        /* Heart */
               ucs == 0x2b58 ||                        /* Heavy circle */
               (ucs >= 0xe000 && ucs <= 0xe09f) ||     /* Seti/Custom */
               (ucs >= 0xe0c0 && ucs <= 0xf8ff) ||     /* Powerline Extra + FA + etc */
               (ucs >= 0xf0001 && ucs <= 0xfffff);     /* Supplementary PUA */
    }

    /* Override libc wcwidth (for zsh etc.) */
    int wcwidth(wchar_t ucs) {
        if (is_nerd_font_icon((int32_t)ucs))
            return 2;
        static int (*real_wcwidth)(wchar_t) = NULL;
        if (!real_wcwidth)
            real_wcwidth = dlsym(RTLD_NEXT, "wcwidth");
        return real_wcwidth(ucs);
    }

    /* Override libc wcswidth */
    int wcswidth(const wchar_t *s, size_t n) {
        static int (*real_wcswidth)(const wchar_t *, size_t) = NULL;
        if (!real_wcswidth)
            real_wcswidth = dlsym(RTLD_NEXT, "wcswidth");

        int width = 0;
        for (size_t i = 0; i < n && s[i]; i++) {
            int w = wcwidth(s[i]);
            if (w < 0) return -1;
            width += w;
        }
        return width;
    }

    /* Override utf8proc_charwidth (for foot) */
    int utf8proc_charwidth(int32_t ucs) {
        if (is_nerd_font_icon(ucs))
            return 2;
        static int (*real_charwidth)(int32_t) = NULL;
        if (!real_charwidth)
            real_charwidth = dlsym(RTLD_NEXT, "utf8proc_charwidth");
        return real_charwidth(ucs);
    }
  '';
  buildPhase = ''
    $CC -shared -fPIC -Wl,-soname,libnfwidth.so \
      -Wl,--no-as-needed -ldl \
      -o libnfwidth.so nfwidth.c
  '';
  installPhase = ''
    mkdir -p $out/lib
    cp libnfwidth.so $out/lib/
  '';
}
