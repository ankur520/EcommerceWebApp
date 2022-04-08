from django.db.models.aggregates import Count
from django.http import request
from django.shortcuts import render, HttpResponse, render, redirect
# from .forms import AdminRegisterForm
from home.models import AdminForms, UserForms, AddSectors, AddCategory, AddToCart, AddSubCategory, AddProductServices, AffliateLink
# django messages 
from django.contrib import messages
from django.contrib.auth import authenticate, login
from django.utils.html import strip_tags
from datetime import datetime
import random, sys, os,  pathlib, string

# Create your views here.
def index(request):

    showAllAddedProduct = AddProductServices.objects.all()

    dataArray = {
        'showAllAddedProducts': showAllAddedProduct
    }

    return render(request, "index.html", dataArray)

#   ------------------------------------------------
#           USERS SIGN , SIGN UP, USER DASHBOARD, LOGOUT FUNCTIONS
#   -----------------------------------------------

def userSignin(request):
    if 'signinBtn' in request.POST:
        # print("button working")

        loginEmail = request.POST.get("loginInputEmail")
        loginPassword = request.POST.get("loginInputPassword")

        emailExistQuery = UserForms.objects.filter(uEmail = loginEmail, uPassword = loginPassword)
     
        if emailExistQuery.exists():
            # print(emailExistQuery)
            fetchedemailid = UserForms.objects.filter(uEmail = loginEmail, uPassword = loginPassword)[0].uEmail
            fetchedid = UserForms.objects.filter(uEmail = loginEmail, uPassword = loginPassword)[0].id
            fetchedname = UserForms.objects.filter(uEmail = loginEmail, uPassword = loginPassword)[0].uName

            request.session['userLoggedIn'] = True
            request.session['userLoggedEmailId'] = fetchedemailid
            request.session['userLoggedName'] = fetchedname
            request.session['userLoggedUserId'] = fetchedid

            # print(f"logged ", fetchedemailid)
            # print(f"logged ", fetchedid)
            # print(f"logged ", fetchedname)
            # print(request.session.get('userLoggedEmailId'))
            # print(request.session.get('userLoggedName'))
            # print(request.session.get('userLoggedUserId'))

            return redirect("/userDashboard")
        
        elif not emailExistQuery.exists():
            # print("Login or Password Incorrect ")
            messages.warning(request, 'Login Email Or Password Incorrect')

    return render(request, "userTemplates/signin.html")



def userSignup(request):
    if 'signupBtn' in request.POST:
        print("button working")

        inputName = strip_tags(request.POST.get("signUpName"))
        inputEmail = strip_tags(request.POST.get("signUpEmail"))
        inputPassword = strip_tags(request.POST.get("signUpPassword"))

        UserSignUpQuery = UserForms(uName = inputName, uEmail= inputEmail, uPassword= inputPassword, userType = "Visitor", uDate = datetime.now())
        UserSignUpQuery.save()
        messages.success(request, 'User Registration Successfull please Login')
        return redirect("/signin")

        print(inputName, inputEmail, inputPassword)

    return render(request, "userTemplates/signup.html")



def userLogout(request):
    del request.session['userLoggedIn']
    del request.session['userLoggedEmailId']
    del request.session['userLoggedName']
    del request.session['userLoggedUserId']
    
    return redirect("/")

    return render(request, "index.html")



def userDashboard(request):
    if not request.session.get('userLoggedIn'):
        return redirect("/signin")

    if 'updateUserType' in request.POST:
        inputSelectUserType = strip_tags(request.POST.get("selectUserType"))
        # print(inputSelectUserType)
        # print(request.session.get('userLoggedUserId'))

        query = UserForms.objects.filter(id = request.session.get('userLoggedUserId')).update(userType = inputSelectUserType)
        messages.success(request, "You Successfully Changed UserType")


    # -----------------------------------
    #   RENDER PAGE ACCORDING TO USER TYPE
    # -----------------------------------
    userDataType = UserForms.objects.filter(id = request.session.get('userLoggedUserId'))[0].userType
    # print(userDataType)

    if userDataType == "Visitor":
        # print("Visitor")
        return render(request, "userTemplates/visitorUserDashboard.html")


    if userDataType == "Creater":
        # print("Creater")
        creatercountAllAddedProduct = AddProductServices.objects.filter(userId = request.session.get('userLoggedUserId')).count()

        createrDataArray = {
            'creatercountAllProducts': creatercountAllAddedProduct
        }
        return render(request, "userTemplates/createrUserDashboard.html", createrDataArray)


    if userDataType == "Affliater":
        
        addedAffliateList = AffliateLink.objects.filter(userId = request.session.get('userLoggedUserId') ).count()
     
        affliateArray = {
            'affliateAddedCount': addedAffliateList
        }

        # print("Affliater")
        return render(request, "userTemplates/affliaterUserDashboard.html", affliateArray)


    if userDataType == "Both":
        # print("bothhhhhh")
        countAllAddedProduct = AddProductServices.objects.filter(userId = request.session.get('userLoggedUserId')).count()

        dataArray = {
            'countAllProducts': countAllAddedProduct
        }
        return render(request, "userTemplates/bothUserDashboard.html", dataArray)



