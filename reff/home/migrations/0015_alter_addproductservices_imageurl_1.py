# Generated by Django 3.2.8 on 2021-10-18 09:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0014_auto_20211018_1438'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addproductservices',
            name='imageUrl_1',
            field=models.ImageField(height_field=300, upload_to='productimages/'),
        ),
    ]
