 /*INSERT INTO fonksiyonunu kullanarak oluşturduğumuz tablolara veri giriyoruz.*/

 /*publisher tablosuna veri girişi*/

   INSERT INTO publisher(publisherName)
  VALUES 
   ('Can Yayınları'),
   ('Yapı Kredi Yayınları'),
   ('İş Bankası Kültür Yayınları'),
   ('Kolektif Kitap'),
   ('Ayrıntı Yayınları'),
   ('İthaki Yayınları'),
   ('Tübitak Yayınları'),
   ('Metis Yayınları'),
   ('Doğan Kitap'),
   ('Can Çocuk Yayınları'),
   ('HaperOne'),
   ('Signet Classic'),
   ('Scribner'),
   ('Pegasus Yayınları'),
   ('İdea Yayınevi')



  /*writers tablosuna veri girişi*/

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
   
   /*bookTypeName tablosuna veri girişi*/

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


   /*Aşağıdaki işlemlerde eğerki ID bilgisi elle girilmesi gereken bir durum oluştuğunda 
     IDENTITY_INSERT fonksiyonunu ON durumuna getirmeliyiz. ON durumuna getirmezsek manuel olarak veri girişi yapamayız.
	 ID bilgilerini girerken tablodaki son ID'nin alddığı değere dikkat ederek yeni veri eklemeliyiz.*/

  /* SET identity_insert dbo.bookTypeName ON
   INSERT INTO bookTypeName(ID , bookTypeName)
  VALUES 
   (12,'Felsefe'),
   (13,'Edebiyat')
  */

   /*stockType toblosuna veri girişi.*/

   INSERT INTO stockType(stockTypeName)
  VALUES 
   ('Bağış'),
   ('Satın Alma')

   /*allBooks tablosuna veri girişi*/

   /*Girdiğimiz values bilgileri doğru sırada ve adette olmalıdır.Yoksa veri girişi yapamayız.*/

   INSERT INTO allbooks (isbnID,bookName,writerName,publisherName,totalPages,addedDate,bookTypeName,writtenLanguage,numberOfBooks,bookTypeID ,writerID,publisherID,stockTypeID ) 
 VALUES
   (9789750731963,'Sineklerin Tanrısı','William Golding','Can Yayınları',232,'2019-02-15','Roman','İngilizce',5,3,1,1,2),
   (9789753638031,'Kürk Mantolu Madonna','Sabahattin Ali','Yapı Kredi Yayınları',160,'2018-07-15','Roman','Türkçe',6,3,2,2,1),
   (9786052957018,'Küçük Prens','Antoine de Saint-Exupery','İş Bankası Kültür Yayınları',96,'2019-01-08','Çocuk','Fransızca',20,6,3,3,2),
   (9786052950156,'Suç ve Ceza','Fyodor Dostoyevski','İş Bnakası Kültür Yayınları',720,'2017-02-15','Roman','Rusça',4,3,4,3,1),
   (9789750732083,'Kırmızı Pazartesi','Gabriel Garcia Marquez','Can Yayınları',160,'2019-09-07','Roman','İspanyolca',5,3,5,1,1),
   (9789755391815,'Otomatik Portakal','Anthony Burgerss','Ayrıntı Yayınları',224,'2018-03-01','Distopya','İngilizce',3,7,6,5,2),
   (9789750732403,'Hayvan Çiftliği','George Orwell','Can Yayınları',152,'2019-12-05','Alegori','İngilizce',8,2,15,1,1),
   (9786053605186,'The Land of Lost Gods','Ahmet Ümit','Yapı Kredi Yayınları',472,'2015-04-05','Polisiye','İngilizce',1,11,17,2,2),
   (9789750800287,'Masal Masal İçinde','Ahmet Ümit','Yapı Kredi Yayınları',160,'2018-04-12','Çocuk','Türkçe',6,6,17,2,2),
   (9786052950194,'Savaş ve Barış','Lev Tolstoy','Yapı Kredi Yayınları',1504,'2017-08-20','Roman','Rusça',9,3,16,2,1),
   (9786052234234,'Labirent: Ölümcül Kaçış','James Dashner','Pegasus Yayınları',400,'2014-09-07','Bilim Kurgu','İngilizce',5,10,18,14,1),
   (9786052345234,'Yüzüklerin Efendisi','J.R.R. Tolkien','Metis Yayınları',1216,'2018-08-05','Fantastik','İngilizce',7,4,19,8,1),
   (9789756456345,'Matematik Tarihi','Carl B. Boyer','Tübitak Yayınları',720,'2019-02-09','Tarih','İngilizce',2,8,11,7,2),
   (9789750345775,'Kar Kokusu','Ahmet Ümit','Yapı Kredi Yayınları',288,'2000-03-05','Polisiye','Türkçe',4,11,17,2,1),
   (9786052980868,'1984','George Orwell','Can Yayınları',352,'1938-03-05','Bilim Kurgu','İngilizce',6,10,15,1,2),
   (9789755334356 ,'Varlık ve Zaman ','Martin Heidegger','İdea Yayınevi',480,'2018-06-26','Felsefe','Türkçe',2,12,20,15,2),
   (9789755334363  ,'Varlık ve Hiçlik ','Jean-Paul Sartre','İdea Yayınevi',320,'2018-05-17','Felsefe','Türkçe',7,12,21,15,1)
  
         
		
             /*NOTLAR
		        
		           SET identity_insert dbo.stock OFF/ON  kod satırı IDENTITY olarak belirlediğimiz kolon için IDENTITY'i pasif ve aktif etmemizi sağlar.
                              ON konumuna getirirsek veri eklerken ID değerini kendimiz girebiliriz, OFF durumdayken ise MS-SQL bunu yapmamıza izin vermez.
		           
			   INSERT INTO : Ekleme sorgusu olarak adlandırılır.Tabloya bir veya birden çok kayıt eklemek için kullanılır. 
		             Kullanımı: INSERT INTO table_name (column_name) VALUES (calumn_value )
			     Belirtilen sütun adları ve girelen değer bilgileri doğru sıralama da ve adette olmalıdır.

               */