def addProducts(request):
    if not request.session.get('userLoggedIn'):
        return redirect("/signin")

    if 'UserAddProductBtn' in request.POST:
        print("btn clicked")
        inputProductName = strip_tags(request.POST.get("addProductName"))
        inputSelectSelector = strip_tags(request.POST.get("selectSelector"))
        inputSelectCategory = strip_tags(request.POST.get("selectCategory"))
        inputSelectSubCat = strip_tags(request.POST.get("selectSubCat"))
        inputUploadImage1 = request.FILES['uploadImage1']
        inputUploadImage2 = request.FILES['uploadImage2']
        
        print(inputUploadImage1)
        print(inputUploadImage2)
        print(inputUploadImage2)

        # unique = request.session.get('userLoggedEmailId')[:-10] + str(request.session.get('userLoggedUserId')) + request.session.get('userLoggedName').replace(" ", "") + str('{:03d}'.format(random.randrange(1000, 10000000))) + inputUploadImage1[-4:]
        # b = 'media/productimages/'+unique
        # d = os.rename(inputUploadImage1, b)
        # print(d)
      
        inputAddProductprice = strip_tags(request.POST.get("addProductprice"))
        inputProductHighlights = strip_tags(request.POST.get("productHighlights"))
        inputProductDescription = strip_tags(request.POST.get("productDescription"))



        query = AddProductServices(userId= request.session.get('userLoggedUserId'), productName = inputProductName, sectorId = inputSelectSelector, categoryId = inputSelectCategory, subCatId = inputSelectSubCat, imageUrl_1 = inputUploadImage1,  imageUrl_2 = inputUploadImage2, productPrice = inputAddProductprice, productHighlights = inputProductHighlights, productDescription = inputProductDescription, date = datetime.today()  )
        query.save()
        messages.success(request, 'Product Added Successfully')
        return redirect("/userDashboard")




        # print(f"product name is - ", inputProductName)
        # print(f"select selector - ", inputSelectSelector)
        # print(f"selectCategory - ", inputSelectCategory)
        # print(f"selectSubCat - ", inputSelectSubCat)
        # print(f"product name is - ", inputUploadImage1)
        # print(f"select selector - ", inputUploadImage2)
        # print(f"selectCategory - ", inputAddProductprice)
        # print(f"selectSubCat - ", inputProductHighlights)
        # print(f"selectSubCat - ", inputProductDescription)
        # names = "ajay"
        # unique = request.session.get('userLoggedEmailId')[:-10] + str(request.session.get('userLoggedUserId')) + request.session.get('userLoggedName').replace(" ", "") + str('{:03d}'.format(random.randrange(1000, 10000000))) + inputUploadImage1[-4:]
        # d = os.rename(inputUploadImage1, unique)
        # print(d)
        # a = os.rename('C:\\Users\\Desktop\\a.txt', 'C:\\Users\\Desktop\\b.kml')
        # print(a)
        # a = os.path.dirname(__file__))


    showAllSector = AddSectors.objects.all()
 
    dataArray = {
        'showAllSectorss': showAllSector
    }

    return render(request, "userTemplates/addProducts.html", dataArray)



