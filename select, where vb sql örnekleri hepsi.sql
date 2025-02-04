USE OrnekVT
USE Northwind

--Select--
Select * from Personeller
Select adi,soyadi from Personeller

--Boşluk karakteri olan Alias atama--
Select 1453 İstanbulun Fethi

Select 1453 [İstanbulun Fethi]

--Boşluk karakteri olan tabloyu sorgulama--
Select * from Satis Detaylari

Select * from [Satis Detaylari]

--Kolonları birleştirme--
Select Adi, SoyAdi from Personeller

Select Adi + ' ' + SoyAdi[Personel Bilgileri] from Personeller

--Farklı tipteki kolonları birleştirme--
Select Adi + ' ' + IseBaslamaTarihi from Personeller

Select Adi + ' ' + CONVERT(nvarchar,IseBaslamaTarihi)from Personeller

Select Adi + ' ' + CAST(IseBaslamaTarihi as nvarchar)from Personeller

--Select sorgularında (WHERE) şartı yazmak--
Select * from Personeller

--Personel tablosunda şehri london olan verileri listeleyelim--
Select * from Personeller where Sehir = 'London'

--Personel tablosunda bağlı çalıştığı kişi sayısı 5'ten küçük olanları listeleyelim--
Select * from Personeller where BagliCalistigiKisi<5

--AND Operatörü
--Personeller tablosunda şehri London olan ve ülkesi UK olanları listeleyelim--
Select * from Personeller where Sehir='London' and Ulke='UK'

--OR Operatörü
--Personeller tablosunda UnvanEki 'Mr.' olan veya şehri Seattle olan tüm personelleri listeleyelim--
Select * from personeller where UnvanEki='Mr.' or Sehir='Seattle'

--Karışık örnekler--
--Adı Robert soyadı King olan personelin tüm bilgilerini çek--
Select * from Personeller where Adi='Robert' and SoyAdi='King'

--PersonelID'si 5 olan personelleri getir--
Select * from Personeller where PersonelID=5

--PersonelID'si 5'den büyük olan tüm personelleri getir--
Select * from Personeller where PersonelID > 5

-- <> Eşit Değilse
-- = Eşitse
-- <= Küçük ve Eşitse
-- >= Büyük ve Eşitse

--Fonksiyon sonuçlarını şart olarak kullanmak
--1993 yılında işe başlayanları listele--
Select * from Personeller where YEAR(IseBaslamaTarihi) = 1993

--1992 yılından sonra işe başlayanları listele--
Select * from Personeller where YEAR(IseBaslamaTarihi) > 1992

--Doğum günü, ayın 29 olmayan personelleri listele--
Select * from Personeller where DAY(DogumTarihi)<>29

--Doğum yılı 1950 ile 1965 yılları arasında olan personelleri listele--
Select * from Personeller where YEAR(DogumTarihi)>1950 and YEAR(DogumTarihi) <1965

--Between Komutu
--Doğum yılı 1950 ile 1965 yılları arasında olan personelleri listele--
Select * from Personeller where YEAR(DogumTarihi) Between 1950 and 1965

--Yaşadığı şehrin London, Tacoma ve Kirkland olan personellerin adını listeleyelim--
Select Adi from Personeller where Sehir='London' or Sehir = 'Tacoma' or Sehir = 'Kirkland'

--In Komutu
--Yaşadığı şehrin London, Tacoma ve Kirkland olan personellerin adını listeleyelim--
Select Adi from Personeller where Sehir In('London','Tacoma','Kirkland')

--LIKE Sorguları
-- %(Genel önemli değil) Operatörü
--İsminin baş harfi j olan personellerin adını ve soyadını yazdıralım--
Select Adi,SoyAdi from Personeller where Adi LIKE 'j%'

--İsminin son harfi y olan personellerin adını ve soyadını yazdıralım--
Select Adi, SoyAdi from Personeller where Adi LIKE '%y'

--İsminin son 3 harfi ert olan personeli getirelim--
Select * from Personeller where Adi LIKE '%ert'

