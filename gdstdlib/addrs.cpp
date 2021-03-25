#include <cc_defs.hpp>

#define STATIC_STUB(addr, ret, ...) \
	(reinterpret_cast<ret (*)(__VA_ARGS__)>(getBase()+addr))

#define MEMBER_STUB(cls, addr, ret, ...) \
	(reinterpret_cast<ret (*)(cls* self, __VA_ARGS__)>(getBase()+addr))
