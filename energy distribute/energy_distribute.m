function output = energy_distribute(Ef, Omega)
output = zeros(size(Ef));


[num_rows, num_columns] = size(Ef);
for i = 1: num_rows
    for j = 1: num_columns
        part_Ef = zeros(size(Omega)); % 3*3
        
        % 给part_Ef赋值
        if((i-1)>0 && (j-1)>0)
            part_Ef(1, 1) = Ef(i-1, j-1);
        end
        if(i-1)>0
            part_Ef(1, 2) = Ef(i-1, j);
        end
        if((i-1)>0 && (j+1)<=num_columns)
            part_Ef(1, 3) = Ef(i-1, j+1);
        end
        if(j-1)>0
            part_Ef(2, 1) = Ef(i, j-1);
        end
        part_Ef(2, 2) = Ef(i, j); % 正中心
        if(j+1)<=num_columns
            part_Ef(2, 3) = Ef(i, j+1);
        end
        if((i+1)<=num_rows && (j-1)>0)
            part_Ef(3, 1) = Ef(i+1, j-1);
        end
        if(i+1)<=num_rows
            part_Ef(3, 2) = Ef(i+1, j);
        end
        if((i+1)<=num_rows && (j+1)<=num_columns)
            part_Ef(3, 3) = Ef(i+1, j+1);   
        end
        
        % part_Ef与Omega的对应元素相乘相
        temp = part_Ef .* Omega;
        sum_all = sum(temp, "all");
        output(i, j) = sum_all;
    end
end
% disp(output);


end