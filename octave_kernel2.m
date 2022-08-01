function parent = kernel_2 (G, root)
%% Compute a sparse adjacency matrix representation
%% of the graph with edges from ij.

  N = size (G, 1);
  %% Adjust from zero labels.
  root = root + 1;
  parent = zeros (N, 1);
  parent (root) = root;

  vlist = zeros (N, 1);
  vlist(1) = root;
  lastk = 1;
  for k = 1:N,
    v = vlist(k);   % Set the current vertex under consideration 
    if v == 0, break; end 
    [I,J,V] = find (G(:, v));              % These lines are responsible for : 
    nxt = I(parent(I) == 0);               % (1) figuring out the adjacent vertices of v; 
    parent(nxt) = v;                       % (2) Making v the parent of those adjacent vertices; 
    vlist(lastk + (1:length (nxt))) = nxt; % (3) updating vlist with those adjacent vertices. 
    lastk = lastk + length (nxt);         
  end

  %% Adjust to zero labels.
  parent = parent - 1;