def allAffliateProductsList(request):
    if not request.session.get('userLoggedIn'):
        return redirect("/signin")
  

   
    if 'generateAffliateLink' in request.POST:

        affliateProductId = request.POST.get("generateAffliateProductId")
        loggedUserId = request.session.get('userLoggedUserId')
        # print(affliateProductId)
        # print(ab)
        listAvailableProductsForAffliate = AffliateLink.objects.filter(userId_id = loggedUserId , productId = affliateProductId)

        if listAvailableProductsForAffliate.exists():
            messages.warning(request, 'Product Already Added For Affliate')
            return redirect("/userDashboard")


        randLetters = string.ascii_letters + string.digits 
        randAffliateLink = ''.join(random.choice(randLetters) for i in range(10)) + str(request.session.get('userLoggedUserId')) + '{:03d}'.format(random.randrange(1000, 10000000))
        addAffliateQuery = AffliateLink(userId_id  = loggedUserId, productId_id  = affliateProductId, affliateCode = randAffliateLink)
        addAffliateQuery.save()
        messages.success(request, 'Product Added For Affliate Business')
        return redirect("/userDashboard")

        # print(randAffliateLink)


    listAvailableProductsForAffliate = AddProductServices.objects.filter()
    

    dataArray = {
        'listAvailableProductsForAffliate': listAvailableProductsForAffliate
    }

    return render(request, "userTemplates/allAffliateProductsList.html", dataArray)



def listAddedProducts(request):
    if not request.session.get('userLoggedIn'):
        return redirect("/signin")

    showAllAddedProduct = AddProductServices.objects.filter(userId = request.session.get('userLoggedUserId'))

    dataArray = {
        'showAllAddedProducts': showAllAddedProduct
    }

    return render(request, "userTemplates/listAddedProducts.html", dataArray)



def detailProduct(request):

    urlSectorId = request.GET.get('cat')
    print("cat id is => ", urlSectorId)

    if urlSectorId:
        print("filter is working ")
        catFilterQuery = AddProductServices.objects.filter(sectorId = urlSectorId).all()
        showAllAddSectors = AddSectors.objects.all()
        showAllAddCategory = AddCategory.objects.all()
        showAllAddSubCategory = AddSubCategory.objects.all()
        # print(catFilterQuery)
        # for i in catFilterQuery:
        #     print(i.productName)
        dataArray1 = {
            'catFilterQuery': catFilterQuery,
            'showAllAddSectors': showAllAddSectors,
            'showAllAddCategory': showAllAddCategory,
            'showAllAddSubCategory': showAllAddSubCategory,
        }
        return render(request, "detailProduct.html", dataArray1)


    else:
        showAllAddedProduct = AddProductServices.objects.all()
        showAllAddSectors = AddSectors.objects.all()
        showAllAddCategory = AddCategory.objects.all()
        showAllAddSubCategory = AddSubCategory.objects.all()
       
            

        dataArray2 = {
            'showAllAddedProducts': showAllAddedProduct,
            'showAllAddSectors': showAllAddSectors,
            'showAllAddCategory': showAllAddCategory,
            'showAllAddSubCategory': showAllAddSubCategory,
         

        }

        return render(request, "detailProduct.html", dataArray2)



def interestedAffliateList(request):
 
    listAffliate = AffliateLink.objects.filter(userId = request.session.get('userLoggedUserId')).all()

    dataArray452 = {
        'listAffliate': listAffliate,
 
    }


    return render(request, "userTemplates/interestedAffliateList.html", dataArray452)



def publicAffliateCode(request):

    uniqueCodeFromUrl  = request.GET["code"]
    uniqueCodeQuery = AffliateLink.objects.filter(affliateCode = uniqueCodeFromUrl )[0].productId_id
    print(uniqueCodeQuery)
    # print(uniqueCodeFromUrl)


    listAffliate = AddProductServices.objects.filter(id = uniqueCodeQuery).all()

    
    dataArray452 = {
        'publicData': listAffliate,
    
    }

    return render(request, "userTemplates/publicAffliateCode.html", dataArray452)



