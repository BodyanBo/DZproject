from django.urls import path
from . import views

urlpatterns = [
    path('', views.stats_list, name='stats_list'),
    path("<date:start_date,date:end_date>/", views.filterbydate, name="filterbydate")

]