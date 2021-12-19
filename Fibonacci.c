#include <stdio.h>

int cont;

int fibonacci(int n){
    cont++;
    if(n == 0) return 0;
    if(n == 1) return 1;
    else return fibonacci(n-1) + fibonacci(n-2);
}

int main(){
    int n, x;
    cont = 0;
    scanf("%d",&n);
    for(int i = 0; i < n; i++){
            scanf("%d",&x);
            
            printf("fibonacci(%d) = %d chamadas = %d\n",x,cont-1,fibonacci(x));
    }
    return 0;
}
