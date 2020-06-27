function [validation_matrix] = restrictions(theta)
  k = [
    0,0;
    0,0;
    0,0;
    0,0;
  ];
  % Domain restrictions
  if 0.1 <= theta(1) && theta(1) <= 100
    k(1,1) = 1;
  endif
  if 0.1 <= theta(2) && theta(2) <= 100
    k(2,1) = 1;
  endif
  if 10 <= theta(3) && theta(3) <= 200
    k(3,1) = 1;
  endif
  if 10 <= theta(4) && theta(4) <= 200
    k(4,1) = 1;
  endif

  % G restrictions
  restriction_1 = (-1 * theta(1)) + (0.0193 * theta(3));
  restriction_2 = (-1 * theta(2)) + (0.00954 * theta(3));
  restriction_4 = theta(4) - 240;
  convergence = (-3.1416 * theta(3)^2 * theta(4)) - ((3.1416 * theta(3)^3)/4) + 1296000;
  if restriction_1 <= 0 && restriction_2 <= 0
    k(3,2) = 1;
  endif
  if restriction_4 <= 0
    k(4,2) = 1;
  endif
  if convergence <= 0
    k(1,2) = 1;
    k(2,2) = 1;
  endif
  validation_matrix = k;
endfunction
