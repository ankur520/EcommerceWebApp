from django.contrib import admin
from home.models import AdminForms, UserForms, AddSectors, AddCategory, AddSubCategory


# Register your models here.
admin.site.register(AdminForms)
admin.site.register(UserForms)
admin.site.register(AddSectors)
admin.site.register(AddCategory)
admin.site.register(AddSubCategory)
