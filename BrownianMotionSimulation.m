/*
simulates Brownian motion
*/
function x = BrownianMotionSimulation ( m, n, d, t )

  if ( nargin < 4 )
    t = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default total time T = %g\n', t );
  end

  if ( nargin < 3 )
    d = 10.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default diffusion coefficient D = %g\n', d );
  end

  if ( nargin < 2 )
    n = 1001;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default number of steps N = %g\n', n );
  end

  if ( nargin < 1 )
    m = 2;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default spatial dimension M = %g\n', m );
  end
%
%  Set the time step.
%
  dt = t / ( n - 1 );
%
%  Compute the individual steps.
%
  x = zeros ( m, n );
%
%  Stepsize is normal.
%
  s = sqrt ( d * dt ) * randn ( 1, n - 1 );
%
%  Direction is random.
%
  if ( m == 1 )
    dx(1:m,1:n-1) = s(1:n-1);
  else
    a = randn ( m, n - 1 );
    v = s ./ sqrt ( sum ( a.^2 ) );
    b = spdiags ( v', 0, n-1, n-1 );
    dx(1:m,1:n-1) = a * b;
  end
%
%  Each position is the sum of the previous steps.
%
  x(1:m,2:n) = cumsum ( dx(1:m,1:n-1), 2 );

  return
end
