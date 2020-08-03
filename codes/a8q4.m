n = input('Input the value of n\n')
ns_x = rand(1,n); % x-coordinate  of nucleation site
ns_y = rand(1,n);  % y-coordinate of nucleation site
voronoi(ns_x,ns_y)