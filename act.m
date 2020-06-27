% Feature number: 4
% derivadas parciales ------------------------------------------
% respecto a x_1: 6.3322 x_1 x_4 + 39.68 x_1 x_3 + 0.6224 x_3 x_4
% respecto a x_2: 1.7781 x_3^2
% respecto a x_3: 19.84 x_1^2 + 0.6224 x_1 x_4 + 3.5562 x_4 x_2
% respecto a x_4: 3.1661 x_1^2 + 0.6224 x_1 x_3
% ---------------------------------------------------------------

theta = [100, 100, 200, 200];
alpha = 0.00001;

for iter = 1:50
  printf('\nIteration: %d \n', iter);
  tx_1 = theta(1) - x1_deriv(theta(1), theta(3), theta(4)) * alpha;
  tx_2 = theta(2) - x2_deriv(theta(3)) * alpha;
  tx_3 = theta(3) - x3_deriv(theta(1), theta(2), theta(4)) * alpha;
  tx_4 = theta(4) - x4_deriv(theta(1), theta(3)) * alpha;
  txs = [tx_1, tx_2, tx_3, tx_4];

  validation_matrix = restrictions(txs);

  better_theta = theta;

  % Improve
  for i = 1:rows(validation_matrix)
    if validation_matrix(i,1) == 1 && validation_matrix(i,2) == 1
      better_theta(i) = txs(i);
    else
      printf('Out of scope\nOptimal solution found:\n');
      theta
      validation_matrix = restrictions(theta)
      cost = (
            0.6224 * theta(1) * theta(3) * theta(4)
         ) + (
            1.7781 * theta(2) * theta(3)^2
         ) + (
            3.1661 * theta(1)^2 * theta(4)
         ) + (
            19.84 * theta(1)^2 * theta(3)
         )
      return;
    endif
  endfor

  theta = better_theta;

end
