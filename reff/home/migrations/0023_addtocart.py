# Generated by Django 3.2.8 on 2021-11-05 09:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0022_auto_20211031_0828'),
    ]

    operations = [
        migrations.CreateModel(
            name='AddToCart',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.CharField(max_length=200)),
                ('date', models.DateTimeField()),
                ('productId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='home.addproductservices')),
                ('userId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='home.userforms')),
            ],
        ),
    ]