# Generated by Django 3.2.8 on 2021-10-26 15:53

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0018_affliatelink'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='addcategory',
            name='sectorName',
        ),
        migrations.RemoveField(
            model_name='addsubcategory',
            name='categoryName',
        ),
        migrations.RemoveField(
            model_name='addsubcategory',
            name='sectorName',
        ),
    ]