def viewCart(request):
    quan = request.POST.get('updateCartQuantity')
    cartId = request.POST.get('cartId')
    

    if 'cartQuantityUpdateBtn' in request.POST:
        print("cartQuantityUpdateBtn")
        print("cart id is -> " , cartId , "and qty is ", quan)
        a = AddToCart.objects.filter(id = cartId).update(quantity = quan)
        messages.success(request, "Quantity Updated successfully")
        return redirect("/viewCart")
     
        # print(a)
        # print("cartQuantityUpdateBtn clicked")
        # print(cartId)


    if 'cartProductDeleteBtn' in request.POST:
        print("cartProductDeleteBtn clicked")
        print("cart id id -> ",cartId)
        deleteQuery = AddToCart.objects.get(id = cartId)
        deleteQuery.delete()
        messages.success(request, "Product Deleted successfully")
        return redirect("/viewCart")




    # to show cart all products sum 
    showCartAdded = AddToCart.objects.filter(userId = request.session.get("userLoggedUserId")).all()
    sum = 0
    for a in showCartAdded:
        price = int(a.productId.productPrice)
        qty = int(a.quantity)
        total = price * qty
        sum += total
        # print(total)
    
    # print(sum)

    dataArray = {
  
       'showCartAdded': showCartAdded,
       'sum': sum
    }


    return render(request, "viewCart.html", dataArray)


def productInfo(request):

    idFromUrl = request.GET['id']
    # print(id)

    showProductQuery = AddProductServices.objects.filter(id = idFromUrl).all()
    showCartAdded = AddToCart.objects.filter(userId = request.session.get("userLoggedUserId")).all()
    # foundQuery = AddToCart.objects.get(userId_id = request.session.get("userLoggedUserId"), productId_id = addToCartProductIdNo)
  

    if 'addToCartBtn' in request.POST:
        addToCartProductIdNo = request.GET['id']
        quan = request.POST.get('addToCartQuantity')

        
        
     
        addCartQuery = AddToCart(userId_id = request.session.get("userLoggedUserId"), productId_id = addToCartProductIdNo, quantity = quan, date = datetime.now() )
        addCartQuery.save()
        messages.success(request, "Product added to cart")
        # print("addToCartBtn" , addToCartProductIdNo, quan)




        # ----------------------------------------------
        #   BUILD CART WITH SESSIONS 
        # 

        # cart = request.session.get('cart')

        # if cart:
       
        #     cart[addToCartProductIdNo] = quan
        # else:
        #     cart = {}
        #     cart[addToCartProductIdNo] = quan

        # request.session['cart'] = cart
        
        # print('cart => ',request.session['cart'])

       



    dataArray = {
        'showProductQuery': showProductQuery,
        'showCartAdded': showCartAdded,
  
    }

   
    return render(request, "userTemplates/productInfo.html", dataArray)






# ajax load category from sectors
def load_categories_forAddProducts(request):
    if not request.session.get('userLoggedIn'):
        return redirect("/signin")

    selectSectors_Id = request.GET.get('sectorIddddd')
    # print(f"id is ", selectSectors_Id)
    category = AddCategory.objects.filter(sectorId = selectSectors_Id)

    newdataArray = {
        'showAllcats': category
    }
    return render(request, "userTemplates/ajax/loadCategoryfromSector.html", newdataArray )


#  ajax load category from sectors
def load_Subcat_forAddProducts(request):
    if not request.session.get('userLoggedIn'):
        return redirect("/signin")

    selectSectors_Id = request.GET.get('catIddddd')
    # print(f"id is ", selectSectors_Id)
    category = AddSubCategory.objects.filter(categoryId = selectSectors_Id)

    newdataArray = {
        'showAllSubcats': category
    }
    
    return render(request, "userTemplates/ajax/loadSubCatfromCategory.html", newdataArray )



#   ------------------------------------------------
#           ADMIN SIGN , SIGN UP, ADMIN DASHBOARD, LOGOUT FUNCTIONS
#   -----------------------------------------------

