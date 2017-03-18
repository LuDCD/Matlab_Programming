function [p_opt,fval] = dynprog(x, DecisFun, ObjFun, TransFun)
%input x 状态变量组成的矩阵，其第k列是阶段k的状态xk的取值；
%DecisFun(k,xk) 由阶段k的状态xk求出相应的允许决策变量的函数；
%ObjFun(k,sk,uk) 阶段指标函数vk=(sk,uk)
%TransFun(k,sk,uk) 状态转移方程Tk(sk,uk)
%Output p_opt4个列向量
%fval 最优函数值
k=length(x(1,:));
x_isnan=~isnan(x);
f_vub=inf;
f_opt=nan*ones(size(x));
d_opt=f_opt;
t_vubm=inf*ones(size(x));
tmp1=find(x_isnan(:,k));
tmp2=length(tmp1);
for i=1:tmp2
        u=feval(DecisFun,k,x(i,k));
        tmp3=length(u);
        for j=1:tmp3
                tmp=feval(ObjFun,k,x(tmp1(i),k),u(j));
                if tmp<=f_vub
                        f_opt(i,k)=tmp;
                        d_opt(i,k)=u(j);
                        t_vub=tmp;
                end
        end
end
for ii=k-1:-1:1
        tmp10=find(x_isnan(:,ii));
        tmp20=length(tmp10);
        for i=1:tmp20
                u=feval(DecisFun,ii,x(i,ii));
                tmp30=length(u);
                for j=1:tmp30
                        tmp00=feval(ObjFun,ii,x(tmp10(i),ii),u(j));
                        tmp40=feval(TransFun,ii,x(tmp10(i),ii),u(j));
                        tmp50=x(:,ii+1)-tmp40;
                        tmp60=find(tmp50==0);
                        if ~isempty(tmp60)
                                tmp00=tmp00+f_opt(tmp60(1),ii+1);
                                if tmp00<=t_vubm(i,ii)
                                        f_opt(i,ii)=tmp00;
                                        d_opt(i,ii)=u(j);
                                        t_vubm(i,ii)=tmp00;
                                end
                        end
                end
        end
end
p_opt=;
tmpx=;
tmpd=;
tmpf=;
tmp0=find(x_isnan(:,1));
fval=f_opt(tmp0,1);
tmp01=length(tmp0);
for i=1:tmp01
        tmpd(i)=d_opt(tmp0(i),1);
        tmpx(i)=x(tmp0(i),1);
        tmpf(i)=feval(ObjFun,1,tmpx(i),tmpd(i));
        p_opt(k*(i-1)+1,)=;
        for ii=2:k
                tmpx(i)=feval(TransFun, ii-1,tmpx(i),tmpd(i));
                tmp1=x(:,ii)-tmpx(i);
                tmp2=find(tmp1==0);
                if ~isempty(tmp2)
                        tmpd(i)=d_opt(tmp2(1),ii);
                end
                tmpf(i)=feval(ObjFun,ii,tmpx(i),tmpd(i));
                p_opt(k*(i-1)+ii,)=;
        end
end
end