--İsminin ilk harfi r, son harfi t olan personeli yazdıralım--
Select * from Personeller where Adi LIKE 'r%t'

--İsminde an geçen personeli yazdıralım--
Select * from Personeller where Adi LIKE '%an%'

--İsminin baş harfi n olan ve içerisinde an geçen personeli getirelim--
Select * from Personeller where Adi LIKE 'n%an%'

-- _ (Özel öenmli değil) Operatörü
--İsminin ilk harfi a, ikinci harfi farketmez ve üçüncü harfi d olan personeli getirelim--
Select * from Personeller where Adi LIKE 'a_d%'

--İsminin ilk harfi m, ikinci, üçüncü, dördüncü harfleri farketmez ve beşinci harfi a olan personeli yazdıralım--
Select * from Personeller where Adi LIKE 'm___a%'

--İsminin ilk harfi n yada m yada r olan personelleri getirelim--
Select * from Personeller where Adi LIKE '[nmr]%'

--İsminin içerisinde a yada i geçen personelleri listeleyelim--
Select * from Personeller where Adi LIKE '%[ai]%'

-- [*-*](Alfabetik arasında) Operatörü
--İsminin baş harfi a ile k arasında alfabetik sıraya göre herhangi bir harf olan personellerin adını yazdıralım--
Select Adi from Personeller where Adi LIKE '[a-k]%'

-- [^*](Değil) Operatörü
--İsminin baş harfinde a olmayan personelleri getirelim--
Select * from Personeller where Adi LIKE '[^a]%'

--İsminin baş harfi an olmayan personelleri getirelim--
Select * from Personeller where Adi LIKE '[^an]%'

--Escape(Kaçış) Karakterleri
--LIKE sorgularında kullandığımız %,_,[] gibi özel ifadeler eğerki verilerimiz içerisinde geçiyorsa sorgulama esnasında hata ile karşılaşabiliriz.
--Böyle durumlarda bu ifadelerin özel ifade olmadığını escape karakteri ile belirleyebiliriz.

--[] Operatörü ile
--Escape komutu ile
Select * from Personeller where Adi LIKE '[_]%'
Select * from Personeller where Adi LIKE 'ü_%' escape 'ü'

--AGGREGATE Fonksiyonları
--Bir tablo içerisindeki tüm veriler için işlem yapmamızı sağlayan fonksiyonlardır.
--AVG : Ortalama alır--
Select AVG(PersonelID) from personeller

--Max : En büyük değeri bulur--
Select MAX(PersonelID) from personeller

--Min : En küçük değeri bulur--
Select MIN(PersonelId) from personeller

--Count : Toplam sayısını verir--
Select COUNT(*) from personeller
Select COUNT(Adi) from personeller

--SUM : Toplamını verir--
Select SUM(NakliyeUcreti) from satislar

--STRING FONKSİYONLARI
--Left : soldan(baştan) belirtilen sayıda karakteri getirir.
--Adı kolonunda baştan 2 karakteri ekrana getirelim--
Select LEFT (Adi, 2) from Personeller

--Right : sağdan(sondan) belirtilen sayıda karakteri getirir.
--Adı kolonunda sondan 3 karakteri ekrana yazdıralım--
Select RIGHT (Adi,3) from Personeller

--Upper : Büyük harfe çevirir.
--Adı kolonunu büyük harfe çevirelim--
Select UPPER(Adi)from Personeller

--Lower : Küçük harfe çevirir.
--Adı kolonunu küçük harfe çevirelim--
Select LOWER(Adi) from Personeller

--Substring : Belirtilen indexten itibaren belirtilen sayıda karakter getirir.
--Soyadı kolonundaki 3.indexten başla 2 karakter ekrana yazdıralım--
Select SUBSTRING(SoyAdi,3,2) from Personeller

--LTRIM : Soldan boşlukları keser.
Select '           Eren'
Select LTRIM('           Eren')

--RTRIM : Sağdan boşlukları keser.
Select 'Eren           '
Select RTRIM('Eren           ')

--REVERSE : Tersine çevirir.
Select  REVERSE(Adi) from Personeller

