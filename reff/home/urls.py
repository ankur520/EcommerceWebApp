from django.contrib import admin
from django.urls import path, include
from home import views


urlpatterns = [
    path('', views.index, name="index"),
    path('signin', views.userSignin, name="sign in"),
    path('signup', views.userSignup, name="sign up"),


    #   ADMINS PART 
    path('adminLoginRegistration', views.adminLoginRegistration, name="adminLoginRegistration"),
    path('adminDashboard', views.adminDashboard, name="Admin Dashboard "),
    path('adminLogout', views.adminLogout, name="Admin Logout "),
    path('AddSectorCategory', views.adminAddSectorCategory, name="AddSectorCategory"),
    path('loadCategory/', views.load_categories, name="ajax_Adminload_category"),
    path('loadAddCategoryData/', views.loadAddCategoryData, name="ajax_Adminload_category"),



    #   USER PARTS
    path('userDashboard', views.userDashboard, name="userDashboard "),
    path('addProducts', views.addProducts, name="addProducts "),
    path('allAffliateProductsList', views.allAffliateProductsList, name="allAffliateProductsList"),
    path('loadCategoryForProducts/', views.load_categories_forAddProducts, name="ajax_load_category"),
    path('loadSubCatForProducts/', views.load_Subcat_forAddProducts, name="ajax_load_subCat"),
    path('userLogout', views.userLogout, name="User Logout "),
    path('listAddedProducts', views.listAddedProducts, name="User Logout "),
    

    path('detailProduct', views.detailProduct, name="User Logout "),
    path('interestedAffliateList', views.interestedAffliateList, name="interestedAffliateList "),
    path('publicAffliateCode', views.publicAffliateCode, name="publicAffliateCode "),
    path('viewCart', views.viewCart, name="viewCart "),
    path('productInfo', views.productInfo, name="productInfo "),
  
]
