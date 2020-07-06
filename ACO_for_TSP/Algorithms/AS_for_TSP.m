% ###################################################################
% Ant Colony Optimization (ACO) for Travelling Salesman Problem (TSP)
%           ALGORITHM  : ANT SYSTEM (AS) FOR TSP
% ###################################################################
% Parameters -->  x        : list of first coordinates of graph vertices 
%            -->  y        : list of second coordinates of graph vertices 
%            -->  Maxit    : Maximun nº of iterations
%            -->  num_Ants : Nº of artificial ants
%            -->  alpha    : Relative importance of the pheromone
%            -->  beta     : Importance of heuristic information
%            -->  rho      : Evaporation rate

% Output     -->  opt_tour : Optimal tour length
% """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function opt_tour = AS_for_TSP(x,y,Maxit,num_Ants,alpha,beta,rho)

[m,n] = size(x);   % n : total nº of graph vertices

% ------------------ Distance matrix --------------------------
len_mat = zeros(n);
for i = 1:n
    for j = i+1:n
        len_mat(i,j) = sqrt((x(i)-x(j))^2 + (y(i)-y(j))^2); 
        len_mat(j,i) = len_mat(i,j);
    end
end

% ---------------- Initial pheromone matrix -------------------
for i = 1:n
    for j = i+1:n
        pher_mat(i,j) = len_mat(i,j).^(-1); 
        pher_mat(j,i) = pher_mat(i,j);
    end
end

%------------------ Vertices visited by ants -------------------
for iter = 1:Maxit
    vsit_vert = [];  % visited vertices  
    for k = 1:num_Ants          
        nonvsit_vert = 1:n; % non-visited vertices
        init_pos = randi(n); % first vertex visited by the k-ant
        vsit_vert(k,1) = init_pos;
        nonvsit_vert(init_pos) = [];
        iaux = init_pos;
        pos = 1;   % position counter
        while pos < n-1  
            fprob = []; % transition probability of the k-ant
            for j = nonvsit_vert       
                fprob(k,j) = (pher_mat(iaux,j)^alpha)*((1/len_mat(iaux,j))^beta);
            end  
            fprob(k,:) = fprob(k,:)/sum(fprob(k,:));
            ind = find(fprob(k,:)); % to search the indices with non-null values
            prob = [];
            for h = ind
                prob(k,h) = sum(fprob(k,1:h));  % probability intervals
            end
            int_prob=[];
            int_prob(k,:) = [0, prob(k,ind)]; % cumulative probabilities
            [s,t] = size(int_prob(k,:));
            nrand = rand; % random number in (0,1) interval
            for i = 1:t-1
                if nrand>=int_prob(k,i) & nrand<int_prob(k,i+1)
                   jaux = i+1; 
                end
            end   
            next_ind = int_prob(k,jaux)-int_prob(k,jaux-1);
            prob_temp = [];  % to find the next vertex visited
            prob_temp(k,:) = fprob(k,:)-next_ind; % so find does not fail
            jaux = find(abs(prob_temp(k,:))<=10^-15);
            
            % fix in case length(jaux)>1
            e = length(jaux); 
            contj = 1; % position counter of jaux           
            if e>1
                while contj<=e
                    if sum(fprob(k,1:jaux(contj)))>=nrand
                        jaux = jaux(contj);
                        break
                    else
                        contj = contj + 1;
                    end
                end
            end    
            pos = pos + 1;
            vsit_vert(k,pos) = jaux;  % add nex visited vertex
            nonvsit_vert(nonvsit_vert == jaux) = []; % remove it from the unvisited
            iaux = jaux; % That vertex will now be the new one from which it starts
            [p,q] = size(nonvsit_vert);   
            if q == 1
                vsit_vert(k,pos+1) = nonvsit_vert(q); 
                nonvsit_vert(q) = [];    
            end         
        end

% ------------------ K-path length -------------------------
        len_tour(k) = 0;        
        for i = 1:n-1
            len_tour(k) = len_tour(k) + len_mat(vsit_vert(k,i),vsit_vert(k,i+1)); 
        end
        % edge back to the starting point
        len_tour(k) = len_tour(k) + len_mat(vsit_vert(k,n),vsit_vert(k,1));  
        
    end % end ants loop
    
%-------------------- Pheromone update --------------------
    sum_ktau = [];
    for k = 1:num_Ants        
        posi = 0;
        for i = vsit_vert(k,:)
            posi = posi + 1;
            if posi == n
                break
            end
            sum_ktau(k,i,vsit_vert(k,posi+1)) = 1/len_tour(k);
            sum_ktau(k,vsit_vert(k,posi+1),i) = sum_ktau(k,i,vsit_vert(k,posi+1));   
        end
        
        % way back to the origin        
        sum_ktau(k,vsit_vert(k,n),vsit_vert(k,1)) = 1/len_tour(k);
        sum_ktau(k,vsit_vert(k,1),vsit_vert(k,n)) = sum_ktau(k,vsit_vert(k,n),vsit_vert(k,1));
    end
    for i = 1:n
         for j = i+1:n
             pher_mat(i,j) = (1-rho)*pher_mat(i,j) + sum(sum_ktau(1:num_Ants,i,j));            
             pher_mat(j,i) = pher_mat(i,j);
         end
    end
    
% uncomment if you want to see the iteration counter and the average tours of each iteration: 
%                                 |
    %          disp('Iteracion:'),disp(num2str(iter))
    % disp(mean(len_tour))  % it is minimized little by little in each iteration
    
end %end iteration loop  

% best-tour --> opt_tour (Output)
opt_tour = min(len_tour);

%------------------ Optimal route drawing ---------------
k_opt = find(len_tour==opt_tour); % minimuns can coincide, so take one (k_opt(1))
for i = 1:n                       
    X(i) = x(vsit_vert(k_opt(1),i));  
    Y(i) = y(vsit_vert(k_opt(1),i)); 
end
Xf = [x(vsit_vert(k_opt(1),n)) x(vsit_vert(k_opt(1),1))];
Yf = [y(vsit_vert(k_opt(1),n)) y(vsit_vert(k_opt(1),1))];
hold on
plot(x,y,'o','LineWidth',1,'MarkerSize',5,'MarkerEdgeColor',...
    'b','MarkerFaceColor','g');
plot(X,Y,'r-')
plot(Xf,Yf,'r-') % join the final vertex with the starting one
hold off

end %end function
