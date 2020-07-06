% ###################################################################
% Ant Colony Optimization (ACO) for Travelling Salesman Problem (TSP)
%           ALGORITHM  : ANT COLONY SYSTEM (ACS1) FOR TSP
% ACS1 : Each ant only updates the last edge visited (in Local pheromone update)
% ###################################################################
% Parameters -->  x        : list of first coordinates of graph vertices 
%            -->  y        : list of second coordinates of graph vertices 
%            -->  Maxit    : Maximun nº of iterations
%            -->  num_Ants : Nº of artificial ants
%            -->  alpha    : Relative importance of the pheromone
%            -->  beta     : Importance of heuristic information
%            -->  rho      : Evaporation rate
%            -->  q0       : Used to see when to use the probability 
%                            component and when to select the best 
%                            possible component
%            -->  phi      : Decomposition coefficient of pheromones
%            -->  tau0     : Initial value of pheromones

% Output     -->  sol      : Optimal tour length
% """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function sol = ACS1_for_TSP(x,y,Maxit,num_Ants,alpha,beta,rho,q0,phi,tau0)

[m,n] = size(x);   % n : total nº of graph vertices

% ------------------ Distance matrix --------------------------
len_mat = zeros(n);
for i = 1:n
    for j = i+1:n
        len_mat(i,j) = sqrt((x(i)-x(j))^2 + (y(i)-y(j))^2); 
        len_mat(j,i) = len_mat(i,j);
    end
end

% ---------------- Initial pheromone matrix ------------------
for i = 1:n
    for j = i+1:n
        pher_mat(i,j) = len_mat(i,j).^(-1); 
        pher_mat(j,i) = pher_mat(i,j);
    end
end

%------------------ Vertices visited by ants -------------------
for iter=1:Maxit
    vsit_vert = [];  %  visited vertices
    for k = 1:num_Ants
        nonvsit_vert = 1:n; % non-visited vertices
        init_pos = randi(n); % first vertex visited by the k-ant
        vsit_vert(k,1) = init_pos;
        nonvsit_vert(init_pos) = [];
        iaux = init_pos;
        pos = 1;   % position counter     
        q = rand;   
        while pos < n-1 
            fprob = []; % transition probability of the k-ant
            acs_prob = []; % To find the maximum when q <= q0
            for j = nonvsit_vert       
                fprob(k,j) = (pher_mat(iaux,j)^alpha)*((1/len_mat(iaux,j))^beta);
                acs_prob(k,j) = pher_mat(iaux,j)*((1/len_mat(iaux,j))^beta);
            end  
    %            ------------ ACS1 ------------
            if q<= q0  
                k_max = max(acs_prob(k,:)); % It might match maximums
                jaux = find(acs_prob(k,:)==k_max);
                b = length(jaux);
                jaux = jaux(randi(b)); % choose one of them
                
    %            ------------- AS -------------            
            else       
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

            end
            pos = pos + 1;
            vsit_vert(k,pos) = jaux; % add nex visited vertex
            
            nonvsit_vert(nonvsit_vert == jaux) = []; % remove it from the unvisited

            iaux = jaux; % That vertex will now be the new one from which it starts
            ran = length(nonvsit_vert);
            if ran == 1
                vsit_vert(k,n) = nonvsit_vert(1);
                nonvsit_vert(1) = [];  
            end             
        end

        %------------- LOCAL pheromone update (ACS1) ---------------
        pher_mat(vsit_vert(k,n),vsit_vert(k,1)) = (1-phi)*pher_mat(vsit_vert(k,n),vsit_vert(k,1)) + phi*tau0;            
        pher_mat(vsit_vert(k,1),vsit_vert(k,n)) = pher_mat(vsit_vert(k,n),vsit_vert(k,1));
        
        % ------------------ K-path length -------------------------
        len_tour(k) = 0;        
        for i = 1:n-1
            len_tour(k) = len_tour(k) + len_mat(vsit_vert(k,i),vsit_vert(k,i+1)); 
        end
        % edge back to the starting point
        len_tour(k) = len_tour(k) + len_mat(vsit_vert(k,n),vsit_vert(k,1));  
        
    end %end ants loop

    %------------- Pheromone update for the best ant ----------------
    % who is the best ant? :
    k_min = min(len_tour);
    best_kant = find(abs(len_tour-k_min)<=10^-15); % can coincide, so take one                                      
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
            pher_mat(j,i) = pher_mat(i,j);   
         end
    end
    % uncomment if you want to see the iteration counter and the average tours of each iteration:  
    %                                 |
    %          disp('Iteracion:'),disp(num2str(iter))
    % disp(mean(len_tour))  % it is minimized little by little in each iteration

end  % end iteration loop

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