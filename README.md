## Bos Yapi Olustur
Verilen dizindeki t�m dosyalar� (0 byte olarak) ve dizinleri bulundu�u dizine olusturur.

Bir projeniz var. Fakat farkl� firmalar i�in farkl� dizinlerde geli�tirmelere devam ettiniz.
Bazen a firmas�nda yapt���n�z� b firmas�nda uygulamay� unuttunuz, ihmal ettiniz. Bazen de b projesinde yapt���n�z� a projesinde ununuttunuz. Bir g�n git kullanmaya karar verdiniz ve bu projelerinizi tek bir repoda toplamak ve her firmay� da bran� olarak tutmak istediniz. Kodlar�n�z� birle�tirmeye karar verdiniz. Asl�nda elinizde iki farkl� master var. 
Bir repo olu�turdunuz ve master bran�a a firmas�n� koydunuz, commitlediniz. b firmas� i�in bran� a�t�n�z commitlediniz.
sonra bunlar� merge etmek istediniz. 
Ters giden bir�eyler var. master da "git merge" b dedi�inizde masterdaki kodlar�n�z ezildi, conflict olmad�. Malesef bu ka��n�lmaz.
��nk� ortak bir commit atalar� yok. O zaman ortak bir commit atas� olmas� amac�yla t�m dosyalar�n�z� s�f�r byte olarak olu�turman�z gerekiyor. sonra a n�n kodlar�n� mastera al�p commit, b nin kodlar�n�n b bran��na al�p commit ettiniz. sonra "git merge b" dedi�inizde arad���n�z (arad���m) conflicti bulmu� oluyoruz.

��te bu script y�zlerce dosyaya ve klas�re sahip projenizin i�i bo� halini, ortak commit atas� olmas� i�in, olu�turmaya yar�yor.

Bu i�in kolay�n� b�yle buldum. Belki ba�ka bir ihtiya� i�in ya da benzer ihtiya� i�in kullanmak isteyebilirsiniz.

