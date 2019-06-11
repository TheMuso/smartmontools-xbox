
int _strncmp(const char *sz1, const char *sz2, int nMax) {

        while((*sz1) && (*sz2) && nMax--) {
		if(*sz1 != *sz2) return (*sz1 - *sz2);
                sz1++; sz2++;
        }
	if(nMax==0) return 0;
        if((*sz1) || (*sz2)) return 0;
        return 0; // used up nMax
}

