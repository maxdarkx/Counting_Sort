function n=data_adquisition(string,n)
    %n=1000;
    %string='nopx';
    n=n+1;
    data=zeros(n,1);
    data(1,1)=3500;
    for i=2:1:n-1
        data(i,1)=randi(5000);
    end
    
    string1=strcat(string,'.asm');
    text_data=fopen(string1,'w+');
   
    for i=1:1:n
        
        if i==1 
            fprintf(text_data,'.orig x%d\n',data(i));
        else
            fprintf(text_data,'.fill #%d\n',data(i));
        end
        
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
            fprintf(text_data,'%d',n-1);
            fprintf(text_data,']={');
        else
            fprintf(text_data,'%d',data(i));
        end
        
        
        if i==n
           fprintf(text_data,'}');
        elseif i>1 
            fprintf(text_data,',');
        end
    end
end