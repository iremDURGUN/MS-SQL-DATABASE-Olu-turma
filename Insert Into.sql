 /*INSERT INTO fonksiyonunu kullanarak oluþturduðumuz tablolara veri giriyoruz.*/

 /*publisher tablosuna veri giriþi*/

   INSERT INTO publisher(publisherName)
  VALUES 
   ('Can Yayýnlarý'),
   ('Yapý Kredi Yayýnlarý'),
   ('Ýþ Bankasý Kültür Yayýnlarý'),
   ('Kolektif Kitap'),
   ('Ayrýntý Yayýnlarý'),
   ('Ýthaki Yayýnlarý'),
   ('Tübitak Yayýnlarý'),
   ('Metis Yayýnlarý'),
   ('Doðan Kitap'),
   ('Can Çocuk Yayýnlarý'),
   ('HaperOne'),
   ('Signet Classic'),
   ('Scribner'),
   ('Pegasus Yayýnlarý'),
   ('Ýdea Yayýnevi')



  /*writers tablosuna veri giriþi*/

   INSERT INTO writers(writerName)
  VALUES 
   ('William Golding'),
   ('Sabahattin Ali'),
   ('Antoine de Saint Exupery'),
   ('Fyodor Dostoyevski'),
   ('Gabriel Garcia Marquez'),
   ('Anthony Burgerss'),
   ('Mary Shaelley'),
   ('Yuval Noah Harari'),
   ('Paulo Coelho'),
   ('Ray Bradbury'),
   ('Carl B. Boyer'),
   ('Franz Kafka'),
   ('Veronica Roth'),
   ('Bram Stoker'),
   ('George Orwell'),
   ('Lev Tolstoy'),
   ('Ahmet Ümit'),
   ('James Dashner'),
   ('J.R.R. Tolkien'),
   ('Martin Heidegger'),
   ('Jean-Paul Sartre')
   
   /*bookTypeName tablosuna veri giriþi*/

   INSERT INTO bookTypeName(bookTypeName)
  VALUES 
   ('Korku'),
   ('Alegori'),
   ('Roman'),
   ('Fantastik'),
   ('Öykü'),
   ('Çocuk'),
   ('Distopya'),
   ('Tarih'),
   ('Gizem'),
   ('Bilim Kurgu'),
   ('Polisiye')


   /*Aþaðýdaki iþlemlerde eðerki ID bilgisi elle girilmesi gereken bir durum oluþtuðunda 
     IDENTITY_INSERT fonksiyonunu ON durumuna getirmeliyiz. ON durumuna getirmezsek manuel olarak veri giriþi yapamayýz.
	 ID bilgilerini girerken tablodaki son ID'nin alddýðý deðere dikkat ederek yeni veri eklemeliyiz.*/

  /* SET identity_insert dbo.bookTypeName ON
   INSERT INTO bookTypeName(ID , bookTypeName)
  VALUES 
   (12,'Felsefe'),
   (13,'Edebiyat')
  */

   /*stockType toblosuna veri giriþi.*/

   INSERT INTO stockType(stockTypeName)
  VALUES 
   ('Baðýþ'),
   ('Satýn Alma')

   /*allBooks tablosuna veri giriþi*/

   /*Girdiðimiz values bilgileri doðru sýrada ve adette olmalýdýr.Yoksa veri giriþi yapamayýz.*/

   INSERT INTO allbooks (isbnID,bookName,writerName,publisherName,totalPages,addedDate,bookTypeName,writtenLanguage,numberOfBooks,bookTypeID ,writerID,publisherID,stockTypeID ) 
 VALUES
   (9789750731963,'Sineklerin Tanrýsý','William Golding','Can Yayýnlarý',232,'2019-02-15','Roman','Ýngilizce',5,3,1,1,2),
   (9789753638031,'Kürk Mantolu Madonna','Sabahattin Ali','Yapý Kredi Yayýnlarý',160,'2018-07-15','Roman','Türkçe',6,3,2,2,1),
   (9786052957018,'Küçük Prens','Antoine de Saint-Exupery','Ýþ Bankasý Kültür Yayýnlarý',96,'2019-01-08','Çocuk','Fransýzca',20,6,3,3,2),
   (9786052950156,'Suç ve Ceza','Fyodor Dostoyevski','Ýþ Bnakasý Kültür Yayýnlarý',720,'2017-02-15','Roman','Rusça',4,3,4,3,1),
   (9789750732083,'Kýrmýzý Pazartesi','Gabriel Garcia Marquez','Can Yayýnlarý',160,'2019-09-07','Roman','Ýspanyolca',5,3,5,1,1),
   (9789755391815,'Otomatik Portakal','Anthony Burgerss','Ayrýntý Yayýnlarý',224,'2018-03-01','Distopya','Ýngilizce',3,7,6,5,2),
   (9789750732403,'Hayvan Çiftliði','George Orwell','Can Yayýnlarý',152,'2019-12-05','Alegori','Ýngilizce',8,2,15,1,1),
   (9786053605186,'The Land of Lost Gods','Ahmet Ümit','Yapý Kredi Yayýnlarý',472,'2015-04-05','Polisiye','Ýngilizce',1,11,17,2,2),
   (9789750800287,'Masal Masal Ýçinde','Ahmet Ümit','Yapý Kredi Yayýnlarý',160,'2018-04-12','Çocuk','Türkçe',6,6,17,2,2),
   (9786052950194,'Savaþ ve Barýþ','Lev Tolstoy','Yapý Kredi Yayýnlarý',1504,'2017-08-20','Roman','Rusça',9,3,16,2,1),
   (9786052234234,'Labirent: Ölümcül Kaçýþ','James Dashner','Pegasus Yayýnlarý',400,'2014-09-07','Bilim Kurgu','Ýngilizce',5,10,18,14,1),
   (9786052345234,'Yüzüklerin Efendisi','J.R.R. Tolkien','Metis Yayýnlarý',1216,'2018-08-05','Fantastik','Ýngilizce',7,4,19,8,1),
   (9789756456345,'Matematik Tarihi','Carl B. Boyer','Tübitak Yayýnlarý',720,'2019-02-09','Tarih','Ýngilizce',2,8,11,7,2),
   (9789750345775,'Kar Kokusu','Ahmet Ümit','Yapý Kredi Yayýnlarý',288,'2000-03-05','Polisiye','Türkçe',4,11,17,2,1),
   (9786052980868,'1984','George Orwell','Can Yayýnlarý',352,'1938-03-05','Bilim Kurgu','Ýngilizce',6,10,15,1,2),
   (9789755334356 ,'Varlýk ve Zaman ','Martin Heidegger','Ýdea Yayýnevi',480,'2018-06-26','Felsefe','Türkçe',2,12,20,15,2),
   (9789755334363  ,'Varlýk ve Hiçlik ','Jean-Paul Sartre','Ýdea Yayýnevi',320,'2018-05-17','Felsefe','Türkçe',7,12,21,15,1)
  
         
		
             /*NOTLAR
		        
		           SET identity_insert dbo.stock OFF/ON  kod satýrý IDENTITY olarak belirlediðimiz kolon için IDENTITY'i pasif ve aktif etmemizi saðlar.
                     ON konumuna getirirsek veri eklerken ID deðerini kendimiz girebiliriz, OFF durumdayken ise MS-SQL bunu yapmamýza izin vermez.
		           
				   INSERT INTO : Ekleme sorgusu olarak adlandýrýlýr.Tabloya bir veya birden çok kayýt eklemek için kullanýlýr. 
					   Kullanýmý: INSERT INTO table_name (column_name) VALUES (calumn_value )
					   Belirtilen sütun adlarý ve girelen deðer bilgileri doðru sýralama da ve adette olmalýdýr.

               */