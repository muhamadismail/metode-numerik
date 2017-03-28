%% 
% Program untuk menyelesaikan persamaan linier menggunakan metode eliminasi 
% gauss partial pivoting. Metode ini mencegah error "division by zero" dan
% mencegah error yang terlampau besar.
% 
% Penjelasannya ada di: 
%   Gaussian Elimination with Partial Pivoting - Theory:
%     https://youtu.be/DAMKhFwSaw8
%
%%

function eliminasi_gauss_pivoting()
   
  % Matrix dari persamaan:
  %   12x + 10y + -7z = 15
  %   6x + 5y +3z = 14
  %   24x -y + 5z = 28
  a = [
    12 10 -7 15;
    6 5 3 14;
    24 -1 5 28;
  ];
  
  % Panggil fungsi eliminasi_gauss_pivot
  % simpan nilai return dari fungsi tersebut kedalam solusi dan matrix_hasil.
  [solusi, matrix_hasil] = eliminasi_gauss_pivot(a);
  
  % Cetak matrix awal
  a
  
  % Cetak matrix hasil
  matrix_hasil
  
  % Cetak hasil/solusi
  solusi
  
endfunction

function [solusi, matrix] = eliminasi_gauss_pivot(matrix)
  
  % ambil ukuran matrix.
  [baris, kolom] = size(matrix);
  
  % Eliminasi
  % Segitiga bawah
  for i = 1:baris-1
    for j = i+1:baris
      
      % Cek apakah ada elemen matrix yang bernilai 0.
      % Mencegah error division by zero.
      if matrix(i,i) == 0
        temp = matrix(i,:);
        matrix(i,:) = matrix(j,:);
        matrix(j,:) = temp;
      endif
      
      % Pilih satu: blok if yang atas atau bawah!
      % Blok if dibawah, bisa menggantikan blok if yang atas.
      
      #{
      if abs(matrix(i,i)) < abs(matrix(j,i))
        temp = matrix(i,:);
        matrix(i,:) = matrix(j,:);
        matrix(j,:) = temp;
      endif
      #}
      
    endfor
    
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
    endfor
    
    solusi(i) = (matrix(i,kolom)-temp)/matrix(i,i);
  
  end
  
endfunction