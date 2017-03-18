function spread=modu(pattern1,m1,L_source,L)
spread=[];
m=[];
for i=1:L*L_source
        if mod(i,L)==0
            m(i)=m1(L);
        else
            m(i)=m1(mod(i,L));
        end
        
%       spread(i)=xor(pattern1(i), m(i));
     spread(i)=pattern1(i)* m(i);
 end
