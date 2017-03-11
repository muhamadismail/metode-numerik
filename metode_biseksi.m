%%
% Metode biseksi untuk mencari akar x untuk suatu fungsi f(x). 
% Cara pakenya misalnya:
% Nyari akar buat fungsi: f(x) = e^x - 3x
%     metode_biseksi(@(x) exp(x)-3*x, 1, 2, 10)
%
% @param f          Fungsi dari persamaan yang akan dicari akar x-nya.
% @param x_a        Nilai x_i.
% @param x_b        Nilai x_i+1.
% @param max_iter   Jumlah pengulangan makismal.
%%
function metode_biseksi(f, x_a, x_b, max_iter)  
  if (f(x_a)*f(x_b) < 0)
    
    % Mencetak label tabel
    printf('i \t')
    printf('x_a \t\t x_b \t\t x_t \t\t')
    printf('f(x_a) \t f(x_b) \t f(x_t) \t')
    printf('error (%%)\n')
    
    for i = 1:max_iter
      x_t = (x_a + x_b) / 2;
      error = abs(x_b - x_a) / x_a;
      
      % Buat Cetak
      printf('\n%d \t', i)
      printf('%f \t %f \t %f \t', x_a, x_b, x_t)
      printf('%f \t %f \t %f \t', f(x_a), f(x_b), f(x_t))
      printf('%.2f', error * 100)
      
      % Cek apakah dalam range x_a dan x_t masih ada akar.
      if ( f(x_a)*f(x_t) < 0 )
        x_b = x_t;
      elseif ( f(x_a)*f(x_t) > 0 )
        x_a = x_t;
      else
        break
      endif
    endfor
    
    printf('\n nilai x = %f\n', x_t)
  else
    printf('Tidak ada akar\n')
  endif
endfunction