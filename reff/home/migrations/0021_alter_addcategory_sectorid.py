# Generated by Django 3.2.8 on 2021-10-30 17:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0020_auto_20211030_2229'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addcategory',
            name='sectorId',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='home.addsectors'),
        ),
    ]