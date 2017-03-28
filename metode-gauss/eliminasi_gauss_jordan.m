%% 
% Program untuk menyelesaikan persamaan linier menggunakan metode eliminasi 
% gauss-jordan.
% 
%%

function eliminasi_gauss_jordan()
  
  % Matrix dari persamaan:
  %   12x + 10y + -7z = 15
  %   6x + 5y +3z = 14
  %   24x -y + 5z = 28
  a = [
    12 10 -7 15;
    6 5 3 14;
    24 -1 5 28;
  ];
  
  % Panggil fungsi gauss_jordan
  [solusi, matrix_hasil] = gauss_jordan(a);
  
  % Cetak matrix awal
  a
  
  % Cetak matrix hasil
  matrix_hasil
  
  % Cetak hasil/solusi
  solusi
  
endfunction

function [solusi, matrix] = gauss_jordan(matrix)
  
  % ambil ukuran matrix.
  [baris, kolom] = size(matrix);
  
  % Eliminasi
  % Segitiga bawah
  for i = 1:baris-1
    for j = i+1:baris
      
      % Cek apakah ada elemen matrix yang bernilai 0.
      % Nilai 0 harus ada dibawah (untuk segitiga bawah).
      if matrix(i,i) == 0
        temp = matrix(i,:);
        matrix(i,:) = matrix(j,:);
        matrix(j,:) = temp;
      endif
      
      matrix(j,:) = matrix(j,:) - matrix(i,:) * (matrix(j,i)/matrix(i,i)); 
    endfor
  endfor
  
  % Eliminasi
  % Segitiga atas
  for i = baris:-1:2
    for j = i-1:-1:1
      matrix(j,:) = matrix(j,:) - matrix(i,:) * (matrix(j,i)/matrix(i,i)); 
    endfor
  endfor
  
  % Hitung solusi
  for i = 1:baris
    solusi(i) = matrix(i,kolom)/matrix(i,i);
  endfor
  
endfunction