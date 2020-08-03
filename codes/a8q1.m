n=input('Size of computational grid\n')
state= zeros(n,n);
g=input('Number of grains\n')
vx=input('velocity in x direction\n')
vy=input('velocity in y direction\n')
F=input('frequency\n')

j=1;
k=0;


sites_x= randperm(n,g);
sites_y= randperm(n,g);

for i=1:g
state(sites_x(i),sites_y(i))=i;
end
figure(1)

    while numel(sites_x)>1
        filename='microstructure.gif';
        Vmax=vx+vy;
        random_number=rand()*(Vmax);
        if random_number>=vx
      if sites_y(j) <= n-1
        if state(sites_x(j),sites_y(j)+1)==0
            state(sites_x(j),sites_y(j)+1)=state(sites_x(j),sites_y(j));
          
           sites_x(end+1) = sites_x(j);
           sites_y(end+1) = sites_y(j)+1;
                 k=k+1;
                 if mod(k,F)==0
          e=pcolor(state)
          set(e, 'EdgeColor', 'none');
      drawnow
      frame = getframe(1);
      im = frame2im(frame);
                 end
                 
          
        end
      end
      if sites_y(j)-1>=1
        if state(sites_x(j),sites_y(j)-1)==0
            state(sites_x(j),sites_y(j)-1)=state(sites_x(j),sites_y(j));
            
            sites_x(end+1) = sites_x(j);
           sites_y(end+1) = sites_y(j)-1;
                 k=k+1;
                 if mod(k,F)==0
                 e=pcolor(state)
                 set(e, 'EdgeColor', 'none');
      drawnow
      frame = getframe(1);
      im = frame2im(frame);
                 end
        end
      end
        end
        if random_number<=vx
      if sites_x(j)+1 <=n
        if state(sites_x(j)+1,sites_y(j))==0
            state(sites_x(j)+1,sites_y(j))=state(sites_x(j),sites_y(j));
           sites_x(end+1) = sites_x(j)+1;
           sites_y(end+1) = sites_y(j);
                 k=k+1;
                 if mod(k,F)==0
                e= pcolor(state)
                set(e, 'EdgeColor', 'none');
      drawnow
      frame = getframe(1);
      im = frame2im(frame);
                 end

              

        end
      end
      if sites_x(j)-1 >= 1
        if state(sites_x(j)-1,sites_y(j))==0
            state(sites_x(j)-1,sites_y(j))=state(sites_x(j),sites_y(j));
            sites_x(end+1) = sites_x(j)-1;
           sites_y(end+1) = sites_y(j);
                 k=k+1;
                 if mod(k,F)==0
                e= pcolor(state)
                set(e, 'EdgeColor', 'none');
      drawnow
      frame = getframe(1);
      im = frame2im(frame);
                 end   
        end
      end
        
         sites_x = sites_x(2:end);
         sites_y = sites_y(2:end);
        end
       
    end
    imshow(im)
    


state
e=pcolor(state)
set(e, 'EdgeColor', 'none');