--REPLACE : Belirtilen ifadeyi, belirtilen ifade ile değiştirir.
Select REPLACE('Benim Adım Eren','Eren','Ali')

--CHARINDEX : Belirtilen karakterin veri içinde sıra numarasını verir.
--Müşteri adi kolonunda boşluk hangi karaktere geldiğini yazdıralım--
Select MusteriAdi, CHARINDEX(' ',MusteriAdi) from Musteriler
 
--CHARINDEX Örnek
--Müşteriler tablosunun MüşteriAdi kolonundan sadece adlarını çekelim--
Select MusteriAdi from Musteriler
Select SUBSTRING(MusteriAdi,0,CHARINDEX(' ',MusteriAdi)) from Musteriler  --0 dan başla boşluk karakterine kadar al anlamı taşır.

--Müşteriler tablosundan MüşteriAdi kolonundan sadece soyadlarını çekelim--
Select SUBSTRING(MusteriAdi, CHARINDEX(' ',MusteriAdi), LEN(MusteriAdi) - (CHARINDEX(' ',MusteriAdi) -1)) from Musteriler
	
--SAYISAL DEĞER İŞLEMLERİ
Select 3+2
Select 3*3
Select 4/2
Select 10-5

--PI : Pi sayısını verir.
Select PI()

--SIN : Sinüs alır.
Select SIN(90)

--POWER Üs alır.
Select POWER (2,3) --2'nin 3'cü kuvvetini alır.

--ABS : Mutlak değer alır.
Select ABS(-12)

--RAND : 0-1 arasında rastgele sayı üretir.
Select	RAND()

--FLOOR : Yuvarlama yapar.
Select FLOOR (RAND ()*100)

--TARİH FONKSİYONLARI
--GETDATE : Bugünün tarihini veren fonksiyondur.
Select GETDATE()

--DATEADD : Verilen tarihe verildiği kadar gün, ay, yıl ekler.
Select DATEADD(DAY,999, GETDATE())
Select DATEADD(MONTH,999,GETDATE())
Select DATEADD(YEAR,999,GETDATE())

--DATEDIFF : İki tarih arasında günü, ayı veya yılı hesaplar.
Select DATEDIFF(DAY,'05.09.1992', GETDATE())
Select DATEDIFF(MONTH,'05.09.1992', GETDATE())
Select DATEDIFF(YEAR,'05.09.1992', GETDATE())

--DATEPART : Verilen tarihin haftanın, ayın veya yılın kaçıncı günü olduğunu hesaplar.
Select DATEPART(DW,GETDATE()) --DW haftayı belirler.
Select DATEPART(MONTH,GETDATE())
Select DATEPART(YEAR,GETDATE())

--TOP Komutu
--Personeller tablosunda ilk üç kaydı yazdıralım--
Select top 3 * from Personeller

--DISTINCT Komutu
--Birden fazla benzer verileri teke indirmemizi sağlayan komuttur.
Select DISTINCT sehir from Personeller 

--GROUP BY
Select *from Urunler

--Kategori ID kolonunda kaçtane ürün olduğunu öğrenelim--
Select KategoriID,COUNT(*) from Urunler GROUP BY KategoriID

--Hangi personelin ne kadar satış yaptığını yazdıralım--
Select PersonelID,COUNT(*) from Satislar GROUP BY PersonelID

--PersoneL ne kadar nakliye ücreti verdiğini hesaplayalım--
Select PersonelID,SUM(NakliyeUcreti) from Satislar GROUP BY PersonelID

--GROUP BY İşleminde WHERE Şartı Kullanma
--Normal kolonlar üzerinde uyguladığımız şarttır where
Select KategoriID,COUNT(*) from Urunler Where KategoriID > 5 GROUP BY KategoriID

--GROUP BY İşleminde Having Komutunu Kullanarak Şart Oluşturma
--AGREATE fonksiyonu üzerinde şart uygulayacaksan Having kullanılır.
Select * from Urunler
Select KategoriID,COUNT(*) from Urunler Where KategoriID > 5 GROUP BY KategoriID Having COUNT(*) > 6

