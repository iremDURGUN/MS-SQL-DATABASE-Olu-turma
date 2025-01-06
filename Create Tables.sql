
/*use ile çalışacağımız database 'i belirtiriz.*/
use LibProject 

/*Tabloları oluşturmak için aşağıdaki gibi CREATE TABLE fonksiyonunu kullanırız */


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
  isbnID NVARCHAR(13) NOT NULL UNIQUE,      /*ISBN numaraları kitap 'a özel bir numara olduğu için UNIQUE olarak tanımlarız.*/
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
  
  FOREIGN KEY (bookTypeID ) REFERENCES bookTypeName (ID),          /*FOREIGN KEY yardımıyla tabloları ilişkilendiririz.*/
  FOREIGN KEY (writerID ) REFERENCES writers (ID),
  FOREIGN KEY (publisherID ) REFERENCES publisher (ID),
  FOREIGN KEY (stockTypeID ) REFERENCES stockType (ID)
 
  )


		 /*NOTLAR
		   PRIMARY KEY: Değer olarak NULL içermez ve her tabloda bir tane bulunur. Primary Key bir tabloda var olan bir veriye 
                    sadece o veriye ait bir değer atar. Örneğin burada oluşturduğumuz writers tablosunda her yazara ayrı bir ID verilir.
                    Çünkü o yazardan birtane vardır ve tabloda ona verdiğin Primary Key olan ID sayesinde o kişiyi kolaylıkla tanımlayabilmeni sağlar. 

		   UNIQUE KEY: Değer olarak NULL içerebilir ve bir değeri birden fazla kez alamaz. Örnek olarak T.C. kimlik numarası kişiye aittir ve kişiye özeldir.
                    Bu yüzden T.C. kimlik numarası UNIQUE yapılmalıdır. Primary Key'den farkı NULL karakter içerbiliyor oluşudur.

                   FOREIGN KEY: Bir veri tablosuna girilebilecek değerleri başka bir veri tablosundaki alanlarla ilişkilendirmeye yarar.
                    DATABASE tasarlarken tablolar parçalara ayrılarak veri tekrarının önüne geçilir.
                    Ayırdığımız tabloları anlamlı bir şekilde birleştirmek için ortak bir sütun belirlenir(Bu DATABASE'de bu sütun ID'dir.).
                    Bu sütunun sayesinde tablolar arası Foreign key ile ilişki kurularak veri bütünlüğü korunur. 
                    Yani Foreign Key kullanım amacı veri bütünlüğünün sağlanmasıdır.

                   IDENTITY: Tabloları oluştururken Primary Key olarak belirlediğimiz kolonu her veri eklendiğinde sıralı bir şekilde artırarak 
                     ID verisini otomatik olarak almasını sağlıyor.

		  */
	
