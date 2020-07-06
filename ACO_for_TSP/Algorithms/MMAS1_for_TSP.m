% ###################################################################
% Ant Colony Optimization (ACO) for Travelling Salesman Problem (TSP)
%        ALGORITHM  : MAX-MIN ANT SYSTEM (MMAS1) FOR TSP
%   MMAS1 : The exact length of the optimal tour is not known
% ###################################################################
% Parameters -->  x        : list of first coordinates of graph vertices 
%            -->  y        : list of second coordinates of graph vertices 
%            -->  Maxit    : Maximun nº of iterations
%            -->  num_Ants : Nº of artificial ants
%            -->  alpha    : Relative importance of the pheromone
%            -->  beta     : Importance of heuristic information
%            -->  rho      : Evaporation rate

% Output     -->  sol : Optimal tour length
% """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function sol = MMAS1_for_TSP(x,y,Maxit,num_Ants,alpha,beta,rho)

[m,n] = size(x);   % n : total nº of graph vertices

% ------------------ Distance matrix --------------------------
len_mat = zeros(n);
for i = 1:n
    for j = i+1:n
        len_mat(i,j) = sqrt((x(i)-x(j))^2 + (y(i)-y(j))^2); 
        len_mat(j,i) = len_mat(i,j);
    end
end

% ------------------ Initial tau_max --------------------------
% Initially tau_max is the length of the tour between closest vertices
L0 = 0;
start = 1;
svert(1) = start;
nvert = 2:n;
while length(nvert) ~= 0
    min_len = 10^10;
    for j = nvert
        if len_mat(start,j)<=min_len
            min_len = len_mat(start,j);
            jtemp = j;
        end
    end
    L0 = L0 + min_len;
    start = jtemp;
    nin = find(nvert==jtemp);
    nvert(nin) = [];
end
L0 = L0 + len_mat(jtemp,1);
tau_max0 = (rho*L0)^-1; % Initial tau_max

% ---------------- Initial pheromone matrix ------------------
tau_min = tau_max0/(2*num_Ants);
for i = 1:n
    for j = i+1:n
        pher_mat(i,j) = tau_max0; 
        pher_mat(j,i) = pher_mat(i,j);
    end
end

%------------------ Vertices visited by ants -------------------
for iter = 1:Maxit
    vsit_vert = [];  % visited vertices  
    for k = 1:num_Ants          
        nonvsit_vert = [1:n]; % non-visited vertices
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
    
%------------- Pheromone update for the best ant ----------------  
    % who is the best ant? :
    k_min = min(len_tour);
    tau_max = 1/(rho*k_min); % update tau_max

    best_kant = find(abs(len_tour-k_min)<=10^-15); %can coincide, so take one
    posi = 0;
    delta_best = [];
    for i = vsit_vert(best_kant(1),:)
        posi = posi + 1;
        if posi == n
            break
        end
        delta_best(i,vsit_vert(best_kant(1),posi+1)) = 1/k_min;
        delta_best(vsit_vert(best_kant(1),posi+1),i) = delta_best(i,vsit_vert(best_kant(1),posi+1));           

    end
    % way back to the origin 
    delta_best(vsit_vert(best_kant(1),n),vsit_vert(best_kant(1),1)) = 1/k_min;
    delta_best(vsit_vert(best_kant(1),1),vsit_vert(best_kant(1),n)) = delta_best(vsit_vert(best_kant(1),n),vsit_vert(best_kant(1),1));  
    for i = 1:n
         for j = i+1:n
            pher_mat(i,j) = (1-rho)*pher_mat(i,j) + rho*delta_best(i,j);  
            if pher_mat(i,j) < tau_min
                pher_mat(i,j) = tau_min;
            elseif pher_mat(i,j) > tau_max
                pher_mat(i,j) = tau_max;
            end
            pher_mat(j,i) = pher_mat(i,j);   
         end
    end
    % uncomment if you want to see the iteration counter and the average tours of each iteration:  
    %                                 | 
    %          disp('Iteracion:'),disp(num2str(iter))
    % disp(mean(len_tour))  % it is minimized little by little in each iteration
    
end % end iteration loop

% best-tour --> sol (Output)
sol = k_min;

%------------------ Optimal route drawing ---------------
for i = 1:n                      
    X(i) = x(vsit_vert(best_kant(1),i));  
    Y(i) = y(vsit_vert(best_kant(1),i));  
end
Xf = [x(vsit_vert(best_kant(1),n)) x(vsit_vert(best_kant(1),1))];
Yf = [y(vsit_vert(best_kant(1),n)) y(vsit_vert(best_kant(1),1))];
hold on
plot(x,y,'o','LineWidth',1,'MarkerSize',5,'MarkerEdgeColor',...
    'b','MarkerFaceColor','g');
plot(X,Y,'r-')
plot(Xf,Yf,'r-') % join the final vertex with the starting one
hold off

end % end function
