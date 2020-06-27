function [theta] = x1_deriv(x1, x3, x4)
  theta = (6.3322 * x1 * x4) + (39.68 * x1 * x3) + (0.6224 * x3 * x4);
endfunction
