#define CYBERSPACE_MAIN_COLOR_raw 0, 221, 255
#define CYBERSPACE_SHADOW_COLOR_raw 0, 21, 55

#define CYBERSPACE_MAIN_COLOR rgb(CYBERSPACE_MAIN_COLOR_raw)
#define CYBERSPACE_SHADOW_COLOR rgb(CYBERSPACE_SHADOW_COLOR_raw)

#define ADD_CYBERSPACE_AVATAR(type, color) ##type/CyberspaceAvatar = TRUE; ##type/CyberSpaceColor = color;
