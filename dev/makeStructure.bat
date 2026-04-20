@ECHO OFF
@ECHO Architecture folder creation...
@ECHO 

@MD bin test lib lib\models lib\controllers lib\data lib\utils

@REM make files
@ECHO 
@ECHO Files creation...

@ECHO 
@ECHO lib\main.dart
@ECHO void main(){} > bin\main.dart

@ECHO 
@ECHO lib\models\Product.dart
@TYPE NUL > lib\models\Product.dart

@ECHO 
@ECHO lib\controllers\ProductController.dart
@TYPE NUL > lib\controllers\ProductController.dart

@ECHO 
@ECHO lib\utils\View.dart
@TYPE NUL > lib\utils\View.dart

@ECHO 
@ECHO lib\data\products.json
@TYPE NUL > lib\data\products.json