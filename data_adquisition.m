function m=data_adquisition(string,n,nmax) 
%n=numero de datos, nmax=rango maximo {-nmax:nmax}
    %n=1000;
    %string='nombre de archivo';
    data=zeros(n,1);
    orig=3500;
    for i=1:1:n
        data(i,1)=randi([-nmax,nmax]);
    end
    m=data;
    string1=strcat(string,'.asm');
    text_data=fopen(string1,'w+');
   
    for i=1:1:n
        
        if i==1 
            fprintf(text_data,'.orig x%d\n',orig);
        end
        
        fprintf(text_data,'.fill #%d\n',data(i));
       
        if i==n
            fprintf(text_data,'.end');
        end
    end
    
    
    fclose(text_data);
    string2=strcat(string,'.txt');
    text_data=fopen(string2,'w+');
    
    for i=1:1:n
        if i==1
            fprintf(text_data,'int values[');
            fprintf(text_data,'%d',n);
            fprintf(text_data,']={');
        end
        
        fprintf(text_data,'%d',data(i));
        
        if i==n
           fprintf(text_data,'};');
        elseif i>=1 
            fprintf(text_data,',');
        end
    end
    
    fprintf(text_data,'\n');
    data=sort(data);
    
    for i=1:1:n
        if i==1
            fprintf(text_data,'/*int values[');
            fprintf(text_data,'%d',n);
            fprintf(text_data,']={');
        end
        
        fprintf(text_data,'%d',data(i));
        
        if i==n
           fprintf(text_data,'};//ascendente*/');
        elseif i>=1 
            fprintf(text_data,',');
        end
    end
    
    fprintf(text_data,'\n');
    data=sort(data,'descend');
    
    for i=1:1:n
        if i==1
            fprintf(text_data,'/*int values[');
            fprintf(text_data,'%d',n);
            fprintf(text_data,']={');
        end
        
        fprintf(text_data,'%d',data(i));
        
        if i==n
           fprintf(text_data,'};//descendente*/');
        elseif i>=1 
            fprintf(text_data,',');
        end
    end
    
    fclose(text_data);
end