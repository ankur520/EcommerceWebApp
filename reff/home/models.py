from django.db import models
from django_resized import ResizedImageField
from PIL import Image


# Create your models here.

# admin sign up db table 
class AdminForms(models.Model):
    inputName = models.CharField(max_length=200)
    inputEmail = models.EmailField(max_length=200)
    inputPassword = models.CharField(max_length=200)


# user sign up db table 
class UserForms(models.Model):
    uName = models.CharField(max_length=200)
    uEmail = models.EmailField(max_length=200)
    uPassword = models.CharField(max_length=200)
    userType = models.CharField(max_length=200)
    uDate = models.DateTimeField()
    


# only  admin can add sectors
class AddSectors(models.Model):
    sectorName = models.CharField(max_length=200)
    uDate = models.DateTimeField()



# only  admin can add Category name with sectors name
class AddCategory(models.Model):
    sectorId = models.ForeignKey(AddSectors, on_delete=models.CASCADE, null=True)
    categoryName = models.CharField(max_length=200)
    date = models.DateTimeField()


class AddSubCategory(models.Model):
    sectorId = models.ForeignKey(AddSectors, on_delete=models.CASCADE)
    categoryId = models.ForeignKey(AddCategory, on_delete=models.CASCADE)
    subCategoryName = models.CharField(max_length=200)
    date = models.DateTimeField()




class AddProductServices(models.Model):
    userId = models.CharField(max_length=200)
    productName = models.CharField(max_length=200)
    sectorId = models.CharField(max_length=200)
    categoryId = models.CharField(max_length=200)
    subCatId = models.CharField(max_length=200)
    imageUrl_1 = models.ImageField(upload_to='productimages/')
    imageUrl_2 = models.ImageField(upload_to='productimages/')
    productPrice = models.CharField(max_length=200)
    productHighlights = models.TextField()
    productDescription = models.TextField()
    date = models.DateTimeField()



class AffliateLink(models.Model):
    
    userId = models.ForeignKey(UserForms, on_delete=models.CASCADE)
    productId = models.ForeignKey(AddProductServices, on_delete=models.CASCADE)
    affliateCode = models.CharField(max_length=200)



class AddToCart(models.Model):
    
    userId = models.ForeignKey(UserForms, on_delete=models.CASCADE)
    productId = models.ForeignKey(AddProductServices, on_delete=models.CASCADE)
    quantity = models.CharField(max_length=200)
    date = models.DateTimeField()

# class placeOrder(models.Model):
    
#     userId = models.ForeignKey(UserForms, on_delete=models.CASCADE)
#     productId = models.ForeignKey(AddProductServices, on_delete=models.CASCADE)
#     quantity = models.CharField(max_length=200)
#     paymentMode = models.CharField(max_length=200)
#     amount = models.FloatField()
#     date = models.DateTimeField()

  
   