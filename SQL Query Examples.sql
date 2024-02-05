
/*Bu sorgu sayesinde kitap adý K harfiyle baþlayan kitaplarýn hangi yazara ait olduðunu sorgularýz*/ 
	SELECT w.writerName,a.bookName FROM writers AS w
        INNER JOIN allbooks AS a on w.ID=a.writerID 
        WHERE a.bookName LIKE 'K%' 
        


	/* Bu sorgu sayesinde 2018 tarihinden sonra basýlan kitaplarýn basým tarihlerini ve stok tipilerini görürüz.*/
	SELECT a.addedDate,s.stockTypeName FROM allbooks AS a
	INNER JOIN stockType AS s on a.stockTypeID=s.ID
	WHERE a.addedDate > '2018-12-30'


	/*Bu sorgu sayesinde 2018 yýllýndan önce kaç adet baðýþlanan, kaç adet satýn alýnan kitap olduðunu gördüðümüz sorgudur.*/
	SELECT COUNT(s.stockTypeName) AS AdetSayisi ,s.stockTypeName  FROM allbooks AS a
	JOIN stockType AS s on a.stockTypeID=s.ID
	WHERE a.addedDate < '2018-12-30' GROUP BY s.stockTypeName


	/*Bu sorgu sayesinde yazarlarýn isimlerin de kýsaltma kullanan toplam kaç kiþi vardýr belirleriz.*/
	SELECT COUNT(writerName) AS Adet  FROM writers
	WHERE writerName LIKE '%.%' 

	/*Bu sorgu sayesinde yazarlarýn isimlerin de kýsaltma kullananlarýn isimlerini belirleriz.*/
    SELECT writerName FROM writers
	WHERE writerName LIKE '%.%' GROUP BY writerName

	/*Stored Procedure yardýmýyla bir fonksiyon oluþturduk.
	allBooks tablosundaki yazarlarýn tabloda kaç adet kitaplarý var 
	ve tabloda bulunan kitap türlerinden kaçar adet var hesaplanýr.
	 */

	use LibProject
	go
	ALTER PROCEDURE Hesapla 
	AS
	BEGIN

	    SELECT COUNT(writerName) AS 'Adet Sayisi',writerName FROM allbooks GROUP BY writerName

		  SELECT COUNT(bookTypeName) AS 'Adet Sayisi',bookTypeName FROM allbooks GROUP BY bookTypeName
	END

	execute Hesapla


	/*Stored Procedure yardýmýyla bir fonksiyon oluþturduk. 
	allbooks tablosunda her türde yazarlarýn kaçar adet kitabýnýn olduðunu sorgululamamýzý saðlayan sorgudur.*/
	
	go
	ALTER PROCEDURE yazarTurIliskisi
	AS
	BEGIN

		SELECT COUNT(a.writerName) AS 'Yazar Adet Sayýsý',a.writerName, a.bookTypeName
		FROM allbooks AS a
		GROUP BY a.writerName ,a.bookTypeName
		
	END

	execute yazarTurIliskisi

	/* publisher tablosunda publisherName kolonunda Yayýnlarý yazan yerler Yayýnevi olarak deðiþtirmemizi saðlayan sorgudur.*/
	
	go
	ALTER PROCEDURE degistir
	AS
	BEGIN

	  select *,
	  CASE 
	   when publisherName like '%Yayýnlarý%' then 'Yayinevi' 
	   else
		publisherName
	    end
	   FROM publisher

	END

	execute degistir

	

	/* allBooks tablosuna en eski basýlan 5 kitabý en eski tarihten en yeni basýlana doðru sýralý olarak sorgular. Bu iþlemi ASC kullanarakta alabiliriz.*/
	Select  top 5 a.addedDate, a.bookName FROM allbooks AS a ORDER BY a.addedDate

   /* allBooks tablosunda en eski basým olan 5 kitabý en eski tarihten en yeni basýlana doðru sýralý olarak sorgulamamýzý saðlar.*/
	Select  top 5 a.addedDate, a.bookName FROM allbooks AS a ORDER BY a.addedDate ASC

   /*Yukardaki iki sorgunun ayný sonucu vermesinin nedeni ORDER BY varsayýlan olarak ASC sýralamasýnda çalýþýr.*/

	/* allBooks tablosuna en son basýlan 5 kitabý en yakýn tarihten en eskisine doðru sýralý olarak sorgular.*/
	Select  top 5 a.addedDate, a.bookName FROM allbooks AS a ORDER BY a.addedDate DESC


	


	/*bookTypeName tablosunda ID numarasý tek ve çift olanlarý ayný tabloda önce tek olanlar sonra çift olanlar þeklinde sýralayan sorgudur.*/
	  select * from bookTypeName where ID % 2 = 1
    union all
    select *  from bookTypeName where ID % 2 = 0


	/*Publisher ve allbooks tablosunda ID deðerleri çift olan publisherName ve bookName'leri sorgulayaran ve ID'leriyle çýktý veren sorgudur.*/
	  SELECT  p.ID, p.publisherName,a.ID,a.bookName FROM allbooks AS a
	  INNER JOIN publisher AS p ON a.publisherID = p.ID
	  WHERE a.ID % 2 = 0 


	/*allbooks tablosunda toplam  birden çok kitap'ý olan kaç yazar olduðunu hesaplayan sorgudur.*/
	SELECT COUNT(writerName) - COUNT(DISTINCT(writerID)) AS 'Listede Birden Çok Kitabý Olan Yazar Sayisi'  
	FROM allbooks

	/*allbooks tablosunda alfabetik olarak kitap adý en kýsa olan kitabý sorgular */
	SELECT TOP 1 bookName,LEN(bookName) AS Uzunluk FROM allbooks 
	WHERE LEN(bookName) = (SELECT TOP 1 MIN(LEN(bookName)) AS Uzunluk FROM allbooks) 
        GROUP BY bookName ORDER BY bookName ASC


	/*allbooks tablosunda alfabetik olarak kitap adý en uzun olan kitabý sorgular */
    SELECT TOP 1 bookName,LEN(bookName) AS Uzunluk FROM allbooks 
  	WHERE LEN(bookName)=(SELECT TOP 1 MAX(LEN(bookName)) AS Uzunluk FROM allbooks) 
        GROUP BY bookName ORDER BY bookName ASC


	/*allBooks tablosunda isbnID 'de 4. karakteri 9 olmayan satýrlarý döndüren sorgudur.*/
	SELECT* FROM allbooks WHERE isbnID NOT LIKE '___[9]%'


    /* allbooks tablosunda bookName sütunun'da tekrar etmeyen verilerde a,e,i,o,u harflerinin kitap isimlerinin hem baþýnda hem de sonunda olmayan kitap isimlerini sorgular. */
	SELECT DISTINCT(bookName) FROM allbooks WHERE bookName NOT LIKE '[aeiom]%' AND bookName NOT LIKE '%[aeiom]'

   /*allbooks tablosunda her katagoride kaçar adet kitap olduðunu küçükten büyüðe sýralar. Bunu yaparken katagori adlarýný alfabetik olarakta sýralar. 
	  Eðer alfabetik sýralamada ayný harfle baþlayan katagoriler varsa bunlarý kendi içinde adet sayýsýna göre küçükten büyüðe sýralar. */
	SELECT CONCAT(bookTypeName,' ','katagorisinde',' ',COUNT(*), ' ','adet kitap vardýr.') AS Katagori_Adetleri
        FROM allbooks
        GROUP BY bookTypeName
        ORDER BY  Katagori_Adetleri , bookTypeName ASC;

	/*Notlar:  

	INNER JOIN : Ýki ya da daha fazla tabloda ortak olan iki alandaki deðerleri kontrol ederek tablolarý birleþtirir.
	  Ýki ya da daha fazla tabloda ortak olan iki alandaki deðerleri kontrol ederek tablolarý birleþtirir. 
	  INNER JOIN, SQL sunucusunda varsayýlan olan JOINdir. Yani INNER JOIN yerine sadece JOIN yazmak da yeterlidir. 
	  WHERE ifadesi kullanarak oluþturmak istenen sonuç tablosu filitrelenerek daha da özelleþtirilebilir.

	COUNT : Kolonda veya sütunda hesaplanmak istenen sayýyý hesaplar.

	LIKE : Bir sütundaki belirli bir veriyi aramak için bir WHERE koþuluyla kullanýlýr. 
	  Aranmak istenen karakter % imleçi yardýmýyla tasvir edilerek arama iþlemi yapýlýr. 
	  Örneðin '%A' ifadesi A karakteri ile biten ifadeleri aramak için kullanýlýr.
	   'A%' ifadesi A karakteri ile baþlayan ifadeleri aramak için kullanýlýr.
	   '%A%' ifadesi saðýnda ve solunda baþka karakterlerinde olduðu ifadeleri arar. Örneðin: KAR kelimesini aramak için kullanýlmalýdýr.
	   '_a%' ifadesi ikinci harfi a olan ifadeleri bulur.
	   'a%o' ifadesi a ile baþlayan o ile biten ifadeleri bulur.
	   'a__%' ifadesi a ile baþlayan sonrasýnda saðýnda en azýndan 3 karakter olan ifadeleri bulur.

  NOT LIKE: Not like ifadesi LIKE ifadesinin tersi olarak çalýþýr. Sütunda arama yaparken aramadan hariç tutmak istediðimiz ifadeleri belirterek kullanýrýz.

	AS Operotörü : Sorgulama yaparken uzun ve karýþýk sütun isimlerini kolay kullanabilmek için kullanýlan operotördür.
	  AS sayesinde sorgulama yaparken birden fazla tablo ile çalýþýrken tablolara takma isim vererek kullaným kolaylýðý saðlanýr.
	  Örnek olarak yukarda ýnner joýn ile yaptýðýmýz sorgularda her tabloya isim vererek çalýþýlmýþtýr.
	  Ya da örneðin count ile bir iþlem yapýyorsak çalýþtýðýmýz kolona anlaþýrlýk açýsýndan isim vermek için kullanýlýr.

   WHERE : Bir koþul belirterek filtreleme yapmak için kullanýlýr. Where cümleciði koþul belirtmek için kullanýlan bir komuttur.

   GROUP BY : Tabloda ki ayný deðerlere sahip verileri gruplamamýzý saðlar. Verileri bir veya daha fazla sütunla gruplamak için 
      toplama iþlevleri kullanýr. Örneðin COUNT, MAX, MIN, SUM, AVG gibi iþlemlerle kullanýlýr.

   ORDER BY : verileri artan ya da azalan düzende sýralamak için kullanýlýr. Kayýtlarý varsayýlan olarak artan sýrada sýralar.
      Kayýtlarý azalan sýrada sýralamak için DESC ifadesini kullanýr.

   ASC : Listeyi artan sýraya göre sýralayacaðýmýz belirtmek için kullanýrýz.

   DESC : Listeyi azalan sýraya göre sýralayacaðýmýz belirtmek için kullanýrýz.

   SELF JOIN : Bir tablonun kendisiyle JOIN iþlemi yapýlmasýna Self Join denir. Hiyerarþik verileri sorgulamak 
     veya ayný tablodaki satýrlarý karþýlaþtýrmak için kullanýþlýdýr.

   UNION ALL : Ýki tablodan birden kayýt çekmek için kullanýlýr. Ancak çekilecek kolonlarýn ayný veri tipinden 
     olmalarý gerekir. Ayrýca, çekilen veriler birbirlerinden farklý (distinct) olmalýdýr.
	   Ayný olan verilerden yalnýzca birisini seçer. 

   TOP : Sorgulanacak tabloda sýralý olarak istediðiniz satýr sayýsýna göre çýktý döndürmeyi saðlar.

   DISTINCT : Veri tekrarýný engellemek için kullanýlýr. Sorgulama yaparken ayný kolonda bulunan verilerde 
     veri tekrarýnýn önüne geçerek veriyi bir kez döndürür.

   LEN : String bir verinin karakter sayýsýný almamýzý saðlar.

   CRUD : CREATE ,READ, UPDATE ,DELETE iþlemleri'dir.

   Stored Procedure : Veritabanýnda CRUD gibi iþlemlerde, her seferinde kodu tekrar yazmamýz ve derlememiz gerekmektedir. 
     Bu yüzden hem zaman hem de derleme açýsýndan perormans kaybý oluþmaktadýr. Bu gibi durumlarda Store Procedure, 
     ile bu sýkýntýlarýn önüne geçeriz. Böylece her seferinde ayný iþlemleri yapma gereksinimi duymadan zamandan tasarruf etmiþ oluruz.
	 Kullanýmý : CREATE PROCEDURE procedure_name 
                 AS 
                 BEGIN 
                 SORGU
                 END  

      Procedure bir kez CREATE yardýmýyla oluþturulduktan sonra üstünde deðiþiklik yapýlacak ise ALTER yardýmýyla
	  bu deðiþiklikler yapýlýr.
	             ALTER PROCEDURE procedure_name 
                 AS 
                 BEGIN 
                 SORGU
                 END  

   EXECUTE : Ececute yardýmýyla oluþturduðumuz Procedure' u çalýþtýrýrýz.

   MOD (%) : % iþareti matematiksel ifade olarak bir sayýnýn modunu almamýza yardýmcý olur.

   AND-OR  : Where koþulunu kullanýrken birden fazla koþul belirtmek için AND,OR yapýlarý kullanýlýr. AND kullanýldýðýnda belirtilen koþullarýn tamamýnýn saðlanmasý beklenir
         OR kullanýldýðýnda koþullardan birinin saðlanmasý yeterlidir. Mantýk ifadeleri mantýðýyla iþlem yapar.

   CONCAT : Bir veya daha fazla dizeyi-kolonu birleþtirerek yeni bir dize oluþturmak için kullanýlýr.

			  */
	