def adminLoginRegistration(request):
    
    #   -----------------------------------------------
    #   admin Sign Up
    #   ----------------------------------------------
    if 'adminRegisterSignUpBtn' in request.POST:
   
        name = request.POST.get("inputName")
        email = request.POST.get("inputEmail")
        password = request.POST.get("inputPassword")
        signUpQuery = AdminForms(inputName = name, inputEmail = email, inputPassword = password )
        signUpQuery.save()
        messages.success(request, 'admin Registration successfull')
        return redirect("/adminDashboard")

        

    #   -----------------------------------------------
    #     admin login
    #   ----------------------------------------------
    if 'adminRegisterSignInBtn' in request.POST:
        loginEmail = request.POST.get("loginInputEmail")
        loginPassword = request.POST.get("loginInputPassword")

        emailExistQuery = AdminForms.objects.filter(inputEmail = loginEmail, inputPassword = loginPassword)
     
        if emailExistQuery.exists():
            print(emailExistQuery)
            fetchedemailid = AdminForms.objects.filter(inputEmail = loginEmail, inputPassword = loginPassword)[0].inputEmail
            fetchedid = AdminForms.objects.filter(inputEmail = loginEmail, inputPassword = loginPassword)[0].id
            fetchedname = AdminForms.objects.filter(inputEmail = loginEmail, inputPassword = loginPassword)[0].inputName

            request.session['adminLoggedIn'] = True
            request.session['adminLoggedEmailId'] = fetchedemailid
            request.session['adminLoggedName'] = fetchedname
            request.session['adminLoggedUserId'] = fetchedid

            # print(f"logged ", fetchedemailid)
            # print(f"logged ", fetchedid)
            # print(f"logged ", fetchedname)
            print(request.session.get('adminLoggedEmailId'))
            print(request.session.get('adminLoggedName'))
            print(request.session.get('adminLoggedUserId'))

            return redirect("/adminDashboard")
        
        elif not emailExistQuery.exists():
            print("Login or Password Incorrect ")
            messages.warning(request, 'Login Or Password Incorrect')
        
    return render(request, "adminTemplates/adminLoginRegistration.html")



def adminDashboard(request):

    if not request.session.get('adminLoggedIn'):
        return redirect("/adminLoginRegistration")


    # to print all table data 
    # a = AdminForms.objects.all()
    # b = AdminForms.objects.all()
    # c = AdminForms.objects.all()[0].inputEmail
    # d = AdminForms.objects.filter(inputName = "arpit")[0].inputEmail
    # e = AdminForms.objects.filter(inputName = "arpit", inputPassword = 'dsaf')
    # f = AdminForms.objects.all().first()
    # g = AdminForms.objects.all().last()

    # print(f"e = ", e)
    # print(f"d = ", d)

    totalAdminUsers = AdminForms.objects.all().count()
    totalUsers = UserForms.objects.all().count()
    totalSectors = AddSectors.objects.all().count()
    totalCategory = AddCategory.objects.all().count()
    totalSubCategory = AddSubCategory.objects.all().count()

    data = {
        'totalAdminUsers': totalAdminUsers,
        'totalUsers': totalUsers,
        'totalSectors': totalSectors,
        'totalCategory': totalCategory,
        'totalSubCategory': totalSubCategory,
    }
    

    return render(request, "adminTemplates/adminDashboard.html", data)


def adminLogout(request):

    del request.session['adminLoggedIn']
    del request.session['adminLoggedEmailId']
    del request.session['adminLoggedName']
    del request.session['adminLoggedUserId']
    return redirect("adminLoginRegistration")

    return render(request, "adminLoginRegistration.html")



