# Generated by Django 3.2.8 on 2021-10-12 10:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0002_rename_adminsignupforms_adminforms'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserForms',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uName', models.CharField(max_length=200)),
                ('uEmail', models.EmailField(max_length=200)),
                ('uPassword', models.CharField(max_length=200)),
                ('uDate', models.DateTimeField()),
            ],
        ),
    ]
