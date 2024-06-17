#include <libjupiter.h>
#include <stdio.h>
#include "module.h"

#ifdef HAVE_CONFIG_H
# include <config.h>
#endif

#if HAVE_DLFCN_H
# include <dlfcn.h>
#endif

#define DEFAULT_SALUTATION "Hello"

int main(int argc, char * argv[])
{
  const char* salutation = DEFAULT_SALUTATION;
#if HAVE_DLFCN_H
  void * module;
  get_salutation_t* get_salutation_fp = 0;

  module = dlopen("./module.so", RTLD_NOW);
  if (module != 0) {
    get_salutation_fp = (get_salutation_t *)dlsym(module, GET_SALUTATION_SYM);
    if (get_salutation_fp != 0)
      salutation = get_salutation_fp();
    else
      printf("no %s function in module.so\n", GET_SALUTATION_SYM);
  }else {
    printf("no module.so file found\n");
  }
#endif

 jupiter_print(salutation, argv[0]);

#if HAVE_DLFCN_H
 if (module != 0)
   dlclose(module);
#endif

 return 0;
}
