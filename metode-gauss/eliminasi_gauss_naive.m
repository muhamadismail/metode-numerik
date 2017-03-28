%% 
% Program untuk menyelesaikan persamaan linier menggunakan metode eliminasi 
% gauss. Metode eliminasi gauss ini dilakukan tanpa mengurutkan koefisien
% kolom pertama pada persamaan di matrix dari kecil ke besar.
% 
% Penjelasannya ada di: 
%   Naive Gaussian Elimination Method:
%     https://youtu.be/eMGeQOZONes
%   Pitfalls of Naive Gaussian Elimination
%     https://youtu.be/qqAThAjrLQg
%
%%

function eliminasi_gauss_naive()
  
  % Matrix yg akan menghasilkan error
  err_m = [
    12 10 -7 15;
    6 5 3 14;
    24 -1 5 28;
  ];
  
  % Matrix dari persamaan
  %   2x + 4y + 3z = 8
  %   -3x -2y +z = 3
  %   5x + 3y +2z = 2
  a = [
    2 4 3 8;
    -3 -2 1 3;
    5 3 2 2;
    ];
  
  % Panggil fungsi eliminasi_gauss
  % simpan nilai return dari fungsi tersebut kedalam solusi dan matrix_hasil.
  [solusi, matrix_hasil] = eliminasi_gauss(a);
  
  % Cetak matrix awal
  a
  
  % Cetak matrix hasil
  matrix_hasil
  
  % Cetak hasil/solusi
  solusi
  
endfunction


function [solusi, matrix] = eliminasi_gauss(matrix)
  
  % ambil ukuran matrix.
  [baris, kolom] = size(matrix);
  
  % Eliminasi
  % Segitiga bawah
  for i = 1:baris-1
    for j = i+1:baris
      
      matrix(j,:) = matrix(j,:) - matrix(i,:) * (matrix(j,i)/matrix(i,i));
    
    endfor
  endfor
  
  % Substitusi
  solusi = zeros(1,baris);
  
  for i = baris:-1:1
    temp = 0;
    
    for j = 1:baris
      temp += matrix(i,j)*solusi(j);
    end
    
    solusi(i) = (matrix(i,kolom)-temp)/matrix(i,i);
  
  end
  
endfunction