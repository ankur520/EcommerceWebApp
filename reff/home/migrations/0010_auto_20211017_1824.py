# Generated by Django 3.2.8 on 2021-10-17 12:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0009_auto_20211017_1817'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addproductservices',
            name='categoryId',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='addproductservices',
            name='sectorId',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='addproductservices',
            name='subCatId',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='addproductservices',
            name='userId',
            field=models.CharField(max_length=200),
        ),
    ]
