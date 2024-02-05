
/*Bu sorgu sayesinde kitap ad� K harfiyle ba�layan kitaplar�n hangi yazara ait oldu�unu sorgular�z*/ 
	SELECT w.writerName,a.bookName FROM writers AS w
        INNER JOIN allbooks AS a on w.ID=a.writerID 
        WHERE a.bookName LIKE 'K%' 
        


	/* Bu sorgu sayesinde 2018 tarihinden sonra bas�lan kitaplar�n bas�m tarihlerini ve stok tipilerini g�r�r�z.*/
	SELECT a.addedDate,s.stockTypeName FROM allbooks AS a
	INNER JOIN stockType AS s on a.stockTypeID=s.ID
	WHERE a.addedDate > '2018-12-30'


	/*Bu sorgu sayesinde 2018 y�ll�ndan �nce ka� adet ba���lanan, ka� adet sat�n al�nan kitap oldu�unu g�rd���m�z sorgudur.*/
	SELECT COUNT(s.stockTypeName) AS AdetSayisi ,s.stockTypeName  FROM allbooks AS a
	JOIN stockType AS s on a.stockTypeID=s.ID
	WHERE a.addedDate < '2018-12-30' GROUP BY s.stockTypeName


	/*Bu sorgu sayesinde yazarlar�n isimlerin de k�saltma kullanan toplam ka� ki�i vard�r belirleriz.*/
	SELECT COUNT(writerName) AS Adet  FROM writers
	WHERE writerName LIKE '%.%' 

	/*Bu sorgu sayesinde yazarlar�n isimlerin de k�saltma kullananlar�n isimlerini belirleriz.*/
    SELECT writerName FROM writers
	WHERE writerName LIKE '%.%' GROUP BY writerName

	/*Stored Procedure yard�m�yla bir fonksiyon olu�turduk.
	allBooks tablosundaki yazarlar�n tabloda ka� adet kitaplar� var 
	ve tabloda bulunan kitap t�rlerinden ka�ar adet var hesaplan�r.
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


	/*Stored Procedure yard�m�yla bir fonksiyon olu�turduk. 
	allbooks tablosunda her t�rde yazarlar�n ka�ar adet kitab�n�n oldu�unu sorgululamam�z� sa�layan sorgudur.*/
	
	go
	ALTER PROCEDURE yazarTurIliskisi
	AS
	BEGIN

		SELECT COUNT(a.writerName) AS 'Yazar Adet Say�s�',a.writerName, a.bookTypeName
		FROM allbooks AS a
		GROUP BY a.writerName ,a.bookTypeName
		
	END

	execute yazarTurIliskisi

	/* publisher tablosunda publisherName kolonunda Yay�nlar� yazan yerler Yay�nevi olarak de�i�tirmemizi sa�layan sorgudur.*/
	
	go
	ALTER PROCEDURE degistir
	AS
	BEGIN

	  select *,
	  CASE 
	   when publisherName like '%Yay�nlar�%' then 'Yayinevi' 
	   else
		publisherName
	    end
	   FROM publisher

	END

	execute degistir

	

	/* allBooks tablosuna en eski bas�lan 5 kitab� en eski tarihten en yeni bas�lana do�ru s�ral� olarak sorgular. Bu i�lemi ASC kullanarakta alabiliriz.*/
	Select  top 5 a.addedDate, a.bookName FROM allbooks AS a ORDER BY a.addedDate

   /* allBooks tablosunda en eski bas�m olan 5 kitab� en eski tarihten en yeni bas�lana do�ru s�ral� olarak sorgulamam�z� sa�lar.*/
	Select  top 5 a.addedDate, a.bookName FROM allbooks AS a ORDER BY a.addedDate ASC

   /*Yukardaki iki sorgunun ayn� sonucu vermesinin nedeni ORDER BY varsay�lan olarak ASC s�ralamas�nda �al���r.*/

	/* allBooks tablosuna en son bas�lan 5 kitab� en yak�n tarihten en eskisine do�ru s�ral� olarak sorgular.*/
	Select  top 5 a.addedDate, a.bookName FROM allbooks AS a ORDER BY a.addedDate DESC


	


	/*bookTypeName tablosunda ID numaras� tek ve �ift olanlar� ayn� tabloda �nce tek olanlar sonra �ift olanlar �eklinde s�ralayan sorgudur.*/
	  select * from bookTypeName where ID % 2 = 1
    union all
    select *  from bookTypeName where ID % 2 = 0


	/*Publisher ve allbooks tablosunda ID de�erleri �ift olan publisherName ve bookName'leri sorgulayaran ve ID'leriyle ��kt� veren sorgudur.*/
	  SELECT  p.ID, p.publisherName,a.ID,a.bookName FROM allbooks AS a
	  INNER JOIN publisher AS p ON a.publisherID = p.ID
	  WHERE a.ID % 2 = 0 


	/*allbooks tablosunda toplam  birden �ok kitap'� olan ka� yazar oldu�unu hesaplayan sorgudur.*/
	SELECT COUNT(writerName) - COUNT(DISTINCT(writerID)) AS 'Listede Birden �ok Kitab� Olan Yazar Sayisi'  
	FROM allbooks

	/*allbooks tablosunda alfabetik olarak kitap ad� en k�sa olan kitab� sorgular */
	SELECT TOP 1 bookName,LEN(bookName) AS Uzunluk FROM allbooks 
	WHERE LEN(bookName) = (SELECT TOP 1 MIN(LEN(bookName)) AS Uzunluk FROM allbooks) 
        GROUP BY bookName ORDER BY bookName ASC


	/*allbooks tablosunda alfabetik olarak kitap ad� en uzun olan kitab� sorgular */
    SELECT TOP 1 bookName,LEN(bookName) AS Uzunluk FROM allbooks 
  	WHERE LEN(bookName)=(SELECT TOP 1 MAX(LEN(bookName)) AS Uzunluk FROM allbooks) 
        GROUP BY bookName ORDER BY bookName ASC


	/*allBooks tablosunda isbnID 'de 4. karakteri 9 olmayan sat�rlar� d�nd�ren sorgudur.*/
	SELECT* FROM allbooks WHERE isbnID NOT LIKE '___[9]%'


    /* allbooks tablosunda bookName s�tunun'da tekrar etmeyen verilerde a,e,i,o,u harflerinin kitap isimlerinin hem ba��nda hem de sonunda olmayan kitap isimlerini sorgular. */
	SELECT DISTINCT(bookName) FROM allbooks WHERE bookName NOT LIKE '[aeiom]%' AND bookName NOT LIKE '%[aeiom]'

   /*allbooks tablosunda her katagoride ka�ar adet kitap oldu�unu k���kten b�y��e s�ralar. Bunu yaparken katagori adlar�n� alfabetik olarakta s�ralar. 
	  E�er alfabetik s�ralamada ayn� harfle ba�layan katagoriler varsa bunlar� kendi i�inde adet say�s�na g�re k���kten b�y��e s�ralar. */
	SELECT CONCAT(bookTypeName,' ','katagorisinde',' ',COUNT(*), ' ','adet kitap vard�r.') AS Katagori_Adetleri
        FROM allbooks
        GROUP BY bookTypeName
        ORDER BY  Katagori_Adetleri , bookTypeName ASC;

	/*Notlar:  

	INNER JOIN : �ki ya da daha fazla tabloda ortak olan iki alandaki de�erleri kontrol ederek tablolar� birle�tirir.
	  �ki ya da daha fazla tabloda ortak olan iki alandaki de�erleri kontrol ederek tablolar� birle�tirir. 
	  INNER JOIN, SQL sunucusunda varsay�lan olan JOINdir. Yani INNER JOIN yerine sadece JOIN yazmak da yeterlidir. 
	  WHERE ifadesi kullanarak olu�turmak istenen sonu� tablosu filitrelenerek daha da �zelle�tirilebilir.

	COUNT : Kolonda veya s�tunda hesaplanmak istenen say�y� hesaplar.

	LIKE : Bir s�tundaki belirli bir veriyi aramak i�in bir WHERE ko�uluyla kullan�l�r. 
	  Aranmak istenen karakter % imle�i yard�m�yla tasvir edilerek arama i�lemi yap�l�r. 
	  �rne�in '%A' ifadesi A karakteri ile biten ifadeleri aramak i�in kullan�l�r.
	   'A%' ifadesi A karakteri ile ba�layan ifadeleri aramak i�in kullan�l�r.
	   '%A%' ifadesi sa��nda ve solunda ba�ka karakterlerinde oldu�u ifadeleri arar. �rne�in: KAR kelimesini aramak i�in kullan�lmal�d�r.
	   '_a%' ifadesi ikinci harfi a olan ifadeleri bulur.
	   'a%o' ifadesi a ile ba�layan o ile biten ifadeleri bulur.
	   'a__%' ifadesi a ile ba�layan sonras�nda sa��nda en az�ndan 3 karakter olan ifadeleri bulur.

  NOT LIKE: Not like ifadesi LIKE ifadesinin tersi olarak �al���r. S�tunda arama yaparken aramadan hari� tutmak istedi�imiz ifadeleri belirterek kullan�r�z.

	AS Operot�r� : Sorgulama yaparken uzun ve kar���k s�tun isimlerini kolay kullanabilmek i�in kullan�lan operot�rd�r.
	  AS sayesinde sorgulama yaparken birden fazla tablo ile �al���rken tablolara takma isim vererek kullan�m kolayl��� sa�lan�r.
	  �rnek olarak yukarda �nner jo�n ile yapt���m�z sorgularda her tabloya isim vererek �al���lm��t�r.
	  Ya da �rne�in count ile bir i�lem yap�yorsak �al��t���m�z kolona anla��rl�k a��s�ndan isim vermek i�in kullan�l�r.

   WHERE : Bir ko�ul belirterek filtreleme yapmak i�in kullan�l�r. Where c�mleci�i ko�ul belirtmek i�in kullan�lan bir komuttur.

   GROUP BY : Tabloda ki ayn� de�erlere sahip verileri gruplamam�z� sa�lar. Verileri bir veya daha fazla s�tunla gruplamak i�in 
      toplama i�levleri kullan�r. �rne�in COUNT, MAX, MIN, SUM, AVG gibi i�lemlerle kullan�l�r.

   ORDER BY : verileri artan ya da azalan d�zende s�ralamak i�in kullan�l�r. Kay�tlar� varsay�lan olarak artan s�rada s�ralar.
      Kay�tlar� azalan s�rada s�ralamak i�in DESC ifadesini kullan�r.

   ASC : Listeyi artan s�raya g�re s�ralayaca��m�z belirtmek i�in kullan�r�z.

   DESC : Listeyi azalan s�raya g�re s�ralayaca��m�z belirtmek i�in kullan�r�z.

   SELF JOIN : Bir tablonun kendisiyle JOIN i�lemi yap�lmas�na Self Join denir. Hiyerar�ik verileri sorgulamak 
     veya ayn� tablodaki sat�rlar� kar��la�t�rmak i�in kullan��l�d�r.

   UNION ALL : �ki tablodan birden kay�t �ekmek i�in kullan�l�r. Ancak �ekilecek kolonlar�n ayn� veri tipinden 
     olmalar� gerekir. Ayr�ca, �ekilen veriler birbirlerinden farkl� (distinct) olmal�d�r.
	   Ayn� olan verilerden yaln�zca birisini se�er. 

   TOP : Sorgulanacak tabloda s�ral� olarak istedi�iniz sat�r say�s�na g�re ��kt� d�nd�rmeyi sa�lar.

   DISTINCT : Veri tekrar�n� engellemek i�in kullan�l�r. Sorgulama yaparken ayn� kolonda bulunan verilerde 
     veri tekrar�n�n �n�ne ge�erek veriyi bir kez d�nd�r�r.

   LEN : String bir verinin karakter say�s�n� almam�z� sa�lar.

   CRUD : CREATE ,READ, UPDATE ,DELETE i�lemleri'dir.

   Stored Procedure : Veritaban�nda CRUD gibi i�lemlerde, her seferinde kodu tekrar yazmam�z ve derlememiz gerekmektedir. 
     Bu y�zden hem zaman hem de derleme a��s�ndan perormans kayb� olu�maktad�r. Bu gibi durumlarda Store Procedure, 
     ile bu s�k�nt�lar�n �n�ne ge�eriz. B�ylece her seferinde ayn� i�lemleri yapma gereksinimi duymadan zamandan tasarruf etmi� oluruz.
	 Kullan�m� : CREATE PROCEDURE procedure_name 
                 AS 
                 BEGIN 
                 SORGU
                 END  

      Procedure bir kez CREATE yard�m�yla olu�turulduktan sonra �st�nde de�i�iklik yap�lacak ise ALTER yard�m�yla
	  bu de�i�iklikler yap�l�r.
	             ALTER PROCEDURE procedure_name 
                 AS 
                 BEGIN 
                 SORGU
                 END  

   EXECUTE : Ececute yard�m�yla olu�turdu�umuz Procedure' u �al��t�r�r�z.

   MOD (%) : % i�areti matematiksel ifade olarak bir say�n�n modunu almam�za yard�mc� olur.

   AND-OR  : Where ko�ulunu kullan�rken birden fazla ko�ul belirtmek i�in AND,OR yap�lar� kullan�l�r. AND kullan�ld���nda belirtilen ko�ullar�n tamam�n�n sa�lanmas� beklenir
         OR kullan�ld���nda ko�ullardan birinin sa�lanmas� yeterlidir. Mant�k ifadeleri mant���yla i�lem yapar.

   CONCAT : Bir veya daha fazla dizeyi-kolonu birle�tirerek yeni bir dize olu�turmak i�in kullan�l�r.

			  */
	