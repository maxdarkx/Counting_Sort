#include <stdio.h>
#define tam 30
#define nmax 1000

int main()
{
    int val_temp[tam]={1,2,5,2,1,4,5,2,9,-3,20,-8,-10,0,15,200,25,80,-5,96,201,-8,-6,100,100,54,67,30,69,-16}; // valores introducidos
    int values[nmax];//valores a ordenar
    int vector_final[tam];
    int temp[nmax]; // vector auxiliar
    int max=0; //maximo valor de la lista
    int min=0; //minimo valor de la lista
    int i,j,k,h;  // contador de bucle
    int aux;//tamaño de vector de contador

    for(i=0;i<nmax;i++)
    {
        if(i<tam)                        // llenando el vector grande con los valores introducidos
        {
            values[i]=val_temp[i];
        }
    }

    for(i=0;i<tam;i++){
        if(max<values[i])  // calcula el maximo valor que tiene la lista
            max=values[i];
        }
       printf("max=%d\n",max); // imprime el maximo valor de la lista

       min=values[0];
       for(i=0;i<tam;i++){
           if(min>values[i]) // calcula el minimo valor que hay en la lista
               min=values[i];
           }
       printf("min=%d\n",min); // imprime el minimo valor de la lista

    for(i=min;i<=max;i++)
    {
           temp[k]=0;
           k++;  // calcula tamaño del vector temporal
    }
    aux=k; // tamalo de vector a aux
    k=0;
    printf("k=%d\n",k); // imprime posiciones que ocupo desde minimo hasta el maximo



    for (k=0;k<tam;k++) //recorre pocisiones de vector de valores
    {
        j=0;
        for(i=min;i<=max;i++) //valores a buscar del vector
        {
                if( values[k]==i)
            {
                temp[j]++;  // contando las repeticiones

                printf("out(val[%d]=%d==%d,temp[%d]=%d)\n",k,values[k],i,j,temp[j]);

            }

            j++; // j para mover el vector temporal
        }
    }

    for(i=0;i<aux;i++)
    {
        printf("%d",temp[i]); // imprime cuantas veces se encuentra un numero en la lista
    }
    printf("\n");

    j=0;
    k=0;
    for(i=min;i<=max;i++)  // imprime vector ordenado
    {

        if(temp[j]>0)
        {
            for(h=0;h<temp[j];h++)
            {

                vector_final[k]=i;
                k++;
            }
        }
        j++;
    }

    for(i=0;i<tam;i++)
    {
        if (i==0)
        {
            printf("[");
        }
        printf("%d ",vector_final[i]);
        if (i==tam-1)
        {
            printf("]");
        }



    }

}
