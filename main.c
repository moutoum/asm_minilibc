#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void putc_normal()
{
	char *str = strdup("Salut");
	printf(" - %d\n", putc(*(&str[1]), stdout));
	printf(" - %d\n", putc(str[3], stderr));
}

void fputc_normal()
{
	char *str = strdup("Salut");
	printf(" - %d\n", fputc(str[1], stdout));
	printf(" - %d\n", fputc(str[3], stderr));
}

void strcspn_normal()
{
	char *str = strdup("Salutation");

	printf("%ld\n", strcspn(str, strdup("S")));
	printf("%ld\n", strcspn(str, strdup("l")));
	printf("%ld\n", strcspn(str, strdup("n")));
	printf("%ld\n", strcspn(str, strdup("z")));
}

void strpbrk_normal()
{
	char *str = strdup("Salutation");
	char *ret;

	printf("%s\n", strpbrk(str, strdup("Sn")));
	printf("%s\n", strpbrk(str, strdup("la")));
	printf("%s\n", strpbrk(str, strdup("nS")));
	printf("%s\n", (strpbrk(str, strdup("zpvb")) == NULL) ? "NULL" : "Error");
}

void strstr_normal()
{
	char *str = strdup("Salutation");
	char *ret;

	printf("%s\n", strstr(str, strdup("Salut")));
	printf("%s\n", strstr(str, strdup("tat")));
	printf("%s\n", strstr(str, strdup("n")));
	printf("%s\n", (strstr(str, strdup("toto")) == NULL) ? "NULL" : "Error");
}

void rindex_normal()
{
	char *str = strdup("Salutation");
	char *ret;

	printf("%s\n", ((ret = rindex(str, 'a')) == NULL) ? "Error" : ret);
	printf("%s\n", ((ret = rindex(str, 'p')) == NULL) ? "NULL" : "Error");
	printf("%s\n", ((ret = rindex(str, '\0')) == NULL) ? "Error" : ret);
}

void index_normal()
{
	char *str = strdup("Salutation");
	char *ret;

	printf("%s\n", ((ret = index(str, 'a')) == NULL) ? "Error" : ret);
	printf("%s\n", ((ret = index(str, 'p')) == NULL) ? "NULL" : "Error");
	printf("%s\n", ((ret = index(str, '\0')) == NULL) ? "Error" : ret);
}

void strcasecmp_normal()
{
	printf("%d\n", strcasecmp(strdup("Salut"),strdup("SaluT")));
	printf("%d\n", strcasecmp(strdup("Salut"),strdup("Saluu")));
	printf("%d\n", strcasecmp(strdup("Salut"),strdup("SaluU")));
	printf("%d\n", strcasecmp(strdup("Saluta"),strdup("SaluU")));
	printf("%d\n", strcasecmp(strdup("SALUT"),strdup("salut")));
	printf("%d\n", strcasecmp(strdup("Salutations"),strdup("Salut")));
}

void memmove_normal()
{
	char *str = strdup("Salutation");
	printf("%s, %s\n", (char *)memmove(str + 3, str, 5), str);
	printf("%s, %s\n", (char *)memmove(str + 3, str, 0), str);
}

void strncmp_normal()
{
  printf("%d\n", strncmp(strdup("Salut"), strdup("Salut"), 3));
  printf("%d\n", strncmp(strdup("Salut"), strdup("Salut"), 0));
  printf("%d\n", strncmp(strdup("Salut"), strdup("Sal"), 4));
  printf("%d\n", strncmp(strdup("Salut"), strdup("lu"), 2));
  printf("%d\n", strncmp(strdup("Sal"), strdup("Salut"), 5));
  printf("%d\n", strncmp(strdup("Salut"), strdup("Toto"), 4));
  printf("%d\n", strncmp(strdup("Toto"), strdup("Salut"), 0));
  printf("%d\n", strncmp(strdup("Salut"), strdup("Saluo"), 5));
  printf("%d\n", strncmp(strdup("Salut"), strdup("Salut"), 0));
}

void strcmp_normal()
{
  printf("%d\n", strcmp(strdup("Salut"), strdup("Salut")));
  printf("%d\n", strcmp(strdup("Salut"), strdup("Sal")));
  printf("%d\n", strcmp(strdup("Sal"), strdup("Salut")));
  printf("%d\n", strcmp(strdup("Salut"), strdup("Toto")));
  printf("%d\n", strcmp(strdup("Toto"), strdup("Salut")));
  printf("%d\n", strcmp(strdup("Salut"), strdup("Saluo")));
}

void strlen_normal()
{
	char *str = strdup("salut");
	printf("%d %s\n", (int)strlen(str), str);
	printf("%d\n", (int)strlen(strdup("    \t\t  djapaj azdpazjdpazjdpazkdazkdpozk\n opekfpzokf")));
}

void strlen_0()
{
	printf("%d\n", (int)strlen(strdup("\0")));	
	printf("%d\n", (int)strlen(strdup("")));	
}

void strchr_normal()
{
	char *str = strdup("salut");
	printf("%s %s %s\n", strchr(str, 's'), strchr(str, 'a'), strchr(str, 't'));
}

void strchr_hard()
{
	char *str = strdup("salut");	
	(strchr(str, '\0') == NULL) ? printf("1") : printf("0");
	(strchr(str, 'z') == NULL) ? printf("1") : printf("0");
}

void memset_normal()
{
	char *str = malloc(10);

	printf("%s %s %s\n", (char *)memset(str, 0, 10), (char *)memset(str, 'a', 9), (char *)memset(str, 'z', 0));
}

void memcpy_normal()
{
	char *str = strdup("aaaaaaaaa");
	char *str2 = malloc(10);

	printf("%s %s %s\n", (char *)memcpy(str2, str, 10), str, str2);
}

int main(int ac, char *av[])
{
	switch (atoi(av[1]))
	{
		/* strlen */
		case 1: strlen_normal(); break;
		case 2: strlen_0(); break;
		case 3: strchr_normal(); break;
		case 4: strchr_hard(); break;
		case 5: memset_normal(); break;
		case 6: memcpy_normal(); break;
		case 7: strcmp_normal(); break;
		case 8: strncmp_normal(); break;
		case 9:	memmove_normal(); break;
		case 10: strcasecmp_normal(); break;
		case 11: index_normal(); break;
		case 12: rindex_normal(); break;
		case 13: strstr_normal(); break;
		case 14: strpbrk_normal(); break;
		case 15: strcspn_normal(); break;
	}
	return (0);
}