--Tabloları Yan Yana Birleştirme (Join kullanmadan)
Select * from Personeller
Select * from Satislar
Select * from Personeller,Satislar
Select p.PersonelID, s.MusteriID from Personeller p, Satislar s where p.PersonelID = s.PersonelID

--INNER JOIN
--Birden fazla tabloyu ilişkisel kolonlar aracılığıyla birleştirip tek bir tablo haline getiren yapıdır.
--Personel ve satışlar tablosunda iki tabloda da personelID var bunlar ilişkisel tablodur. (kolon isimleri farklı olabilir)

--Select * from tablo1 Inner Join Tablo2 on Tablo1.iliskilikolun = Tablo2.iliskilikolun

--Tablolara alias tanımlanabilir.
--Select * from tablo1 t1 Inner Join tablo2 t2 on t1.iliskilitablo = t2.iliskilitablo

--İki tabloyu ilişkisel birleştirme 

--Hangi personel hangi satışları yapmıştır. (Personeller,Satıslar)
Select * from Personeller p Inner Join Satislar s on p.PersonelID = s.PersonelID

--Hangi ürünler hangi kategoride. (Urunler, Kategoriler)
select * from Urunler
select * from Kategoriler
Select u.UrunAdi, k.kategoriAdi from Urunler u Inner Join Kategoriler k on u.KategoriID = k.KategoriID

--Where komutunun kullanımı 
--Beverages kategorisindeki ürünlerim (Urunler,Kategoriler)
--kategorisi beverages olan ürünleri getirelim--
Select u.UrunAdi from Kategoriler k Inner Join Urunler u on k.KategoriID = u.KategoriID where K.KategoriAdi = 'Beverages'

--Seafood kategorisindeki ürünlerin listesi (Urunler, Kategoriler)
Select u.UrunAdi from Kategoriler k Inner Join Urunler u on k.KategoriID = u.KategoriID where k.KategoriAdi = 'Seafood'

--Hangi satışı hangi çalışanım yapmış? (Satislar,Personeller)
Select s.SatisID, p.Adi + ' ' + p.SoyAdi from Satislar s Inner Join Personeller p on s.PersonelID = p.PersonelID

--Fax numarası null olmayan tedarikçilerden alınmış olan ürünler nelerdir? (Urunler, Tedarikciler)
Select * from Urunler u Inner Join Tedarikciler t on u.TedarikciID = t.TedarikciID where t.Faks <> 'Null'

Select * from Urunler u Inner Join Tedarikciler t on u.TedarikciID = t.TedarikciID where t.Faks is not null

--İkiden fazla tabloyu ilişkisel birleştirme
--1997 yılından sonra Nancy nin satış yaptığı firmaların isimlerini öğrenelim (1997 dahil)(Musteriler, Satislar, Personeller)
Select * from Personeller p 
inner join Satislar s on p.PersonelID = s.PersonelID
inner join Musteriler m on s.MusteriID = m.MusteriID
where p.Adi = 'Nancy' and YEAR (s.SatisTarihi)>=1997

--Limited olan tedarikçilerden alınmış seafood kategorisindeki ürünlerimin toplam satış tutarı.. (Urunler, Kategoriler, Tedarikciler)
Select SUM(U.HedefStokDuzeyi * u.BirimFiyati) from Urunler u
inner join Tedarikciler t on u.TedarikciID = t.TedarikciID
inner join Kategoriler k on u.KategoriID = k.KategoriID
where t.SirketAdi like '%Ltd.%' and k.KategoriAdi = 'Seafood'

--Inner Join de Grup By
Select KategoriID,Count(*) from Urunler group by KategoriID

--Hangi personel adı soyadı, toplam kaç adetlik satış yapmış. Satış adedi 100 den fazla olanlar ve personelin adının baş harfi M olan kayıtlar gelsin.. (Personeller, Satislar)
Select p.Adi + ' ' + p.SoyAdi, COUNT(s.satisID) from Personeller p
inner join Satislar s on p.PersonelID=s.PersonelID
where p.Adi like 'm%' group by p.Adi + ' ' + p.SoyAdi having COUNT(s.SatisID)>100

