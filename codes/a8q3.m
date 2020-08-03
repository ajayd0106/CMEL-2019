clear
clc
k=input('Input computational Grid size\n')
Grid= zeros(k,k);
n=input('Input number of grains\n')
vx=input('Velocity in x direction\n')
vy=input('Velocity in x direction\n')

j=1;
C=0;
f=0; 
t=0;


site_x= randperm(k,n);
site_y= randperm(k,n);

for i=1:n
Grid(site_x(i),site_y(i))=i;
end


    while numel(site_x)>1
        Vmax=vx+vy;
        random_number=rand()*(Vmax);
        if random_number>=vx
      if site_y(j) <= k-1
        if Grid(site_x(j),site_y(j)+1)==0
            Grid(site_x(j),site_y(j)+1)=Grid(site_x(j),site_y(j));
          
           site_x(end+1) = site_x(j);
           site_y(end+1) = site_y(j)+1;
                 t=t+1;

        end
      end
      if site_y(j)-1>=1
        if Grid(site_x(j),site_y(j)-1)==0
            Grid(site_x(j),site_y(j)-1)=Grid(site_x(j),site_y(j));
            
            site_x(end+1) = site_x(j);
           site_y(end+1) = site_y(j)-1;
                 t=t+1;

        end
      end
        end
        if random_number<=vx
      if site_x(j)+1 <=k
        if Grid(site_x(j)+1,site_y(j))==0
            Grid(site_x(j)+1,site_y(j))=Grid(site_x(j),site_y(j));
           site_x(end+1) = site_x(j)+1;
           site_y(end+1) = site_y(j);
                 t=t+1;

        end
      end
      if site_x(j)-1 >= 1
        if Grid(site_x(j)-1,site_y(j))==0
            Grid(site_x(j)-1,site_y(j))=Grid(site_x(j),site_y(j));
            site_x(end+1) = site_x(j)-1;
           site_y(end+1) = site_y(j);
                 t=t+1;

        end
      end
        
         site_x = site_x(2:end);
         site_y = site_y(2:end);
        end
       
    end
    p=1;
    u=1;
    r=0;
    gb_ct=0;
    tp_ct=0;
    in_ct=0;
    while p<=k
        while u<=k
            r=Grid(p,u);
            if p<=k-1 && u<=k-1 && p>=2 && u>=2
                if Grid(p,u+1)==r && Grid(p,u-1)==r && Grid(p+1,u)==r && Grid(p-1,u)==r
                in_ct=in_ct+1 ;                           
                end 
                a=[Grid(p,u+1),Grid(p+1,u),Grid(p,u-1),Grid(p-1,u)];
                if numel(unique(a))>=3
                    tp_ct=tp_ct+1;
                end

            end
            if p==1 && u~=1 && u~=k
                    if Grid(p,u-1)==r && Grid(p+1,u)==r && Grid(p,u+1)==r
                        in_ct=in_ct+1;
                    end
                    a=[Grid(p,u+1),Grid(p+1,u),Grid(p,u-1)];
                if numel(unique(a))>=3
                    tp_ct=tp_ct+1;
                end
            end
            if u==1 && p~=k && p~=1
                if Grid(p-1,u)==r && Grid(p+1,u)==r && Grid(p,u+1)==r
                   in_ct=in_ct+1;
                end
                a=[Grid(p,u+1),Grid(p+1,u),Grid(p-1,u)];
                if numel(unique(a))>=3
                    tp_ct=tp_ct+1;
                end
            end
            if u==k && p~=1 && p~=k
                if Grid(p,u-1)==r && Grid(p+1,u)==r && Grid(p-1,u)==r
                    in_ct=in_ct+1;
                end
                a=[Grid(p+1,u),Grid(p,u-1),Grid(p-1,u)];
                if numel(unique(a))>=3
                    tp_ct=tp_ct+1;
                end
            end
            if p==k && u~=1 && u~=k
                if Grid(p,u-1)==r && Grid(p,u+1)==r && Grid(p-1,u)==r
                    in_ct=in_ct+1;
                end
                a=[Grid(p,u+1),Grid(p,u-1),Grid(p-1,u)];
                if numel(unique(a))>=3
                    tp_ct=tp_ct+1;
                end
            end
            if p==1 && u==1
                if Grid(1,2)==r && Grid(2,1)==r
                    in_ct=in_ct+1;
                end
            end
            if p==k && u==1
                if Grid(k-1,1)==r && Grid(k,2)==r
                    in_ct=in_ct+1;
                end
            end
            if p==1 && u==k
                if Grid(1,k-1)==r && Grid(2,k)==r
                    in_ct=in_ct+1;
                end
            end
            if p==k && u==k
                if Grid(k-1,k)==r && Grid(k,k-1)==r
                    in_ct=in_ct+1;
                end
            end
           u=u+1;
          end
         p=p+1;
         u=2;
        end
        in_ct
    gb_ct= (k)^2 - in_ct
tp_ct
t
e=pcolor(Grid)
set(e, 'EdgeColor', 'none');
