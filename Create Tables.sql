
/*use ile çalýþacaðýmýz database 'i belirtiriz.*/
use LibProject 

/*Tablolarý oluþturmak için aþaðýdaki gibi CREATE TABLE fonksiyonunu kullanýrýz */


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
  isbnID NVARCHAR(13) NOT NULL UNIQUE,      /*ISBN numaralarý kitap 'a özel bir numara olduðu için UNIQUE olarak tanýmlarýz.*/
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
  
  FOREIGN KEY (bookTypeID ) REFERENCES bookTypeName (ID),          /*FOREIGN KEY yardýmýyla tablolarý iliþkilendiririz.*/
  FOREIGN KEY (writerID ) REFERENCES writers (ID),
  FOREIGN KEY (publisherID ) REFERENCES publisher (ID),
  FOREIGN KEY (stockTypeID ) REFERENCES stockType (ID)
 
  )


		 /*NOTLAR
		   PRIMARY KEY: Deðer olarak NULL içermez ve her tabloda bir tane bulunur. Primary Key bir tabloda var olan bir veriye 
                    sadece o veriye ait bir deðer atar. Örneðin burada oluþturduðumuz writers tablosunda her yazara ayrý bir ID verilir.
                    Çünkü o yazardan birtane vardýr ve tabloda ona verdiðin Primary Key olan ID sayesinde o kiþiyi kolaylýkla tanýmlayabilmeni saðlar. 

		   UNIQUE KEY: Deðer olarak NULL içerebilir ve bir deðeri birden fazla kez alamaz. Örnek olarak T.C. kimlik numarasý kiþiye aittir ve kiþiye özeldir.
                    Bu yüzden T.C. kimlik numarasý UNIQUE yapýlmalýdýr. Primary Key'den farký NULL karakter içerbiliyor oluþudur.

                   FOREIGN KEY: Bir veri tablosuna girilebilecek deðerleri baþka bir veri tablosundaki alanlarla iliþkilendirmeye yarar.
                    DATABASE tasarlarken tablolar parçalara ayrýlarak veri tekrarýnýn önüne geçilir.
                    Ayýrdýðýmýz tablolarý anlamlý bir þekilde birleþtirmek için ortak bir sütun belirlenir(Bu DATABASE'de bu sütun ID'dir.).
                    Bu sütunun sayesinde tablolar arasý Foreign key ile iliþki kurularak veri bütünlüðü korunur. 
                    Yani Foreign Key kullaným amacý veri bütünlüðünün saðlanmasýdýr.

                   IDENTITY: Tablolarý oluþtururken Primary Key olarak belirlediðimiz kolonu her veri eklendiðinde sýralý bir þekilde artýrarak 
                     ID verisini otomatik olarak almasýný saðlýyor.

		  */
	