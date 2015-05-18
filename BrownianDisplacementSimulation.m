/*
computes the squared displacement over time, for an ensemble of cases
*/

function dsq = BrownianDisplacementSimulation ( k, n, m, d, t )

  if ( nargin < 5 )
    t = 1.0;
  end

  if ( nargin < 4 )
    d = 10.0;
  end

  if ( nargin < 3 )
    m = 2;
  end

  if ( nargin < 2 )
    n = 1001;
  end

  if ( nargin < 1 )
    k = 20;
  end
%
%  Set the time step.
%
  dt = t / ( n - 1 );

  dsq = zeros ( k, n );

  for i = 1 : k
%
%  Compute the individual steps.
%
    x = zeros ( m, n + 1 );
%
%  Stepsize is normal.
%
    s = sqrt ( d * dt ) * randn ( 1, n - 1 );
%
%  Direction is random.
%
    if ( m == 1 )
      dx(1:m,1:n - 1) = s;
    else
      a = randn ( m, n - 1 );
      v = s ./ sqrt ( sum ( a.^2 ) );
      b = spdiags ( v', 0, n - 1, n - 1 );
      dx(1:m,1:n-1) = a * b;
    end
%
%  Each position is the sum of the previous steps.
%
    x(1:m,2:n) = cumsum ( dx(1:m,1:n-1), 2 );

    if ( m == 1 )
      dsq(i,1:n) = x(1,1:n).^2;
    else
      dsq(i,1:n) = sum ( x(1:m,1:n).^2 );
    end

  end

  return
end
