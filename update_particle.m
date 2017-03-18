function g = update_particle(rho,w,Gid,c1,r1,Glb,c2,r2,Ggb)
% ¸üÐÂÁ£×Ó
% Gid
% Glb
% Ggb

num = length(Gid);
g = zeros(num);

for i=1:num
    for j=i+1:num
        g(i,j) = newYunSuan(rho,w*Gid(i,j)) & newYunSuan(rho,c1*r1*Glb(i,j)) & newYunSuan(rho,c2*r2*Ggb(i,j));
    end
end

g = ad_mat_inversion(g);
end