def adminAddSectorCategory(request):

    if not request.session.get('adminLoggedIn'):
        return redirect("/adminLoginRegistration")

    #   ------------------------------------------------------
    #       ADD SECTOR NAMES AND UPDATE FUNCTIONS 
    #   ------------------------------------------------------
    if 'addSectorBtn' in request.POST:
        inputSectorName = strip_tags(request.POST.get("sectorName"))
        addSectorQuery = AddSectors(sectorName = inputSectorName, uDate = datetime.today() )
        addSectorQuery.save()
        messages.success(request, 'Sector Added Successfully')

    if 'updateSectorNameBtn' in request.POST:
        inputSectorId = strip_tags(request.POST.get("updateSectorId"))
        inputSectorName = strip_tags(request.POST.get("updateSectorName"))
        
        sectorDeleteQuery = AddSectors.objects.filter(id = inputSectorId).update(sectorName = inputSectorName, uDate = datetime.today())
        
        messages.success(request, 'Sector Name Updated  Successfully')
        return redirect("/adminDashboard")




    #   ------------------------------------------------------
    #       ADD Category  NAMES with sector id and name 
    #   ------------------------------------------------------
    if 'addCategoryBtn' in request.POST:
        inputCategoryName = strip_tags(request.POST.get("CategoryName"))
        inputSelectSectorId = strip_tags(request.POST.get("selectSectorId"))
        fetchSectorNameQuery = AddSectors.objects.filter(id = inputSelectSectorId)[0].sectorName
       
        # print(inputCategoryName)
        # print(inputSelectSectorId)
        # print(fetchSectorNameQuery)
        
        addCategoryQuery = AddCategory(sectorId_id = inputSelectSectorId , categoryName = inputCategoryName,  date = datetime.today() )
        addCategoryQuery.save()
        messages.success(request, 'Sector Added Successfully')

    if 'updateCategoryNameBtn' in request.POST:
        inputCategoryId = strip_tags(request.POST.get("updateCategoryId"))
        inputCategoryName = strip_tags(request.POST.get("updateCategoryName"))

        print(inputCategoryId)
        print(inputCategoryName)
        
        
        categoryUpdateQuery = AddCategory.objects.filter(id = inputCategoryId).update(categoryName = inputCategoryName, date = datetime.today())
        
        messages.success(request, 'Category Name Updated  Successfully')
        return redirect("/adminDashboard")

    
    
    #   ------------------------------------------------------
    #       ADD sub Category names and update sub cat
    #   ------------------------------------------------------
    if 'addSubCategoryBtn' in request.POST:
        # print("fdsafsafasdfdsafsadfsadfasdfasd")
        inputSelectSelector = strip_tags(request.POST.get("selectSectors"))
        inputSelectCategory = strip_tags(request.POST.get("selectCategorys"))
        inputSubCatName = strip_tags(request.POST.get("subCategoryName"))

        AddSubCategoryQuery = AddSubCategory(sectorId_id = inputSelectSelector,  categoryId_id  = inputSelectCategory, subCategoryName = inputSubCatName,  date = datetime.today() )
        AddSubCategoryQuery.save()
        messages.success(request, 'Sector Added Successfully')

        # print(inputSelectSelector)
        # print(inputSelectCategory)
        # print(inputSubCatName)
        # print(fetchSectorName)
        # print(fetchCategoryName)


    if 'updateSubCatNameBtn' in request.POST:
        inputSubCatId = strip_tags(request.POST.get("updateSubCategoryId"))
        inputSubCatName = strip_tags(request.POST.get("updateSubCategoryName"))

        print(inputSubCatId)
        print(inputSubCatName)
        
        categoryUpdateQuery = AddSubCategory.objects.filter(id = inputSubCatId).update(subCategoryName = inputSubCatName, date = datetime.today())
        messages.success(request, 'Sub Category Name Updated  Successfully')
        return redirect("/adminDashboard")


    #   ------------------------------------------------------
    #       show all fetched data from database in html
    #   ------------------------------------------------------
    showAllSector = AddSectors.objects.all()
    # for t in showAllSector:
    #     catfetchy = AddCategory.objects.filter(sectorId = t.id)
    #     for i in catfetchy:
    #         aaa = AddSubCategory.objects.filter(categoryId = i.id)
    #         for b in aaa:
    #             print(f"sector is  {t.sectorName} -> category is  {i.categoryName} -> subcat is {b.subCategoryName} ")


    catfetchQuery = AddCategory.objects.all()
    # for i in catfetchQuery:
        # print()
        # fetchQuery = AddSectors.objects.filter(id = i.sectorId)
        # print(f"{fetchQuery[0].sectorName} -> {i.categoryName}")
        # a = fetchQuery[0].sectorName + " " + i.categoryName
        # for q in fetchQuery:
        #     aa = AddSubCategory.objects.filter(id = q.categoryId )
        #     print(f"{aa}")


    showSubCategory = AddSubCategory.objects.all()


    dataArray = {
        'showAllSectorss': showAllSector,
        'showAllCategoryyyy': catfetchQuery,
        'showAllSubCategory': showSubCategory
    }

    return render(request, "adminTemplates/addSectorCategory.html", dataArray )


# ajax load category from sectors
def load_categories(request):

    selectSectors_Id = request.GET.get('selectSectorssssss')
    # print(f"id is ", selectSectors_Id)

    category = AddCategory.objects.filter(sectorId = selectSectors_Id)

    newdataArray = {
        'showAllcats': category
    }
    
    return render(request, "adminTemplates/ajax/loadCategoryfromSector.html", newdataArray )



def loadAddCategoryData(request):

    selectSectors_Id = request.GET.get('selectSectorssssss')
    # print(f"id is ", selectSectors_Id)

    category = AddCategory.objects.filter(sectorId = selectSectors_Id)

    newdataArray = {
        'showAllcats': category
    }
    
    return render(request, "adminTemplates/ajax/loadAddCategoryData.html", newdataArray )

