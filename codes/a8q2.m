clear
clc

n = input('Enter the Grid Size: \n');    %Size of the Grid
no_grain = input('Enter the Number of Grains: \n');    %Number of Grains
v_x = input('Enter velocity of growth in x direction: \n');    %2D velocity vector
v_y = input('Enter velocity of growth in y direction: \n');
time = input('Enter frequency: \n');    %Frequency
grid = zeros(n,n);    %Initilaizing Grid to Zero
v_total = v_x + v_y;    %Total Probability 
count = 0;

x_pos= randperm(n,no_grain);
y_pos= randperm(n,no_grain);

for i=1:no_grain
    grid(x_pos(i),y_pos(i))=i;
end

while length(x_pos)>1
    check_v = rand()*v_total;
    if check_v >= v_x
        if y_pos(1)  <= n-1 
            if grid(x_pos(1),y_pos(1)+1)==0
                grid(x_pos(1),y_pos(1)+1)=grid(x_pos(1),y_pos(1));
                
                x_pos(end+1) = x_pos(1);
                y_pos(end+1) = y_pos(1)+1;
            end
        end
        if y_pos(1) == n 
                if grid(x_pos(1),1)==0
                    grid(x_pos(1),1)=grid(x_pos(1),y_pos(1));
                
                    x_pos(end+1) = x_pos(1);
                    y_pos(end+1) = 1;
                end
        end
        if y_pos(1)-1>=1
            if grid(x_pos(1),y_pos(1)-1)==0
                grid(x_pos(1),y_pos(1)-1)=grid(x_pos(1),y_pos(1));
            
                x_pos(end+1) = x_pos(1);
                y_pos(end+1) = y_pos(1)-1;
               
            end
        end
        if y_pos(2) == 1
            if grid(x_pos(1),n)==0
                grid(x_pos(1),n)=grid(x_pos(1),y_pos(1));
                
                x_pos(end+1) = x_pos(1);
                y_pos(end+1) = n;
            end
        end
    end
    if check_v <= v_x
        if x_pos(1)+1 <=n && y_pos(1) <= n
            if grid(x_pos(1)+1,y_pos(1))==0
                grid(x_pos(1)+1,y_pos(1))=grid(x_pos(1),y_pos(1));
                x_pos(end+1) = x_pos(1)+1;
                y_pos(end+1) = y_pos(1);
            end
        end
        if x_pos(1) == n
            if grid(1,y_pos(1))==0                 
                grid(1,y_pos(1))=grid(x_pos(1),y_pos(1));
                
                x_pos(end+1) = 1;
                y_pos(end+1) = y_pos(1);
            end
            
            
        end
        if x_pos(1)-1 >= 1
            if grid(x_pos(1)-1,y_pos(1))==0
                grid(x_pos(1)-1,y_pos(1))=grid(x_pos(1),y_pos(1));
                x_pos(end+1) = x_pos(1)-1;
                y_pos(end+1) = y_pos(1);
            end
        end
        if x_pos(1) == 1
            if grid(n,y_pos(1))==0                 
                grid(n,y_pos(1))=grid(x_pos(1),y_pos(1));
                
                x_pos(end+1) = n;
                y_pos(end+1) = y_pos(1);
            end
            
        end
        
        x_pos = x_pos(2:end);
        y_pos = y_pos(2:end);
    end

    count = count + 1;
    
    if mod(count, time) == 0
        set(pcolor(grid), 'EdgeColor', 'none');
        f = getframe
        [im, map] = rgb2ind(f.cdata, 256, 'nodither')
        imwrite(im, map, 'test5.gif', 'gif', 'WriteMode', 'append')
    end

end