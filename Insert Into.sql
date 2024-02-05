 /*INSERT INTO fonksiyonunu kullanarak olu�turdu�umuz tablolara veri giriyoruz.*/

 /*publisher tablosuna veri giri�i*/

   INSERT INTO publisher(publisherName)
  VALUES 
   ('Can Yay�nlar�'),
   ('Yap� Kredi Yay�nlar�'),
   ('�� Bankas� K�lt�r Yay�nlar�'),
   ('Kolektif Kitap'),
   ('Ayr�nt� Yay�nlar�'),
   ('�thaki Yay�nlar�'),
   ('T�bitak Yay�nlar�'),
   ('Metis Yay�nlar�'),
   ('Do�an Kitap'),
   ('Can �ocuk Yay�nlar�'),
   ('HaperOne'),
   ('Signet Classic'),
   ('Scribner'),
   ('Pegasus Yay�nlar�'),
   ('�dea Yay�nevi')



  /*writers tablosuna veri giri�i*/

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
   ('Ahmet �mit'),
   ('James Dashner'),
   ('J.R.R. Tolkien'),
   ('Martin Heidegger'),
   ('Jean-Paul Sartre')
   
   /*bookTypeName tablosuna veri giri�i*/

   INSERT INTO bookTypeName(bookTypeName)
  VALUES 
   ('Korku'),
   ('Alegori'),
   ('Roman'),
   ('Fantastik'),
   ('�yk�'),
   ('�ocuk'),
   ('Distopya'),
   ('Tarih'),
   ('Gizem'),
   ('Bilim Kurgu'),
   ('Polisiye')


   /*A�a��daki i�lemlerde e�erki ID bilgisi elle girilmesi gereken bir durum olu�tu�unda 
     IDENTITY_INSERT fonksiyonunu ON durumuna getirmeliyiz. ON durumuna getirmezsek manuel olarak veri giri�i yapamay�z.
	 ID bilgilerini girerken tablodaki son ID'nin aldd��� de�ere dikkat ederek yeni veri eklemeliyiz.*/

  /* SET identity_insert dbo.bookTypeName ON
   INSERT INTO bookTypeName(ID , bookTypeName)
  VALUES 
   (12,'Felsefe'),
   (13,'Edebiyat')
  */

   /*stockType toblosuna veri giri�i.*/

   INSERT INTO stockType(stockTypeName)
  VALUES 
   ('Ba���'),
   ('Sat�n Alma')

   /*allBooks tablosuna veri giri�i*/

   /*Girdi�imiz values bilgileri do�ru s�rada ve adette olmal�d�r.Yoksa veri giri�i yapamay�z.*/

   INSERT INTO allbooks (isbnID,bookName,writerName,publisherName,totalPages,addedDate,bookTypeName,writtenLanguage,numberOfBooks,bookTypeID ,writerID,publisherID,stockTypeID ) 
 VALUES
   (9789750731963,'Sineklerin Tanr�s�','William Golding','Can Yay�nlar�',232,'2019-02-15','Roman','�ngilizce',5,3,1,1,2),
   (9789753638031,'K�rk Mantolu Madonna','Sabahattin Ali','Yap� Kredi Yay�nlar�',160,'2018-07-15','Roman','T�rk�e',6,3,2,2,1),
   (9786052957018,'K���k Prens','Antoine de Saint-Exupery','�� Bankas� K�lt�r Yay�nlar�',96,'2019-01-08','�ocuk','Frans�zca',20,6,3,3,2),
   (9786052950156,'Su� ve Ceza','Fyodor Dostoyevski','�� Bnakas� K�lt�r Yay�nlar�',720,'2017-02-15','Roman','Rus�a',4,3,4,3,1),
   (9789750732083,'K�rm�z� Pazartesi','Gabriel Garcia Marquez','Can Yay�nlar�',160,'2019-09-07','Roman','�spanyolca',5,3,5,1,1),
   (9789755391815,'Otomatik Portakal','Anthony Burgerss','Ayr�nt� Yay�nlar�',224,'2018-03-01','Distopya','�ngilizce',3,7,6,5,2),
   (9789750732403,'Hayvan �iftli�i','George Orwell','Can Yay�nlar�',152,'2019-12-05','Alegori','�ngilizce',8,2,15,1,1),
   (9786053605186,'The Land of Lost Gods','Ahmet �mit','Yap� Kredi Yay�nlar�',472,'2015-04-05','Polisiye','�ngilizce',1,11,17,2,2),
   (9789750800287,'Masal Masal ��inde','Ahmet �mit','Yap� Kredi Yay�nlar�',160,'2018-04-12','�ocuk','T�rk�e',6,6,17,2,2),
   (9786052950194,'Sava� ve Bar��','Lev Tolstoy','Yap� Kredi Yay�nlar�',1504,'2017-08-20','Roman','Rus�a',9,3,16,2,1),
   (9786052234234,'Labirent: �l�mc�l Ka���','James Dashner','Pegasus Yay�nlar�',400,'2014-09-07','Bilim Kurgu','�ngilizce',5,10,18,14,1),
   (9786052345234,'Y�z�klerin Efendisi','J.R.R. Tolkien','Metis Yay�nlar�',1216,'2018-08-05','Fantastik','�ngilizce',7,4,19,8,1),
   (9789756456345,'Matematik Tarihi','Carl B. Boyer','T�bitak Yay�nlar�',720,'2019-02-09','Tarih','�ngilizce',2,8,11,7,2),
   (9789750345775,'Kar Kokusu','Ahmet �mit','Yap� Kredi Yay�nlar�',288,'2000-03-05','Polisiye','T�rk�e',4,11,17,2,1),
   (9786052980868,'1984','George Orwell','Can Yay�nlar�',352,'1938-03-05','Bilim Kurgu','�ngilizce',6,10,15,1,2),
   (9789755334356 ,'Varl�k ve Zaman ','Martin Heidegger','�dea Yay�nevi',480,'2018-06-26','Felsefe','T�rk�e',2,12,20,15,2),
   (9789755334363  ,'Varl�k ve Hi�lik ','Jean-Paul Sartre','�dea Yay�nevi',320,'2018-05-17','Felsefe','T�rk�e',7,12,21,15,1)
  
         
		
             /*NOTLAR
		        
		           SET identity_insert dbo.stock OFF/ON  kod sat�r� IDENTITY olarak belirledi�imiz kolon i�in IDENTITY'i pasif ve aktif etmemizi sa�lar.
                     ON konumuna getirirsek veri eklerken ID de�erini kendimiz girebiliriz, OFF durumdayken ise MS-SQL bunu yapmam�za izin vermez.
		           
				   INSERT INTO : Ekleme sorgusu olarak adland�r�l�r.Tabloya bir veya birden �ok kay�t eklemek i�in kullan�l�r. 
					   Kullan�m�: INSERT INTO table_name (column_name) VALUES (calumn_value )
					   Belirtilen s�tun adlar� ve girelen de�er bilgileri do�ru s�ralama da ve adette olmal�d�r.

               */