--Seafood kategorisindeki ürünlerin sayısı? (Urunler, Kategoriler)
Select k.kategoriAdi, COUNT(u.UrunAdi) from Urunler u 
Inner join Kategoriler k on u.KategoriID = k.KategoriID
where k.KategoriAdi = 'Seafood' Group By k.KategoriAdi



--OrnekVT de oluşturduğumuz veritabanını bilmediği için select atarken öncelikle veritabanının adını bildirip çekmemiz lazım "OrnekVT.dbo.Filmler"
--Outer Join

--İnner Join de eşleşen kayıtlar getiriliyordu. Outer Join'de ise eşleşmeyen kayıtlar getirilmektedir.

--Left Join
--Join ifadesinin solundaki tablodan tüm kayıtları getirir. Sağındaki tablodan eşleşenleri yan yana eşleşmeyenleri null olarak getirir.
Select * from OrnekVT.dbo.Oyuncular o left outer join OrnekVT.dbo.Filmler f on o.FilmID = f.FilmID 
Select * from OrnekVT.dbo.Filmler f Left outer join OrnekVT.dbo.Oyuncular o on f.FilmID = o.FilmID 

--veya
Select * from OrnekVT.dbo.Oyuncular o left join OrnekVT.dbo.Filmler f on o.FilmID = f.FilmID
Select * from OrnekVT.dbo.Filmler f left join OrnekVT.dbo.Oyuncular o on f.FilmID = o.FilmID

--Right Join
--Joinin sağındaki tablonun tamamını getirecek,solundakinden eşleşenleri aynı satırda eşleşmeyenleri null olarak getirecek.
Select * from OrnekVT.dbo.Oyuncular o right join OrnekVT.dbo.filmler f on o.FilmID = f.FilmID
Select * from OrnekVT.dbo.Filmler f right join OrnekVT.dbo.oyuncular o on o.FilmID = f.FilmID

--Full join
--Joinin iki tarafındaki tablolardan eşleşen eşleşmeyen hepsini getirir.
Select * from OrnekVT.dbo.Oyuncular o full outer join OrnekVT.dbo.filmler f on o.FilmID = f.FilmID

--veya
Select * from OrnekVT.dbo.Oyuncular o full join OrnekVT.dbo.filmler f on o.FilmID = f.FilmID

--Cross Join
--İki tablo arasında kartezyen çarpımı yapar.

Select COUNT(*) FROM Personeller
Select COUNT(*) FROM Bolge

Select p.Adi, b.BolgeID From Personeller p Cross Join Bolge b




--DML (Data Manipulation Language)

--Select, Insert, Update, Delete

--Select
Select * from Personeller

--Insert
--Insert [tablo adı](kolonlar) values(Değerler)
Insert Personeller (Adi,SoyAdi) values ('Eren','ERCAN')

Insert Personeller Values ('Uzun','Utku','Yazılım Uzmanı','Mr.','01.01.1993',GETDATE(),
'Tekirdağ','Çorlu','Trakya','59850','Türkiye','02822184572',null,null,null,null,null )

--[Dikkat edilmesi gerekenler!!!]
--Into komutu ile yazılabilir--
Insert into Personeller (Adi,SoyAdi) values ('Eren','ERCAN')
--Kolonun kabul ettiği veri tipi ve karakter uzunluğunda kayıt yapılmalıdır.
--Not Null olan kolonlara boş bırakılmayacaklarından dolayı mutlaka değer gönderilmelidir.
--Otomatik artan identity kolonlara değer gönderilmez.
--Tablodaki seçilen yahut bütün kolonlara değer gönderileceği belirtilip, gönderilmezse hata verecektir.
Insert Personeller (Adi, SoyAdi) Values ('Eren')
Insert Personeller values ('Eren')


--[Pratik kullanım]
Insert Musteriler(MusteriAdi, Adres) Values('Hilmi','Çorum')
