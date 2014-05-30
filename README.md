## Bos Yapi Olustur
Verilen dizindeki tüm dosyalarý (0 byte olarak) ve dizinleri bulunduðu dizine olusturur.

Bir projeniz var. Fakat farklý firmalar için farklý dizinlerde geliþtirmelere devam ettiniz.
Bazen a firmasýnda yaptýðýnýzý b firmasýnda uygulamayý unuttunuz, ihmal ettiniz. Bazen de b projesinde yaptýðýnýzý a projesinde ununuttunuz. Bir gün git kullanmaya karar verdiniz ve bu projelerinizi tek bir repoda toplamak ve her firmayý da branþ olarak tutmak istediniz. Kodlarýnýzý birleþtirmeye karar verdiniz. Aslýnda elinizde iki farklý master var. 
Bir repo oluþturdunuz ve master branþa a firmasýný koydunuz, commitlediniz. b firmasý için branþ açtýnýz commitlediniz.
sonra bunlarý merge etmek istediniz. 
Ters giden birþeyler var. master da "git merge" b dediðinizde masterdaki kodlarýnýz ezildi, conflict olmadý. Malesef bu kaçýnýlmaz.
Çünkü ortak bir commit atalarý yok. O zaman ortak bir commit atasý olmasý amacýyla tüm dosyalarýnýzý sýfýr byte olarak oluþturmanýz gerekiyor. sonra a nýn kodlarýný mastera alýp commit, b nin kodlarýnýn b branþýna alýp commit ettiniz. sonra "git merge b" dediðinizde aradýðýnýz (aradýðým) conflicti bulmuþ oluyoruz.

Ýþte bu script yüzlerce dosyaya ve klasöre sahip projenizin içi boþ halini, ortak commit atasý olmasý için, oluþturmaya yarýyor.

Bu iþin kolayýný böyle buldum. Belki baþka bir ihtiyaç için ya da benzer ihtiyaç için kullanmak isteyebilirsiniz.

