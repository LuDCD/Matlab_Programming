function f = graph_fitness(G,Del)

alpha1 = 1;
alpha2 = 1;

Del_used = Del.*G;
Del_max = max(Del_used(:));

f = alpha1*exp(-PN(G)) + alpha2*exp(-Del_max);
end