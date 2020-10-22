model MatrixOperations
  //illustrate basic matrix math.  using <,> to separate columns, <;> separates rows
  Real[3] a = {1,2,3};
  Real[3] b = {4,5,6};
  Real    c;
  Real[3] d;
  Real[3] e;

  Real[3,3] A = [a,a,a]; //a is a column giving [1,1,1; 2,2,3; 3,3,3]
  Real[3,3] B = [b,b,b];
  Real[3,3] C;


  //now, variable dimensions
  constant Integer n = 2;
  Real an[:] = { i for i in 1:n}; //=[1,2]
  Real bn[:] = { i+n for i in 1:n};
  Real L[n,n] = { i+1/j for i in 1:n, j in 1:n}; //=[2,1.5; 3,2.5]
  Real san;
  Real saL;
  Real sLa;

  //with trig
  constant Integer m = 2;
  Modelica.SIunits.Angle th[:] = { Modelica.Constants.pi/10*i for i in 1:m }; //N.B.: modelica is 1-indexed like matlab, so i = 1,2,3,4,5,6,7,8,9,10
  Real sumTh;
  Real K[m,m] = { i+j for i in 1:m, j in 1:m};
  Real Kth[m];
  Real sumKth;
  Real sumJth;

  Real z[2];

  equation
    c = a*b; //=32, a is implicitly transposed()
    d = A*a; //=[6;12;18]
    e = a*A; //=[14,14,14] implied transpose()
    C = A*B; // = [15,15,15; 30,30,30; 45,45,45]

    san = sum( an ); //=10
    saL = sum( an * L ); //=sum([8,6.5])=14.5
    sLa = sum( L * an ); //=sum([5;8]) = 13

    sumTh = sum( cos(th) ); //=-1
    Kth = K * cos(th);
    sumKth = sum( K * cos(th) ); // cos(th) returns a vector, then matrix multiply, then sum
    sumJth = sum({K[j,j]*cos(th[j])*j for j in 1:m});

    {1,2} = {{1,0},{0,1}} * z;

end MatrixOperations;
