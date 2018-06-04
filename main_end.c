#include <stdio.h>
#define tam 30
#define nmax 1000



int numMayor(int *val);
int numMenor(int *val);
void order(int *val,int *temp,int min,int max);
void ordered_vector(int *temp, int *vector_final, int min, int max);
void imp_vec(int *vector_final);

int main()
{
    int val_temp[tam]={1,2,5,2,1,4,5,2,9,-3,20,-8,-10,
                        0,15,200,25,80,-5,96,201,-8,-6,
                        100,100,54,67,30,69,-16};        // vector de valores, modificar con la rutina de matlab
    int values[nmax];                                    // valores a ordenar
    int vector_final[tam];                               // vector ordenado
    int temp[nmax];                                      // vector auxiliar
    int max=0;                                           // maximo valor de la lista
    int min=0;                                           // minimo valor de la lista
    int i=0;
    int k=0;                                             // contador de bucle
    
    for(i=0;i<nmax;i++)
    {
        if(i<tam)                                       // llenando el vector grande con los valores introducidos (+comodo)
        {
            values[i]=val_temp[i];
        }
    }
    max=numMayor(values);
    min=numMenor(values);

    //printf("max=%d\n",max); // imprime el maximo valor de la lista
    //printf("min=%d\n",min); // imprime el minimo valor de la lista

    for(i=min;i<=max;i++)                               //se inicializa el vector temp a cero
    {
           temp[k]=0;
           k++;
    }
    

    order(values,temp,min,max);                     //se calcula el numero de ocurrencias de cada dato y se guardan en temp
    //printf("k=%d\n",k); // imprime posiciones que ocupo desde minimo hasta el maximo

    ordered_vector(temp, vector_final,min,max);         //con el calculo del numero de ocurrencias, se halla el vector ordenado
/*    for(i=0;i<aux;i++)
    {
        printf("%d",temp[i]); // imprime cuantas veces se encuentra un numero en la lista
    }
    printf("\n");
*/
    imp_vec(vector_final);                              //se imprime en pantalla el vector ordenado

}




int numMayor(int *values) // calcula el maximo valor que tiene la lista
{
    int i;
    int max=*values;
    for(i=0;i<tam;i++)
    {
        if(max<values[i])  
        {
            max=values[i];
        }
    }
    return max;
}

int numMenor(int *values) // calcula el minimo valor que hay en la lista
{
    int i;
    int min=values[i];

    for(i=0;i<tam;i++)
    {
        if(min>values[i]) 
        {
            min=values[i];
        }
    }
    return min;
}

void order(int *val,int *temp,int min,int max) //funcion para hallar el numero de ocurrencias de un dato en un vector
{
    int i,j,k;

    for (i=0;i<tam;i++)             //recorre pocisiones de vector de valores
    {
        k=0;
        for(j=min;j<=max;j++)       //valores a buscar del vector
        {
            if( val[i]==j)
            {
                temp[k]++;          // contando las ocurrencias y se devuelven al main
                //printf("out(val[%d]=%d==%d,temp[%d]=%d)\n",i,values[i],j,k,temp[k]);
            }
            k++;                    // k para mover el vector temporal
        }
    }

}

void ordered_vector(int *temp, int *vector_final, int min, int max) //con el vector de ocurrencias, se crea un vector ordenado
{
    int i=0;                        //indices para los vectores
    int j=0;
    int k=0;
    int h=0;

    for(i=min;i<=max;i++)               // debe iniciar en el valor minimo hallado y hasta el maximo hallado
    {
        if(temp[j]>0)
        {
            for(h=0;h<temp[j];h++)
            {
                vector_final[k]=i;      //segun la posicion en el vector de ocurrencias y las ocurrencias, se llena el vector ordenado
                k++;                    //se debe llevar al vector final el dato tantas veces como ocurrencias tenga
            }
        }
        j++;                            //j es un indice dependiente del valor minimo y maximo, pero por cuestiones de programacion debe empezar en cero
    }
}



void imp_vec(int *vector_final)         //funcion para imprimir el vector ordenado en consola
{
    int i;

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