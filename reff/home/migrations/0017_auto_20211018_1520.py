# Generated by Django 3.2.8 on 2021-10-18 09:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0016_alter_addproductservices_imageurl_1'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addproductservices',
            name='productDescription',
            field=models.CharField(max_length=5000),
        ),
        migrations.AlterField(
            model_name='addproductservices',
            name='productHighlights',
            field=models.CharField(max_length=5000),
        ),
    ]
