# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Assets(models.Model):
    assets_id = models.AutoField(primary_key=True)
    month = models.DateField()
    value = models.IntegerField(blank=True, null=True)
    office = models.ForeignKey('Office', models.DO_NOTHING)
    indicator = models.ForeignKey('Indicators', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Assets'


class Categories(models.Model):
    category_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Categories'


class Indicatornames(models.Model):
    indicator_name_id = models.AutoField(db_column='indicator__name_id', primary_key=True)  # Field renamed because it contained more than one '_' in a row.
    name = models.CharField(unique=True, max_length=18)

    class Meta:
        managed = False
        db_table = 'IndicatorNames'


class Indicators(models.Model):
    indicator_id = models.AutoField(primary_key=True)
    indicator_name = models.ForeignKey(Indicatornames, models.DO_NOTHING)
    category = models.ForeignKey(Categories, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Indicators'


class Office(models.Model):
    office_id = models.AutoField(primary_key=True)
    city = models.ForeignKey('CityRegion', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Office'


class Region(models.Model):
    region_id = models.IntegerField(primary_key=True)
    name = models.CharField(unique=True, max_length=30)

    class Meta:
        managed = False
        db_table = 'Region'


class CityRegion(models.Model):
    city_id = models.AutoField(primary_key=True)
    region = models.ForeignKey(Region, models.DO_NOTHING)
    name = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'city_region'


class Sysdiagrams(models.Model):
    name = models.CharField(max_length=128)
    principal_id = models.IntegerField()
    diagram_id = models.AutoField(primary_key=True)
    version = models.IntegerField(blank=True, null=True)
    definition = models.BinaryField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sysdiagrams'
        unique_together = (('principal_id', 'name'),)
