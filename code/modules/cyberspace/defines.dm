#define CYBERSPACE_MAIN_COLOR_raw 0, 221, 255
#define CYBERSPACE_SHADOW_COLOR_raw 0, 21, 55

#define CYBERSPACE_MAIN_COLOR rgb(CYBERSPACE_MAIN_COLOR_raw) //for directly networked devices
#define CYBERSPACE_SHADOW_COLOR rgb(CYBERSPACE_SHADOW_COLOR_raw)

#define ADD_CYBERSPACE_AVATAR(type) ##type/CyberspaceAvatar = TRUE
#define ADD_CYBERSPACE_AVATAR_CUSTOM_COLOR(type, color) ADD_CYBERSPACE_AVATAR(##type); ##type/CyberSpaceColor = color;
//todo blur

