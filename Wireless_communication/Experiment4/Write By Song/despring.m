function despr_b1=despring(despread,L_source,L)
k=1;
 sum=0;
 demod_b1=zeros(1,2*L_source);
  despr_b1=zeros(1,L_source);
for i=1:L_source*L
       sum=despread(i)+sum;
     if mod(i,L)==0
          demod_b1(k)=sum;
          if  demod_b1(k)>0
              despr_b1(k)=0;
          else
               despr_b1(k)=1;
          end
          sum=0;
            k=k+1;
     end
     
end