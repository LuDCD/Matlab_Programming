function [Y]=Msequence(X)
switch nargin
    case 0
         Y=Msequence(X);
         return
    case 1
         l=length(X);
         mp_register=X;
         out_sequence=zeros(1,2^1-1);
             sum xor=0;
         for ii=l:2^1-1
             oui_sequence(ii)=mp_register(l);
                 sum_xor=xor(mp_register(l),mp_regisier(l-l));
              for jj=l:l-l
                  mp_register(1-jj+l)=mp_register(l-jj);
             end
             mp_register(l)=sum_xor;
             if mp_register-X
                   Break;
             end
         end
         Y=out_sequence;
         return
end