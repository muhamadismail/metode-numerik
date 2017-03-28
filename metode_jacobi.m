%% 
% Program untuk menyelesaikan persamaan linier menggunakan metode iterasi 
% jacobi. Saat di-run, akan dikeluarkan nilai daftar solusi dan paling akhir
% ditampilkan solusinya.
% 
%%

function metode_jacobi()
  %
  % Matrix dari persamaan:
  %   10w - 1x  + 2y        = 6
  %   -1w + 11x - y   + 3z  = 25
  %   2w  - x   + 10y - z   = -11
  %         3x  - y   + 8z  = 15
  %%
  a = [
    10 -1 2 0 6;
    -1 11 -1 3 25;
    2 -1 10 -1 -11;
    0 3 -1 8 15;
  ];
  
  % Panggil fungsi jacobi untuk menyelesaikan persamaan pada
  % matrix a dengan maksimal error 1e-7.
  [solusi, list_solusi] = jacobi(a, 1e-7);
  
  % Cetak hasil/solusi
  print_hasil(list_solusi) 
  
  solusi
  
endfunction

% Fungsi untuk menyelesaikan persamaan linier menggunakan metode jacobi.
% 
% @param matrix     persamaan yang ingin dicari penyelesaiannya.
% @param err_limit  nilai error untuk solusi.
function [solusi, list_solusi] = jacobi(matrix, err_limit)
  
  % ambil ukuran matrix.
  [baris, kolom] = size(matrix);
  
  % Nilai solusi awal dimisalkan 0
  solusi = zeros(1, baris);
  
  % Lakukan iterasi untuk mencari solusi dari persaman.
  counter = 0;
  while(true)
  
    for i = 1:baris
      sigma = 0;
      
      % Menjumlahkan 1 baris dengan nilai solusi.
      for j = 1:baris
        if j != i
          sigma += matrix(i,j) * solusi(j);
        endif
      endfor
      
      % Mencari nilai solusi baru.
      solusi_baru(i) = (matrix(i, kolom) - sigma) / matrix(i,i);
      
    endfor
    
    % Mengganti solusi lama dengan solusi yang baru.
    % Solusi lama tetap disimpan untuk dipakai pada iterasi berikutnya.
    solusi = solusi_baru;
    
    % Memasukan solusi iterasi ke-n.
    list_solusi(counter+1,:) = solusi;
    
    % Error dihitung dimulai dari tahap iterasi ke-2.
    if counter > 1
      % Mencari nilai error.
      error = abs((list_solusi(counter,:) 
        - list_solusi(counter-1,:))
        ./list_solusi(counter,:));
      
      % Untuk setiap error, cek apakah sudah memenuhi batas?
      % Jika telah mencapai batas error, hentikan loop.
      if error <= err_limit
        break;
      endif
      
    endif
    
    counter++;
  endwhile
  
endfunction

% Fungsi untuk print hasil.
function print_hasil(list_solusi)
  [baris, kolom] = size(list_solusi);
  
  for i = 1:kolom
    
    % Cetak daftar proses perubahan nilai solusi dan error.
    printf("%4s x%2d %4s", " ", i, " ")
  
  endfor
  
  for i = 1:kolom
    
    % Cetak daftar proses perubahan nilai solusi dan error.
    printf("%4s err%d%4s", " ", i, " ")
  
  endfor
  
  printf("\n")
  
  for i = 1:baris
    
    for j = 1:kolom
      printf("%2s %5.5f %2s", " ", list_solusi(i,j), " ")
    endfor
      
    if i > 1
      error = abs( 
        (list_solusi(i,:) - list_solusi(i-1,:)) ./ list_solusi(i,:) 
      ) .* 100;
      
      for j = 1:kolom
        printf("%3s %5.2f %3s", " ", error(j), " ")
      endfor
      
    else
      for j = 1:kolom
        printf("%5s - %5s", " ", " ")
      endfor
    endif
    
    printf("\n")
    
  endfor
  
  printf("\n")
endfunction