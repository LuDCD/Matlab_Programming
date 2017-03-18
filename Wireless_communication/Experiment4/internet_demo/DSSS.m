function [Y]=DSSS(X,mode)
switch nargin
     case 0
           X='This is a test.';
          Y=DSSS(X);
          return
     case 1
           YI=DSSS(X, l):
          Y2=DSSS(YI. 2);
           Y=Y2;
           return;
     case 2
           if mode==l
              D=ones(1.7);
             m_sequence=Msequence(D);
              X_length=length(X):
              ascii_value=abs( X) :
              ascii_binary=zeros(X_length,7);
              for ii=1:X_length
                 ascii_binary(ii,:)=Binary(ascii_value(ii));
              subplot(2,3,l):plot(reshape(ascii_binary, 1,X_length*7));
              title('A：输入数据');
             Sp_expand=zeros(X_length,1 27*7):
               for ii=1:X_length
                  for jj=1:7
                       Sp_expand(ii,1 27*jj- 126: 127*jj)=xor(m_sequence,ascii_binary(ii,jj));
                 end
             end
             subplot(2,3,2);plot(reshape(Sp_expand,1,X_length*127*7);
             title('B:数据扩展');
             for ii=1:X_length
                 for jj=1:127*7
                    if~(Sp_expand(ii,jj))
                        Sp_expand(ii,jj)=-1;
                    end
                 end
            end
            Sp_expand_bpsk=reshape(Sp_expand,l,X_length*127*7);
            subplot(2.3,3);plot(Sp_expand_bpsk);
            title('C:BPSK调制');
            Y=Sp_expand_bpsk;
        elseif mode==2
            D=ones(1,7);
           m_sequence=Msequence(D);
           l=length(X)/(127*7);
           X_length=length(X);
           for ii=l :X_length
               if X(ii)==-1
                   X(ii)=0;
               end
           end
           Sp_expand=reshape(X,1,127*7);
           subplot(2,3,4);plot(X);title('D:数据传输');
           ascii_binary=zeros(1,7);
           Demodulate_binary=zeros(l, 127,*7);
              for ii=l:l
                  for jj=1:7
                      Demodulate(ii,127*jj-126:127*jj)=xor(m_sequence,
Sp_expand(ii,127*jj-126:127*jj));
                end
           end
           for ii=l:l
               for jj=1:7
                   ascii_binary(ii,jj)=Demodulate(ii,127*jj-126);
               end
           end
           subplot(2,3,6);plot(reshape(ascii_binary, 1,1*7));Liile( 'E:数据输出');
           A=zeros(l.l);
           for ii=l:l
               A(ii)=Ascii(ascii_binary(ii,:));
           end
           Y=char( A);
        else 
           mode=1;
     end 
       return
  end