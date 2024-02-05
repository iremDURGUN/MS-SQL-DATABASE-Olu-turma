
/*use ile �al��aca��m�z database 'i belirtiriz.*/
use LibProject 

/*Tablolar� olu�turmak i�in a�a��daki gibi CREATE TABLE fonksiyonunu kullan�r�z */


Create Table bookTypeName (
  
  ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  bookTypeName VARCHAR(20)NOT NULL
  )


Create Table writers (
  
  ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  writerName VARCHAR(30) NOT NULL
  )


  Create Table publisher (
  
  ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  publisherName VARCHAR(30) NOT NULL
  )



  Create Table stockType (
  
  ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  stockTypeName VARCHAR(30) NOT NULL

  )


Create Table  allbooks ( 
  ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  isbnID NVARCHAR(13) NOT NULL UNIQUE,      /*ISBN numaralar� kitap 'a �zel bir numara oldu�u i�in UNIQUE olarak tan�mlar�z.*/
  bookName VARCHAR(30) NOT NULL,
  writerName VARCHAR(30) NOT NULL,
  publisherName VARCHAR(30) NOT NULL,
  totalPages INT NOT NULL,
  addedDate DATE NOT NULL,
  bookTypeName VARCHAR(20)NOT NULL,
  writtenLanguage VARCHAR(10) NOT NULL,
  numberOfBooks INT NOT NULL,
  bookTypeID INT,
  writerID INT,
  publisherID INT,
  stockTypeID INT,
  
  FOREIGN KEY (bookTypeID ) REFERENCES bookTypeName (ID),          /*FOREIGN KEY yard�m�yla tablolar� ili�kilendiririz.*/
  FOREIGN KEY (writerID ) REFERENCES writers (ID),
  FOREIGN KEY (publisherID ) REFERENCES publisher (ID),
  FOREIGN KEY (stockTypeID ) REFERENCES stockType (ID)
 
  )


		 /*NOTLAR
		   PRIMARY KEY: De�er olarak NULL i�ermez ve her tabloda bir tane bulunur. Primary Key bir tabloda var olan bir veriye 
                    sadece o veriye ait bir de�er atar. �rne�in burada olu�turdu�umuz writers tablosunda her yazara ayr� bir ID verilir.
                    ��nk� o yazardan birtane vard�r ve tabloda ona verdi�in Primary Key olan ID sayesinde o ki�iyi kolayl�kla tan�mlayabilmeni sa�lar. 

		   UNIQUE KEY: De�er olarak NULL i�erebilir ve bir de�eri birden fazla kez alamaz. �rnek olarak T.C. kimlik numaras� ki�iye aittir ve ki�iye �zeldir.
                    Bu y�zden T.C. kimlik numaras� UNIQUE yap�lmal�d�r. Primary Key'den fark� NULL karakter i�erbiliyor olu�udur.

                   FOREIGN KEY: Bir veri tablosuna girilebilecek de�erleri ba�ka bir veri tablosundaki alanlarla ili�kilendirmeye yarar.
                    DATABASE tasarlarken tablolar par�alara ayr�larak veri tekrar�n�n �n�ne ge�ilir.
                    Ay�rd���m�z tablolar� anlaml� bir �ekilde birle�tirmek i�in ortak bir s�tun belirlenir(Bu DATABASE'de bu s�tun ID'dir.).
                    Bu s�tunun sayesinde tablolar aras� Foreign key ile ili�ki kurularak veri b�t�nl��� korunur. 
                    Yani Foreign Key kullan�m amac� veri b�t�nl���n�n sa�lanmas�d�r.

                   IDENTITY: Tablolar� olu�tururken Primary Key olarak belirledi�imiz kolonu her veri eklendi�inde s�ral� bir �ekilde art�rarak 
                     ID verisini otomatik olarak almas�n� sa�l�yor.

		  */
	